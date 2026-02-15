# Ollama — Local LLM Setup

Ollama runs as a system service on this machine. See system info in `~/Repos/CLAUDE.md`.

## Service

| Detail | Value |
|--------|-------|
| API | `http://localhost:11434` |
| Models dir | `/var/lib/ollama/` |
| Manage | `systemctl start/stop/status ollama` |

---

## Installed Models *(as at 2026-02-15 — update this date and the table when adding new models)*

| Model | Size | Tool Calling | Web Search | Downloaded | Training Cutoff | Best For |
|-------|------|-------------|------------|------------|----------------|----------|
| `gpt-oss:20b` | 13 GB | ✅ native | ✅ native | 2026-02-15 | Jun 2024 | Reasoning, agentic tasks, chain-of-thought. OpenAI open-weight MoE model. |
| `qwen2.5-coder:14b` | 9.0 GB | ✅ | ✅ via tools | 2026-02-15 | Oct 2023 | Coding — Node.js, bash/fish, AL/CAL (Business Central) |
| `phi4:14b` | 9.1 GB | ⚠️ broken in Ollama | ❌ | 2026-02-15 | Oct 2023 | BC/AL dev, reasoning, Microsoft ecosystem knowledge. Not for MCP. |
| `qwen2.5:14b` | 9.0 GB | ✅ | ✅ via tools | 2026-02-15 | Oct 2023 | General knowledge, mixed reasoning + coding, MCP tool calling |
| `llama3.1:8b` | 4.9 GB | ✅ | ✅ via tools | 2026-02-15 | Dec 2023 | Fast, lightweight, most reliable for MCP tool calls |
| `mistral:7b` | 4.4 GB | ⚠️ raw mode only | ⚠️ unreliable | 2026-02-15 | May 2024 | General use — MCP unreliable due to message formatting issues |
| `llama3.2:latest` | 2.0 GB | ✅ | ✅ via tools | 2026-02-12 | Dec 2023 | Lightweight general use, fast responses |
| `nomic-embed-text` | ~274 MB | N/A | N/A | 2026-02-15 | N/A | Embedding model only — used by Open WebUI for RAG document indexing |

---

## VRAM Notes

GPU: AMD RX 9060 XT — 16 GB VRAM. `HSA_OVERRIDE_GFX_VERSION` set globally in fish config (applies to all ROCm tools).

Only one model loads at a time. Largest model (`gpt-oss:20b` at 13 GB) leaves ~3 GB for context — workable but limited for long sessions. All others leave 7 GB+ free.

---

## MCP / Tool Calling

Best models for MCP SSE tool calling (most to least reliable):

1. `llama3.1:8b` — most reliable
2. `gpt-oss:20b` — native function calling
3. `qwen2.5:14b` / `qwen2.5-coder:14b` — reliable
4. `mistral:7b` — raw mode, finicky
5. `phi4:14b` — broken in Ollama, do not use for MCP
