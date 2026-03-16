# STARD 2015 Checklist -- Diagnostic Accuracy Studies

**Citation:** Bossuyt PM, Reitsma JB, Bruns DE, et al. STARD 2015: an updated list of essential items for reporting diagnostic accuracy studies. *BMJ*. 2015;351:h5527. doi:10.1136/bmj.h5527

---

## Title and Abstract

| Item | Description | Status |
|------|-------------|--------|
| 1 | Identification as a study of diagnostic accuracy using at least one measure of accuracy (sensitivity, specificity, predictive values, or AUC) | |
| 2 | Structured abstract: study design, methods, results, conclusions | |

---

## Introduction

| Item | Description | Status |
|------|-------------|--------|
| 3 | Scientific and clinical background, including intended use and clinical role of the index test | |
| 4 | Study objectives and hypotheses | |

---

## Methods

### Study Design

| Item | Description | Status |
|------|-------------|--------|
| 5 | Whether data collection was planned before the index test and reference standard were performed (prospective) or after (retrospective) | |
| 6 | Eligibility criteria | |
| 7 | On what basis potentially eligible participants were identified (symptoms, results of previous tests, registry, consecutive, random, convenience) | |

### Test Methods

| Item | Description | Status |
|------|-------------|--------|
| 8a | Index test: describe in sufficient detail to allow replication | |
| 8b | Reference standard: describe in sufficient detail to allow replication | |
| 9 | Rationale for choosing the reference standard (if alternatives exist) | |
| 10a | Definition of and rationale for test positivity cut-offs or result categories of the index test, distinguishing pre-specified from exploratory | |
| 10b | Definition of and rationale for test positivity cut-offs or result categories of the reference standard, distinguishing pre-specified from exploratory | |
| 11 | Whether clinical information and reference standard results were available to the performers/readers of the index test (blinding) | |
| 12 | Whether clinical information and index test results were available to the assessors of the reference standard (blinding) | |

### Analysis

| Item | Description | Status |
|------|-------------|--------|
| 13 | Methods for estimating or comparing measures of diagnostic accuracy | |
| 14 | How indeterminate index test or reference standard results were handled | |
| 15 | How missing data on the index test and reference standard were handled | |
| 16 | Any analyses of variability in diagnostic accuracy, distinguishing pre-specified from exploratory | |
| 17 | Intended sample size and how it was determined | |

---

## Results

### Participants

| Item | Description | Status |
|------|-------------|--------|
| 18 | Flow of participants, using a diagram: eligible, enrolled, index test performed, reference standard performed, analysed; with reasons for exclusions at each stage | |
| 19 | Baseline demographic and clinical characteristics of participants | |
| 20a | Distribution of severity of disease in those with the target condition | |
| 20b | Distribution of alternative diagnoses in those without the target condition | |
| 21 | Time interval and any clinical interventions between index test and reference standard | |

### Test Results

| Item | Description | Status |
|------|-------------|--------|
| 22 | Cross-tabulation of the index test results (or their distribution) by the results of the reference standard | |
| 23 | Estimates of diagnostic accuracy and their precision (95% CI) | |
| 24 | Any adverse events from performing the index test or reference standard | |

---

## Discussion

| Item | Description | Status |
|------|-------------|--------|
| 25 | Study limitations including sources of potential bias, statistical uncertainty, and generalisability | |
| 26 | Implications for practice, including the intended use and clinical role of the index test | |

---

## Other Information

| Item | Description | Status |
|------|-------------|--------|
| 27 | Registration number and name of registry | |
| 28 | Where the full study protocol can be accessed | |
| 29 | Sources of funding and other support; role of funders | |

---

## Expanded Item Descriptions

### Item 5 -- Study Design
State whether the study was prospective (data collection planned in advance) or retrospective (using existing specimens or records). Prospective studies with consecutive enrolment provide the highest quality evidence. State the study design explicitly: cross-sectional (single time point) or cohort-based (follow-up for delayed reference standard).

### Item 6 -- Eligibility Criteria
Define inclusion and exclusion criteria precisely. Specify the clinical presentation, age range, and setting. The eligibility criteria determine the clinical spectrum and thus affect the generalisability of accuracy estimates.

### Item 7 -- Participant Identification
State whether participants were identified consecutively, randomly, or by convenience. Consecutive enrolment of all eligible patients during the study period minimises spectrum bias and selection bias.

### Item 8a -- Index Test
Describe the index test procedure in replicable detail: name, manufacturer, model/version, reagents (lot numbers if relevant), equipment settings, operator qualifications and training, number of readers, blinding to reference standard and clinical information. For imaging: describe acquisition protocol, reconstruction, and interpretation criteria.

### Item 8b -- Reference Standard
Describe the reference standard with the same level of detail as the index test. If the reference standard is composite (combining multiple tests or clinical criteria), describe each component and the decision algorithm. If the reference standard is clinical follow-up, state the duration and method of ascertainment.

### Item 9 -- Rationale for Reference Standard
Explain why this reference standard was chosen over alternatives. If the reference standard is imperfect (not truly a gold standard), acknowledge this and discuss the implications for accuracy estimates.

### Items 10a/10b -- Thresholds
For quantitative tests, state the threshold for positivity and whether it was pre-specified (based on prior literature or manufacturer recommendation) or derived from the study data (e.g., Youden's index from ROC analysis). Data-driven thresholds will overestimate accuracy (optimism bias).

### Items 11/12 -- Blinding
State explicitly whether index test readers were blinded to reference standard results and clinical information, and whether reference standard assessors were blinded to index test results. Lack of blinding can inflate accuracy (review bias / incorporation bias).

### Item 13 -- Statistical Methods
Describe all accuracy measures calculated: sensitivity, specificity, PPV, NPV, positive and negative likelihood ratios, diagnostic odds ratio, AUC. State the method for confidence intervals (exact binomial, bootstrap, DeLong for AUC comparison). Describe any ROC analysis, including the method for optimal threshold determination.

### Item 14 -- Indeterminate Results
Report the number of indeterminate, inconclusive, or uninterpretable results for both the index test and the reference standard. State how these were handled in the analysis. Excluding indeterminate results inflates apparent accuracy.

### Item 18 -- Flow Diagram
The STARD flow diagram should show: (1) eligible participants, (2) participants who received the index test, (3) participants who received the reference standard, (4) participants included in the 2x2 table, with reasons for exclusions at each stage. This is analogous to the CONSORT flow diagram for RCTs.

---

## Diagnostic Accuracy Measures -- Definitions

| Measure | Formula | Interpretation |
|---------|---------|---------------|
| Sensitivity | TP / (TP + FN) | Proportion of true positives correctly identified |
| Specificity | TN / (TN + FP) | Proportion of true negatives correctly identified |
| PPV | TP / (TP + FP) | Probability of disease given a positive test |
| NPV | TN / (TN + FN) | Probability of no disease given a negative test |
| LR+ | Sensitivity / (1 - Specificity) | How much a positive result increases disease probability |
| LR- | (1 - Sensitivity) / Specificity | How much a negative result decreases disease probability |
| DOR | (TP x TN) / (FP x FN) | Overall discriminatory power |
| AUC-ROC | Area under the curve | Overall discrimination across all thresholds |
