# Automation-Hook Scout

**Action policy: PROPOSE**, then route execution to the update-config skill (hooks live in settings.json; the harness executes them, not Claude).

## The key distinction this scout exists to teach

"From now on, when X happens, do Y" **cannot be fulfilled by memory or preferences** - Claude only acts when invoked, and memory only shapes what Claude does when it happens to be running. A settings.json hook is executed *by the harness, deterministically, every time*. When the user expresses an every-time expectation, a hook is the only honest implementation; quietly storing it as a preference sets them up for disappointment.

## Recognition

- **Explicit**: "from now on...", "every time you...", "always run X after...", "whenever I do Y, also...".
- **Implicit (the valuable catch)**: a manual ritual is repeating - the user (or you) runs the same check after every edit (tsc after changes, a formatter, a test file, a notification on completion). Two repetitions = pattern; three = propose.
- **Friction complaints**: "I keep having to...", "why do I always need to remind you to...".

## Stay quiet when

- The behavior needs judgment per occurrence - hooks run unconditionally on every matching event; a hook that's right 80% of the time is wrong 20% of the time, forever. Judgment-dependent behaviors belong in memory/CLAUDE.md instead.
- It happened once. One repetition is not a ritual.
- The cost of the hook firing wrongly exceeds the cost of doing it manually (e.g. hooks that mutate files or send external messages deserve extra skepticism).

## The proposal

> You've now [done X after Y] [N] times - that's hook-shaped. A [PostToolUse/Stop/...] hook in settings.json would make the harness do it automatically every time, no reminders. Want me to set it up via update-config? (One caveat: it will fire on EVERY [event] - including [the edge case most likely to annoy them].)

Always name the caveat. Hooks are the sharpest tool in this family precisely because they never forget and never use judgment.
