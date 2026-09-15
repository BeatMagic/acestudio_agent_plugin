---
name: ace-studio-setup
description: "Connect an agent to ACE Studio when the plugin is installed but the connection was skipped — you have no `acestudio-cli` path and no ACE Studio MCP server among your tools. Load only in that case: it tells you the connection is a separate step, so you point the user at ACE Studio's own connect flow instead of trying to work without a surface."
---

# Connect to ACE Studio

The skills in this plugin are know-how. They do not connect you to ACE Studio —
that is a separate, built-in step, and without it none of them can act.

If you do not know where `acestudio-cli` lives, and no ACE Studio MCP server
appears among your tools, that step was skipped: the user installed the plugin
but never connected it.

The connection is made in ACE Studio, not here. **Connect to Agents** in the app,
and the
[External Agent Access](https://docs.acestudio.ai/ai-agent/external-agent-access)
docs, are the authority — they carry the routes and the default binary locations.
Point the user there before trying to answer anything about their project.