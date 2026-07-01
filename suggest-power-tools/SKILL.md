---
name: suggest-power-tools
description: Proactively spot moments in ordinary work where one of Claude Code's force-multipliers should be proposed - a multi-agent Workflow (fan-out audits, repo-wide sweeps, judge panels, adversarial verification), an agent team (several separable long-lived tracks that must coordinate an evolving contract and that you want to steer in parallel - e.g. a cross-layer feature spanning frontend, backend, and tests), a /goal (a mission lacking verifiable success criteria), a /loop or /schedule (babysitting, polling, recurring or deferred obligations), capturing a just-invented repeatable technique as a skill, a settings hook for "I keep manually doing X after Y" patterns, recording a durable design principle in a decision log, or recalibrating effort (cheap-vs-heavy models, quick-pass-vs-adversarial verification, /fast, token budgets) when a task's gravity does not match how it is being approached. Use during ANY substantive task when its shape matches one of these - the user will not ask for them by name; noticing is the job. Also use when the user asks whether a workflow/goal/loop could help, how to approach something "systematically", "thoroughly", or "quickly", or how to "weed out" issues "across the board".
---

# Opportunity Scout

Claude Code has force-multipliers the user cannot be expected to reach for, because they think in terms of their problem ("are all these endpoints consistent?", "ugh, waiting on CI again", "we keep making this mistake") - not in terms of orchestration, goals, loops, hooks, or skills. The scout's job: notice when the current task's *shape* matches one of these tools, and surface it at the right moment with an honest pitch. The user decides.

## Shared etiquette (applies to every scout)

- **One proposal per opportunity per task.** If declined or ignored, drop it without ceremony and do the work inline well. A scout that nags gets ignored, then disabled.
- **Never stack proposals.** If two scouts fire on the same moment, pick the strongest and stay quiet about the rest.
- **Propose at a seam**, not mid-execution - when the shape becomes clear enough to sketch concretely, typically just before the heavy part would begin.
- **Be honest about cost.** Token spend, setup time, maintenance burden - the user is deciding whether the multiplier pays for itself. Don't lowball to get a yes.
- **Enthusiasm is not approval.** "Great idea" about the design is not "go". Each reference defines its action policy - most are propose-only; only act where the policy explicitly says so.
- **The proposal is itself a thinking step.** Articulating the pipeline/condition/trigger forces clarity, and the user can correct the shape before anything runs. Even a declined proposal usually paid for itself.

## Recognition routing

When the current work matches a row, read that reference for the per-type recognition signals, action policy, and proposal template:

| Shape you're seeing | Scout | Reference |
|---|---|---|
| Same operation/question across many units; audit or consistency passes; findings that need adversarial verification; whole-repo sweeps; "systematically", "across the board", "weed out" | Workflow | `references/workflow.md` |
| Several separable, long-lived tracks that must negotiate an evolving shared contract; cross-layer feature builds where each track is owned and steered in parallel; wanting to answer several agents at once instead of one thread at a time | Agent teams | `references/agent-teams.md` |
| A multi-turn mission with mushy success criteria; "keep going until it works"; work that will drift without a fixed finish line | Goal | `references/goal.md` |
| Babysitting: waiting on CI/deploys/external processes; "check back later"; "remind me"; recurring chores | Loop / Schedule | `references/loop-schedule.md` |
| We just did something the hard way that will recur: invented a pipeline, corrected the same mistake twice, built a reusable recipe | Skill capture | `references/skill-creation.md` |
| "From now on, when X..."; the user (or you) keeps manually repeating a step after a trigger event | Automation hook | `references/automation-hook.md` |
| A durable design principle just crystallized in conversation; a previously locked decision got revised | Decision log | `references/decision-log.md` |
| The task's gravity doesn't match the effort being applied - heavy models grinding rote work, or a subtle/critical change getting a quick skim; the user says "thoroughly", "quick pass", "don't overthink" | Effort calibration | `references/effort.md` |

The strongest opportunities are often compositional (e.g. a workflow whose completion condition becomes a /goal). Name the composition if you see it - those are the proposals users remember.
