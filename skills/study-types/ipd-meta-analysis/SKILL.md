---
name: ipd-meta-analysis
description: >
  Study-type module for individual participant data (IPD) meta-analyses. Provides
  section-by-section guidance aligned with the PRISMA-IPD extension, covering IPD
  collection processes, data harmonisation, one-stage and two-stage analytical
  approaches, and individual-level subgroup analyses.
version: 1.0.0
triggers:
  - IPD meta-analysis
  - individual participant data
  - individual patient data meta-analysis
  - PRISMA-IPD
  - one-stage meta-analysis
  - two-stage meta-analysis
---

# IPD Meta-Analysis Study-Type Module

This module governs manuscript generation for individual participant data (IPD)
meta-analyses. It supplements the core engine and section-specific skills with
IPD-specific reporting requirements derived from the PRISMA-IPD extension
statement. IPD meta-analyses are considered the gold standard of evidence
synthesis because they allow consistent re-analysis of primary data, flexible
subgroup exploration at the individual level, and avoidance of ecological bias
in treatment-covariate interactions.

---

## Section 1 --- Reporting Guideline

### PRISMA-IPD

The primary reporting guideline for IPD meta-analyses is the PRISMA-IPD
extension statement:

> Stewart LA, Clarke M, Rovers M, et al. Preferred reporting items for a
> systematic review and meta-analysis of individual participant data: the
> PRISMA-IPD statement. *JAMA*. 2015;313(16):1657-1665.

This extension modifies and supplements the standard PRISMA 2020 items to
address the unique features of IPD meta-analyses, including the process of
obtaining IPD, data integrity checking, harmonisation procedures, and the
analytical framework (one-stage versus two-stage approaches).

When citing the guideline in the Methods section, use the following phrasing:

> "This systematic review and IPD meta-analysis was conducted and reported
> in accordance with the Preferred Reporting Items for Systematic Reviews
> and Meta-Analyses of Individual Participant Data (PRISMA-IPD) (Stewart
> et al., JAMA 2015;313:1657-1665)."

See `references/prisma-ipd-checklist.md` for the full IPD-specific checklist
items.

---

## Section 2 --- Methods Subsections

### 2.1 Protocol and Registration

State the prospective registration and note whether the protocol specified
the IPD collection approach. Template sentences:

> "The protocol for this systematic review and IPD meta-analysis was registered
> prospectively with PROSPERO (registration number CRD42XXXXXXX) before the
> first data request was issued to study investigators. The protocol specified
> eligibility criteria, the IPD collection process, planned analyses including
> one-stage and two-stage approaches, and pre-specified treatment-covariate
> interactions."

> "The study was coordinated by [collaborative group name] and followed
> established procedures for IPD meta-analyses as recommended by the
> Cochrane IPD Meta-Analysis Methods Group."

### 2.2 Eligibility Criteria

Define eligibility using the PICO framework with the additional requirement
of IPD availability. Template sentences:

> "Studies were eligible if they were randomised controlled trials comparing
> [intervention] with [comparator] in patients with [condition], reporting
> [outcome] with a minimum follow-up of [N] months. Both published and
> unpublished trials meeting these criteria were eligible regardless of
> whether IPD were ultimately obtainable, to permit assessment of availability
> bias."

> "The eligibility criteria were applied identically to all studies identified
> by the systematic search. Studies for which IPD could not be obtained were
> retained in the review for descriptive comparison but excluded from the
> primary IPD meta-analysis."

Specify any additional IPD-specific criteria, such as minimum data fields
required for harmonisation.

### 2.3 Information Sources

Describe both the systematic search and the direct contact with trialists.
Template sentences:

> "A systematic search was conducted across MEDLINE (via PubMed), Embase (via
> Elsevier), the Cochrane Central Register of Controlled Trials (CENTRAL), and
> [additional databases] from inception to [date]. Trial registries
> (ClinicalTrials.gov, WHO ICTRP, EU Clinical Trials Register) were searched
> to identify unpublished and ongoing trials. The full search strategy is
> provided in the Supplementary Materials (eTable 1)."

