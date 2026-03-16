---
name: systematic-review
description: >
  Study-type module for systematic reviews and meta-analyses. Provides reporting
  guidance aligned with PRISMA 2020, including methods subsection templates,
  results conventions for heterogeneity and pooled estimates, discussion
  paragraph frameworks, and software citation standards.
version: 1.0.0
triggers:
  - "write systematic review"
  - "PRISMA methods"
  - "meta-analysis methods"
  - "write SRMA"
  - "systematic review results"
  - "pooled estimate reporting"
  - "heterogeneity reporting"
  - "write forest plot results"
  - "write waning analysis"
  - "write sensitivity analysis"
  - "write subgroup results"
  - "PRISMA checklist"
---

# Systematic Review and Meta-Analysis

## Section 1 — Reporting Guideline

**Guideline:** PRISMA 2020 (Preferred Reporting Items for Systematic Reviews and Meta-Analyses)

**Key reference:** Page MJ, McKenzie JE, Bossuyt PM, et al. The PRISMA 2020 statement: an updated guideline for reporting systematic reviews. *BMJ*. 2021;372:n71. doi:10.1136/bmj.n71

PRISMA 2020 applies to all systematic reviews with or without meta-analysis. Announce guideline selection before writing and allow the user to override.

See `references/prisma-checklist.md` for the full item-level checklist.

---

## Section 2 — Methods Subsections

Write Methods in past tense. Passive voice is conventional for procedural steps; active voice is acceptable when it improves clarity (e.g., "Two reviewers independently screened..."). Never invent procedural details; flag unknowns with `[PLEASE VERIFY: ___]`.

### 2.1 Protocol and Registration

State the registration database, registration number, and date. Note any protocol amendments and their rationale.

**Template sentences:**
> "This systematic review and meta-analysis was conducted in accordance with the Preferred Reporting Items for Systematic Reviews and Meta-Analyses (PRISMA 2020) guidelines [REF]. The study protocol was prospectively registered with the International Prospective Register of Systematic Reviews (PROSPERO; registration number: CRD[XXXXXXXX], registered [DATE])."

> "The study protocol was pre-registered on the Open Science Framework (OSF; https://osf.io/[ID], registered [DATE])."

**Checklist:**
- [ ] Registration number and database (PROSPERO, OSF, INPLASY)
- [ ] Protocol availability and access location
- [ ] Amendments from protocol with rationale

### 2.2 Eligibility Criteria

Define inclusion and exclusion criteria using PICO/PICOTS:

- **P** — Population (age range, clinical setting, diagnosis, geographical scope)
- **I** — Intervention or exposure (type, dose, timing)
- **C** — Comparator (unvaccinated, placebo, alternative)
- **O** — Outcomes (primary outcome defined precisely; secondary outcomes listed)
- **T** — Time (study period, follow-up duration)
- **S** — Study design (observational only? RCTs only? Both?)

**Template sentence:**
> "Studies were eligible if they enrolled [POPULATION], assessed [INTERVENTION/EXPOSURE] compared with [COMPARATOR], and reported [OUTCOME] with a minimum follow-up of [DURATION]. Both [RCTs and observational studies / observational studies only] were included."

**Checklist:**
- [ ] All PICOTS elements stated
- [ ] Language restrictions stated (or absence thereof)
- [ ] Geographical restrictions stated (or absence thereof)
- [ ] Exclusion criteria enumerated

### 2.3 Information Sources and Search Strategy

State all databases searched, grey literature sources, date of last search, and search strategy availability.

**Template sentence:**
> "A systematic literature search was conducted in MEDLINE via PubMed, Embase via Elsevier, the Cochrane Central Register of Controlled Trials (CENTRAL), and [OTHER] from inception to [DATE]. The full electronic search strategy for [DATABASE] is provided in Supplementary Material [X]. Reference lists of included studies and relevant reviews were hand-searched."

**Checklist:**
- [ ] All databases named with platform (e.g., "MEDLINE via PubMed")
- [ ] Grey literature sources specified
- [ ] Date of last search stated
- [ ] Full strategy in supplement for at least one database
- [ ] Hand-searching and citation chaining described

### 2.4 Study Selection

Describe the screening process, number of reviewers, software used, and conflict resolution.

**Template sentence:**
> "Titles and abstracts were independently screened by two reviewers ([INITIALS] and [INITIALS]) using [Rayyan / Covidence / other]. Full-text articles were assessed against the eligibility criteria by the same reviewers independently. Discrepancies were resolved by consensus or, when necessary, by consultation with a third reviewer ([INITIALS])."

