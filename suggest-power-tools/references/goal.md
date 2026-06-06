# Goal Scout (/goal)

**Action policy: DRAFT AND HAND OVER.** Claude cannot set a goal programmatically - `/goal` is user-typed only. So the scout's "add" is: write the exact `/goal <condition>` line, ready to fire, and ask the user to run it (or refine it first). When the success criteria are ambiguous, ask ONE clarifying question, then hand over the drafted line.

## How /goal works (mechanics that shape the draft)

- `/goal <condition>` starts working immediately with the condition as the directive. One goal per session; a new one replaces it. `/goal` alone shows status; `/goal clear` stops it.
- After each turn, a small fast model judges the condition against the conversation and either ends the goal (met) or kicks off another turn with its reason as guidance.
- **The evaluator cannot run tools or read files** - it only sees what the conversation surfaces. Conditions must be written so the transcript can demonstrate them.
- Goals survive `--resume`/`--continue`; they are cleared by `/clear`.

## Condition craft - this is the whole game

Write conditions whose satisfaction is *visible in the transcript*:

- Good: "`npx vitest run` exits 0 and `npx tsc --noEmit` is clean" - Claude will paste the output, the evaluator can see it.
- Good: "every endpoint in the audit doc has a verdict entry, confirmed by a printed checklist"
- Bad: "the code is correct" / "the feature works well" - nothing in a transcript proves it; the loop either spins or ends on vibes.
- Bad: "all files are updated" - unverifiable unless the condition names the check that demonstrates it.

If the user's mission can't be phrased verifiably, that's the clarifying question to ask: "what would prove this is done?"

## Recognition - when a /goal earns its keep

- A multi-turn mission with a real finish line that work could drift away from: "get the test suite green", "migrate all call sites and keep tests passing", "drive this checklist to done".
- "Keep going until..." phrasing from the user - that is literally what /goal does.
- Long unattended runs (the user is stepping away) where turn-by-turn steering won't happen.

## Overuse guard (the user asked for this explicitly)

Goals are powerful and should stay rare. Do NOT propose for:
- Anything completable this turn or with a known fixed step count - just do it.
- Vague aspirations with no checkable finish line (fix the criteria first or skip).
- A session that already has an active goal - one at a time; replacing has real cost.
- Work the user is actively steering message-by-message - a goal adds a second driver.

Rule of thumb: if you wouldn't bet the mission survives three turns unsupervised, it doesn't need a goal.

## The proposal

> This is /goal-shaped - [one line why: drift risk / finish line]. Ready to fire:
> `/goal <verifiable condition, exact text>`
> Run it as-is or tell me what to tweak.
