#!/usr/bin/env bash
# UserPromptSubmit hook for the suggest-power-tools scout.
#
# Proactive skills under-fire: nothing re-injects the reminder at the moment
# the tool choice is made. This hook fixes that. It injects ONE line reminding
# Claude to consider a force-multiplier (workflow / agent team / loop) ONLY when
# the prompt carries high-signal, opportunity-shaped language. Silent otherwise
# => zero context cost on non-matching turns. Never blocks prompt submission
# (always exit 0). See ../README of the repo, or the repo README, for wiring.
set -euo pipefail

input=$(cat)
prompt=$(printf '%s' "$input" | jq -r '.prompt // empty' 2>/dev/null | tr '[:upper:]' '[:lower:]')
[ -z "$prompt" ] && exit 0

# Precision over recall: multi-word / contextual signals only, so it stays
# near-silent on ordinary prompts. Loosen if it under-fires; tighten if it nags.
pattern='systematically|across the board|weed out|one at a time|in parallel|every single|all of the (files|configs|endpoints|components|modules|tests)|for (all|each|every) |audit (this|the|all|every|our|each)|keep (running|checking|polling|going until)|check back|remind me|from now on|whenever i |new (feature|module|service|endpoint|component|subsystem)|competing (hypothes|theor)|migrat(e|ion)|rename across|refactor across|batch of'

if printf '%s' "$prompt" | grep -Eq "$pattern"; then
  echo "[scout-check] This prompt looks like a possible force-multiplier moment (dynamic workflow / agent team / loop). Consult the suggest-power-tools skill and propose if it genuinely fits; otherwise proceed inline without comment."
fi
exit 0
