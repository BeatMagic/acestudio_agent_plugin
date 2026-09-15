# ACE Studio agent plugin

## What this repo is

Know-how for agents that operate [ACE Studio](https://www.acestudio.ai): the *how*, not the tools. The tools are the product's CLI and MCP server; this repo carries the skills that tell an agent what to reach for, in what order, and when to hand the work to something else.

## Installing this for a user

Install the plugin on Claude Code or Codex, or copy the `skills/` folders into the user's harness skills folder. Install and update mechanics live in [README.md](README.md).

Connecting to ACE Studio is a separate step from installing the skills: point the user at the app's **Connect to Agents** entry or the [External Agent Access](https://docs.acestudio.ai/ai-agent/external-agent-access) docs.

## Working on the content

- Skills are the orchestrator layer: workflow order, when to reach for what, why, decision heuristics, handoff to external tools. CLI/MCP mechanics (syntax, arguments, enums) live in `help` and `get_docs`, and a skill points at them rather than restating them.
- Examples live in the CLI/MCP docs too; a skill carries one only when it is compact and stable.
- Skill text is harness-agnostic: the `SKILL.md` convention only, with no Claude Code or Codex specific mechanism.

## Release and delivery

- `main` is the delivery channel: merging ships to installed users, with no version bump and no tags.
- Ahead-of-product prose (guidance for a Studio build not yet shipped) waits on a branch or PR until the build ships; a skill that needs the newer build says so inline (`requires Studio ≥ x`).
- The repo root is the plugin: a root-level `commands/`, `agents/`, `hooks/` or `.mcp.json` silently becomes a plugin component.
- Commit messages prefer Conventional Commits (`feat:`, `fix:`, `docs:`, `chore:`, ...).
- Issues here are an inbound funnel for external users; the team ledger is the ACE Studio tracker (`BeatMagic/ACE-Studio`).

## Before editing

Load the `writing-for-agents` skill before changing any skill or doc here, where the harness has it.
