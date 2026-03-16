---
name: diagnostic-accuracy
description: >
  Study-type module for diagnostic accuracy studies. Provides reporting guidance
  aligned with STARD 2015, including methods subsection templates for index test
  and reference standard description, results conventions for sensitivity,
  specificity and likelihood ratios, discussion paragraph frameworks, and
  software citation standards.
version: 1.0.0
triggers:
  - "write diagnostic accuracy"
  - "STARD methods"
  - "write sensitivity specificity"
  - "write diagnostic results"
  - "write ROC analysis"
  - "STARD checklist"
  - "write index test"
  - "write reference standard"
  - "diagnostic study methods"
  - "write 2x2 table"
---

# Diagnostic Accuracy Study

## Section 1 — Reporting Guideline

**Guideline:** STARD 2015 (Standards for Reporting of Diagnostic Accuracy Studies)

**Key reference:** Bossuyt PM, Reitsma JB, Bruns DE, et al. STARD 2015: an updated list of essential items for reporting diagnostic accuracy studies. *BMJ*. 2015;351:h5527. doi:10.1136/bmj.h5527

STARD 2015 applies to studies evaluating the accuracy of one or more diagnostic tests, biomarkers, or imaging procedures against a reference standard. Announce guideline selection before writing; allow the user to override.

See `references/stard-checklist.md` for the full item-level checklist.

---

## Section 2 — Methods Subsections

Write Methods in past tense. Provide sufficient detail for replication, particularly regarding the index test and reference standard procedures. Never invent procedural details; flag unknowns with `[PLEASE VERIFY: ___]`.

### 2.1 Study Design

State whether the study was prospective or retrospective, cross-sectional or cohort-based, and whether consecutive or random sampling was used.

**Template sentences:**
> "This was a [prospective / retrospective] [cross-sectional / cohort-based] diagnostic accuracy study conducted at [SETTING] between [START DATE] and [END DATE]. Participants were enrolled [consecutively / randomly / by convenience sampling] from [SOURCE POPULATION]."

> "The study was approved by [ETHICS COMMITTEE] (reference: [NUMBER]). All participants provided [written informed consent / consent was waived due to retrospective design]."

**Checklist:**
- [ ] Study design stated (prospective/retrospective, cross-sectional/cohort)
- [ ] Sampling method stated (consecutive, random, convenience)
- [ ] Setting and dates described
- [ ] Ethics approval and consent

### 2.2 Participants

Describe the eligibility criteria, the intended use population for the test, and the spectrum of disease in the study sample.

**Template sentences:**
> "Eligible participants were [ADULTS / PATIENTS] presenting with [SYMPTOMS / CLINICAL INDICATION] at [SETTING]. Inclusion criteria were [LIST]. Exclusion criteria included [LIST]. The intended use population for the index test is [DESCRIPTION OF TARGET CLINICAL SCENARIO]."

> "Participants were classified into [DISEASE / NO DISEASE] groups based on the reference standard (see Section 2.4). The study aimed to evaluate diagnostic accuracy across the full clinical spectrum of [CONDITION], including patients with [MILD / SEVERE / DIFFERENTIAL DIAGNOSIS]."

**Checklist:**
- [ ] Eligibility criteria (inclusion and exclusion)
- [ ] Intended use population described
- [ ] Spectrum of disease described (severity range, differential diagnoses)
- [ ] Recruitment setting and period

### 2.3 Index Test

Describe the index test(s) in sufficient detail for replication, including the name, manufacturer, procedure, interpretation criteria, reader training, and handling of indeterminate results.

**Template sentences:**
> "The index test was [TEST NAME] ([MANUFACTURER, MODEL, VERSION]), performed according to [PROTOCOL / MANUFACTURER INSTRUCTIONS]. [DESCRIPTION OF PROCEDURE]. Results were interpreted by [N] [trained / certified] [readers / operators] who were blinded to the reference standard results."

> "A [positive / abnormal] index test result was defined as [THRESHOLD / CRITERIA]. Indeterminate or inconclusive results were [excluded from the primary analysis / classified as negative / classified as positive / reported separately]."

> "For quantitative tests, the threshold for positivity was determined by [pre-specified clinical threshold / Youden's index from ROC analysis / manufacturer's recommended cut-off]."

**Checklist:**
- [ ] Test named with manufacturer and version
- [ ] Procedure described in replicable detail
- [ ] Interpretation criteria and threshold for positivity stated
- [ ] Reader training and qualifications described
- [ ] Blinding of index test readers to reference standard stated
- [ ] Handling of indeterminate results stated

### 2.4 Reference Standard

Describe the reference standard, its rationale for selection, and the blinding of reference standard assessors.