**Checklist:**
- [ ] Number of reviewers stated
- [ ] Screening software named
- [ ] Conflict resolution process described
- [ ] Pilot testing of screening criteria mentioned (if performed)

### 2.5 Data Extraction

Describe the data extraction form, pilot testing, duplicate extraction, and variables extracted.

**Template sentence:**
> "Data were extracted independently by two reviewers using a standardised, pilot-tested data extraction form. Extracted variables included: first author, publication year, country, study design, population characteristics (N, age, sex), [exposure/intervention] definition, [comparator] definition, outcome definition, follow-up duration, effect estimate (with 95% CI), and confounders adjusted for."

**Checklist:**
- [ ] Form described (standardised, pilot-tested)
- [ ] Duplicate extraction stated
- [ ] All extracted variables enumerated
- [ ] Process for contacting study authors described (if applicable)

### 2.6 Risk of Bias Assessment

State the tool used, domains assessed, and process (independent, consensus).

| Study Design | Tool |
|---|---|
| RCTs | Cochrane RoB 2 |
| Non-randomised interventions | ROBINS-I |
| Observational (aetiology) | Newcastle-Ottawa Scale (NOS) |
| Diagnostic / prognostic | QUADAS-2 |
| Prevalence studies | JBI prevalence tool |
| Prediction models | PROBAST |

**Template sentence:**
> "Risk of bias was assessed independently by two reviewers using the [TOOL NAME]. For RCTs, the Cochrane Risk of Bias 2 (RoB 2) tool was used, covering five domains: randomisation process, deviations from intended interventions, missing outcome data, measurement of the outcome, and selection of reported results. For observational studies, the [NOS / ROBINS-I] was used. Disagreements were resolved by consensus. An overall risk-of-bias judgement (low, some concerns, high) was assigned to each study."

**Checklist:**
- [ ] Tool named for each study design included
- [ ] Domains listed
- [ ] Independent assessment stated
- [ ] Overall judgement categories defined

### 2.7 Effect Measures

Define the primary effect measure, any transformations, and the VE formula if applicable.

**Template sentence:**
> "The primary effect measure was the [odds ratio (OR) / relative risk (RR) / hazard ratio (HR)], with 95% confidence intervals. Effect estimates were log-transformed for meta-analysis and back-transformed for presentation."

**VE formula (for vaccine studies):**
> "Vaccine effectiveness was calculated as VE% = (1 - effect estimate) x 100%, where the effect estimate was the odds ratio, relative risk, or hazard ratio from each study, as reported."

**Checklist:**
- [ ] Primary effect measure defined
- [ ] Transformations stated (log-scale)
- [ ] VE formula stated (if applicable)
- [ ] Absolute vs relative VE distinguished (if applicable)

### 2.8 Synthesis Methods

This is the most complex subsection. Cover model type, estimation, heterogeneity, subgroup analyses, meta-regression, sensitivity analyses, and publication bias.

**Meta-analytic model:**
> "A random-effects model with restricted maximum likelihood (REML) estimation was used to pool effect estimates. Standard errors were adjusted using the Knapp-Hartung (HKSJ) method to account for uncertainty in the between-study variance estimate."

**Three-level meta-analysis (v1.0.0):**
> "A three-level random-effects meta-analytic model was fitted using the rma.mv function in the metafor package (version [X.X]) in R (version [X.X]), with effect sizes (level 2) nested within studies (level 3). This structure accounts for within-study correlation between repeated estimates from the same cohort."

**Robust variance estimation (v1.0.0):**
> "Robust variance estimation (RVE) with small-sample corrections was applied to account for dependent effect sizes within studies, using the clubSandwich package in R."

**Heterogeneity:**
> "Heterogeneity was assessed using Cochran's Q statistic (with p < 0.10 indicating significant heterogeneity), the I-squared statistic (interpreted as low < 25%, moderate 25-75%, high > 75%; Higgins et al.), the between-study variance tau-squared, and the 95% prediction interval."

**Subgroup analyses:**
> "Pre-specified subgroup analyses were conducted by [VARIABLES]. Subgroup differences were assessed using a chi-squared test of interaction."

**Meta-regression:**
> "Meta-regression was conducted using REML estimation with HKSJ-corrected standard errors to evaluate [COVARIATES] as potential sources of heterogeneity."

**Publication bias:**
> "Publication bias was assessed visually using funnel plots and statistically using Egger's weighted regression test for funnel plot asymmetry (where >= 10 studies were available). The trim-and-fill method was applied to estimate the number and direction of potentially missing studies."

