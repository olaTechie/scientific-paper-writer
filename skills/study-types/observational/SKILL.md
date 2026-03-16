---
name: observational
description: >
  Study-type module for observational studies (cohort, case-control, cross-sectional).
  Provides reporting guidance aligned with STROBE, including methods subsection
  templates, results conventions for crude and adjusted estimates, discussion
  paragraph frameworks, and software citation standards.
version: 1.0.0
triggers:
  - "write observational study"
  - "STROBE methods"
  - "cohort study methods"
  - "case-control methods"
  - "cross-sectional methods"
  - "write observational results"
  - "write adjusted estimates"
  - "propensity score reporting"
  - "STROBE checklist"
  - "write cohort discussion"
---

# Observational Study (Cohort, Case-Control, Cross-Sectional)

## Section 1 — Reporting Guideline

**Guideline:** STROBE (Strengthening the Reporting of Observational Studies in Epidemiology)

**Key reference:** von Elm E, Altman DG, Egger M, et al. The Strengthening the Reporting of Observational Studies in Epidemiology (STROBE) statement: guidelines for reporting observational studies. *Lancet*. 2007;370(9596):1453-1457. doi:10.1016/S0140-6736(07)61602-X

STROBE has three design-specific versions: cohort, case-control, and cross-sectional. Items marked with an asterisk (*) differ between designs. Announce guideline selection and the specific design version before writing; allow the user to override.

See `references/strobe-checklist.md` for the full item-level checklist.

---

## Section 2 — Methods Subsections

Write Methods in past tense. Passive voice is conventional; active voice is acceptable when it improves clarity. Never invent procedural details; flag unknowns with `[PLEASE VERIFY: ___]`.

### 2.1 Study Design and Setting

State the study design (cohort, case-control, or cross-sectional), the rationale for choosing that design, the setting (institution, geography, healthcare system), and the dates of data collection, recruitment, exposure, and follow-up.

**Template sentences:**
> "We conducted a [retrospective / prospective] [cohort / case-control / cross-sectional] study using data from [DATA SOURCE] between [START DATE] and [END DATE]."

> "The study was conducted at [SETTING] in [CITY/COUNTRY]. [DATA SOURCE] captures [DESCRIPTION OF POPULATION COVERED]."

**Checklist:**
- [ ] Study design named explicitly (cohort, case-control, cross-sectional)
- [ ] Rationale for design choice provided
- [ ] Setting and geography described
- [ ] Dates of recruitment, data collection, and follow-up stated
- [ ] Ethics approval and informed consent stated

### 2.2 Participants

For cohort studies: eligibility criteria, sources and methods of selection, methods of follow-up. For case-control studies: case definition and source, control selection method and rationale (separately). For cross-sectional studies: eligibility criteria, sources and methods of selection.

**Template sentences (cohort):**
> "We included all [ADULTS / PATIENTS] aged [RANGE] who [CRITERIA] between [DATES]. Participants were followed from [INDEX DATE] until [OUTCOME / CENSORING EVENT / END OF FOLLOW-UP], whichever occurred first."

**Template sentences (case-control):**
> "Cases were defined as [OUTCOME DEFINITION] identified from [SOURCE]. For each case, [N] controls were randomly selected from [SOURCE], matched on [VARIABLES], and confirmed to be free of [OUTCOME] at the index date."

**Checklist:**
- [ ] Eligibility criteria (inclusion and exclusion)
- [ ] Sources and methods of participant selection
- [ ] Follow-up method and duration (cohort)
- [ ] Case definition and control selection rationale (case-control)
- [ ] Matching variables and ratio (if matched)

### 2.3 Variables

Define all outcomes, exposures, predictors, potential confounders, and effect modifiers. Describe measurement methods and diagnostic criteria.

**Template sentence:**
> "The primary outcome was [OUTCOME], defined as [DEFINITION, including ICD codes or clinical criteria]. The primary exposure was [EXPOSURE], defined as [DEFINITION]. Potential confounders included [LIST], selected a priori based on [clinical knowledge / directed acyclic graph (DAG) / published literature]."

**Checklist:**
- [ ] Primary and secondary outcomes defined with diagnostic criteria
- [ ] Exposure defined with measurement method
- [ ] Confounders listed with selection rationale (a priori, DAG-based, stepwise)
- [ ] Effect modifiers specified
- [ ] Any variable grouping or categorisation with rationale

### 2.4 Data Sources and Measurement

Describe each data source, validation methods, and measurement reliability.

**Template sentence:**
> "[EXPOSURE / OUTCOME] data were obtained from [SOURCE]. [Validation statement, e.g., 'Diagnoses were validated against medical records with a positive predictive value of [X]%']. Laboratory assays were performed at [LABORATORY] using [METHOD]."

