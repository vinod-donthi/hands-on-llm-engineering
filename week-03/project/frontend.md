# Doc Q&A Studio — Frontend

> Week 3 Project · [← Backend](backend.md) · [API](api.md)

> **Work dir:** `~/ai-learning/week-03-work/doc-qa-studio/frontend/`

## Pages / components

| Component | Purpose |
|-----------|---------|
| `UploadPanel` | Drag-drop PDF/MD/DOCX → `POST /api/v1/index` |
| `ChatPanel` | Message thread, input, streaming display |
| `CitationChip` | Clickable chip → source doc + page preview |
| `IndexStatus` | Shows chunk count, last indexed, index version |

## UX flow

1. User uploads `handbook.pdf` → progress spinner → "Indexed 87 chunks"
2. User asks *"What is the equipment stipend?"*
3. Tokens stream in chat bubble
4. Citation chips appear below: `handbook.pdf p.13`
5. Click chip → side panel shows chunk text preview

## SSE hook (reuse Week 2 pattern)

```typescript
// hooks/useSSEChat.ts
export function useSSEChat() {
  async function send(question: string, onToken: (t: string) => void, onCitations: (c: Citation[]) => void) {
    const res = await fetch("/api/v1/chat/stream", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ question }),
    });
    const reader = res.body!.getReader();
    // parse event: token / event: citations
  }
}
```

## Citation chip UI

```tsx
function CitationChip({ citation }: { citation: Citation }) {
  return (
    <button className="citation-chip" onClick={() => openPreview(citation.chunk_id)}>
      {citation.label}
    </button>
  );
}
```

Display `label` from API (e.g. `handbook.pdf p.13`) — not raw chunk_id.

## Styling minimum

- Distinguish user vs assistant messages
- Show "Searching documents…" during retrieval (optional loading state before first token)
- Empty state: "Upload documents to get started"
- Error state: API 413 context overflow → user-friendly message

## Dev proxy

`vite.config.ts` proxy `/api` → `http://localhost:8000` (same as Week 2).

## Acceptance (UI)

- [ ] Upload triggers index and updates chunk count
- [ ] Streaming text visible within 3s of send
- [ ] ≥1 citation chip on grounded answer
- [ ] Unanswerable question shows refusal (no fake citation)

## Next

[api.md](api.md) · [acceptance-criteria.md](acceptance-criteria.md)
