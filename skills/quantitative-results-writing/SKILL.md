---
name: quantitative-results-writing
description: >
  This skill should be used when writing the Results section of a quantitative
  research paper. Trigger phrases include: "write my results", "draft the results
  section", "write study selection", "write risk of bias", "write primary analysis",
  "write pooled estimates", "write waning analysis", "write subgroup results",
  "help me report my statistics", "write my forest plot results".
  Covers systematic reviews, meta-analyses, RCTs, cohort studies, and ML papers.
version: 0.1.0
---

# Quantitative Results Writing

## Core Principle

Never invent, estimate, or paraphrase numerical values. Every number must be extracted directly from source materials (PDFs, images, analysis outputs, tables). If a value cannot be read clearly, flag it as **[UNCLEAR IN SOURCE — please verify]** and continue.

## General Statistical Reporting Standards

Always report, for each main finding:
- **Point estimate** (e.g., OR, RR, HR, VE%, AUC, mean difference)
- **95% confidence interval** in parentheses or brackets
- **P-value** (report exact value to 2 decimal places; use *P* = .XX format for JAMA; p < 0.001 when very small)
- **Sample size** (N events / N total, or N per group)

Round consistently:
- Percentages: 1 decimal place (67.8%, not 67.77%)
- Odds ratios/hazard ratios: 2 decimal places (1.43, not 1.4)
- P-values: 2–3 decimal places (p = 0.061; p = 0.91)

## Study-Type Specific Conventions

See `references/statistical-reporting.md` for detailed reporting checklists by study type.

### Systematic Review and Meta-Analysis

**Primary pooled estimate:** Report point estimate + 95% CI + method (random-effects, REML/DL/HKSJ).

**Heterogeneity — always report all four:**
- Cochran's Q statistic and p-value
- I² statistic (with 95% CI if available)
- τ² (between-study variance; report estimate and 95% CI via profile likelihood if available)
- 95% Prediction interval (PI): the range of true effects expected in 95% of similar future populations — always report alongside CI

**Interpreting heterogeneity:**
- I² < 25%: low heterogeneity
- I² 25–75%: moderate heterogeneity
- I² > 75%: high heterogeneity
- Always pair with the 95% PI — I² can be low even when PI is wide (small k problem)

**Vaccine effectiveness (VE):** VE% = (1 − θ) × 100, where θ is the OR, RR, or HR. Back-transform from log-scale before reporting. Explicitly distinguish **absolute VE** (vs unvaccinated) from **relative VE** (vs alternative vaccine) throughout.

**Waning analyses:** Report slope (log-odds per year), p-value, between-study variance (σ²_between, I²_between), within-study variance (σ²_within, I²_within). Report model-predicted VE at key time points. State clearly what the prediction interval implies at each time horizon. Distinguish interpolated (within data range) from extrapolated (beyond data range) predictions.

**Sensitivity analyses:** Report each alternative estimate with its own CI and I². State the direction of change relative to the base case. Do not over-interpret small numerical differences.

**Subgroup analyses:** Always report the test for subgroup difference (χ² statistic, degrees of freedom, p-value). Do not claim a subgroup effect without a statistically significant interaction test. Prespecified subgroups have higher evidential weight than post-hoc.

### RCT

Report ITT analysis as the primary. Report per-protocol as secondary. Include both absolute and relative risk estimates. Calculate NNT = 1 / ARR where appropriate. For time-to-event outcomes, report log-rank test and median follow-up.

### Cohort / Observational

Report crude and adjusted estimates separately. Name the covariates in the final adjusted model. For propensity score analyses, report standardised mean differences before and after matching/weighting.

### Machine Learning

Report discrimination (AUC-ROC, AUC-PR), calibration (Brier score, calibration plot), and threshold-based metrics (sensitivity, specificity, PPV, NPV at specified threshold). Report confidence intervals (bootstrap or cross-validation-based). Report performance on held-out test set, not training set.

## Prose Style Rules

- Write in full paragraphs — never bullet points in the final manuscript
- Past tense for methods and results ("was estimated", "were included")
- Passive voice acceptable and common in biomedical Results sections
- Cross-reference all figures and tables inline: (Figure 1), (Table 2)
- Do not cite external references in the Results section
- UK English spelling throughout
- Subsection headings as ## markdown headers

## Reading Figures and Forest Plots

When reading a forest plot image:
1. List each study row: study name, effect estimate, lower CI, upper CI, weight%
2. Note the overall diamond (pooled estimate) lower CI, point, upper CI
3. Note heterogeneity statistics below the plot (I², τ², Q, p)
4. Note the 95% prediction interval if shown
5. Note the scale (log scale vs linear scale) and null value position (OR=1 or VE=0%)

For trajectory/waning plots:
- Note: solid vs dashed line distinction (interpolated vs extrapolated)
- Note: CI band (inner) vs PI band (outer) if both shown
- Note: threshold lines and their values
- Note: axis labels, time unit (years, months)

## Reference Files

For detailed reporting checklists, templates, and examples by study type, see:
- `references/statistical-reporting.md` — full reporting standards per study type
- `references/study-type-templates.md` — Results section templates
