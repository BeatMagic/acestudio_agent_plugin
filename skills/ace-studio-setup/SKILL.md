---
name: ace-studio-setup
description: "Connect an agent to ACE Studio when it is not connected yet — the skills are installed but ACE Studio does not answer, the CLI is unavailable, or the MCP server is not registered. Load when the user wants to do something in ACE Studio and no working connection exists, including \"I installed the plugin but it is not connected\", or when a command fails because the ACE Studio surface is unreachable."
---

# Connect to ACE Studio

Installing this plugin gives the agent know-how. It does not connect the agent to
ACE Studio — that is a separate step, and no skill works without it.

## 1. Diagnose

Check what is actually missing before changing any configuration:

- **Is ACE Studio running?** The CLI and the MCP server both talk to a running
  Studio, so a closed Studio looks exactly like a broken connection. Ask the
  user to open it.
- **Is the tool there?** Look for the CLI — and the MCP server — at the default
  locations for the platform, listed in the
  [External Agent Access](https://docs.acestudio.ai/ai-agent/external-agent-access)
  docs.
- **Does anything answer?** If a CLI command or an MCP call already returns
  project information, the connection works. Stop here.

## 2. Connect

Prefer the **CLI**: it is the direct route and needs no harness configuration.
When the CLI is unavailable — missing, or blocked by sandboxing or permissions —
register the **MCP server** instead, under the name `ace-studio` at user/global
scope, so it is available in every project.

- **Not at a default location.** Ask the user to open **Preferences → General →
  External Agent Access** and copy the path it offers for the CLI binary or the
  MCP server. Do not guess an install path.
- **Harness cannot self-configure.** If you cannot run commands or edit your own
  configuration, walk the user through **Path B** in the docs.
- **Keep the working path** where you hold durable instructions, so later
  sessions skip the search.

## 3. Confirm

Ask ACE Studio for the current project information. Tempo, key and track list
coming back is the completion criterion — the connection works.