> "In addition to the electronic search, principal investigators or data
> custodians of all eligible studies were contacted directly by email to
> request individual participant data. Up to three contact attempts were made
> over a period of [N] months. Collaborative agreements and data-sharing
> protocols were established with responding investigators."

### 2.4 Study Selection

Describe the two-phase selection: study identification and IPD acquisition.
Template sentences:

> "Study selection followed a two-phase process. In the first phase, two
> reviewers independently screened titles and abstracts, followed by full-text
> assessment against the eligibility criteria. In the second phase, authors of
> eligible studies were contacted to request IPD. Studies for which IPD were
> obtained were included in the primary IPD meta-analysis; studies with
> aggregate data only were included in supplementary aggregate-data analyses
> where possible."

### 2.5 Data Collection

This is a critical subsection for IPD meta-analyses. Describe the IPD request
process, response rate, harmonisation, and quality checks. Template sentences:

> "Individual participant data were requested from all eligible study
> investigators. Of [N] eligible studies, IPD were obtained from [N] ([X]%),
> representing [N] participants. Reasons for non-availability included: loss
> of contact with investigators ([N] studies), data no longer accessible
> ([N] studies), and declined participation ([N] studies)."

> "Upon receipt, all IPD were subjected to a standardised quality-assurance
> protocol. Data integrity checks included: verification of randomisation
> codes against published results, reproduction of published summary
> statistics (sample sizes, event rates, treatment effects), identification
> of duplicates and out-of-range values, and cross-checking of baseline
> characteristics against published tables. Discrepancies were resolved by
> correspondence with the original investigators."

> "Individual variables were harmonised across studies using a pre-specified
> coding manual. Continuous variables (e.g., age, baseline biomarker levels)
> were standardised to common units. Categorical variables (e.g., disease
> stage, comorbidity classification) were recoded to a common taxonomy.
> Where harmonisation was not possible for a specific variable, it was
> excluded from that analysis with a note in the data dictionary."

### 2.6 Risk of Bias

Describe both study-level and IPD-specific risk-of-bias assessments. Template
sentences:

> "Risk of bias in individual studies was assessed using the Cochrane Risk of
> Bias 2 (RoB 2) tool. Access to IPD allowed enhanced assessment of certain
> domains; for example, the adequacy of randomisation was verified directly
> from the allocation sequences, and the completeness of outcome data was
> assessed at the individual level rather than relying on published attrition
> figures."

> "IPD-specific quality concerns were assessed separately, including: data
> integrity (agreement between IPD and published aggregate results), data
> completeness (proportion of participants with missing baseline or outcome
> data), and data currency (whether the dataset represented the final
> analysis population). Studies with unresolved data discrepancies were
> flagged and subjected to sensitivity analysis."

### 2.7 Statistical Methods

Describe the analytical framework in detail, covering the one-stage and
two-stage approaches, covariate handling, and missing data. Template sentences:

**One-stage approach:**

> "The primary analysis used a one-stage approach in which all IPD were
> analysed simultaneously in a single mixed-effects model. For time-to-event
> outcomes, a Cox proportional hazards model was fitted with a random
> treatment effect across studies, a stratified baseline hazard by study,
> and individual-level covariates (age, sex, baseline severity). The model
> was specified as: h_i(t) = h_0s(t) x exp(beta_1 x Treatment_i + beta_2 x
> Covariate_i + u_s x Treatment_i), where u_s ~ N(0, tau-squared) represents
> the random treatment effect for study s."

> "For binary outcomes, a generalised linear mixed model with a logit link
> function was used, with participants nested within studies. A random
> intercept accounted for between-study heterogeneity in baseline risk, and
> a random slope allowed the treatment effect to vary across studies."

**Two-stage approach:**

> "As a complementary analysis, a two-stage approach was used. In the first
> stage, the treatment effect was estimated within each study separately using
> [Cox regression / logistic regression]. In the second stage, study-specific
> estimates were pooled using a random-effects meta-analysis (restricted
> maximum likelihood estimation) with the Knapp-Hartung adjustment for
> standard errors."

