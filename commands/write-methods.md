---
allowed-tools: Read, Write, Glob, Grep, WebSearch, WebFetch, Bash, Task
argument-hint: "[study-type] e.g. systematic-review, rct, observational, prediction-model"
description: "Write the Methods section for a scientific manuscript, aligned with the appropriate reporting guideline"
---

# /write-methods

## Step 1: Load core conventions

Read `skills/core/SKILL.md` for shared conventions (prose rules, precision, verification flags, no-fabrication guarantee).

## Step 2: Determine study type

If the study type was pre-loaded from `PAPER_CONTEXT.md`, use it. If provided as argument (`$ARGUMENTS`), use that. Otherwise, ask the user using the study-type list from the core skill:

- `systematic-review` — Systematic Review / Pairwise Meta-Analysis (PRISMA 2020)
- `network-meta-analysis` — Network Meta-Analysis (PRISMA-NMA)
- `ipd-meta-analysis` — Individual Patient Data Meta-Analysis (PRISMA-IPD)
- `dose-response` — Dose-Response Meta-Analysis
- `bayesian-meta-analysis` — Bayesian Meta-Analysis
- `rct` — Randomised Controlled Trial (CONSORT 2010)
- `observational` — Observational: Cohort, Case-Control, Cross-Sectional (STROBE)
- `economic-evaluation` — Economic Evaluation: CEA/CUA/CBA (CHEERS 2022)
- `prediction-model` — Prediction/Prognostic Model or Generic ML (TRIPOD+AI)
- `diagnostic-accuracy` — Diagnostic Accuracy Study (STARD 2015)
- `qualitative` — Qualitative / Mixed Methods (COREQ/SRQR)

## Step 3: Load study-type module

Read `skills/study-types/<study-type>/SKILL.md` and all files in `skills/study-types/<study-type>/references/`. The SKILL.md contains the canonical subsection order, template sentences, and prose guidance for this study type's Methods section (Section 2 of the SKILL.md).

## Step 4: Check for optional integrations

Read `skills/integrations/SKILL.md`. Run detection if this is the first command invocation this session. If `scientific-writing` is detected, use its two-stage outline-then-prose workflow. Otherwise, use the built-in section-by-section approach.

## Step 5: Read source materials

Ask the user for the location of source materials (protocol, search strategy, analysis scripts, figures, tables, data extraction forms). If `PAPER_CONTEXT.md` specifies a `Source materials` folder, check there first. Read all relevant files using the Read tool.

## Step 6: Write section by section

Follow the canonical Methods subsection order from Section 2 of the study-type SKILL.md. For each subsection:

1. Draft the subsection using the prose guidance, template sentences, and checklist items from the SKILL.md
2. Apply core conventions: past tense, UK English, full paragraphs, precise quantification, verification flags for missing details
3. Present the drafted subsection to the user for confirmation
4. Wait for approval before proceeding to the next subsection

**Key rules:**
- Never invent procedural details — flag with `[PLEASE VERIFY: ___]`
- Be precise: never "several" when an exact number should exist
- State software with version numbers
- Cite the reporting guideline in the Methods text

## Step 7: Output reporting checklist

After all subsections are written, read the reporting checklist from `skills/study-types/<study-type>/references/` and output it with status for each item based on what was written:
- Items satisfied
- Items partially addressed
- Items missing

Flag any items that could not be addressed due to missing information, and prompt the user to supply the details.

## Step 8: Save output

Ask the user where to save the completed Methods section. Write to file using the Write tool. If `PAPER_CONTEXT.md` specifies a `Manuscript output` folder, suggest saving there.
