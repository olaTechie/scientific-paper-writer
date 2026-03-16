# Reporting Guidelines — Full Item Checklists

## PRISMA 2020 — Systematic Reviews and Meta-Analyses

**Citation**: Page MJ, McKenzie JE, Bossuyt PM, et al. The PRISMA 2020 statement: an updated guideline for reporting systematic reviews. *BMJ*. 2021;372:n71. doi:10.1136/bmj.n71

### Methods Items (Section 4)

| Item | Description |
|---|---|
| 4a | Eligibility criteria — PICO/PICOTS elements stated |
| 4b | Information sources — all databases, grey literature, date of last search |
| 4c | Search strategy — full strategy for at least one database in supplementary material |
| 4d | Selection process — number of reviewers, software, conflict resolution |
| 4e | Data collection process — data extraction form, pilot testing, duplicate extraction |
| 4f | Data items — all variables extracted, any assumptions about missing/unclear data |
| 4g | Study risk of bias assessment — tool name, domains, process (independent/consensus) |
| 4h | Effect measures — primary effect measure for each outcome |
| 4i | Synthesis methods — eligibility for synthesis, tabulation, visual methods |
| 4j | Reporting bias assessment — methods to assess publication/selective-reporting bias |
| 4k | Certainty assessment — GRADE or equivalent tool, if used |

### Synthesis Sub-items (4i expanded)
- Meta-analytic model type (random-effects, fixed-effects, multilevel)
- Estimation method (REML, DerSimonian-Ladd, Bayesian)
- Any transformations applied (log-transformation for RR/OR)
- Heterogeneity statistics: Cochran's Q, I², τ², 95% prediction interval
- Investigation of heterogeneity: subgroup analysis (pre-specified vs post-hoc), meta-regression
- Subgroup difference test: χ² test of interaction with p-value
- Sensitivity analyses: list each and rationale
- Publication bias: Egger's test, funnel plot, trim-and-fill (if ≥10 studies)

### Registration and Protocol
| Item | Description |
|---|---|
| 2a | Registration number and database (PROSPERO, OSF, INPLASY) |
| 2b | Protocol availability — where to access |
| 2c | Amendments — any deviations from protocol and rationale |

---

## STROBE — Observational Studies

**Citation**: von Elm E, Altman DG, Egger M, et al. The Strengthening the Reporting of Observational Studies in Epidemiology (STROBE) statement: guidelines for reporting observational studies. *Lancet*. 2007;370(9596):1453–1457. doi:10.1016/S0140-6736(07)61602-X

> STROBE has three design-specific versions: cohort, case-control, and cross-sectional. Items marked * differ between designs.

### Methods Items

| Item | Cohort | Case-Control | Cross-Sectional |
|---|---|---|---|
| 4 — Study design | State study design (cohort/case-control/cross-sectional) and rationale | Same | Same |
| 5 — Setting | Describe setting, locations, dates of data collection, recruitment, exposure, follow-up, data collection | Same | Same |
| 6 — Participants* | Eligibility criteria, sources and methods of selection, methods of follow-up | Separately for cases and controls: case definition and source, control selection method, rationale for choice | Eligibility criteria, sources and methods of selection |
| 7 — Variables | Define all outcomes, exposures, predictors, potential confounders, effect modifiers; describe measurement and diagnostic criteria | Same | Same |
| 8 — Data sources | Describe each data source; validation methods if applicable | Same | Same |
| 9 — Bias | Describe any efforts to address potential sources of bias | Same | Same |
| 10 — Study size | Explain how the study size was arrived at | Same | Same |
| 11 — Quantitative variables | How quantitative variables were handled; groupings and rationale | Same | Same |
| 12 — Statistical methods | Describe all statistical methods, including control for confounding; missing data; sensitivity analyses | Same | Same |

### STROBE Statistical Methods Checklist (Item 12 expanded)
- [ ] Regression model type stated (logistic, Cox, Poisson, linear, etc.)
- [ ] Adjustment variables listed with rationale
- [ ] Missing data approach stated (complete case, imputation, sensitivity)
- [ ] Matching description if matched design (variables matched, ratio)
- [ ] Interaction/effect modification testing described
- [ ] Sensitivity analyses listed
- [ ] Software and version stated

---

## CONSORT 2010 — Randomised Controlled Trials

**Citation**: Schulz KF, Altman DG, Moher D; CONSORT Group. CONSORT 2010 statement: updated guidelines for reporting parallel group randomised trials. *BMJ*. 2010;340:c332. doi:10.1136/bmj.c332

### Methods Items

| Item | Description |
|---|---|
| 3a | Trial design (e.g., parallel, factorial) and allocation ratio |
| 3b | Important changes to methods after trial commencement and reasons |
| 4a | Eligibility criteria for participants |
| 4b | Settings and locations where data were collected |
| 5 | Interventions for each group, with sufficient detail for replication |
| 6a | Completely defined pre-specified primary and secondary outcome measures |
| 6b | Any changes to trial outcomes after trial commenced |
| 7a | How sample size was determined |
| 7b | Interim analyses and stopping guidelines if applicable |
| 8a | Method used to generate random allocation sequence |
| 8b | Type of randomisation (restricted: e.g., block size) |
| 9 | Mechanism used to implement allocation concealment sequence |
| 10 | Who generated sequence, who enrolled, who assigned |
| 11a | Whether blinded (participants, care providers, outcome assessors) |
| 11b | Similarity of interventions if blinded |
| 12a | Statistical methods for primary and secondary outcomes |
| 12b | Methods for additional analyses (subgroup, adjusted) |

