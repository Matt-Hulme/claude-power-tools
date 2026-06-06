# Claude Power Tools

Skills that make Claude Code proactively smarter about its own capabilities.

Claude Code ships with serious force-multipliers - multi-agent workflows, session goals, recurring loops, hooks, custom skills - but you have to know to ask for them. These skills flip that: **Claude notices when your task fits one of its power tools and proposes it**, with a concrete sketch and an honest cost, and you decide.

## Skills

### [`suggest-power-tools`](suggest-power-tools/)

The opportunity spotter. While you work on ordinary tasks, it watches for seven shapes and surfaces a proposal at the right seam:

| It notices... | It suggests... |
|---|---|
| The same question across many files/items, audits, claims worth adversarially verifying | A multi-agent **Workflow** (with pipeline sketch + cost, never auto-launched) |
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

## License

MIT
