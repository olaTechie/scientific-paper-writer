---
name: rct
description: >
  Study-type module for randomised controlled trials. Provides reporting
  guidance aligned with CONSORT 2010, including methods subsection templates
  with detailed prose guidance, results conventions for ITT and per-protocol
  analyses, discussion paragraph frameworks, and software citation standards.
version: 1.0.0
triggers:
  - "write RCT methods"
  - "CONSORT methods"
  - "randomised trial methods"
  - "write RCT results"
  - "write primary outcome"
  - "write adverse events"
  - "CONSORT checklist"
  - "write clinical trial"
  - "write randomisation"
  - "write blinding"
  - "write trial discussion"
---

# Randomised Controlled Trial

## Section 1 — Reporting Guideline

**Guideline:** CONSORT 2010 (Consolidated Standards of Reporting Trials)

**Key reference:** Schulz KF, Altman DG, Moher D; CONSORT Group. CONSORT 2010 statement: updated guidelines for reporting parallel group randomised trials. *BMJ*. 2010;340:c332. doi:10.1136/bmj.c332

CONSORT 2010 applies to parallel-group RCTs. Extensions exist for cluster, crossover, non-inferiority, pragmatic, adaptive, and stepped-wedge designs. Announce guideline selection before writing; allow the user to override or specify an extension.

See `references/consort-checklist.md` for the full item-level checklist.

---

## Section 2 — Methods Subsections

Write Methods in past tense. Provide sufficient detail for replication. Never invent procedural details; flag unknowns with `[PLEASE VERIFY: ___]`.

### 2.1 Trial Design

State the trial design (parallel, factorial, crossover, cluster, adaptive, platform), the allocation ratio, and any important changes after trial commencement.

**Template sentences:**
> "This was a [single-centre / multicentre], [parallel-group / factorial / crossover], [double-blind / single-blind / open-label] randomised controlled trial conducted at [SETTING(S)] between [START DATE] and [END DATE]. Participants were randomly assigned in a [1:1 / 2:1 / other] ratio to receive [INTERVENTION] or [COMPARATOR]."

> "The trial was registered with [REGISTRY] ([REGISTRATION NUMBER]) and approved by [ETHICS COMMITTEE / IRB] (reference: [NUMBER]). All participants provided written informed consent before enrolment."

**Adaptive designs (v1.0.0):**
> "This was a [response-adaptive / sample-size-adaptive / platform] trial. The adaptation rules were pre-specified in the statistical analysis plan and included [DESCRIPTION -- e.g., interim analyses at N=X and N=Y with predefined stopping boundaries for efficacy and futility based on a Lan-DeMets alpha-spending function with O'Brien-Fleming boundaries]."

**Platform trials (v1.0.0):**
> "This was a platform trial with a shared control arm and [N] experimental arms. Arms could be added or dropped during the trial based on pre-specified decision rules. The master protocol was registered at [REGISTRY]."

**Checklist:**
- [ ] Trial design named (parallel, factorial, crossover, cluster, adaptive, platform)
- [ ] Allocation ratio stated
- [ ] Important changes after commencement and reasons
- [ ] Registration number and registry
- [ ] Ethics approval and informed consent

### 2.2 Participants

State the eligibility criteria, the settings and locations where data were collected, and the recruitment period.

**Template sentences:**
> "Eligible participants were [ADULTS / CHILDREN / PATIENTS] aged [RANGE] years with [CONDITION / CRITERIA]. Key exclusion criteria included [LIST]. Participants were recruited from [SETTING] between [DATES]."

> "Eligibility was confirmed by [METHOD -- e.g., review of medical records / screening visit / laboratory testing] before randomisation."

**Checklist:**
- [ ] Inclusion criteria specified (population, condition, age)
- [ ] Exclusion criteria enumerated
- [ ] Settings and locations described
- [ ] Recruitment period and methods stated

### 2.3 Interventions

Describe the interventions for each group with sufficient detail for replication, including dose, route, frequency, duration, and any co-interventions.

**Template sentences:**
> "Participants in the intervention group received [DRUG / DEVICE / PROCEDURE] at a dose of [DOSE], administered [ROUTE] every [FREQUENCY] for [DURATION]. Participants in the control group received [PLACEBO / ACTIVE COMPARATOR / STANDARD CARE], matched for [APPEARANCE / ROUTE / FREQUENCY]."

> "Adherence was assessed by [METHOD -- e.g., pill counts, electronic monitoring, self-report]. Protocol deviations were recorded and classified as major or minor according to pre-specified criteria."

**Checklist:**
- [ ] Each group's intervention described in replicable detail
- [ ] Dose, route, frequency, and duration stated
- [ ] Placebo or comparator described (matching characteristics)
- [ ] Co-interventions and prohibited concomitant treatments
- [ ] Adherence assessment method stated