---

## TRIPOD+AI — Prediction / Prognostic Models

**Citation**: Collins GS, Moons KGM, Dhiman P, et al. TRIPOD+AI statement: updated guidance for reporting clinical prediction models that use regression or machine learning methods. *BMJ*. 2024;385:e078378. doi:10.1136/bmj-2023-078378

### Methods Items

| Item | Description |
|---|---|
| 4a | Source of data: data source name, type, country, dates |
| 4b | Participants: eligibility criteria, index date, follow-up, outcome ascertainment |
| 4c | Predictors: list, definitions, timing, transformations |
| 4d | Sample size: n events, EPV or EPP calculation |
| 4e | Missing data: proportion per predictor, handling method |
| 4f | Model development: model type, variable selection strategy, shrinkage/regularisation |
| 4g | Model performance: discrimination (AUC/C-statistic), calibration, clinical utility |
| 4h | Internal validation: bootstrap resampling, cross-validation, or temporal split |
| 4i | External validation (if applicable): validation dataset description |
| 4j | Software, packages, versions; code availability |

### TRIPOD Supplementary — Machine Learning Additions
- Hyperparameter tuning strategy: grid search, random search, Bayesian optimisation
- Cross-validation strategy: k-fold (state k), stratified, grouped, temporal
- Feature importance method: SHAP, permutation importance, integrated gradients
- Threshold selection for binary classification: state method (Youden, sensitivity-specificity tradeoff)
- Resampling for class imbalance: SMOTE, oversampling, class weights
- Train/validation/test split ratios and how determined

---

## STARD 2015 — Diagnostic Accuracy Studies

**Citation**: Bossuyt PM, Reitsma JB, Bruns DE, et al. STARD 2015: an updated list of essential items for reporting diagnostic accuracy studies. *BMJ*. 2015;351:h5527. doi:10.1136/bmj.h5527

### Key Methods Items
- 7: Index test (name, description, reader training)
- 8: Reference standard (name, rationale)
- 9: Participants: eligibility, recruitment setting, period
- 10: Data collection: prospective or retrospective
- 11: Rationale for sample size
- 12: Handling indeterminate index test results
- 13: Blinding: index test and reference standard readers
- 14: Statistical methods (sensitivity, specificity, 95% CI, likelihood ratios, ROC analysis)

---

## GRADE — Certainty of Evidence (for SRMA)

**Citation**: Guyatt GH, Oxman AD, Vist GE, et al. GRADE: an emerging consensus on rating quality of evidence and strength of recommendations. *BMJ*. 2008;336(7650):924–926.

### Domains (Reasons to downgrade certainty)
1. **Risk of bias**: methodological quality of included studies
2. **Inconsistency**: unexplained heterogeneity in results (high I²)
3. **Indirectness**: PICO elements differ from question of interest
4. **Imprecision**: wide confidence intervals, few events
5. **Publication bias**: evidence of selective reporting

### Certainty Levels
| Level | Description |
|---|---|
| High | We are very confident that the true effect lies close to the estimate |
| Moderate | We are moderately confident; the true effect is likely close to the estimate, but may be substantially different |
| Low | Our confidence in the effect estimate is limited; the true effect may be substantially different |
| Very low | We have very little confidence in the effect estimate; the true effect is likely to be substantially different |

---

## Software Citations

Always cite software with version number. Standard citations:

**R**:
> R Core Team. R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing, Vienna, Austria. [Year]. Available from: https://www.R-project.org/

**metafor** (R package):
> Viechtbauer W. Conducting meta-analyses in R with the metafor package. *J Stat Softw*. 2010;36(3):1–48. doi:10.18637/jss.v036.i03

**Stata**:
> StataCorp. Stata Statistical Software: Release [XX]. StataCorp LLC, College Station, TX. [Year].

**SAS**:
> SAS Institute Inc. SAS/STAT Software, Version [XX]. SAS Institute Inc., Cary, NC. [Year].

**Rayyan** (screening):
> Ouzzani M, Hammady H, Fedorowicz Z, Elmagarmid A. Rayyan—a web and mobile app for systematic reviews. *Syst Rev*. 2016;5:210. doi:10.1186/s13643-016-0384-4

**Covidence** (screening):
> Covidence systematic review software, Veritas Health Innovation, Melbourne, Australia. Available from: www.covidence.org

**RevMan** (meta-analysis):
> Review Manager (RevMan) [Computer program]. Version [X.X]. The Cochrane Collaboration. [Year].

**Python** (for ML):
> Van Rossum G, Drake FL. Python 3 Reference Manual. Scotts Valley, CA: CreateSpace. [Year].

**scikit-learn**:
> Pedregosa F, Varoquaux G, Gramfort A, et al. Scikit-learn: Machine learning in Python. *J Mach Learn Res*. 2011;12:2825–2830.

---

## PROSPERO Registration Template

When stating PROSPERO registration in Methods:

> "This systematic review and meta-analysis was conducted in accordance with the Preferred Reporting Items for Systematic Reviews and Meta-Analyses (PRISMA 2020) guidelines [REF]. The study protocol was prospectively registered with the International Prospective Register of Systematic Reviews (PROSPERO; registration number: CRD[XXXXXXXX], registered [DATE])."

## OSF Registration Template

> "The study protocol was pre-registered on the Open Science Framework (OSF; https://osf.io/[ID], registered [DATE])."
