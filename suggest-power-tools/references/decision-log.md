# Decision-Log Scout

**Action policy: PROPOSE** a one-line entry; write it only on a yes. Low ceremony by design - this is the cheapest scout in the family, and the proposal should cost the user five seconds to approve.

## Recognition - a durable principle just crystallized

- **A generalizing rule emerged from a specific debate.** The conversation resolved one case but the reasoning covers a class. (Origin example: a debate about whether one feature's stacking bonus should be allowed to reach a second feature's signature effect produced "no feature's scaling should quietly grow into another feature's identity" - one discussion, a principle that governs every future design.)
- **"Let's always / never..."** - the user states a standing policy mid-conversation.
- **A locked decision got revised.** Something previously settled was deliberately changed. Unrecorded reversals look like drift to the next reader (human or agent) and get "fixed" back.
- **A trade-off was decided with reasoning that won't be reconstructible** from the code alone - the code shows WHAT, the log preserves WHY.

## Where it goes

- A project decision log if one exists (check for `decision-log.md` / docs conventions in the repo's CLAUDE.md) - append-only, dated, one entry.
- Otherwise auto-memory (a `project` or `feedback` memory file) for cross-session recall.
- If the principle is about how the user wants *Claude* to behave, memory is the right home even when a project log exists.

## Stay quiet when

- It's a fact, not a decision - facts the repo already records (code, git history, configs) don't need logging.
- It's tentative - "maybe we should..." isn't a decision yet. Wait for the resolution.
- It only matters to this conversation.

## The proposal

> That's a durable principle - worth a decision-log entry? Draft: "[date] - [one-line decision] - [one-line why]". Say yes and I'll append it.