### 2.4 Outcomes

Define all pre-specified primary and secondary outcomes, including measurement methods, time points, and any changes after trial commencement.

**Template sentences:**
> "The primary outcome was [OUTCOME], defined as [DEFINITION], assessed at [TIME POINT] after randomisation. Secondary outcomes included [OUTCOME 1], [OUTCOME 2], and [OUTCOME 3]. Safety outcomes included [SERIOUS ADVERSE EVENTS / ADVERSE EVENTS OF SPECIAL INTEREST]."

> "Outcomes were assessed by [BLINDED / UNBLINDED] clinical assessors using [TOOL / SCALE / CRITERIA]. [Any adjudication committee and its blinding status]."

**Estimand framework (ICH E9 R1, v1.0.0):**
> "The primary estimand was defined as: Population: [TARGET POPULATION]; Treatment: [TREATMENT CONDITION]; Endpoint: [VARIABLE]; Intercurrent events: [LIST WITH STRATEGIES -- e.g., treatment discontinuation handled by treatment-policy strategy; death handled by composite strategy]; Population-level summary: [DIFFERENCE IN MEANS / RISK RATIO / HAZARD RATIO]."

**Checklist:**
- [ ] Primary outcome completely defined (measure, method, time point)
- [ ] Secondary outcomes defined
- [ ] Safety outcomes specified
- [ ] Any changes to outcomes after trial commencement stated with reasons
- [ ] Estimand defined (v1.0.0) with intercurrent event strategies

### 2.5 Sample Size

Report the basis for sample size determination, including the assumed effect size, power, alpha, and any adjustments.

**Template sentences:**
> "A sample size of [N] participants per group ([N] total) was required to detect a [EFFECT SIZE -- e.g., 20% relative risk reduction / mean difference of X units] with [POWER]% power at a two-sided significance level of [ALPHA], assuming [ASSUMPTIONS -- e.g., event rate of X% in the control group / standard deviation of X / dropout rate of X%]."

> "The sample size was calculated using [SOFTWARE / FORMULA]. [Any interim analysis adjustments: 'The total sample size was inflated by [X]% to account for [N] planned interim analyses using a [Lan-DeMets / O'Brien-Fleming / Pocock] alpha-spending approach.']"

**Checklist:**
- [ ] Target sample size and basis
- [ ] Assumed effect size and its clinical rationale
- [ ] Power, alpha level, and test (one-sided or two-sided)
- [ ] Key assumptions (event rate, SD, dropout rate)
- [ ] Adjustments for interim analyses or multiplicity

### 2.6 Randomisation

Describe the method of random sequence generation, the type of randomisation, and the allocation concealment mechanism.

**Template sentences:**
> "The randomisation sequence was generated by [PERSON / ORGANISATION] using [COMPUTER-GENERATED RANDOM NUMBERS / BLOCK RANDOMISATION with block sizes of [N] / STRATIFIED RANDOMISATION by [VARIABLES]]. Allocation was concealed using [CENTRALISED WEB-BASED SYSTEM / SEQUENTIALLY NUMBERED, SEALED OPAQUE ENVELOPES / INTERACTIVE VOICE RESPONSE SYSTEM (IVRS)]."

> "Randomisation was stratified by [VARIABLES] using permuted blocks of [SIZE]. The allocation sequence was generated before recruitment and stored on [SECURE SYSTEM]."

**Checklist:**
- [ ] Sequence generation method stated
- [ ] Type of randomisation (simple, block, stratified, minimisation)
- [ ] Block size(s) stated if applicable
- [ ] Stratification factors stated if applicable
- [ ] Allocation concealment mechanism described
- [ ] Who generated sequence, who enrolled, who assigned

### 2.7 Blinding

State who was blinded (participants, care providers, outcome assessors, data analysts), describe the method of blinding, and state the similarity of interventions.

**Template sentences:**
> "This was a [double-blind / single-blind / open-label] trial. Participants, care providers, and outcome assessors were blinded to group allocation. The [INTERVENTION] and [PLACEBO / COMPARATOR] were identical in [APPEARANCE / TASTE / PACKAGING]. Unblinding was permitted only in the event of a medical emergency, following a pre-specified protocol."

> "[If open-label:] Due to the nature of the intervention, blinding of participants and care providers was not possible. Outcome assessors were blinded to group allocation. The primary endpoint was assessed by an independent, blinded adjudication committee."

**Checklist:**
- [ ] Who was blinded (participants, providers, assessors, analysts)
- [ ] Method of blinding described
- [ ] Similarity of interventions stated
- [ ] Emergency unblinding procedure described (if applicable)
- [ ] Assessment of blinding success (if performed)

