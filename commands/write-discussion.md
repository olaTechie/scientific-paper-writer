---
allowed-tools: Read, Write, Glob, Grep, WebSearch, WebFetch, Task
argument-hint: "[section] e.g. main-findings, policy, strengths-limitations, conclusion, all"
description: "Write the Discussion section with literature comparison and multi-source citation verification"
---

# /write-discussion

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

## Step 3: Load study-type module and citation engine

Read `skills/study-types/<study-type>/SKILL.md` and all files in `skills/study-types/<study-type>/references/`. Load Section 4 (Discussion Considerations) from the study-type SKILL.md for guidance specific to this study type's Discussion.

Also read `skills/citations/SKILL.md` for citation verification pipeline. The Discussion section requires verified citations for literature comparison.

## Step 4: Check for optional integrations

Read `skills/integrations/SKILL.md`. Run detection if this is the first command invocation this session. If `scientific-writing` is detected, use its two-stage outline-then-prose workflow. If `research-lookup` integration is detected, use it for literature search during the Main Findings section.

## Step 5: Read source materials and search literature

Ask the user for the completed Results section (or draft report). Read it and extract: primary outcome estimate, direction and magnitude of secondary findings, any null results, key limitations flagged in analysis.

BEFORE writing Main Findings, search PubMed for comparison literature:
- Recent (last 5-7 years) systematic reviews, meta-analyses, or major cohort studies on the same topic
- Prioritise pooled evidence (SRMAs) over individual studies
- Use the citation engine pipeline from `skills/citations/SKILL.md` to verify all found references

If `PAPER_CONTEXT.md` specifies a `Source materials` folder, check there first.

## Step 6: Write section by section

Write the Discussion in the canonical order. If `$ARGUMENTS` specifies a particular section, write only that section. For each subsection:

1. Draft the subsection
2. Apply core conventions: present tense for established knowledge, past tense for own findings, UK English, full paragraphs
3. Present the drafted subsection to the user for confirmation
4. Wait for approval before proceeding to the next subsection

### Canonical Discussion order:

**Main Findings** (~200 words own findings + ~200-300 words literature comparison + ~100 words mechanistic plausibility):
- Restate primary quantitative finding with full statistics (point estimate, 95% CI, heterogeneity if applicable)
- Mirror the hierarchy of Results: primary outcome, secondary outcomes, subgroup/exploratory analyses
- Compare own findings with prior pooled estimates (consistent / divergent / extends prior work)
- Explain divergences (methodological differences, population differences, time period)
- Provide biological or mechanistic plausibility if relevant (brief, evidence-based, no speculation)

**Policy & Future Research** (~400-500 words):
- Link recommendations directly to findings — do not overclaim
- Distinguish: what the evidence supports now vs what remains uncertain
- Be specific about future research: name study designs, populations, settings, comparators

**Strengths & Limitations** (~300-400 words):
- Strengths (~40% of section): specific, not generic praise — pre-specified protocol, comprehensive search, methodological innovation, reporting standards
- Limitations (~60% of section): 4-5 major limitations only, for each state the limitation and likely direction of bias

**Conclusion** (3-5 sentences):
- Restate main finding, state what this study adds, acknowledge one key limitation (optional), state what should happen next

**Citation rules:**
- Vancouver numbering from 1
- Verify all citations via the citation engine pipeline (PubMed, CrossRef, Semantic Scholar, bioRxiv)
- Limit to 8-15 references total
- Flag any unverifiable citation: `[Citation needed — unable to verify]`
- Do NOT fabricate citations

## Step 7: Save output

Ask the user where to save the completed Discussion section. Write to file using the Write tool. If `PAPER_CONTEXT.md` specifies a `Manuscript output` folder, suggest saving there.
