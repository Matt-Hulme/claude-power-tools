# Effort-Calibration Scout

**Action policy: SPLIT.** Effort levers come in two kinds, and the policy differs:

- **Claude-controlled levers: ACT, and narrate in passing.** Adjusting these is just doing the job well - never ask permission, but say what you did and why in one clause ("running this through 3 adversarial verifiers since it touches payment code", "sonnet fleet for the extraction grind"). The user always sees the calibration and can override; they are never interrupted for routine picks. Skip the narration only for the most mundane calls (a single sonnet lookup).
- **User-controlled levers: PROPOSE the exact toggle.** These change session state or billing and only the user can type them.

## The lever inventory

### Claude-controlled (act directly)
| Lever | Down-shift | Up-shift |
|---|---|---|
| Subagent model | `sonnet` for implementation grind, review, lookups; `haiku` for trivial fan-out | `opus` for architecture, synthesis, "second opinion" judgment |
| Verification depth | Trust the diff + types/tests for routine changes | Adversarial verify / independent re-derivation for subtle, irreversible, or security-adjacent changes |
| Search breadth | Direct lookup when the location is known | Explore agents at "very thorough" for cross-cutting questions |
| Workflow scale | Few finders, single-vote verify for "find any issues" | Larger pools, 3-5 vote adversarial passes for "audit thoroughly" |

Respect the user's standing delegation preferences (e.g. a CLAUDE.md model-routing table) as the default; this scout handles the *exceptions* where task gravity overrides the default.

### User-controlled (draft the toggle, hand it over)
| Lever | When to propose |
|---|---|
| `/fast` | Long, grindy, low-risk output ahead (bulk edits, doc generation) where latency dominates and depth doesn't |
| `/model` | The session's default model is mismatched to a long stretch of upcoming work |
| Extended thinking (tab) | A genuinely hard reasoning problem is about to be attempted without it |
| Token budget directive (`+500k` style) | The user wants exhaustiveness and the current budget-free framing will under-deliver |
| `/code-review low..ultra` | Review effort should match change risk: dep bump = low; auth/payment/concurrency touch = high or ultra |

## Recognition - mismatch in either direction

**Underkill** (the dangerous one): a subtle, irreversible, or blast-radius-heavy change getting the routine treatment - concurrency edits, migrations, auth/payment code, public API changes, anything where "looks right" has failed before in this project. User phrases: "make sure", "this has to be right", "audit", "thoroughly".

**Overkill** (the expensive one): premium effort on rote work - the most capable model grinding mechanical renames, adversarial panels on a typo fix, deep research for a fact one search settles. User phrases: "quick", "rough", "don't overthink", "just get it working".

The calibration question is always: **what does a mistake here cost, and what does the extra effort cost?** Effort should track the first, not habit.

## Stay quiet when

- The current effort already matches - most of the time it does; this scout fires on exceptions, not as a constant commentary track.
- The user explicitly chose the effort level this turn - don't relitigate their call. (One respectful flag is allowed if you believe the choice is dangerous; then drop it.)

## The proposal (user-controlled levers only)

> Heads-up on effort: [the mismatch in one line]. Worth toggling `[exact command]` for this stretch? [One line on what it buys and costs.]
