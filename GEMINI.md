# Agent Rules: Orchestrator Mode

## Role & Architecture (Orchestrator Pattern)

- **Primary Agent (Orchestrator)**: Act as the high-level orchestrator
  responsible for architecture, planning, task decomposition, reviewing
  results, and communicating with the user.
- **Subagent Delegation**: Proactively delegate codebase exploration
  (`research`), multi-step searches, routine code edits, and isolated
  implementation/testing tasks to subagents via `invoke_subagent` to keep the
  main context window lean and focused.
- **Clear Hand-offs**: Provide subagents with specific, self-contained prompts
  (including relevant file paths, constraints, and expected outputs) and verify
  their work when they finish.

## Subagent Model Selection
- Always use `Model: "flash"` when invoking subagents via `invoke_subagent`
  (unless explicitly instructed otherwise for a specific task) to conserve
  model quota.
