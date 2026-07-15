# ACE Studio Agent Plugin

Control a running [ACE Studio](https://www.acestudio.ai) — the AI vocal
synthesis DAW — from **Claude Code** or **OpenAI Codex**. One repo, both
channels.

The plugin connects your agent to ACE Studio's built-in MCP server
(`ace_mcp_server`, shipped inside the app) and adds skills that teach the
agent ACE Studio's editing model: tracks, clips, notes, lyrics, singers,
the marker-line, and asynchronous synthesis.

## Prerequisites

1. **ACE Studio installed and running** (macOS; the app bundles the MCP
   server at `ACE Studio.app/Contents/Helpers/ace_mcp_server`).
2. **MCP Server enabled** in ACE Studio: Settings → General → MCP Server.
   This writes the bridge credentials file (`mcp-bridge.json`) that the
   MCP server reads.
3. **A project open** in ACE Studio. Agents cannot open or switch projects.

## Install — Claude Code

```
/plugin marketplace add TODO-your-org/acestudio-agent-plugin
/plugin install acestudio@acestudio
```

Then just talk: *"write a two-bar melody on track 1 singing 'hello world'"*.
Skills are also directly invocable, e.g. `/acestudio:compose-vocal-clip`.

## Install — Codex

```
codex plugin marketplace add TODO-your-org/acestudio-agent-plugin
```

Then open `/plugins` in a Codex session and enable **ACE Studio**.

> Note: the Codex plugin system (March 2026) is newer than Claude Code's and
> its marketplace schema may still change — if installation fails, check the
> current docs at learn.chatgpt.com/docs/build-plugins and file an issue.

## What's inside

```
.claude-plugin/marketplace.json      Claude Code marketplace (this repo is the marketplace)
.agents/plugins/marketplace.json     Codex marketplace
plugins/acestudio/
├── .claude-plugin/plugin.json       Claude Code manifest
├── .codex-plugin/plugin.json        Codex manifest
├── .mcp.json                        MCP server config (Claude Code format)
├── mcp-codex.json                   MCP server config (Codex format)
├── bin/launch-ace-mcp.sh            Locates ace_mcp_server and runs it in --stdio mode
└── skills/
    ├── working-with-ace-studio/     Core mental model: live editor, marker-line, ticks, discovery
    └── compose-vocal-clip/          Workflow: singer → clip → notes+lyrics → synthesis → playback
```

Both channels launch the same server over **stdio** (not HTTP) — stdio
avoids sandbox network restrictions entirely and needs no port or token
handling; the server reads bridge credentials from the file ACE Studio
writes when its MCP server is enabled.

## Development

```
# Claude Code: load the plugin for one session without installing
claude --plugin-dir ./plugins/acestudio

# Validate before publishing
claude plugin validate ./plugins/acestudio --strict
claude plugin validate .claude-plugin/marketplace.json

# Test the MCP server standalone (ACE Studio must be running with
# its MCP server enabled)
./plugins/acestudio/bin/launch-ace-mcp.sh
```

Releases: bump `version` in **both** `plugin.json` files, tag, push. Users
pick it up via `/plugin marketplace update acestudio` (Claude Code) or
`codex plugin marketplace upgrade` (Codex).

## TODO before publishing

- [ ] Replace `TODO-your-org/acestudio-agent-plugin` with the real GitHub slug (here and in app-side onboarding UI)
- [ ] Confirm homepage / author URLs
- [ ] Windows: `launch-ace-mcp.sh` and `mcp-codex.json` are macOS-only; add a `.cmd` launcher + per-OS paths
- [ ] Verify Codex marketplace/plugin schema against current docs before announcing the Codex channel
- [ ] Decide LICENSE (currently marked Proprietary in the manifest, no LICENSE file)