**Treatment-covariate interactions:**

> "Pre-specified treatment-covariate interactions were investigated to identify
> potential effect modifiers at the individual level. Interaction terms
> (treatment x covariate) were added to the one-stage model. To separate
> within-study interactions (unconfounded) from across-study interactions
> (potentially confounded), covariates were centred at the study-specific
> mean, following the approach of Debray et al. (BMJ 2015;350:h1961)."

**Missing data:**

> "Missing participant-level data were handled using multiple imputation by
> chained equations (MICE), with [N] imputations generated within each study
> separately to preserve the clustering structure. The imputation model
> included the treatment variable, outcome, and all covariates included in
> the analysis model, as well as auxiliary variables associated with
> missingness. Missing study-level data (i.e., entire studies for which IPD
> were not obtained) were addressed by conducting sensitivity analyses that
> incorporated aggregate data from non-IPD studies."

> "An available-case analysis was conducted as the primary approach, with
> multiple imputation as a sensitivity analysis. Studies for which IPD were
> not obtained were incorporated in an additional sensitivity analysis
> combining IPD with aggregate data using a two-stage framework."

---

## Section 3 --- Results Conventions

Results for IPD meta-analyses are reported in the following canonical order:

1. **IPD availability** --- Present a flow diagram showing the identification
   of eligible studies and the proportion from which IPD were obtained. State
   the number of studies, participants with IPD, and participants without IPD.
   Compare characteristics of IPD-available versus IPD-unavailable studies.

2. **Participant characteristics** --- Present a table of individual-level
   baseline characteristics (age, sex, disease severity, comorbidities) by
   treatment arm, pooled across studies. Use medians with interquartile ranges
   for skewed continuous variables and counts with percentages for categorical
   variables.

3. **One-stage results** --- Present the primary treatment effect estimate
   from the one-stage model with 95% CI, p-value, heterogeneity (tau-squared,
   I-squared), and prediction interval. Report for both primary and secondary
   outcomes.

4. **Two-stage results** --- Present the two-stage pooled estimate alongside
   the one-stage result. Discuss concordance between the two approaches. If
   results differ substantially, investigate and report reasons.

5. **Subgroup analyses (individual-level interactions)** --- Present forest
   plots of treatment effects stratified by individual-level covariates. Report
   interaction p-values and distinguish within-study from across-study
   interactions. Present results as a subgroup forest plot or an interaction
   plot.

6. **Forest plot** --- Present a forest plot of study-specific estimates
   (from the two-stage analysis) with the overall pooled estimate. Include
   study weights and prediction intervals.

7. **Sensitivity analyses** --- Report results of sensitivity analyses
   including: complete-case versus multiple imputation, exclusion of high
   risk-of-bias studies, and incorporation of aggregate data from non-IPD
   studies.

All effect estimates must include the point estimate, 95% CI, and p-value.
For time-to-event outcomes, report hazard ratios. Report the proportion of
IPD obtained and comment on availability bias.

---

## Section 4 --- Discussion Considerations

### Paragraph Template

The Discussion for an IPD meta-analysis should follow this structure:

**Paragraph 1 --- Main findings:**
Restate the primary treatment effect and key subgroup findings. Emphasise
any individual-level interactions that could not have been detected with
aggregate data.

**Paragraph 2 --- Availability bias:**
Discuss the proportion of eligible studies for which IPD were obtained. If
IPD availability was less than 100%, compare the characteristics and aggregate
results of IPD-available versus IPD-unavailable studies. Discuss whether
non-availability could bias the results (e.g., if studies with null results
were less likely to share data).

**Paragraph 3 --- Harmonisation challenges:**
Discuss any difficulties encountered in harmonising variables across studies.
Note variables that could not be harmonised and the impact on planned
analyses. Discuss whether differences in outcome definitions, measurement
methods, or follow-up schedules across studies could have affected the
pooled results.