**Checklist:**
- [ ] Each data source described
- [ ] Validation methods stated (if applicable)
- [ ] Measurement reliability or accuracy reported
- [ ] Linkage methods described (for linked data)

### 2.5 Bias

Describe efforts to address potential sources of bias. State known biases and the direction of their expected effect.

**Template sentence:**
> "To address [BIAS TYPE], we [METHOD]. [E.g., 'To reduce confounding by indication, we used propensity score matching on [N] pre-treatment covariates.' / 'To minimise healthy user bias, we restricted the comparator group to active users of [ALTERNATIVE].']"

**Target trial emulation framework (v1.0.0):**
> "The study was designed to emulate a hypothetical target trial of [INTERVENTION] vs [COMPARATOR] in [POPULATION], following the framework of Hernan and Robins. The target trial protocol specifying eligibility criteria, treatment strategies, assignment, follow-up, outcome, and causal contrast is detailed in [Table / Supplement]."

**E-value for unmeasured confounding (v1.0.0):**
> "To assess the robustness of findings to unmeasured confounding, we calculated the E-value, defined as the minimum strength of association on the risk ratio scale that an unmeasured confounder would need to have with both the exposure and the outcome to fully explain away the observed association."

**Checklist:**
- [ ] Potential biases identified and named
- [ ] Methods to address each bias described
- [ ] Target trial protocol specified (if emulation design)
- [ ] E-value reported (if unmeasured confounding is a concern)

### 2.6 Study Size

Explain how the study size was arrived at. For primary studies, report a formal sample size calculation. For database studies, state whether the available sample was used in its entirety.

**Template sentence:**
> "A minimum sample size of [N] participants ([N] events) was required to detect a [EFFECT SIZE] with [POWER]% power at a two-sided alpha of [ALPHA], assuming [ASSUMPTIONS]. [OR: 'All eligible patients in the database during the study period were included; no a priori sample size calculation was performed.']"

**Checklist:**
- [ ] Sample size calculation or rationale for available sample
- [ ] Effect size, power, alpha, and assumptions stated (if calculated)
- [ ] Events per variable (EPV) consideration for regression models

### 2.7 Statistical Methods

Describe all statistical methods, including regression model type, adjustment strategy, missing data handling, and sensitivity analyses.

**Template sentences:**
> "The association between [EXPOSURE] and [OUTCOME] was estimated using [Cox proportional hazards / multivariable logistic / Poisson] regression, adjusting for [CONFOUNDERS]. The proportional hazards assumption was assessed using Schoenfeld residual tests."

> "Propensity scores for [EXPOSURE] were estimated using logistic regression including [N] pre-treatment covariates. [Matching: Participants were matched 1:1 on the logit of the propensity score using a caliper of 0.2 standard deviations.] [Weighting: Inverse probability of treatment weighting (IPTW) was applied, with weights stabilised and truncated at the 1st and 99th percentiles.] Balance was assessed using standardised mean differences (SMD), with SMD < 0.1 indicating adequate balance."

> "Missing data were handled using [complete case analysis / multiple imputation by chained equations (MICE) with m = [N] imputations / last observation carried forward]."

**Checklist:**
- [ ] Regression model type stated
- [ ] Adjustment variables listed with selection rationale
- [ ] Missing data approach stated (complete case, imputation, sensitivity)
- [ ] Matching description if matched design (variables, ratio, caliper)
- [ ] Propensity score method described (if used)
- [ ] Balance assessment method stated (SMD < 0.1)
- [ ] Interaction/effect modification testing described
- [ ] Sensitivity analyses listed
- [ ] Software and version stated

---

## Section 3 — Results Conventions

### Subsection Order

1. **Study Population** -- flow diagram or description of cohort assembly
2. **Baseline Characteristics** -- descriptive table by exposure group
3. **Primary Association** -- crude and adjusted estimates
4. **Sensitivity Analyses** -- alternative specifications
5. **Subgroup Analyses** -- stratified results with interaction tests

### Study Population

Report the total eligible population, exclusions (with reasons), and the final analytic sample. For cohort studies, report median follow-up time and total person-years. Reference a flow diagram if applicable.

### Baseline Characteristics

Report by exposure group. Include: age (mean +/- SD or median [IQR]), sex, ethnicity, key clinical variables. Report standardised mean differences for propensity score analyses. Do NOT test for baseline balance using p-values in observational studies with large samples (SMD is preferred).

### Primary Association — Crude and Adjusted Separately

For each primary outcome:
- **Crude estimate:** unadjusted [OR / HR / RR] with 95% CI
- **Adjusted estimate:** adjusted [OR / HR / RR] with 95% CI
- Name the confounders in the final adjusted model explicitly
- For propensity score analyses: report SMD before and after matching/weighting

