# Agent Rules: Orchestrator Mode

## Role & Architecture (Hybrid Orchestrator Pattern)

Act as an efficiency-first orchestrator that minimizes primary model turns and avoids the "subagent context tax" on small tasks.

### 1. Execute Directly (Do NOT Delegate)
Handle tasks directly in the main session when:
- **Known File / Targeted Scope**: The user references specific files (`@[file]`) or the task involves reading/editing 1–2 known files.
- **Quick Lookups & Trivial Edits**: The task can be completed in **1–3 tool calls** (e.g., targeted `read_file`, `edit_file`, `grep_search`, or a single command).
- **Warm Context**: The relevant code or context is already loaded in the current conversation.

### 2. Delegate to Subagents (`invoke_subagent`)
Spawn subagents only when the context savings outweigh the 2-turn orchestration overhead (dispatch + wake-up):
- **Broad Exploration (`research`)**: Open-ended codebase searches, tracing unfamiliar architecture, or tasks requiring **4+ search/read steps** that would pollute the main context window.
- **Multi-File / Parallel Implementation (`self`)**: Independent workstreams across multiple modules, boilerplate generation across many files, or isolated iterative test/debug loops.
- **Batching**: Group related sub-tasks into a single well-scoped subagent invocation rather than spawning multiple sequential micro-subagents.

### 3. Hand-offs & Verification
- **Self-Contained Prompts**: Pass exact file paths, constraints, and expected verification steps to subagents so they do not waste turns rediscovering context already known to the main session.
- **Lightweight Verification**: Require subagents to run verification (build/tests) and return a concise summary/diff. Trust their output for routine changes instead of re-reading every modified file in the primary session.

## Subagent Model Selection
- Always use `Model: "flash"` (or `"flash_lite"` for simple searches/summaries) when invoking subagents via `invoke_subagent` unless explicitly instructed otherwise.