**Template sentences:**
> "The reference standard was [TEST / PROCEDURE / CLINICAL CRITERIA], selected because [RATIONALE -- e.g., it is the current gold standard for diagnosing [CONDITION] / it has established high sensitivity and specificity]. Reference standard assessments were performed by [N] [SPECIALISTS] who were blinded to the index test results."

> "All participants received the same reference standard regardless of index test result. [OR: 'Participants with a positive index test result underwent [PROCEDURE]; participants with a negative result were followed for [DURATION] to confirm absence of disease (delayed verification).']"

**Checklist:**
- [ ] Reference standard named and described
- [ ] Rationale for selection stated
- [ ] Blinding of reference standard readers to index test stated
- [ ] Whether all participants received the same reference standard (verification bias)
- [ ] Time interval between index test and reference standard stated

### 2.5 Sample Size

Explain the basis for sample size determination.

**Template sentences:**
> "A minimum sample size of [N] participants ([N] with the target condition) was required to estimate sensitivity of [X]% with a 95% confidence interval width of no more than [X] percentage points, assuming a disease prevalence of [X]%."

> "[OR: 'All eligible participants during the study period were included. No a priori sample size calculation was performed; however, the achieved sample provides [PRECISION STATEMENT].']"

**Checklist:**
- [ ] Target precision for sensitivity and/or specificity stated
- [ ] Expected prevalence stated
- [ ] Sample size formula or method cited
- [ ] Achieved sample adequacy discussed

### 2.6 Missing Data

Describe how missing or indeterminate results were handled.

**Template sentences:**
> "Of [N] enrolled participants, [N] ([X]%) had missing or indeterminate index test results and [N] ([X]%) had missing or incomplete reference standard results. The primary analysis excluded participants with missing data (complete case analysis). A sensitivity analysis was performed classifying all indeterminate results as [positive / negative]."

**Checklist:**
- [ ] Number and proportion of missing index test results
- [ ] Number and proportion of missing reference standard results
- [ ] Handling method stated (exclusion, worst-case, best-case)
- [ ] Sensitivity analysis for missing/indeterminate results

### 2.7 Statistical Methods

Describe the statistical methods for calculating diagnostic accuracy measures.

**Template sentences:**
> "Sensitivity, specificity, positive predictive value (PPV), negative predictive value (NPV), and positive and negative likelihood ratios were calculated from the 2x2 cross-tabulation of index test results against the reference standard. Exact binomial 95% confidence intervals were computed for sensitivity and specificity."

> "Receiver operating characteristic (ROC) analysis was performed for quantitative test results. The area under the ROC curve (AUC) was calculated with 95% confidence intervals using the method of DeLong et al. The optimal threshold was determined using [Youden's index / pre-specified clinical threshold]."

> "Subgroup analyses were performed by [AGE GROUP / SEX / DISEASE SEVERITY / CLINICAL SETTING] to assess whether diagnostic accuracy varied across clinically relevant subpopulations."

**Checklist:**
- [ ] Diagnostic accuracy measures listed (sensitivity, specificity, PPV, NPV, LR+, LR-)
- [ ] Confidence interval method stated (exact binomial, bootstrap)
- [ ] ROC analysis described (if quantitative test)
- [ ] AUC calculation method and CI stated
- [ ] Threshold determination method stated
- [ ] Pre-specified subgroup analyses described
- [ ] Software and version stated

---

## Section 3 — Results Conventions

### Subsection Order

1. **Participants** -- flow diagram, enrolment, exclusions
2. **2x2 Cross-Tabulation** -- index test vs reference standard
3. **Diagnostic Accuracy Measures** -- sensitivity, specificity, PPV, NPV, LRs
4. **Subgroup Analyses** -- accuracy by clinically relevant subgroups

### Participants

Report numbers at each stage: eligible, enrolled, excluded (with reasons), received index test, received reference standard, included in analysis. Reference the STARD flow diagram (Figure X).

### 2x2 Cross-Tabulation Table

Present the 2x2 table clearly:

|  | Reference Standard + | Reference Standard - | Total |
|--|---------------------|---------------------|-------|
| Index Test + | True Positive (TP) | False Positive (FP) | TP + FP |
| Index Test - | False Negative (FN) | True Negative (TN) | FN + TN |
| Total | TP + FN | FP + TN | N |

Report the raw numbers in each cell. This table is the foundation for all accuracy calculations.

### Diagnostic Accuracy Measures

For each index test (or threshold), report:
- **Sensitivity** = TP / (TP + FN), with 95% CI
- **Specificity** = TN / (TN + FP), with 95% CI
- **PPV** = TP / (TP + FP), with 95% CI
- **NPV** = TN / (TN + FN), with 95% CI
- **Positive likelihood ratio (LR+)** = sensitivity / (1 - specificity), with 95% CI
- **Negative likelihood ratio (LR-)** = (1 - sensitivity) / specificity, with 95% CI
- **AUC-ROC** (for quantitative tests), with 95% CI