### 2.8 Statistical Methods

Describe the primary analysis, secondary analyses, subgroup analyses, adjusted analyses, and any methods for handling multiplicity.

**Template sentences:**
> "The primary analysis was conducted on the intention-to-treat (ITT) population, defined as all randomised participants regardless of protocol adherence. A per-protocol analysis was conducted as a secondary sensitivity analysis, excluding participants who [CRITERIA]."

> "The primary outcome was analysed using [METHOD -- e.g., a Cox proportional hazards model / logistic regression / linear mixed-effects model] comparing [INTERVENTION] with [COMPARATOR], with [STRATIFICATION FACTORS] included as covariates. The hazard ratio (HR) with 95% confidence interval was reported."

> "Subgroup analyses were pre-specified for [VARIABLES] and tested using [INTERACTION TERM / STRATIFIED ANALYSIS]. No adjustment for multiplicity was applied to subgroup analyses, which are considered exploratory."

> "For the primary outcome, a two-sided p-value of < 0.05 was considered statistically significant. [Multiplicity adjustment: 'The family-wise error rate for [N] co-primary endpoints was controlled using [Bonferroni / Hochberg / hierarchical testing procedure].']"

> "Interim analyses were planned at [N]% and [N]% of information, using a [Lan-DeMets alpha-spending function with O'Brien-Fleming boundaries / Haybittle-Peto stopping rule]. An independent Data Safety Monitoring Board (DSMB) reviewed interim results."

**Checklist:**
- [ ] ITT population defined
- [ ] Per-protocol population defined and criteria stated
- [ ] Primary analysis method stated with model details
- [ ] Covariates in the model listed
- [ ] Handling of missing outcome data (ITT requires imputation strategy or last-observation approach)
- [ ] Subgroup analyses listed as pre-specified or exploratory
- [ ] Multiplicity adjustment stated (or explicitly stated as not applied)
- [ ] Interim analysis rules and stopping boundaries (if applicable)
- [ ] Software and version stated

---

## Section 3 — Results Conventions

### Subsection Order

1. **Participant Flow** -- CONSORT flow diagram
2. **Baseline Characteristics** -- table by group
3. **Primary Outcome** -- ITT analysis
4. **Secondary Outcomes** -- by pre-specified hierarchy
5. **Subgroup Analyses** -- pre-specified subgroups
6. **Adverse Events** -- safety reporting

### Participant Flow (CONSORT Flow Diagram)

Report at each stage:
- Assessed for eligibility (N)
- Excluded (N, with reasons)
- Randomised (N)
- Allocated to intervention (N received, N did not receive with reasons)
- Lost to follow-up (N, with reasons)
- Discontinued (N, with reasons)
- Analysed: ITT (N), per-protocol (N, with reasons for exclusion)

### Baseline Characteristics

Report by group (intervention vs control). Include: age (mean +/- SD or median [IQR]), sex, ethnicity, key clinical variables. Do NOT test for balance using p-values (baseline differences are due to chance by design; report SMD instead if needed).

### Primary Outcome

Required elements:
- Effect estimate ([RR / OR / HR / MD / SMD]) with 95% CI and p-value
- Absolute risk in each group (events/N, %)
- Absolute risk difference with 95% CI
- NNT = 1 / ARR where clinically meaningful (report with 95% CI)
- For time-to-event: log-rank test p-value and median follow-up (with IQR)
- ITT as primary; per-protocol as secondary

**Template sentence:**
> "In the ITT population, [OUTCOME] occurred in [N/N] ([X]%) participants in the [INTERVENTION] group and [N/N] ([X]%) in the [CONTROL] group (hazard ratio, [X.XX]; 95% CI, [lower] to [upper]; p = [X.XX]). The absolute risk reduction was [X.X]% (95% CI, [lower] to [upper]), corresponding to a number needed to treat of [N] (95% CI, [lower] to [upper])."

### Secondary Outcomes

Report in the pre-specified hierarchy. Apply the same reporting format as the primary outcome. Note whether multiplicity adjustments were applied.

### Subgroup Analyses

Report pre-specified subgroup analyses with:
- Subgroup-specific estimates and 95% CIs
- Interaction p-value for each subgroup factor
- Forest plot of subgroup effects (referenced as Figure X)
- Explicit statement that subgroup analyses are exploratory

### Adverse Events

Report:
- Any adverse event by group (N, %)
- Serious adverse events by group (N, %)
- Adverse events leading to discontinuation (N, %)
- Deaths by group (N, %)
- Most common adverse events (those occurring in >= X% of participants)
- Reference safety table (Table X)

### Prose Style

- Write in full paragraphs, never bullet points in the final manuscript
- Past tense throughout
- ITT analysis is always primary; state this explicitly
- Cross-reference all figures and tables inline
- Do not cite external references in the Results section
- UK English spelling

