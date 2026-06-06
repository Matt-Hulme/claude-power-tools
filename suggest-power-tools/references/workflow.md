# Workflow Scout

**Action policy: PROPOSE ONLY. Never call the Workflow tool without an explicit "go".** Workflows spend real tokens at scale; the spend must be a decision, not a side effect.

## Recognition - task shapes that want a workflow

1. **Breadth** - the same question or operation across many units: every weapon, every API endpoint, every landing page, every config file. One context reading 25 files serially does it shallowly; 6 parallel extractors with structured outputs do it properly.
2. **Panel confidence** - judgments where independent lenses materially raise trust: audits, balance passes, code review, security sweeps, content critiques. A single reviewer anchors on their first read; a panel with distinct lenses plus a synthesis step does not.
3. **Adversarial verification** - findings that could be plausible-but-wrong: bug reports, claimed root causes, research claims, "safe to delete" lists. Skeptic agents prompted to refute kill the survivor bias.
4. **Scale beyond one context** - migrations, renames across hundreds of call sites, whole-repo questions where context limits would force sampling instead of coverage.
5. **Research sweeps** - multi-source, multi-angle questions where any single search modality misses what the others would catch.
6. **Systematic-approach asks** - "how do we systematically...", "weed out", "across the board", "audit this", "make these consistent". Near-explicit invitations; answer with a concrete pipeline, not methodology talk.

The strongest opportunities are compositional: extraction fan-out feeding a deterministic harness feeding a judge panel. If two or more shapes stack, say so.

## Stay quiet when

- One file, one bug, one question, or nearly done already.
- Strictly sequential dependencies - no fan-out width means overhead, not benefit.
- One or two plain Agent-tool subagents cover it. Don't dress up small work as orchestration.

## The proposal

One compact block, inline:

> This is a strong Workflow fit - [which shape(s) and why]. Pipeline: **[Phase 1]** (N agents: what) → **[Phase 2]** (...) → **[Phase 3]** (...). Output: [the durable artifact]. Cost: roughly [N agents, light / moderate / heavy token spend]. Want me to launch it?

- **Name the durable artifact.** A rerunnable tool (report script, harness, checker) beats prose. If a "this conversation never has to happen again" artifact is available, build the pipeline around it.
- **Keep the human the decision-maker inside the pipeline too**: audit/retune/migration workflows end in a proposal doc or flagged-decisions list, not auto-applied changes. Say which decisions stay with the user.

## Worked example (origin case)

User, mid-game-balancing: *"How can we systematically approach nerfing and balancing the weapons... all upgrade choices are not equal... how do we weed these imbalances out?"*

Shape: breadth (~20 weapon files) + deterministic-harness opportunity + judge panel + meta decisions that must stay human-owned.

Proposal: **Extract** (6 parallel readers → structured value-formula specs from code) → **Build** (zero-dep balance harness, `npm run balance:report`, rerunnable forever) → **Verify** (adversarial agent hand-derives 4 weapons' math, fails the harness on drift) → **Audit** (3 judge lenses: cross-stat inversions, degenerate strategies, identity collisions) → **Synthesize** (retune proposal doc; caps philosophy flagged as a user decision).

Why it worked: a permanent balance tool plus a numbers-grounded proposal, every config change stayed the user's call - and the user said they wouldn't have anticipated asking for it. That's the scout's whole reason to exist.
