# Skill-Creation Scout

**Action policy: PROPOSE** capture via the skill-creator skill (never hand-author a SKILL.md from scratch - skill-creator owns structure, triggering, and evals).

## Recognition - "we just did something the hard way that will recur"

- **A pipeline got invented mid-task.** Tools failed, workarounds were found, a working path emerged through iteration. (Origin example: two MCP servers turned out to have broken core operations, so a working path was invented mid-task by scripting the underlying app directly from the CLI. Obviously reusable; nobody proposed capturing it. That miss is why this scout exists.)
- **The same correction landed twice.** The user fixed your approach the same way more than once - that correction is a skill (or memory) wanting to exist.
- **A prompt recipe or parameter set got tuned.** Hard-won knowledge about how to talk to an API/model/tool that took several failures to learn.
- **The user says** "how did you do that?", "we should remember this", "save this approach", or repeats a request you've fulfilled before from scratch.

## The capture test

Propose only when ALL THREE hold:
1. **Recurrence is plausible** - the situation will arise again, in this project or others.
2. **The knowledge is non-obvious** - a fresh Claude would NOT reconstruct it from docs and common sense. (If it would, a skill adds noise, not value.)
3. **It's procedural** - there's a how, not just a fact. Bare facts go to memory, not a skill.

## Timing matters

Propose while the context is hot - the same session where the technique was invented, while the failure modes and exact commands are still in context. Capture quality degrades fast; a skill written next week from a summary loses the gotchas that made it valuable.

## Stay quiet when

- One-off work, even if clever.
- An existing skill already covers it - check the available-skills list first; propose *updating* that skill instead of creating a competitor (overlapping triggers make both fire unreliably).
- The lesson is a single fact or preference - that's a memory write, not a skill.

## The proposal

> We just built a repeatable technique here - [one line: what it is]. A fresh session would have to rediscover [the specific hard-won parts]. Want me to capture it as a skill via skill-creator (~[small/moderate] effort)? Suggested name: `[domain-prefix-name]`.