**Paragraph 4 --- Advantages over aggregate-data meta-analysis:**
Explicitly state the advantages gained by using IPD rather than published
aggregate data:
- Ability to investigate individual-level treatment-covariate interactions
  without ecological bias
- Standardised analysis across all studies (common model, consistent
  covariate adjustment)
- Improved handling of time-to-event data (avoiding the need for
  approximations from published Kaplan-Meier curves)
- Access to unpublished data and subgroups not reported in publications
- Enhanced data quality through verification of primary data

**Paragraph 5 --- Comparison with previous evidence:**
Compare findings with published aggregate-data meta-analyses on the same
topic. Discuss concordance or discordance and reasons for any differences.

### Typical Strengths

- Gold-standard approach to evidence synthesis using primary data
- Standardised re-analysis across all studies
- Individual-level subgroup analyses avoiding ecological bias
- Enhanced data quality verification through access to raw data
- Ability to include unpublished outcomes and subgroups
- Pre-registered protocol with pre-specified analyses

### Typical Limitations

- Availability bias if IPD were not obtained from all eligible studies
  (direction of bias: uncertain; may favour positive studies if investigators
  with null findings are less willing to share data)
- Harmonisation constraints preventing analysis of some pre-specified
  variables (impact: inability to test certain interactions)
- Residual heterogeneity despite standardised analysis (heterogeneity in
  clinical populations, co-interventions, or outcome definitions across
  studies)
- Missing participant-level data requiring imputation (sensitivity to
  missing-at-random assumption)
- Time and resource costs may limit the recency of included studies if the
  data collection period was prolonged

---

## Section 5 --- Software Citations

### ipdmeta (Stata)

> Riley RD, Debray TPA, Fisher DJ, et al. Individual participant data
> meta-analysis to examine interactions between treatment effect and
> participant-level covariates: statistical recommendations for conduct
> and planning. *Stat Med*. 2020;39(15):2115-2137.

> Fisher DJ. Two-stage individual participant data meta-analysis and
> generalized forest plots. *Stata J*. 2015;15(2):369-396.

### metafor (R)

> Viechtbauer W. Conducting meta-analyses in R with the metafor package.
> *J Stat Softw*. 2010;36(3):1-48.

Cite the specific version used:

> Viechtbauer W. metafor: Meta-Analysis Package for R. R package version
> [X.X]. Available from: https://CRAN.R-project.org/package=metafor

### lme4 (R)

> Bates D, Machler M, Bolker B, Walker S. Fitting linear mixed-effects
> models using lme4. *J Stat Softw*. 2015;67(1):1-48.

Used for one-stage generalised linear mixed models:

> Bates D, Machler M, Bolker B, Walker S. lme4: Linear Mixed-Effects Models
> using 'Eigen' and S4. R package version [X.X]. Available from:
> https://CRAN.R-project.org/package=lme4

### survival (R)

> Therneau TM, Grambsch PM. *Modeling Survival Data: Extending the Cox
> Model*. New York: Springer; 2000.

> Therneau TM. survival: Survival Analysis. R package version [X.X].
> Available from: https://CRAN.R-project.org/package=survival

Used for one-stage and two-stage Cox proportional hazards models with shared
frailty terms or stratified baselines.

### mice (R)

> van Buuren S, Groothuis-Oudshoorn K. mice: Multivariate Imputation by
> Chained Equations in R. *J Stat Softw*. 2011;45(3):1-67.

> van Buuren S. *Flexible Imputation of Missing Data*. 2nd ed. Boca Raton:
> CRC Press; 2018.

### Additional Software

When reporting the analysis, always cite the specific R or Stata version.
Example:

> "All analyses were performed in R (version [X.X]; R Foundation for
> Statistical Computing, Vienna, Austria) using the metafor package
> (version [X.X]) for two-stage meta-analysis, lme4 (version [X.X]) for
> one-stage generalised linear mixed models, survival (version [X.X]) for
> Cox regression, and mice (version [X.X]) for multiple imputation."
