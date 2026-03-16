# Methods Writing Skill

## Purpose
This skill guides the writing of Methods sections for quantitative research papers, ensuring full alignment with the appropriate reporting guideline (PRISMA 2020, STROBE, CONSORT, TRIPOD+AI, STARD, or COREQ/SRQR).

## Trigger Phrases
- "write my methods"
- "draft the methods section"
- "write methods aligned with PRISMA"
- "STROBE-compliant methods"
- "TRIPOD methods"
- "write study design"
- "write eligibility criteria"
- "write search strategy"
- "write statistical analysis section"
- "write data extraction"
- "write risk of bias section"
- "write synthesis methods"
- "write the participants section"
- "write model development"
- "/write-methods"

## Core Principles

### 1. Never invent procedural details
The Methods section describes what was actually done. If information is missing (e.g., exact software version, number of reviewers), flag with `[PLEASE VERIFY: ___]`. Do not guess or paraphrase vaguely — a Methods section must be reproducible.

### 2. Match guideline to study type automatically
| Study Type | Guideline | Key Reference |
|---|---|---|
| Systematic review / meta-analysis | PRISMA 2020 | Page et al. *BMJ* 2021;372:n71 |
| Observational (cohort, case-control, cross-sectional) | STROBE | von Elm et al. *Lancet* 2007;370:1453–1457 |
| RCT | CONSORT 2010 | Schulz et al. *BMJ* 2010;340:c332 |
| Prediction / prognostic model | TRIPOD+AI | Collins et al. *BMJ* 2024;385:e078378 |
| Diagnostic accuracy | STARD 2015 | Bossuyt et al. *BMJ* 2015;351:h5527 |
| Qualitative or mixed methods | COREQ / SRQR | Tong et al. *Int J Qual Health Care* 2007 |

Announce guideline selection before writing. Allow user to override.

### 3. Write in past tense, passive or active as appropriate
- Past tense throughout: "Studies were included if...", "We extracted data on..."
- Passive voice is conventional for procedural steps
- Active voice acceptable when it improves clarity: "Two reviewers independently screened..."

### 4. Be precise with quantitative language
Never write "several", "a number of", "multiple" when an exact figure should exist. If the exact number is unknown, flag it.

### 5. Sequence matters
For SRMA, the canonical subsection order is:
1. Protocol and Registration
2. Eligibility Criteria
3. Information Sources and Search Strategy
4. Study Selection
5. Data Extraction
6. Risk of Bias Assessment
7. Effect Measures
8. Synthesis Methods (including heterogeneity, subgroup analyses, meta-regression, publication bias, sensitivity analyses)

For observational studies (STROBE):
1. Study Design and Setting
2. Participants
3. Variables (outcome, exposure, covariates)
4. Data Sources and Measurement
5. Bias
6. Study Size
7. Statistical Methods

For prediction models (TRIPOD+AI):
1. Source of Data
2. Participants
3. Predictors
4. Sample Size
5. Missing Data
6. Model Development
7. Model Performance (discrimination, calibration)
8. Internal Validation
9. External Validation (if applicable)
10. Software and Reproducibility

## Statistical Reporting Standards for Methods

### Meta-Analysis Model Description
- Always state the model type: random-effects (specify REML or DL estimation), fixed-effects, or multilevel/three-level
- For three-level models: "A three-level random-effects meta-analytic model was fitted using the rma.mv function in the metafor package (version X.X) in R (version X.X), with effect sizes nested within studies."
- State HKSJ if used: "Standard errors were adjusted using the Knapp-Hartung (HKSJ) method to account for uncertainty in the between-study variance estimate."
- Heterogeneity statistics to report in Methods: Cochran's Q test, I² statistic, τ², 95% prediction interval method (Higgins & Thompson or IntHout)

### Subgroup Analysis Description
- State whether pre-specified or post-hoc
- State grouping variable
- State test for subgroup differences: "Subgroup differences were assessed using a χ² test of interaction."

### Meta-Regression Description
- State covariates and their rationale
- State estimation: "Meta-regression was conducted using REML estimation with HKSJ-corrected standard errors."
- State whether continuous or categorical moderators