**Sensitivity analyses:**
> "Pre-specified sensitivity analyses included: (1) exclusion of studies rated as high risk of bias; (2) exclusion of [SPECIFIC CRITERIA]; (3) use of fixed-effects model; (4) [OTHER]. Each sensitivity analysis was compared with the base-case estimate to assess robustness."

**Dose-response cross-reference (v1.0.0):**
For dose-response meta-analysis methods, see `skills/study-types/dose-response/SKILL.md`.

**Checklist:**
- [ ] Model type stated (random-effects, fixed-effects, multilevel)
- [ ] Estimation method stated (REML, DL, HKSJ)
- [ ] Heterogeneity statistics listed (Q, I-squared, tau-squared, 95% PI)
- [ ] Subgroup variables listed and pre-specified vs post-hoc stated
- [ ] Meta-regression covariates and estimation described
- [ ] Publication bias method stated (Egger's, funnel, trim-and-fill)
- [ ] Each sensitivity analysis listed with rationale
- [ ] Software and version cited

---

## Section 3 — Results Conventions

### Subsection Order

1. **Study Selection** — PRISMA flow diagram
2. **Study Characteristics** — summary table
3. **Risk of Bias** — domain-level and overall summary
4. **Primary Meta-Analysis** — pooled estimate with full heterogeneity reporting
5. **Sensitivity Analyses** — alternative estimates
6. **Subgroup Analyses** — stratified estimates with interaction tests
7. **Secondary Outcomes** — additional meta-analyses

### Study Selection

Report total records identified (by database), records after deduplication, records screened (title/abstract), full-texts assessed, studies included, and reasons for exclusion. Reference the PRISMA flow diagram.

### Study Characteristics Table

Required columns: First author, Year, Country, Design, Population (N), Exposure/Intervention, Comparator, Outcome definition, Follow-up duration, Confounders adjusted.

### Risk of Bias

Report domain-level judgements and overall judgement for each study. Summarise the distribution of RoB ratings across included studies.

### Primary Pooled Estimate

Report all of the following for every meta-analysis:

1. Number of studies (k) and total participants (N)
2. Model type and estimator (e.g., random-effects, REML, HKSJ)
3. Pooled point estimate with 95% CI
4. Cochran's Q statistic (df, p-value)
5. I-squared with 95% CI if available
6. Tau-squared with 95% CI via profile likelihood if available
7. 95% Prediction interval (PI)
8. Cross-reference to forest plot: (Figure X)

**Three-level model additional reporting:**
- Sigma-squared-between (between-cluster variance) with I-squared-between
- Sigma-squared-within (within-cluster variance) with I-squared-within
- Profile likelihood CIs for variance components
- Justification for three-level structure

**Interpreting heterogeneity:**
- I-squared < 25%: low heterogeneity
- I-squared 25-75%: moderate heterogeneity
- I-squared > 75%: high heterogeneity
- Always pair I-squared with the 95% PI; I-squared can be low even when PI is wide (small k problem)

### Vaccine Effectiveness Reporting

VE% = (1 - theta) x 100, where theta is the OR, RR, or HR. Back-transform from log-scale before reporting. Explicitly distinguish absolute VE (vs unvaccinated) from relative VE (vs alternative vaccine) throughout.

### Waning Analysis

Report slope (log-odds per year), p-value, between-study variance (sigma-squared-between, I-squared-between), within-study variance (sigma-squared-within, I-squared-within). Report model-predicted VE at key time points. State clearly what the prediction interval implies at each time horizon. Distinguish interpolated (within data range) from extrapolated (beyond data range) predictions.

### Sensitivity Analyses

Report each alternative estimate with its own CI and I-squared. State the direction of change relative to the base case. Do not over-interpret small numerical differences.

### Subgroup Analyses

Always report the test for subgroup difference (chi-squared statistic, degrees of freedom, p-value). Do not claim a subgroup effect without a statistically significant interaction test. Pre-specified subgroups carry higher evidential weight than post-hoc.

### Meta-Regression

Report: moderator variable(s) and coding, slope coefficient with SE, 95% CI, and p-value, intercept with SE, 95% CI, and p-value, R-squared analogue (% variance explained), residual heterogeneity after moderator.

### Prose Style

- Write in full paragraphs, never bullet points in the final manuscript
- Past tense throughout
- Cross-reference all figures and tables inline: (Figure 1), (Table 2)
- Do not cite external references in the Results section
- UK English spelling

---

## Section 4 — Discussion Considerations

### Main Findings — Opening Paragraph Template

> "This systematic review and meta-analysis of [N] studies -- [N] [design] and [N] [design], published between [years] across [countries] -- found that [intervention] was associated with [primary outcome] of [point estimate] (95% CI: [lower], [upper]; I-squared = [X]%; 95% prediction interval, [lower] to [upper]). [Secondary finding 1, with statistics]. [Null result or non-significant trend, phrased proportionately]. [Waning / subgroup result, with appropriate caveat if from single study]."

### Literature Comparison Framing

**Consistent:**
> "The pooled estimate of [X]% observed in the present review is broadly consistent with prior evidence. [Author] and colleagues, in a [SRMA / cohort study] of [scope], reported [comparable estimate] (95% CI: [lower], [upper])..."

**Divergent:**
> "In contrast to [Author] et al., who reported [estimate], the present review found [different estimate]. This divergence may reflect [methodological difference / population difference / time period / comparator heterogeneity]..."

**Extending:**
> "The present review extends the work of [Author] et al. by [methodological contribution -- e.g., separating absolute from relative VE / applying three-level meta-regression / restricting to a specific age group]..."

### Typical Strengths

- Pre-specified registered protocol reduces post-hoc bias
- Comprehensive multi-database search reduces publication bias
- Three-level meta-regression accounts for within-study correlations between repeated estimates
- Explicit separation of absolute vs relative VE (if applicable)
- HKSJ adjustment provides appropriate interval widths under small-study conditions
- Rigorous heterogeneity assessment (tau-squared, I-squared, PI) informs generalisability
- Multiple pre-specified sensitivity analyses test robustness
- Design-appropriate risk of bias tools (RoB 2, ROBINS-I, NOS)
- PRISMA 2020 adherence ensures transparent reporting

**Template:**
> "This review was conducted against a pre-specified, registered protocol, reducing the risk of post-hoc analytical decisions inflating spurious positive findings."

> "The Hartung-Knapp-Sidik-Jonkman adjustment was applied to all confidence intervals, providing more appropriate interval widths under the small-study conditions (k < 10) prevalent in this literature."

### Typical Limitations

For each limitation, state: (1) the limitation precisely, (2) likely direction of bias, (3) impact on conclusions.

- **Small k / limited power:** "The base-case meta-analysis included only [k] studies, and the waning meta-regression was based on [N] paired estimates from [N] studies, affording limited statistical power. Wide confidence and prediction intervals throughout reflect this imprecision."
- **Temporal heterogeneity:** "The pooled estimate represents an average across studies with markedly different post-vaccination follow-up periods, ranging from [X] to [X] years."
- **Observational study bias:** "All [N] observational studies were at moderate to serious risk of bias from unmeasured confounding. Healthy vaccinee bias may have inflated effectiveness estimates to an unknown degree."
- **Comparator heterogeneity:** "Differences in comparator vaccines across studies precluded direct pooling of relative and absolute VE estimates."
- **Single-study subgroup:** "Age-stratified data were available from a single study, precluding replication of the age-differential finding."
- **Geographical restriction:** "Evidence was restricted to [N] high-income countries; generalisability to LMIC settings is uncertain."
- **Midpoint assumption:** "Time since vaccination was derived using the midpoint of study periods; misclassification may have attenuated the slope estimate."

---

## Section 5 — Software Citations

**R:**
> R Core Team. R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing, Vienna, Austria. [Year]. Available from: https://www.R-project.org/

**metafor (R package):**
> Viechtbauer W. Conducting meta-analyses in R with the metafor package. *J Stat Softw*. 2010;36(3):1-48. doi:10.18637/jss.v036.i03

**Rayyan (screening):**
> Ouzzani M, Hammady H, Fedorowicz Z, Elmagarmid A. Rayyan -- a web and mobile app for systematic reviews. *Syst Rev*. 2016;5:210. doi:10.1186/s13643-016-0384-4

**Covidence (screening):**
> Covidence systematic review software, Veritas Health Innovation, Melbourne, Australia. Available from: www.covidence.org

**RevMan (meta-analysis):**
> Review Manager (RevMan) [Computer program]. Version [X.X]. The Cochrane Collaboration. [Year].

**PROSPERO registration template:**
> "This systematic review and meta-analysis was conducted in accordance with the Preferred Reporting Items for Systematic Reviews and Meta-Analyses (PRISMA 2020) guidelines [REF]. The study protocol was prospectively registered with PROSPERO (registration number: CRD[XXXXXXXX], registered [DATE])."

**OSF registration template:**
> "The study protocol was pre-registered on the Open Science Framework (OSF; https://osf.io/[ID], registered [DATE])."

**clubSandwich (robust variance estimation):**
> Pustejovsky JE. clubSandwich: Cluster-Robust (Sandwich) Variance Estimators with Small-Sample Corrections. R package. Available from: https://CRAN.R-project.org/package=clubSandwich
