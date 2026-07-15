---
name: working-with-ace-studio
description: Core mental model for controlling ACE Studio via its MCP tools. Load this before doing ANY work in ACE Studio — playback, tracks, clips, notes, lyrics, singers, mixing. Explains the live-editor model, the marker-line, tick coordinates, command discovery, and error recovery.
---

# Working with ACE Studio

ACE Studio is an AI vocal-synthesis DAW. You control **one running instance**
with **one open project** through the `acestudio` MCP server. There is no
session or workspace of your own.

## The live-instrument model (most important)

Treat ACE Studio as a live instrument someone is already playing:

- Every command mutates the **same editor the user is looking at**. Every
  change is visible to them in real time.
- You cannot open, close, or switch projects. If a command returns
  `NO_PROJECT_OPEN`, stop and ask the user to open a project.
- Each command lands as **a single undo group** — the user can Ctrl+Z any
  one command away as one step. Don't fear making edits, but don't spray
  many small mutations when one bulk command exists (e.g. add all notes in
  one `editor add-notes` call, never one call per note).
- Read-only commands are idempotent. Mutating commands generally are NOT —
  re-running `editor add-notes` adds the notes again.

## Discover commands — don't guess

The command surface is self-documenting. Before using an unfamiliar command:

1. `get_docs` with no name (or `acestudio-cli help`) — lists every command
   path and topic.
2. `get_docs` with a name (e.g. `editor add-notes`, `marker-line`,
   `tick-coordinates`, `error-codes`) — full doc for that command or topic.
3. Search across all docs with a regex (`acestudio-cli help --search <regex>`).

Argument schemas are strict JSON Schemas; the doc for each command is the
source of truth. Read it rather than guessing flags.

## The marker-line (cursor)

The marker-line is the single shared editing pointer. Users call it the
cursor or caret. It is three things at once:

1. **Playback start position** — play starts from it.
2. **Editing position** — commands without an explicit position (e.g.
   `editor add-notes`) act at it.
3. **Editor target selector** — the pattern editor edits whatever clip the
   marker-line is inside. There is no separate "open clip" action:
   **moving the marker-line into a clip IS how you open it** (`marker set`
   / `marker seek`).

It has two scopes: `global` (project ticks, arrangement view) and `editor`
(local ticks inside the current clip). Commands default to the user's last
UI focus — pass `--scope` explicitly to be safe.

## Coordinates

- Positions and durations are in **ticks**. Convert with the `convert`
  commands (`tick-to-time`, `tick-to-measure`, `editor-to-global`, etc.).
- Note positions in `editor add-notes` are **local ticks** relative to the
  editor's `tickBegin`. Final placement = marker-line + offset + note pos.
- Track indices are **0-based** in commands, but users see tracks numbered
  from 1. Subtract 1 when the user says "track 3"; add 1 when reporting back.

## Synthesis is asynchronous

After editing notes, audio is re-synthesized in the background. Check
`status synthesis` before judging playback: if playback sounds wrong or
silent right after an edit, synthesis is likely still running. Poll until
it reports idle, then play.

## Error handling

Every error carries a stable code (see the `error-codes` doc topic).
Common ones:

- `NO_PROJECT_OPEN` — ask the user to open a project; do not retry.
- Validation errors — re-read the command doc; your arguments are wrong.
- Connection failures — ACE Studio isn't running, or its MCP server is
  disabled. Ask the user to launch ACE Studio and enable it under
  Settings → General → MCP Server.

## Etiquette

- Before placing clips, `clip list` the target range — placing a clip
  auto-trims/splits/deletes overlapping clips.
- Prefer reading state (`status project`, `track list`, `editor status`)
  over assuming it; the user may have changed things between your calls.
- Announce destructive intentions (deleting tracks/clips, overwriting
  lyrics) before doing them.