### Publication Bias
- Egger's weighted regression test for funnel plot asymmetry
- Trim-and-fill method (if ≥10 studies)
- State direction of potential bias if detected

### Vaccine Effectiveness Formula (for SRMA of VE studies)
Always state the formula explicitly:
> "Vaccine effectiveness was calculated as VE% = (1 − effect estimate) × 100%, where the effect estimate was the odds ratio, relative risk, or hazard ratio from each study, as reported."

### Missing Data (for observational / prediction)
State approach:
- Complete case analysis: "Studies with missing outcome or covariate data were excluded from primary analyses (complete case analysis)."
- Multiple imputation: "Missing data were handled using multiple imputation by chained equations (MICE) with m = [NUMBER] imputations."

## Eligibility Criteria Checklist (PICO/PICOTS)

For SRMA, ensure the eligibility section covers all PICOTS elements:
- **P** — Population (age range, clinical setting, diagnosis, geographical scope)
- **I** — Intervention or exposure (vaccine type, dose, timing)
- **C** — Comparator (unvaccinated, placebo, alternative vaccine)
- **O** — Outcomes (primary outcome defined precisely; secondary outcomes listed)
- **T** — Time (study period, follow-up duration)
- **S** — Study design (observational only? RCTs only? Both?)

## Risk of Bias Tools

| Study Design | Tool |
|---|---|
| RCTs | Cochrane RoB 2 tool |
| Non-randomised studies of interventions | ROBINS-I |
| Observational studies (aetiology) | Newcastle-Ottawa Scale (NOS) |
| Diagnostic / prognostic | QUADAS-2 |
| Prevalence studies | JBI prevalence tool |
| Prediction models | PROBAST |

State the domain-level assessment and the overall RoB judgement categories used.

## Reporting Checklist Template

At the end of writing, output a guideline checklist. Use this structure:

```
REPORTING CHECKLIST — PRISMA 2020 (Page et al., BMJ 2021)

TITLE / ABSTRACT
✅ 1. Title identifies as systematic review
✅ 2. Structured abstract with PICO elements

INTRODUCTION
[handled in Introduction section]

METHODS
✅ 4a. Protocol registration stated
✅ 4b. Eligibility criteria (PICOTS)
✅ 4c. Information sources and dates
✅ 4d. Search strategy (full strategy in supplement)
✅ 4e. Study selection process
✅ 4f. Data extraction process
✅ 4g. Risk of bias assessment tool stated
✅ 4h. Effect measures defined
✅ 4i–4m. Synthesis methods (heterogeneity, subgroup, meta-regression, bias, sensitivity)

⚠️ 4n. Certainty of evidence (GRADE) — [flag if not mentioned]
```

Adapt checklist items to the relevant guideline. See references/reporting-guidelines.md for full item lists.

## Pause Points

Always pause and request confirmation from the user:
- After stating the selected guideline ("Is PRISMA 2020 correct for your study?")
- After each major subsection
- Before writing the synthesis/statistical methods subsection (most complex)
- After outputting the checklist ("Are there any items flagged ⚠️ or ❌ you'd like me to address?")

## Language Conventions

**Use**:
- "We conducted a systematic review and meta-analysis"
- "Studies were eligible if they enrolled..."
- "Data were extracted independently by two reviewers"
- "Heterogeneity was assessed using Cochran's Q statistic and the I² index"
- "A random-effects model was used to pool effect estimates"

**Avoid**:
- "We found several papers" (vague)
- "The data was analysed" (grammatically incorrect — data are plural)
- "Results were significant" in Methods (results belong in Results)
- Any interpretation of findings

## Common Errors to Watch For

1. **Mixing methods and results**: The Methods section should describe procedures only, not outcomes
2. **Vague database descriptions**: Write "MEDLINE via PubMed" not just "PubMed"; write "Embase via Elsevier" not just "Embase"
3. **Missing search date**: Always include the date the search was last run
4. **Unstated heterogeneity thresholds**: If you mention I² thresholds (e.g., <25% low), state where these come from (Higgins et al.)
5. **Missing software citation**: Always cite R or Stata or SAS with version number
6. **Omitting HKSJ**: If HKSJ was used, it must be stated explicitly
7. **Undefined VE formula**: For vaccine studies, always write the formula
