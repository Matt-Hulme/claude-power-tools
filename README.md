# Claude Power Tools

Skills that make Claude Code proactively smarter about its own capabilities.

Claude Code ships with serious force-multipliers - multi-agent workflows, session goals, recurring loops, hooks, custom skills - but you have to know to ask for them. These skills flip that: **Claude notices when your task fits one of its power tools and proposes it**, with a concrete sketch and an honest cost, and you decide.

Using OpenAI Codex instead? The same scout, retargeted at Codex's native tool set (subagent fan-out, goals, automations, lifecycle hooks), lives at [codex-power-tools](https://github.com/Matt-Hulme/codex-power-tools).

## Skills

### [`suggest-power-tools`](suggest-power-tools/)

The opportunity spotter. While you work on ordinary tasks, it watches for eight shapes and surfaces a proposal at the right seam:

| It notices... | It suggests... |
|---|---|
| The same question across many files/items, audits, claims worth adversarially verifying | A multi-agent **Workflow** (with pipeline sketch + cost, never auto-launched) |
| Several separable, long-lived tracks that must negotiate an evolving contract, each steered in parallel | An **agent team** (a lead + peer teammates; writers worktree-isolated), never for tight-loop tuning on shared files |
| A multi-turn mission with a mushy finish line | A **/goal** with an evaluator-verifiable condition, drafted ready to fire |
| Babysitting work: waiting on CI, recurring checks, "remind me later" | **/loop** or **/schedule** |
| You just did something the hard way that will recur | Capturing it as a **skill** while the context is hot |
| "From now on, when X..." or a repeated manual ritual | A **settings hook** (the one automation memory can't do) |
| A durable design principle crystallizing mid-conversation | A one-line **decision-log** entry |
| Task gravity not matching the effort applied | **Effort recalibration** - acts on its own levers (narrating them), proposes yours (/fast, /model, budgets) |

Core etiquette baked in: one proposal per opportunity, never stacks proposals, never treats enthusiasm as approval, drops it without ceremony if you decline.

Born from a real session: a "how do we systematically balance these 20 weapons?" conversation became a 12-agent workflow that produced a rerunnable balance harness and a numbers-grounded retune proposal - a thing the user said they would never have thought to ask for.

## Install

Copy any skill directory into your skills folder:

```bash
git clone https://github.com/Matt-Hulme/claude-power-tools.git
cp -r claude-power-tools/suggest-power-tools ~/.claude/skills/
```

Skills follow the standard `SKILL.md` convention (YAML frontmatter + progressive-disclosure references), so they also work with any agent runtime that reads Claude-style skill directories. If you rename the directory, update the `name:` field in the frontmatter to match.

## Optional: the firing hook

A proactive skill only helps if Claude remembers to consult it, and nothing re-injects that reminder at the moment the tool choice is made - so it under-fires. The bundled `UserPromptSubmit` hook fixes that. It prints a one-line "consider a power tool" reminder **only** when your prompt carries opportunity-shaped language (`systematically`, `across the board`, `one at a time`, `new feature`, `migrate`, `remind me`, ...), and stays completely silent otherwise - so it costs zero context on ordinary turns.

Wire it into `~/.claude/settings.json` (merge into any existing `hooks` block, don't replace it):

```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [
          { "type": "command", "command": "~/.claude/skills/suggest-power-tools/hooks/power-tool-scout.sh", "timeout": 5 }
        ]
      }
    ]
  }
}
```

The script ships at `suggest-power-tools/hooks/power-tool-scout.sh` (so after install it lives at the path above). Make it executable (`chmod +x`), then open `/hooks` once or restart to load it. It's precision-biased by default - loosen the `pattern` regex in the script if it under-fires, tighten it if it nags. Requires `jq`.

## License

MIT
