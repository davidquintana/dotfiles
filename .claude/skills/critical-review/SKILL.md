---
name: critical-review
description: Use when a plan, architecture, or design has been drafted and needs adversarial review before committing to it. Dispatches a subagent to keep the main conversation context free.
---

# Critical Review

Dispatch a skeptical staff-engineer subagent to find holes in a plan or design.

## When to Use

- After drafting an implementation plan, migration plan, or architecture
- Before committing to a significant technical direction
- When you want a fresh-eyes review without polluting the current conversation context

## How It Works

1. **Collect context** from the current conversation: the plan, key constraints, architecture decisions, and any prior analysis (e.g., security audit)
2. **Dispatch a Task subagent** (`subagent_type: general-purpose`, `model: opus`) with the full context and the review prompt below
3. **Summarize findings** back to the user, grouped by severity

The subagent gets a **clean context** with only the material you provide — no conversation history leaking in.

## Subagent Prompt Template

Adapt this to the situation. Include ALL relevant context — the subagent knows nothing else.

```
You are a staff engineer reviewing an implementation plan. Be skeptical. Look for:
- Edge cases the plan doesn't address
- Assumptions that might not hold
- Simpler alternatives
- Potential performance issues
- Operational gotchas for a [solo operator / small team / etc.]
- Security gaps

Do NOT just validate the plan. Your job is to poke holes.

---

## Context

[Paste: what the system is, who operates it, current state, constraints]

## Decisions Already Made

[Paste: architecture choices, technology picks, and why]

## The Plan Being Reviewed

[Paste: the full plan with all steps]

## Prior Analysis (if any)

[Paste: security audit, trade-off analysis, etc.]

---

## Your Task

Review this plan critically. For each issue you find, classify it as:
- **BLOCKER** — will prevent the plan from working
- **RISK** — could cause problems, needs mitigation
- **QUESTION** — assumption that should be validated before proceeding
- **SUGGESTION** — improvement that's not critical but worth considering

Be specific. Don't just say "consider backups" — say exactly what could go wrong and what to do about it.

End with a summary table: issue number, severity, one-line summary.
```

## After Review

Present findings to the user grouped by severity (blockers first). For each item, add your own assessment: agree, disagree, or "needs investigation." Then offer to revise the plan incorporating the valid findings.