---

## Section 4 — Discussion Considerations

### Main Findings -- Opening Paragraph Template

> "In this randomised controlled trial of [N] participants followed for a median of [X] [months/years], [intervention] [significantly / did not significantly] reduce the primary outcome of [outcome] compared with [comparator] ([primary estimate]; 95% CI: [lower], [upper]; p = [X]). The absolute risk reduction was [X]% (95% CI: [lower], [upper]), corresponding to a number needed to treat of [N] (95% CI: [lower], [upper]). [Key secondary results]. [Safety results]."

### Literature Comparison Framing

**Consistent:**
> "These findings are consistent with the [TRIAL NAME] trial, which reported [estimate] in [N] [population]..."

**Divergent:**
> "In contrast, the [TRIAL NAME] trial found [estimate], which may reflect differences in [population / intervention dose / comparator / follow-up duration / endpoint definition]..."

**Extending:**
> "The present trial extends prior evidence by [novel contribution -- e.g., testing in a previously unstudied population / using a pragmatic design / reporting long-term follow-up / evaluating a composite endpoint]..."

### Typical Strengths

- Randomisation eliminates confounding by measured and unmeasured variables
- Allocation concealment prevents selection bias
- Double-blinding prevents performance and detection bias
- Pre-registered protocol with pre-specified analysis plan
- Adequate sample size with sufficient statistical power
- Low loss to follow-up (<X%) minimising attrition bias
- ITT analysis preserving the benefit of randomisation
- Independent DSMB oversight
- CONSORT 2010 adherence ensuring transparent reporting
- Multicentre design enhancing generalisability
- Adjudicated endpoints reducing misclassification

### Typical Limitations

For each limitation, state: (1) the limitation precisely, (2) likely direction of bias, (3) impact on conclusions.

- **Open-label design:** "The open-label design may have introduced performance bias (participants modifying behaviour) and detection bias (assessors influenced by knowledge of allocation). Blinded endpoint adjudication mitigates but does not eliminate this risk."
- **Single-centre:** "The single-centre design limits generalisability to other settings, populations, and care pathways."
- **Short follow-up:** "The [X]-month follow-up period may be insufficient to capture long-term efficacy, delayed adverse events, or durability of effect."
- **Surrogate endpoint:** "The primary endpoint ([SURROGATE]) is an imperfect proxy for [CLINICAL OUTCOME]; the observed effect on the surrogate may not translate into clinically meaningful benefit."
- **Multiplicity:** "Multiple secondary endpoints were tested without formal adjustment for multiplicity; these results should be considered exploratory and hypothesis-generating."
- **Eligibility restrictions:** "Strict eligibility criteria (exclusion of [GROUPS]) limit generalisability to [BROADER POPULATION]."
- **Crossover / contamination:** "[X]% of participants in the control group received [INTERVENTION], which may have diluted the treatment effect toward the null."
- **Loss to follow-up:** "Differential loss to follow-up ([X]% intervention vs [X]% control) may have introduced attrition bias in [DIRECTION]."
- **Underpowered subgroups:** "Subgroup analyses were underpowered; absence of significant interactions should not be interpreted as absence of effect modification."

---

## Section 5 — Software Citations

**R:**
> R Core Team. R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing, Vienna, Austria. [Year]. Available from: https://www.R-project.org/

**Stata:**
> StataCorp. Stata Statistical Software: Release [XX]. StataCorp LLC, College Station, TX. [Year].

**SAS:**
> SAS Institute Inc. SAS/STAT Software, Version [XX]. SAS Institute Inc., Cary, NC. [Year].

**R packages (common for RCTs):**

*survival:*
> Therneau TM. A Package for Survival Analysis in R. R package version [X.X]. Available from: https://CRAN.R-project.org/package=survival

*lme4 (mixed-effects models):*
> Bates D, Machler M, Bolker B, Walker S. Fitting Linear Mixed-Effects Models Using lme4. *J Stat Softw*. 2015;67(1):1-48. doi:10.18637/jss.v067.i01

*rpact (adaptive designs):*
> Wassmer G, Pahlke F. rpact: Confirmatory Adaptive Clinical Trial Design and Analysis. R package. Available from: https://CRAN.R-project.org/package=rpact

**PASS (sample size):**
> PASS [Version]. NCSS, LLC. Kaysville, Utah. [Year]. Available from: ncss.com/software/pass

**REDCap (data capture):**
> Harris PA, Taylor R, Thielke R, et al. Research electronic data capture (REDCap) -- a metadata-driven methodology and workflow process for providing translational research informatics support. *J Biomed Inform*. 2009;42(2):377-381. doi:10.1016/j.jbi.2008.08.010
