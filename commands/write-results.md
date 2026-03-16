---
allowed-tools: Read, Write, Glob, Grep, WebSearch, Task
argument-hint: "[study-type] e.g. systematic-review, rct, cohort, prediction-model"
description: "Write the Results section, extracting all numbers directly from source materials"
---

# /write-results

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

Read `skills/study-types/<study-type>/SKILL.md` and all files in `skills/study-types/<study-type>/references/`. Load Section 3 (Results Conventions) from the study-type SKILL.md for the canonical Results subsection order and guidance.

Also read `skills/visual/SKILL.md` for figure interpretation guidance — this is needed to extract numerical values from figures before writing.

## Step 4: Check for optional integrations

Read `skills/integrations/SKILL.md`. Run detection if this is the first command invocation this session. If `scientific-writing` is detected, use its two-stage outline-then-prose workflow. Otherwise, use the built-in section-by-section approach.

## Step 5: Read source materials

Ask the user for the location of source materials (figures, tables, forest plots, analysis output, data files). Emphasise reading figures and tables first — these are the primary source of numerical data for the Results section. Use the visual engine guidance from `skills/visual/SKILL.md` to interpret any figures before writing.

If `PAPER_CONTEXT.md` specifies a `Source materials` folder, check there first. Read all relevant files using the Read tool.

**Critical rule:** Never invent or estimate numbers. Only use values explicitly visible in source materials. If a value is unclear, flag it as `[UNCLEAR IN SOURCE — please verify]`.

## Step 6: Write section by section

Follow the canonical Results subsection order from Section 3 of the study-type SKILL.md. For each subsection:

1. Draft the subsection using the prose guidance and template sentences from the SKILL.md
2. Apply core conventions: past tense, UK English, full paragraphs, precise quantification, verification flags for missing details
3. Present the drafted subsection to the user for confirmation
4. Wait for approval before proceeding to the next subsection

**Key rules specific to Results:**
- NO citations in Results — all claims come from the study's own data
- Cross-reference all figures and tables inline (Figure 1, Table 2, eFigure 1, eTable 1)
- Every finding needs: point estimate + 95% CI + p-value + sample size (where applicable)
- Report numbers to one decimal place for percentages; two decimal places for CIs and p-values
- Write in full paragraphs with flowing prose — never bullet points in the final text

## Step 7: Save output

Ask the user where to save the completed Results section. Write to file using the Write tool. If `PAPER_CONTEXT.md` specifies a `Manuscript output` folder, suggest saving there.