Note that PPV and NPV depend on disease prevalence; state the prevalence in the study sample and caution about applicability to settings with different prevalence.

### Subgroup Analyses

Report diagnostic accuracy measures stratified by clinically relevant subgroups (e.g., disease severity, age, sex, clinical setting). Compare accuracy across subgroups and note any spectrum effects.

### Prose Style

- Write in full paragraphs, never bullet points in the final manuscript
- Past tense throughout
- Cross-reference all figures and tables inline
- Do not cite external references in the Results section
- UK English spelling
- Report all accuracy measures with 95% CIs

---

## Section 4 — Discussion Considerations

### Main Findings -- Opening Paragraph

Restate the primary diagnostic accuracy results with full statistics. Contextualise with the clinical question: does this test perform well enough to change clinical management?

**Template:**
> "In this [prospective / retrospective] diagnostic accuracy study of [N] participants, the [INDEX TEST] demonstrated a sensitivity of [X]% (95% CI: [lower], [upper]) and a specificity of [X]% (95% CI: [lower], [upper]) for the diagnosis of [CONDITION], using [REFERENCE STANDARD] as the reference. The positive likelihood ratio of [X] suggests that a positive result [substantially increases / moderately increases / minimally increases] the post-test probability of [CONDITION]."

### Comparison with Existing Tests

Compare the index test's accuracy with existing diagnostic approaches:
- State whether the new test offers superior sensitivity, specificity, or both
- Compare AUCs using formal statistical tests (DeLong) if both tests were evaluated in the same population
- Discuss where in the diagnostic pathway the test would be positioned (triage, add-on, replacement)

### Discussion of Key Biases

Address the following biases explicitly:
- **Spectrum bias:** "The study enrolled patients with [DESCRIPTION OF SPECTRUM]. Sensitivity may be [overestimated / underestimated] if the clinical spectrum is [narrower / broader] than the intended use population."
- **Verification bias (partial verification):** "If not all participants received the reference standard, apparent accuracy may be biased."
- **Incorporation bias:** "If the index test forms part of the reference standard, sensitivity will be artificially inflated."
- **Disease progression bias:** "If there was a delay between index test and reference standard, disease status may have changed."
- **Reader bias:** "If readers were not blinded to [clinical information / other test results], accuracy may be overestimated."

### Clinical Utility

Discuss whether the observed accuracy is sufficient to change clinical management. Consider:
- What is the consequence of a false negative? (missed diagnosis)
- What is the consequence of a false positive? (unnecessary treatment, anxiety)
- Does the test add value beyond current clinical assessment?
- Is the test feasible, affordable, and acceptable in the target clinical setting?

### Typical Strengths

- Prospective consecutive enrolment reducing spectrum and selection bias
- Pre-specified threshold reducing data-driven threshold optimisation bias
- Blinded interpretation of index test and reference standard
- All participants received the same reference standard (no partial verification)
- Adequate sample size with sufficient precision
- Clinically relevant subgroup analyses
- STARD 2015 adherence ensuring transparent reporting

### Typical Limitations

- **Limited spectrum:** "The study population may not represent the full spectrum of [CONDITION] seen in routine clinical practice."
- **Single-centre:** "Generalisability to other settings, operators, and equipment is uncertain."
- **Convenience sampling:** "Non-consecutive enrolment may introduce selection bias."
- **Unblinded readers:** "[READERS] were not fully blinded to clinical information, which may have influenced test interpretation."
- **Small sample in subgroups:** "Subgroup analyses were underpowered and should be considered exploratory."
- **Reference standard imperfection:** "The reference standard ([TEST]) is imperfect; misclassification of true disease status would bias accuracy estimates."

---

## Section 5 — Software Citations

**R:**
> R Core Team. R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing, Vienna, Austria. [Year]. Available from: https://www.R-project.org/

**pROC (R):**
> Robin X, Turck N, Hainard A, et al. pROC: an open-source package for R and S+ to analyze and compare ROC curves. *BMC Bioinformatics*. 2011;12:77. doi:10.1186/1471-2105-12-77

**epiR (R, diagnostic accuracy):**
> Stevenson M, Nunes T, Heuer C, et al. epiR: Tools for the Analysis of Epidemiological Data. R package. Available from: https://CRAN.R-project.org/package=epiR

**Stata:**
> StataCorp. Stata Statistical Software: Release [XX]. StataCorp LLC, College Station, TX. [Year].

**MedCalc:**
> MedCalc Statistical Software version [XX]. MedCalc Software Ltd, Ostend, Belgium. [Year]. Available from: https://www.medcalc.org

**Python (scikit-learn):**
> Pedregosa F, Varoquaux G, Gramfort A, et al. Scikit-learn: Machine learning in Python. *J Mach Learn Res*. 2011;12:2825-2830.
