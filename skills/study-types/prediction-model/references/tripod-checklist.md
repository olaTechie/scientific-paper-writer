# TRIPOD+AI Checklist -- Prediction Models and Machine Learning

**Citation:** Collins GS, Moons KGM, Dhiman P, et al. TRIPOD+AI statement: updated guidance for reporting clinical prediction models that use regression or machine learning methods. *BMJ*. 2024;385:e078378. doi:10.1136/bmj-2023-078378

---

## Title and Abstract

| Item | Description | Status |
|------|-------------|--------|
| 1 | Identify the study as developing, validating, or updating a prediction model; identify the target population and outcome | |
| 2 | Provide a summary of objectives, study design, setting, participants, sample size, predictors, outcome, statistical analysis, results, and conclusions | |

---

## Introduction

| Item | Description | Status |
|------|-------------|--------|
| 3a | Explain the clinical/scientific background and rationale for developing/validating the model | |
| 3b | Specify the objectives, including whether the study is development, validation, or both | |

---

## Methods

| Item | Description | Status |
|------|-------------|--------|
| 4a | Source of data: describe the study design (e.g., cohort, case-control, registry), data source, country, setting, and relevant dates | |
| 4b | Participants: describe eligibility criteria, treatment/index date, and key dates (recruitment, follow-up, data collection) | |
| 4c | Predictors: list all candidate predictors, definitions, timing of measurement relative to index date, and any transformations applied | |
| 4d | Sample size: report number of participants and outcome events; report events per variable (EPV) or events per predictor parameter (EPP); describe any formal sample size calculation | |
| 4e | Missing data: report proportion of missing data per predictor and outcome; describe handling method (complete case, imputation, other) | |
| 4f | Model development: describe model type, variable/feature selection method, shrinkage/regularisation, and hyperparameter tuning strategy | |
| 4g | Model performance: describe pre-specified measures of discrimination (AUC/C-statistic), calibration (plot, slope, intercept), and clinical utility (decision curve, net benefit) | |
| 4h | Internal validation: describe the validation strategy (bootstrap, cross-validation, temporal split) and method for optimism correction | |
| 4i | External validation: describe the external validation dataset (source, geography, dates, N, events) and whether the model was applied as-is or recalibrated | |
| 4j | Software: state all software, packages, and versions used; state code and data availability | |

---

## Results

| Item | Description | Status |
|------|-------------|--------|
| 5a | Participant flow: report numbers at each stage, reasons for exclusions | |
| 5b | Participant characteristics: describe development and validation samples | |
| 5c | Model development: report final model (intercept/coefficients or architecture), selected predictors | |
| 5d | Model performance: report discrimination, calibration, and clinical utility with confidence intervals | |
| 5e | Model updating: if applicable, report performance before and after updating/recalibration | |

---

## Discussion

| Item | Description | Status |
|------|-------------|--------|
| 6a | Summarise main findings with reference to study objectives | |
| 6b | Discuss limitations (including risk of overfitting, generalisability, missing data) | |
| 6c | Discuss implications for clinical use, next steps for validation, and potential biases | |

---

## Other

| Item | Description | Status |
|------|-------------|--------|
| 7a | Supplementary information: full model specification, code, data dictionary | |
| 7b | Funding sources and role of funders | |

---

## Machine Learning Additions (TRIPOD+AI Supplement)

### Hyperparameter Tuning

| Item | Description | Status |
|------|-------------|--------|
| ML-1 | Tuning strategy (grid search, random search, Bayesian optimisation) | |
| ML-2 | Hyperparameter search space (ranges and distributions) | |
| ML-3 | Number of tuning iterations | |
| ML-4 | Selection criterion (AUC, log-loss, Brier score) | |
| ML-5 | Final hyperparameter values reported | |

### Cross-Validation

| Item | Description | Status |
|------|-------------|--------|
| ML-6 | CV scheme: k-fold (state k), stratified, grouped, temporal, nested | |
| ML-7 | Grouping variable (if grouped CV) to prevent data leakage | |
| ML-8 | Performance reported as mean +/- SD across folds | |

### Feature Importance

| Item | Description | Status |
|------|-------------|--------|
| ML-9 | Method: SHAP, permutation importance, integrated gradients, model-specific (Gini) | |
| ML-10 | Computed on test/validation set (not training set) | |
| ML-11 | Top N features listed with importance values | |
| ML-12 | Summary plot referenced (Figure X) | |
| ML-13 | Explicit statement that feature importance does not imply causation | |

### Threshold Selection

| Item | Description | Status |
|------|-------------|--------|
| ML-14 | Threshold selection method (Youden, sensitivity-specificity tradeoff, clinical consensus, cost-based) | |
| ML-15 | Threshold value reported | |
| ML-16 | Sensitivity, specificity, PPV, NPV at selected threshold | |

### Class Imbalance

| Item | Description | Status |
|------|-------------|--------|
| ML-17 | Class prevalence reported | |
| ML-18 | Resampling method (SMOTE, oversampling, undersampling, class weights) | |
| ML-19 | Applied to training data only (not test/validation) | |

### Data Splitting

| Item | Description | Status |
|------|-------------|--------|
| ML-20 | Split type (random, temporal, stratified, site-based) | |
| ML-21 | Split ratios and N per split | |
| ML-22 | Test set used only for final evaluation | |
| ML-23 | No data leakage between splits (preprocessing fit on training only) | |

---

## ML Reporting Checklist (Summary)

### Data Split
- [ ] N training / N validation / N test (or k-fold CV details)
- [ ] Class prevalence in each split
- [ ] Any oversampling or undersampling used (training only)

### Performance Metrics
- [ ] Primary metric pre-specified: AUC-ROC or other
- [ ] Sensitivity (recall) at specified threshold with 95% CI
- [ ] Specificity at specified threshold with 95% CI
- [ ] PPV (precision) at specified threshold with 95% CI
- [ ] NPV at specified threshold with 95% CI
- [ ] F1 score
- [ ] Calibration: Brier score and calibration plot

### Model Comparison
- [ ] Baseline model defined (e.g., logistic regression, clinical score)
- [ ] Statistical test of AUC difference (e.g., DeLong test)
- [ ] Confidence interval for AUC difference

### Confidence Intervals
- [ ] Bootstrap (>= 1000 iterations) or nested CV
- [ ] 95% CI reported for all primary metrics