**Effect estimate by design:**
- HR (time-to-event / cohort with censoring)
- OR (binary outcome / case-control / logistic regression)
- RR (cohort with complete follow-up / Poisson regression)
- MD (continuous outcome)

### Sensitivity Analyses

Report each alternative estimate with its own CI and interpretation. State the direction of change relative to the base case.

### Subgroup Analyses

Report stratified estimates with interaction p-values. Do not claim effect modification without a significant interaction test.

### Prose Style

- Write in full paragraphs, never bullet points in the final manuscript
- Past tense throughout
- Report crude and adjusted side by side or in sequence
- Cross-reference all figures and tables inline
- Do not cite external references in the Results section
- UK English spelling

---

## Section 4 — Discussion Considerations

### Main Findings -- Opening Paragraph Template

> "In this [cohort / case-control / nested case-control] study of [N] [adults / patients / participants], [exposure] was associated with [outcome] (adjusted [OR/HR/RR]: [estimate]; 95% CI: [lower], [upper]), after adjustment for [key confounders]. [Sensitivity analysis result]. [Subgroup finding with interaction p-value]."

### Literature Comparison Framing

**Consistent:**
> "These findings are consistent with [Author] et al., who reported [estimate] in a [study design] of [N] [population]..."

**Divergent:**
> "In contrast, [Author] et al. found [estimate], which may reflect differences in [population / exposure definition / confounding control / follow-up duration]..."

**Extending:**
> "The present study extends prior work by [novel contribution -- e.g., using target trial emulation / applying E-values / examining a previously unstudied population]..."

### Typical Strengths

- Large sample size with adequate statistical power
- Use of validated exposure/outcome definitions
- Pre-specified analysis plan reducing post-hoc bias
- Propensity score methods addressing measured confounding
- Target trial emulation design aligning observational analysis with causal question
- E-value quantifying robustness to unmeasured confounding
- Multiple sensitivity analyses testing robustness
- STROBE adherence ensuring transparent reporting
- Long follow-up duration capturing delayed outcomes (cohort)
- Population-based design enhancing generalisability

### Typical Limitations

For each limitation, state: (1) the limitation precisely, (2) likely direction of bias, (3) impact on conclusions.

- **Unmeasured confounding:** "Despite adjustment for [N] covariates, residual confounding from unmeasured variables (e.g., [EXAMPLES]) cannot be excluded. The E-value of [X] suggests that an unmeasured confounder would need [DESCRIPTION] to fully explain the observed association."
- **Healthy user / healthy vaccinee bias:** "Healthy user bias may have inflated the observed association, as individuals who [BEHAVIOUR] may be systematically healthier."
- **Misclassification:** "Exposure was ascertained from [SOURCE], which may be subject to [non-differential / differential] misclassification. Non-differential misclassification would be expected to bias estimates toward the null."
- **Selection bias:** "Restriction to [SUBSET] may limit generalisability to [BROADER POPULATION]."
- **Immortal time bias:** "The cohort design may be susceptible to immortal time bias if [CONDITION]; we addressed this by [METHOD]."
- **Loss to follow-up:** "[X]% of participants were lost to follow-up, which may introduce attrition bias if loss was differential by exposure status."
- **Cross-sectional limitation:** "The cross-sectional design precludes inference about temporal sequence; the observed association may reflect reverse causation."

---

## Section 5 — Software Citations

**R:**
> R Core Team. R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing, Vienna, Austria. [Year]. Available from: https://www.R-project.org/

**Stata:**
> StataCorp. Stata Statistical Software: Release [XX]. StataCorp LLC, College Station, TX. [Year].

**SAS:**
> SAS Institute Inc. SAS/STAT Software, Version [XX]. SAS Institute Inc., Cary, NC. [Year].

**R packages (common for observational studies):**

*survival:*
> Therneau TM. A Package for Survival Analysis in R. R package version [X.X]. Available from: https://CRAN.R-project.org/package=survival

*MatchIt (propensity score matching):*
> Ho DE, Imai K, King G, Stuart EA. MatchIt: Nonparametric Preprocessing for Parametric Causal Inference. *J Stat Softw*. 2011;42(8):1-28. doi:10.18637/jss.v042.i08

*mice (multiple imputation):*
> van Buuren S, Groothuis-Oudshoorn K. mice: Multivariate Imputation by Chained Equations in R. *J Stat Softw*. 2011;45(3):1-67. doi:10.18637/jss.v045.i03

*EValue (E-value calculation):*
> Mathur MB, Ding P, Riddell CA, VanderWeele TJ. Web Site and R Package for Computing E-values. *Epidemiology*. 2018;29(5):e45-e47. doi:10.1097/EDE.0000000000000864

*WeightIt (propensity score weighting):*
> Greifer N. WeightIt: Weighting for Covariate Balance in Observational Studies. R package. Available from: https://CRAN.R-project.org/package=WeightIt
