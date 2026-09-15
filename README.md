![ACE Studio Skills](assets/banner.png)

# ACE Studio agent skills

[![license: MIT](https://img.shields.io/badge/license-MIT-5D59FF)](LICENSE)
[![plugin for: Claude Code](https://img.shields.io/badge/plugin%20for-Claude%20Code-D77757?logo=claude&logoColor=white)](#claude-code)
[![plugin for: Codex](https://img.shields.io/badge/plugin%20for-Codex-FFFFFF?labelColor=000000&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9ImN1cnJlbnRDb2xvciIgZD0iTTIyLjI4MiA5LjgyMWE2IDYgMCAwIDAtLjUxNi00LjkxYTYuMDUgNi4wNSAwIDAgMC02LjUxLTIuOUE2LjA2NSA2LjA2NSAwIDAgMCA0Ljk4MSA0LjE4YTYgNiAwIDAgMC0zLjk5OCAyLjlhNi4wNSA2LjA1IDAgMCAwIC43NDMgNy4wOTdhNS45OCA1Ljk4IDAgMCAwIC41MSA0LjkxMWE2LjA1IDYuMDUgMCAwIDAgNi41MTUgMi45QTYgNiAwIDAgMCAxMy4yNiAyNGE2LjA2IDYuMDYgMCAwIDAgNS43NzItNC4yMDZhNiA2IDAgMCAwIDMuOTk3LTIuOWE2LjA2IDYuMDYgMCAwIDAtLjc0Ny03LjA3M00xMy4yNiAyMi40M2E0LjQ4IDQuNDggMCAwIDEtMi44NzYtMS4wNGwuMTQxLS4wODFsNC43NzktMi43NThhLjguOCAwIDAgMCAuMzkyLS42ODF2LTYuNzM3bDIuMDIgMS4xNjhhLjA3LjA3IDAgMCAxIC4wMzguMDUydjUuNTgzYTQuNTA0IDQuNTA0IDAgMCAxLTQuNDk0IDQuNDk0TTMuNiAxOC4zMDRhNC40NyA0LjQ3IDAgMCAxLS41MzUtMy4wMTRsLjE0Mi4wODVsNC43ODMgMi43NTlhLjc3Ljc3IDAgMCAwIC43OCAwbDUuODQzLTMuMzY5djIuMzMyYS4wOC4wOCAwIDAgMS0uMDMzLjA2Mkw5Ljc0IDE5Ljk1YTQuNSA0LjUgMCAwIDEtNi4xNC0xLjY0Nk0yLjM0IDcuODk2YTQuNSA0LjUgMCAwIDEgMi4zNjYtMS45NzNWMTEuNmEuNzcuNzcgMCAwIDAgLjM4OC42NzdsNS44MTUgMy4zNTRsLTIuMDIgMS4xNjhhLjA4LjA4IDAgMCAxLS4wNzEgMGwtNC44My0yLjc4NkE0LjUwNCA0LjUwNCAwIDAgMSAyLjM0IDcuODcyem0xNi41OTcgMy44NTVsLTUuODMzLTMuMzg3TDE1LjExOSA3LjJhLjA4LjA4IDAgMCAxIC4wNzEgMGw0LjgzIDIuNzkxYTQuNDk0IDQuNDk0IDAgMCAxLS42NzYgOC4xMDV2LTUuNjc4YS43OS43OSAwIDAgMC0uNDA3LS42NjdtMi4wMS0zLjAyM2wtLjE0MS0uMDg1bC00Ljc3NC0yLjc4MmEuNzguNzggMCAwIDAtLjc4NSAwTDkuNDA5IDkuMjNWNi44OTdhLjA3LjA3IDAgMCAxIC4wMjgtLjA2MWw0LjgzLTIuNzg3YTQuNSA0LjUgMCAwIDEgNi42OCA0LjY2em0tMTIuNjQgNC4xMzVsLTIuMDItMS4xNjRhLjA4LjA4IDAgMCAxLS4wMzgtLjA1N1Y2LjA3NWE0LjUgNC41IDAgMCAxIDcuMzc1LTMuNDUzbC0uMTQyLjA4TDguNzA0IDUuNDZhLjguOCAwIDAgMC0uMzkzLjY4MXptMS4wOTctMi4zNjVsMi42MDItMS41bDIuNjA3IDEuNXYyLjk5OWwtMi41OTcgMS41bC0yLjYwNy0xLjVaIi8%2BPC9zdmc%2B&logoColor=white)](#codex)
[![skills.sh](https://skills.sh/b/BeatMagic/acestudio_agent_plugin)](https://skills.sh/BeatMagic/acestudio_agent_plugin)

Official agent skills for [ACE Studio](https://www.acestudio.ai), the all-in-one AI music studio. Installed in Claude Code or Codex through a plugin, or in any skills-capable agent through the [skills](https://skills.sh) CLI, they let the agent create and edit a music project through ACE Studio's CLI and MCP surface: tracks, vocals, instruments, effects, stems, and exports.

## Quick start

Click **Connect to Agents** in ACE Studio's bottom-right toolbar to get the instructions.

<p align="center"><img src="assets/connect-to-agents.png" alt="Connect to Agents in ACE Studio's bottom-right toolbar" height="180"></p>

Or read the [External Agent Access](https://docs.acestudio.ai/ai-agent/external-agent-access) docs if you want more detail.

## Install the skills

### Copy this prompt

Paste this into your agent; it picks the right route for the harness it is running in:

```text
Install this ACE Studio agent plugin so I can connect ACE Studio with you. Check if there's a plugin for your harness and use it if available; otherwise install the skills with `npx skills add BeatMagic/acestudio_agent_plugin`. Then help me set up the CLI/MCP connection so we can actually connect.
```

The routes below are for reference or if you prefer doing things by hand. They only install the skills; the CLI/MCP connection still has to be set up separately (see [Quick start](#quick-start)).

### Claude Code

```text
/plugin marketplace add BeatMagic/acestudio_agent_plugin
/plugin install acestudio@acestudio
```

Auto-update is off by default for third-party marketplaces. Enable it once under `/plugin` → Marketplaces; to update by hand, run `/plugin marketplace update acestudio`.

### Codex

```text
codex plugin marketplace add BeatMagic/acestudio_agent_plugin
codex plugin add acestudio@acestudio
```

Codex refreshes configured marketplaces at startup, so new commits arrive without re-installing.

### Other agents

For harnesses we ship no plugin for, install the skills with the [skills](https://skills.sh) CLI:

```text
npx skills add BeatMagic/acestudio_agent_plugin
```

Updates on this route are manual: `npx skills check` shows what is out of date, then `npx skills update` pulls it. The plugin routes above update without re-installing.

<details>
<summary>Manual copy</summary>

Copy the folders under [`skills/`](skills/) into `~/.agents/skills/`, or into your harness's own skills folder if it has one.

Manually copied skills do not update with the repository.

</details>

## Scope and limitations

- **Experimental.** Things may change under the hood. It updates quickly, so remember to update.
- **Same machine.** Run your agent with ACE Studio on the same computer.

## Credits

Parts of `ace-studio-workflows` are adapted from [To-Sheet-Music-Skill](https://github.com/kiri603/To-Sheet-Music-Skill) by kiri603, under the MIT License.

## License

MIT © 2026 Timedomain Inc. Third-party tools and materials referenced by these skills remain under their own licenses.
