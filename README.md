# Ollama — Local LLM Setup

Ollama runs as a system service on this machine. See system info in `~/Repos/CLAUDE.md`.

## Service

| Detail | Value |
|--------|-------|
| API | `http://localhost:11434` |
| Models dir | `/var/lib/ollama/` |
| Manage | `systemctl start/stop/status ollama` |
| Restart (alias) | `restart-ollama` → runs `restart-ollama.sh` (restarts + shows status) |

---

## Installed Models *(as at 2026-02-15 — update this date and the table when adding new models)*

| Model | Maker | Size | Quantization | Context Window | Vision | Tool Calling | Web Search | MCP Reliability | Downloaded | Training Cutoff | Best For |
|-------|-------|------|--------------|----------------|--------|-------------|------------|-----------------|------------|----------------|----------|
| `gpt-oss:20b` | OpenAI | 13 GB | MXFP4 | 128k | ❌ | ✅ native | ✅ native | ✅ reliable | 2026-02-15 | Jun 2024 | Reasoning, agentic tasks, chain-of-thought. Open-weight MoE model. |
| `qwen2.5-coder:14b` | Alibaba | 9.0 GB | Q4_K_M | 128k | ❌ | ✅ | ✅ via tools | ✅ reliable | 2026-02-15 | Oct 2023 | Coding — Node.js, bash/fish, AL/CAL (Business Central) |
| `deepseek-r1:8b` | DeepSeek | 5.2 GB | Q4_K_M | 128k | ❌ | ✅ | ✅ via tools | ✅ reliable | 2026-02-15 | Jul 2024 | Reasoning, math, step-by-step problem solving. |
| `llama3.2-vision:11b` | Meta | 7.8 GB | Q4_K_M | 128k | ✅ | ✅ | ✅ via tools | ✅ reliable | 2026-02-15 | Dec 2023 | Multimodal — image understanding, screenshots, diagrams. |
| `qwen2.5:14b` | Alibaba | 9.0 GB | Q4_K_M | 128k | ❌ | ✅ | ✅ via tools | ✅ reliable | 2026-02-15 | Oct 2023 | General knowledge, mixed reasoning + coding. |
| `llama3.1:8b` | Meta | 4.9 GB | Q4_K_M | 128k | ❌ | ✅ | ✅ via tools | ✅ most reliable | 2026-02-15 | Dec 2023 | Fast, lightweight. |
| `llama3.2:latest` | Meta | 2.0 GB | Q4_K_M | 128k | ❌ | ✅ | ✅ via tools | ✅ reliable | 2026-02-12 | Dec 2023 | Lightweight general use, fast responses. |
| `nomic-embed-text` | Nomic AI | ~274 MB | F16 | 8k | N/A | N/A | N/A | N/A | 2026-02-15 | N/A | Embedding model only — used by Open WebUI for RAG document indexing. |

---

## VRAM Notes

GPU: AMD RX 9060 XT — 16 GB VRAM. `HSA_OVERRIDE_GFX_VERSION` set globally in fish config (applies to all ROCm tools).

Only one model loads at a time. Largest model (`gpt-oss:20b` at 13 GB) leaves ~3 GB for context — workable but limited for long sessions. `llama3.2-vision:11b` and `qwen2.5-coder:14b` leave ~6–7 GB free. All others leave 7 GB+.

