const API_BASE = process.env.NEXT_PUBLIC_API_URL ?? "http://localhost:8000";

export type LLMResult = {
  request_id: string;
  model_id: string;
  text: string;
  input_tokens: number;
  output_tokens: number;
  latency_ms: number;
  cost_usd: number;
  error: string | null;
  parse_status?: string | null;
};

export type CompareResponse = {
  parent_request_id: string;
  results: LLMResult[];
  total_cost_usd: number;
};

export async function compareModels(
  modelIds: string[],
  request: {
    system_prompt?: string;
    prompt: string;
    temperature?: number;
    max_tokens?: number;
  }
): Promise<CompareResponse> {
  const res = await fetch(`${API_BASE}/api/v1/compare`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ model_ids: modelIds, request }),
  });
  if (!res.ok) {
    throw new Error(`Compare failed: ${res.status} ${await res.text()}`);
  }
  return res.json();
}
