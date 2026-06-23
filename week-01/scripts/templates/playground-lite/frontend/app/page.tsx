"use client";

import { useState } from "react";
import { compareModels, type LLMResult } from "@/lib/api";

const DEFAULT_MODELS = ["openai/gpt-4o-mini", "ollama/llama3.1:8b"];

type Scores = {
  correctness: number;
  format: number;
  groundedness: number;
  conciseness: number;
};

function composite(s: Scores): number {
  return Math.round(((s.correctness + s.format + s.groundedness + s.conciseness) / 4) * 100) / 100;
}

export default function HomePage() {
  const [systemPrompt, setSystemPrompt] = useState(
    "You are a concise engineering assistant."
  );
  const [userPrompt, setUserPrompt] = useState(
    "List three benefits of observability on every LLM API call. Use exactly 3 bullets."
  );
  const [selected, setSelected] = useState<string[]>(DEFAULT_MODELS);
  const [results, setResults] = useState<LLMResult[]>([]);
  const [parentId, setParentId] = useState<string | null>(null);
  const [totalCost, setTotalCost] = useState<number | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [scores, setScores] = useState<Record<string, Scores>>({});

  const toggleModel = (id: string) => {
    setSelected((prev) =>
      prev.includes(id) ? prev.filter((m) => m !== id) : [...prev, id]
    );
  };

  const runCompare = async () => {
    if (selected.length === 0) {
      setError("Select at least one model.");
      return;
    }
    setLoading(true);
    setError(null);
    try {
      const data = await compareModels(selected, {
        system_prompt: systemPrompt,
        prompt: userPrompt,
        temperature: 0,
      });
      setResults(data.results);
      setParentId(data.parent_request_id);
      setTotalCost(data.total_cost_usd);
      const initial: Record<string, Scores> = {};
      for (const r of data.results) {
        initial[r.model_id] = {
          correctness: 3,
          format: 3,
          groundedness: 3,
          conciseness: 3,
        };
      }
      setScores(initial);
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    } finally {
      setLoading(false);
    }
  };

  const updateScore = (
    modelId: string,
    key: keyof Scores,
    value: number
  ) => {
    setScores((prev) => ({
      ...prev,
      [modelId]: { ...prev[modelId], [key]: value },
    }));
  };

  const exportJson = () => {
    const rows = results.map((r) => ({
      request_id: r.request_id,
      parent_request_id: parentId,
      model_id: r.model_id,
      scores: scores[r.model_id],
      composite: scores[r.model_id] ? composite(scores[r.model_id]) : null,
      latency_ms: r.latency_ms,
      input_tokens: r.input_tokens,
      output_tokens: r.output_tokens,
      cost_usd: r.cost_usd,
      error: r.error,
      text_preview: r.text?.slice(0, 300) ?? null,
    }));
    const blob = new Blob([JSON.stringify({ parent_request_id: parentId, total_cost_usd: totalCost, rows }, null, 2)], {
      type: "application/json",
    });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "compare_export.json";
    a.click();
    URL.revokeObjectURL(url);
  };

  return (
    <main style={{ maxWidth: 1100, margin: "0 auto", padding: "1.5rem" }}>
      <h1 style={{ marginTop: 0 }}>Prompt Playground Lite</h1>
      <p style={{ color: "#8b98a5" }}>
        Week 1 MVP — compare models with observability. Backend on :8000.
      </p>

      <section style={{ marginBottom: "1rem" }}>
        <label>
          <strong>System prompt</strong>
          <textarea
            rows={2}
            value={systemPrompt}
            onChange={(e) => setSystemPrompt(e.target.value)}
          />
        </label>
      </section>

      <section style={{ marginBottom: "1rem" }}>
        <label>
          <strong>User prompt</strong>
          <textarea
            rows={4}
            value={userPrompt}
            onChange={(e) => setUserPrompt(e.target.value)}
          />
        </label>
      </section>

      <section style={{ marginBottom: "1rem" }}>
        <strong>Models</strong>
        <div style={{ display: "flex", gap: "1rem", marginTop: "0.5rem" }}>
          {DEFAULT_MODELS.map((id) => (
            <label key={id}>
              <input
                type="checkbox"
                checked={selected.includes(id)}
                onChange={() => toggleModel(id)}
              />{" "}
              {id}
            </label>
          ))}
        </div>
      </section>

      <div style={{ display: "flex", gap: "0.75rem", marginBottom: "1.5rem" }}>
        <button onClick={runCompare} disabled={loading}>
          {loading ? "Comparing…" : "Compare"}
        </button>
        {results.length > 0 && (
          <button type="button" onClick={exportJson} style={{ background: "#38444d" }}>
            Export JSON
          </button>
        )}
      </div>

      {error && (
        <p style={{ color: "#f4212e" }} role="alert">
          {error}
        </p>
      )}

      {parentId && (
        <p className="metrics">
          parent_request_id: <code>{parentId}</code> · total_cost_usd:{" "}
          <code>{totalCost}</code>
        </p>
      )}

      <div
        style={{
          display: "grid",
          gridTemplateColumns: "repeat(auto-fit, minmax(320px, 1fr))",
          gap: "1rem",
        }}
      >
        {results.map((r) => (
          <article
            key={r.request_id}
            className={`panel${r.error ? " error" : ""}`}
          >
            <h3 style={{ marginTop: 0 }}>{r.model_id}</h3>
            {r.error ? (
              <p style={{ color: "#f4212e" }}>{r.error}</p>
            ) : (
              <pre
                style={{
                  whiteSpace: "pre-wrap",
                  fontSize: "0.9rem",
                  margin: 0,
                }}
              >
                {r.text}
              </pre>
            )}
            <div className="metrics">
              <div>
                request_id: <code>{r.request_id}</code>
              </div>
              <div>
                latency: {r.latency_ms} ms · tokens: {r.input_tokens}/
                {r.output_tokens} · cost: ${r.cost_usd}
              </div>
            </div>
            {scores[r.model_id] && (
              <div style={{ marginTop: "0.75rem", fontSize: "0.85rem" }}>
                <strong>Scores (1–5)</strong>
                {(
                  [
                    ["correctness", "Correctness"],
                    ["format", "Format"],
                    ["groundedness", "Groundedness"],
                    ["conciseness", "Conciseness"],
                  ] as const
                ).map(([key, label]) => (
                  <div key={key} style={{ marginTop: "0.25rem" }}>
                    {label}:{" "}
                    <input
                      type="range"
                      min={1}
                      max={5}
                      value={scores[r.model_id][key]}
                      onChange={(e) =>
                        updateScore(r.model_id, key, Number(e.target.value))
                      }
                    />{" "}
                    {scores[r.model_id][key]}
                  </div>
                ))}
                <div>
                  Composite: <strong>{composite(scores[r.model_id])}</strong>
                </div>
              </div>
            )}
          </article>
        ))}
      </div>
    </main>
  );
}
