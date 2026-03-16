# STROBE Checklist -- Observational Studies

**Citation:** von Elm E, Altman DG, Egger M, et al. The Strengthening the Reporting of Observational Studies in Epidemiology (STROBE) statement: guidelines for reporting observational studies. *Lancet*. 2007;370(9596):1453-1457. doi:10.1016/S0140-6736(07)61602-X

> STROBE has three design-specific versions: cohort, case-control, and cross-sectional. Items marked with * differ between designs.

---

## Title and Abstract

| Item | Description | Status |
|------|-------------|--------|
| 1a | Indicate the study design in the title or abstract | |
| 1b | Provide an informative and balanced summary in the abstract | |

---

## Introduction

| Item | Description | Status |
|------|-------------|--------|
| 2 | Explain the scientific background and rationale | |
| 3 | State specific objectives, including any pre-specified hypotheses | |

---

## Methods

| Item | Cohort | Case-Control | Cross-Sectional | Status |
|------|--------|-------------|-----------------|--------|
| 4 -- Study design | Present key elements of study design early in the paper | Same | Same | |
| 5 -- Setting | Describe the setting, locations, and relevant dates (recruitment, exposure, follow-up, data collection) | Same | Same | |
| 6* -- Participants | Eligibility criteria, sources and methods of selection, methods of follow-up | Case definition and source; control selection method and rationale (separately for cases and controls) | Eligibility criteria, sources and methods of selection | |
| 6a* -- Participants (continued) | For matched studies: matching criteria and number of exposed/unexposed | For matched studies: matching criteria and number of controls per case | N/A | |
| 7 -- Variables | Define all outcomes, exposures, predictors, potential confounders, and effect modifiers; give diagnostic criteria | Same | Same | |
| 8 -- Data sources | For each variable, give sources of data and details of methods of assessment (measurement); describe comparability of assessment methods if >1 group | Same | Same | |
| 9 -- Bias | Describe any efforts to address potential sources of bias | Same | Same | |
| 10 -- Study size | Explain how the study size was arrived at | Same | Same | |
| 11 -- Quantitative variables | Explain how quantitative variables were handled; if applicable, describe which groupings were chosen and why | Same | Same | |
| 12 -- Statistical methods | (a) Describe all statistical methods, including those used to control for confounding | Same | Same | |
| 12b | (b) Describe any methods used to examine subgroups and interactions | Same | Same | |
| 12c | (c) Explain how missing data were addressed | Same | Same | |
| 12d* | (d) Explain how loss to follow-up was addressed | (d) If applicable, explain how matching of cases and controls was addressed | (d) If applicable, describe analytical methods taking account of sampling strategy | |
| 12e | (e) Describe any sensitivity analyses | Same | Same | |

---

## Results

| Item | Cohort | Case-Control | Cross-Sectional | Status |
|------|--------|-------------|-----------------|--------|
| 13* -- Participants | Report numbers at each stage (eligible, examined, included); give reasons for non-participation; consider a flow diagram | Same | Same | |
| 13a* | Give characteristics of study participants; indicate number of participants with missing data for each variable | Same | Same | |
| 13b* | Summarise follow-up time (mean, median, total person-years) | N/A | N/A | |
| 14* -- Descriptive data | Give characteristics of participants by exposure group; indicate number with missing data per variable | Same | Same | |
| 14a* | Summarise follow-up time | N/A | N/A | |
| 15* -- Outcome data | Report numbers of outcome events or summary measures over time | Report numbers in each exposure category, or summary measures of exposure | Report numbers of outcome events or summary measures | |
| 16 -- Main results | (a) Give unadjusted estimates and, if applicable, confounder-adjusted estimates; make clear which confounders were adjusted for and why | Same | Same | |
| 16a | (b) Report category boundaries when continuous variables were categorised | Same | Same | |
| 16b | (c) If relevant, consider translating estimates of relative risk into absolute risk for a meaningful time period | Same | Same | |
| 17 -- Other analyses | Report other analyses done (subgroup, interaction, sensitivity) | Same | Same | |

---

## Discussion

| Item | Description | Status |
|------|-------------|--------|
| 18 | Summarise key results with reference to study objectives | |
| 19 | Discuss limitations, sources and direction of potential bias, imprecision; discuss both direction and magnitude of any potential bias | |
| 20 | Give a cautious overall interpretation considering objectives, limitations, multiplicity of analyses, results from similar studies, and other relevant evidence | |
| 21 | Discuss the generalisability (external validity) of the study results | |

---

## Other Information

| Item | Description | Status |
|------|-------------|--------|
| 22 | Give the source of funding and the role of funders | |

---

## Statistical Methods Checklist (Item 12 Expanded)

This expanded checklist ensures comprehensive reporting of statistical methods for observational studies.

### Regression Model Specification

- [ ] Regression model type stated (logistic, Cox proportional hazards, Poisson, negative binomial, linear, mixed-effects)
- [ ] Model assumptions assessed and stated (proportional hazards, linearity, homoscedasticity)
- [ ] Functional form of continuous predictors stated (linear, polynomial, spline, categorical)
- [ ] Interaction terms tested and reported

### Adjustment Strategy

- [ ] Adjustment variables listed explicitly
- [ ] Selection rationale stated (a priori / DAG-based / change-in-estimate / stepwise)
- [ ] Directed acyclic graph (DAG) provided (if DAG-based selection)
- [ ] Multicollinearity assessed (variance inflation factor)

### Propensity Score Methods (if applicable)

- [ ] Method specified (matching, IPTW, stratification, covariate adjustment)
- [ ] Variables included in propensity score model listed
- [ ] Matching algorithm stated (nearest-neighbour, caliper width, with/without replacement)
- [ ] Balance assessment method stated (SMD, with threshold < 0.1)
- [ ] Weight handling described (stabilisation, truncation)

### Missing Data

- [ ] Proportion of missing data per variable reported
- [ ] Missing data mechanism assumed (MCAR, MAR, MNAR)
- [ ] Handling method stated (complete case, multiple imputation, single imputation)
- [ ] If MI: number of imputations, imputation model variables, convergence assessment
- [ ] Sensitivity analysis for missing data (e.g., worst-case, pattern-mixture)

### Sensitivity Analyses

- [ ] Each sensitivity analysis listed with rationale
- [ ] Alternative exposure or outcome definitions
- [ ] Alternative confounding control (e.g., different propensity score model)
- [ ] Quantitative bias analysis or E-value (if unmeasured confounding concern)
- [ ] Negative control exposure or outcome (if applicable)

### Software

- [ ] Statistical software named with version number
- [ ] Key packages or procedures named
