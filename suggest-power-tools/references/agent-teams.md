# Agent Teams Scout

**Action policy: PROPOSE ONLY. Never form a team without an explicit "go".** A team spins up several *full* Claude Code sessions - real token cost, coordination overhead, and the feature is experimental (enable with `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`; session-resume and shutdown are rough). The spend and the setup must be a decision, not a side effect.

## What a team uniquely offers (vs subagents / a workflow)

Both a lead-with-subagents pattern and a workflow funnel through one orchestrator, and their agents are ephemeral and mute to each other. Teams break exactly three of those constraints - and earn their overhead only when all three are in play:

1. **Long-lived tracks** - each teammate accumulates context over many turns (a subsystem, a pipeline, a hypothesis). A spawn-do-die subagent is the wrong shape.
2. **An evolving shared contract the tracks negotiate between themselves** - an API shape, an interface, an asset key - that *changes as they build*. Teammate-to-teammate messaging (not round-tripping the lead) is the thing only teams do.
3. **Parallel human steering** - you want to answer/redirect multiple agents as each surfaces something, instead of funnelling every decision through one thread.

## Recognition - task shapes that want a team

- **Cross-layer feature with a live interface** - frontend, backend, tests, and schema owned by different teammates who negotiate the contract between themselves while you steer each track.
- **Cross-pipeline build with slow, human-judged tracks** - e.g. asset generation you review + code that consumes it + config you tune. Teammates absorb generation/async latency independently and surface to you when each has something to look at, instead of serializing three slow review loops behind one thread.
- **Competing hypotheses held live** - rival debug theories or design prototypes explored simultaneously, peers comparing notes, lead synthesizing. Kills a wrong hypothesis faster than one thread testing them in sequence.

## The distinguishing test (vs a workflow)

- No inter-agent talk needed, agents are one-shot, you don't steer mid-flight → **workflow** (deterministic fan-out) or plain **subagents**.
- Persistent per-track context + peer coordination + parallel human steering → **team**.

## Stay quiet when

- **Tight-loop tuning on shared files** - the human judgment is concentrated on *decisions* over shared state. Parallel writers collide and the human is serial anyway. Use a Workflow (measure / verify) that feeds the decision instead.
- **One-shot fan-out** - audits, reviews, generation, migrations. Agents don't need to talk; a Workflow is cheaper and deterministic.
- **Serial grind on shared core files** - one subsystem, shared global state. One subagent; parallel writers clobber each other.
- **Small work** - a single unit, one bug, one question. Overhead swamps benefit.

## Isolation caveat (always include it)

Any teammate that **writes** files must run in its own git worktree, or concurrent writers clobber each other. Read-only teammates (investigators, reviewers) don't need it. Name this in the proposal - it's the difference between a team that works and a merge disaster.

## The proposal

One compact block, inline:

> This is a team fit, not a workflow - [separable long-lived tracks + the evolving contract + you steering each in parallel]. Team: **lead** (you + integration) + [teammate A: track] + [teammate B: track] + ... Writers get worktrees; they coordinate [the contract] between themselves; you steer each track's [review / decision] as it surfaces. Cost: N persistent sessions, moderate-heavy tokens + coordination overhead, and it's experimental (resume/shutdown rough). Want me to form it?

- **Name what each teammate owns and the contract they share.** Vague teams thrash.
- **Keep the human steering, not blocked.** The pitch is *parallel* human-in-the-loop - you review each track when ready, in any order - not hands-off autonomy.
- **Don't retrofit a team onto a dirty tree.** If the target files already have a large uncommitted diff, propose committing first, then forming the team on a clean tree - otherwise the worktrees fork from a mess.

## Worked example (the boundary against Workflow)

Two adjacent tasks on the same codebase route to *different* tools:

- **Tightening an existing subsystem's config → Workflow.** Breadth over files, decisions stay human, files are shared. Measure/verify fan-out feeding your call. (See `workflow.md`.)
- **Building a *new* cross-layer feature → Team.** A backend teammate (new endpoint + data model), a frontend teammate (the view that calls it), a test teammate (contract + integration tests), each in its own worktree. The contract: the frontend and tests reference the request/response shape the backend invents, and it gets renamed as they iterate. Why a team beats the alternatives: the tracks are long-lived and you want to steer each in parallel, and a Workflow can't let the frontend teammate ask the backend teammate "what did you call that field?" - they negotiate it directly while you review each track as it lands.

The tell every time: **separable long-lived tracks + an evolving contract they negotiate + parallel human steering.** Work that's mechanical, single-pipeline, or tight-loop tuning does not qualify - and that's most day-to-day work, which is why a team is a special-occasion tool, not a default.
