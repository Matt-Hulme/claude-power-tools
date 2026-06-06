# Loop / Schedule Scout

**Action policy: PROPOSE.** Both /loop and /schedule are user-invoked; the scout drafts the exact command line and hands it over.

## Recognition - babysitting and deferred obligations

- **Polling external state the harness can't see**: a CI run, a deploy pipeline, a remote queue, a third-party job. The user says "let me know when...", "check back on...", "is it done yet?"
- **Recurring chores**: "keep the PRs babysat", "re-run the audit weekly", "check the error logs every morning".
- **Deferred one-shots**: "remind me tomorrow", "run this after the launch", "next week we should...". These carry a concrete date or event.

## Choosing the dispatch

| Situation | Tool | Why |
|---|---|---|
| Needs THIS session's context, recurring or polling while the session lives | `/loop <interval> <prompt>` (or no interval - the model self-paces) | Runs in the open session; sees everything already in context |
| Should run whether or not a session is open; cron-shaped; one-time future run | `/schedule` (remote routine) | Survives the laptop lid; independent execution |

## Stay quiet when

- The harness already notifies automatically: background Bash commands, spawned agents, and Workflows all re-invoke Claude on completion. Proposing a loop to poll those is pure waste - this is the most common false positive, don't be it.
- The "recurring" need is actually 2-3 repetitions inside the current task - just do them.
- A /goal fits better: "until CONDITION holds" is a goal; "every N minutes regardless" is a loop. Don't propose both.

## The proposal

> This is babysitting work - [what's being watched and why the harness won't auto-notify]. Want to run:
> `/loop 5m check <thing>; report only on state change`
> (or for cron-shaped: "want me to set up a /schedule routine - [cadence] - [task]?")

For /schedule, note it runs remotely and billed separately, so the user is opting into spend.
