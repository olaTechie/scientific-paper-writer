---
name: prediction-model
description: >
  Study-type module for clinical prediction models and generic machine learning
  papers. Provides reporting guidance aligned with TRIPOD+AI, including methods
  subsection templates for model development and validation, results conventions
  for both clinical prediction and generic ML studies, discussion paragraph
  frameworks, and software citation standards.
version: 1.0.0
triggers:
  - "write prediction model"
  - "TRIPOD methods"
  - "TRIPOD+AI methods"
  - "write ML paper"
  - "machine learning methods"
  - "write model performance"
  - "write calibration"
  - "write AUC results"
  - "write feature importance"
  - "TRIPOD checklist"
  - "write model development"
  - "write validation results"
---

# Prediction Model and Machine Learning

## Section 1 — Reporting Guideline

**Guideline:** TRIPOD+AI (Transparent Reporting of a multivariable prediction model for Individual Prognosis or Diagnosis + Artificial Intelligence)

**Key reference:** Collins GS, Moons KGM, Dhiman P, et al. TRIPOD+AI statement: updated guidance for reporting clinical prediction models that use regression or machine learning methods. *BMJ*. 2024;385:e078378. doi:10.1136/bmj-2023-078378

TRIPOD+AI applies to studies developing, validating, or updating prediction models using regression or machine learning methods. It covers both clinical prediction models and generic ML papers. Announce guideline selection before writing; allow the user to override.

See `references/tripod-checklist.md` for the full item-level checklist.

---

## Section 2 — Methods Subsections

Write Methods in past tense. Provide full technical detail for reproducibility. Never invent procedural details; flag unknowns with `[PLEASE VERIFY: ___]`.

### 2.1 Source of Data

Describe the data source name, type (registry, EHR, claims, cohort, public dataset), country, and dates.

**Template sentence:**
> "Data were obtained from [DATA SOURCE], a [registry / electronic health record system / prospective cohort / publicly available dataset] covering [POPULATION DESCRIPTION] in [COUNTRY/REGION] between [START DATE] and [END DATE]."

**Checklist:**
- [ ] Data source named and described
- [ ] Data type (prospective, retrospective, registry, EHR, claims)
- [ ] Country and dates
- [ ] Data access and permissions stated

### 2.2 Participants

Describe the eligibility criteria, index date, follow-up period, and outcome ascertainment.

**Template sentence:**
> "The study included [ADULTS / PATIENTS] aged [RANGE] who [CRITERIA]. The index date was defined as [DEFINITION]. Participants were followed from the index date until [OUTCOME / CENSORING / END OF STUDY], whichever occurred first, for a maximum of [DURATION]."

**Checklist:**
- [ ] Eligibility criteria (inclusion and exclusion)
- [ ] Index date defined
- [ ] Follow-up period and censoring rules
- [ ] Outcome ascertainment method and timing

### 2.3 Predictors

List all candidate predictors, their definitions, timing of measurement relative to the index date, and any transformations applied.

**Template sentence:**
> "A total of [N] candidate predictors were considered, including [CATEGORIES -- e.g., demographics, laboratory values, comorbidities, imaging features]. All predictors were measured at or before the index date to ensure temporal validity. [Transformations: 'Continuous predictors were [log-transformed / winsorised at the 1st and 99th percentiles / modelled using restricted cubic splines with [N] knots].']"

**Checklist:**
- [ ] All candidate predictors listed with definitions
- [ ] Timing of measurement relative to index date
- [ ] Transformations stated (log, spline, categorisation)
- [ ] Feature engineering described (if applicable)

### 2.4 Sample Size

Report the number of events, events per variable (EPV) or events per predictor parameter (EPP), and any formal sample size calculation.

**Template sentence:**
> "The development dataset included [N] participants with [N] outcome events, yielding an events-per-variable ratio of [EPV]. [If formal calculation: 'A minimum sample size of [N] events was required based on the criteria of Riley et al., assuming [N] candidate predictors, an anticipated C-statistic of [X], and an outcome prevalence of [X]%.']"

**Checklist:**
- [ ] Total N and N events
- [ ] EPV or EPP ratio
- [ ] Formal sample size calculation (if performed) with assumptions
- [ ] Reference to sample size method (Riley et al. if applicable)

### 2.5 Missing Data

Report the proportion of missing data per predictor and the handling method.

**Template sentence:**
> "Missing data ranged from [X]% ([PREDICTOR]) to [X]% ([PREDICTOR]). Missing values were handled using [complete case analysis / multiple imputation by chained equations (MICE) with m = [N] imputations / single imputation with [METHOD]]. [For MI: 'The imputation model included all predictors, the outcome, and the Nelson-Aalen cumulative hazard estimate (for survival outcomes). Rubin's rules were used to combine estimates across imputed datasets.']"

**Checklist:**
- [ ] Proportion missing per predictor reported
- [ ] Missing data mechanism assumed (MCAR, MAR, MNAR)
- [ ] Handling method stated
- [ ] Imputation model details (if MI used)
- [ ] Sensitivity analysis for missing data (if performed)

### 2.6 Model Development

Describe the model type, variable selection strategy, shrinkage/regularisation, and hyperparameter tuning.

**Template sentence (clinical prediction):**
> "A [logistic regression / Cox proportional hazards / Fine-Gray competing risks] model was developed. Variable selection was performed using [backward elimination / LASSO / elastic net] with [CRITERION -- e.g., Akaike information criterion / cross-validated lambda-min]. Regression coefficients were [shrunk using a uniform shrinkage factor derived from bootstrapping / penalised using LASSO with lambda selected by 10-fold cross-validation]."

**Template sentence (generic ML):**
> "The following algorithms were evaluated: [logistic regression, random forest, gradient-boosted trees (XGBoost), support vector machine, neural network]. Hyperparameters were tuned using [grid search / random search / Bayesian optimisation] with [N]-fold [stratified] cross-validation on the training set. The final model was selected based on [PRIMARY METRIC -- e.g., AUC-ROC / log-loss] averaged across folds."

**Calibration-in-the-large (v1.0.0):**
> "Calibration-in-the-large was assessed by comparing the mean predicted probability with the observed event proportion."

**Model updating and recalibration (v1.0.0):**
> "Model recalibration was performed by [re-estimating the intercept only / re-estimating the intercept and calibration slope / full model revision] in the validation dataset."

**Checklist:**
- [ ] Model type(s) stated
- [ ] Variable selection strategy described
- [ ] Shrinkage or regularisation method stated
- [ ] Hyperparameter tuning strategy stated (if ML)
- [ ] Cross-validation scheme described (k-fold, stratified, grouped, temporal)
- [ ] Final model selection criterion stated

### 2.7 Model Performance

Describe the pre-specified performance metrics and how they were calculated.

**Template sentence:**
> "Model discrimination was assessed using the area under the receiver operating characteristic curve (AUC-ROC) [and the concordance statistic (C-statistic) for survival models]. Calibration was assessed using [calibration plots / Hosmer-Lemeshow test / calibration-in-the-large / calibration slope]. [Clinical utility was assessed using decision curve analysis, reporting net benefit across a range of clinically relevant threshold probabilities.]"

**Decision curve analysis and net benefit (v1.0.0):**
> "Decision curve analysis was performed to evaluate the clinical utility of the model, plotting net benefit against threshold probability across the range of [X]% to [X]%. Net benefit was compared with the strategies of treating all patients and treating no patients."

**Checklist:**
- [ ] Discrimination metric pre-specified (AUC-ROC, C-statistic)
- [ ] Calibration metric pre-specified (calibration plot, slope, intercept)
- [ ] Clinical utility metric stated (net benefit, decision curve)
- [ ] Threshold-based metrics and threshold value stated (sensitivity, specificity, PPV, NPV)
- [ ] Confidence interval method stated (bootstrap, cross-validation)

### 2.8 Internal Validation

Describe the internal validation strategy.

**Template sentence:**
> "Internal validation was performed using [bootstrap resampling with [N] iterations, optimism-corrected / [N]-fold cross-validation / temporal split (training: [DATES]; testing: [DATES])]. The optimism-corrected C-statistic [and calibration slope] are reported."

**Checklist:**
- [ ] Validation method stated (bootstrap, cross-validation, temporal split)
- [ ] Number of iterations or folds
- [ ] Optimism correction applied and reported

### 2.9 External Validation

Describe the external validation dataset, its relationship to the development data, and any recalibration performed.

**Template sentence:**
> "External validation was performed in an independent cohort from [DATA SOURCE] ([COUNTRY], [DATES]), comprising [N] participants with [N] events. The model was applied without modification to the external dataset. [If recalibrated: 'The model was recalibrated by [METHOD] before assessing performance.']"

**Checklist:**
- [ ] External dataset described (source, geography, dates, N, events)
- [ ] Relationship to development data stated (temporal, geographical, domain)
- [ ] Whether model was applied as-is or recalibrated
- [ ] Performance metrics reported in external data

### 2.10 Software and Reproducibility

Cite all software, packages, and versions. State code and data availability.

**Template sentence:**
> "All analyses were conducted in [Python [VERSION] / R [VERSION]]. [KEY PACKAGES with versions]. Code is available at [REPOSITORY URL]. [Data availability statement.]"

**Generic ML subsection: additional items:**

**Hyperparameter tuning:**
> "Hyperparameters were optimised using [grid search over {PARAMETER: VALUES} / random search with [N] iterations / Bayesian optimisation with [N] evaluations]. The search was conducted within [N]-fold [stratified] cross-validation on the training set."

**Cross-validation:**
> "Model performance was estimated using [N]-fold [stratified / grouped / temporal] cross-validation. [If grouped: 'Folds were grouped by [VARIABLE] to prevent data leakage from [REASON].']"

**Feature importance (SHAP):**
> "Feature importance was assessed using SHAP (SHapley Additive exPlanations) values, computed on the [test / validation] set. Summary plots display the mean absolute SHAP value for each feature."

**Threshold selection:**
> "The classification threshold was selected based on [Youden's index (maximising sensitivity + specificity - 1) / a pre-specified sensitivity of [X]% / the threshold maximising the F1 score / clinical consensus at [X]% threshold probability]."

**Resampling for class imbalance:**
> "To address class imbalance (prevalence [X]%), [SMOTE / random oversampling of the minority class / random undersampling of the majority class / class weights inversely proportional to class frequency] was applied to the training data only."

**Train/validation/test splits:**
> "The dataset was split into training ([X]%), validation ([X]%), and test ([X]%) sets using [random / temporal / stratified] splitting. [N] participants were allocated to training, [N] to validation, and [N] to test. The test set was held out and used only for final performance assessment."

**Checklist:**
- [ ] Software and package versions cited
- [ ] Code availability stated
- [ ] Data availability stated
- [ ] Hyperparameter search strategy and ranges
- [ ] Cross-validation scheme details
- [ ] Feature importance method
- [ ] Threshold selection rationale
- [ ] Class imbalance handling (if applicable)
- [ ] Train/validation/test split ratios and method

---

## Section 3 — Results Conventions

### Results Ordering: Clinical Prediction Model

1. **Data Description** -- participant flow, sample sizes, outcome prevalence/incidence
2. **Model Performance** -- discrimination (AUC/C-statistic) with 95% CI
3. **Calibration** -- calibration plot, slope, intercept, calibration-in-the-large
4. **Clinical Utility** -- decision curve analysis, net benefit
5. **Model Comparison** -- comparison with existing models or simpler baselines
6. **Validation** -- internal and/or external validation performance

### Results Ordering: Generic ML

1. **Data Description** -- dataset size, class prevalence, feature statistics, missingness
2. **Model Performance** -- primary metric (AUC-ROC or other pre-specified) with 95% CI
3. **Secondary Metrics** -- sensitivity, specificity, PPV, NPV, F1, Brier score at specified threshold
4. **Model Comparison** -- performance against baseline model(s), statistical test (DeLong)
5. **Feature Importance** -- SHAP values or permutation importance, top N features
6. **Subgroup / Fairness Analysis** -- performance across demographic subgroups, fairness metrics

### Data Description

Report total N, N events, outcome prevalence or incidence rate, number of predictors, missingness summary, and split sizes. Reference the participant flow diagram or data description table.

### Model Performance -- Discrimination

Report AUC-ROC (or C-statistic for survival) with 95% CI derived from [bootstrap / cross-validation]. For multiple models, report in a comparison table.

### Model Performance -- Calibration

Report calibration plot (observed vs predicted, referenced as Figure X), calibration slope (ideal = 1), calibration intercept (ideal = 0), and calibration-in-the-large. Report Hosmer-Lemeshow test (if used) with caution about sensitivity to sample size.

### Clinical Utility

Report net benefit at clinically relevant threshold probabilities. Reference the decision curve plot (Figure X). State the range of thresholds over which the model provides net benefit compared with treat-all and treat-none strategies.

### Model Comparison

Report AUC difference with 95% CI and p-value (DeLong test or bootstrap comparison). State the baseline/comparator model clearly.

### Feature Importance

Report top N features by SHAP value (or other method). Reference the SHAP summary plot (Figure X). Avoid causal interpretation of feature importance.

### Threshold-Based Metrics

Report at the pre-specified threshold:
- Sensitivity (recall) with 95% CI
- Specificity with 95% CI
- PPV (precision) with 95% CI
- NPV with 95% CI
- F1 score
- Confusion matrix or 2x2 table

### Confidence Intervals

Bootstrap (>= 1000 iterations) or nested cross-validation. Report 95% CI for all primary metrics.

### Prose Style

- Write in full paragraphs, never bullet points in the final manuscript
- Past tense throughout
- Report performance on held-out test set, not training set
- Cross-reference all figures and tables inline
- Do not cite external references in the Results section
- UK English spelling

---

## Section 4 — Discussion Considerations

### Main Findings -- Opening Paragraph Template

> "The [model name/type] achieved an AUC-ROC of [X] (95% CI: [lower], [upper]) in the held-out test set, with sensitivity of [X]%, specificity of [X]%, and PPV of [X]% at the pre-specified threshold of [X]. This performance [exceeded / was similar to / did not significantly differ from] the [baseline/comparator model] (AUC difference [X]; p = [X])."

### Literature Comparison Framing

**Consistent:**
> "The observed AUC of [X] is comparable to [Author] et al., who reported [X] using [model type] in [population]..."

**Divergent:**
> "In contrast, [Author] et al. reported a higher AUC of [X], which may reflect differences in [sample size / feature set / population / outcome definition / data quality / temporal validation vs internal validation]..."

**Extending:**
> "The present study extends prior work by [novel contribution -- e.g., providing external validation / including calibration assessment / evaluating clinical utility via decision curve analysis / assessing algorithmic fairness]..."

### Typical Strengths

- Large sample size with adequate events per variable
- Rigorous internal validation (bootstrap optimism correction / nested cross-validation)
- External validation in an independent cohort
- Comprehensive performance reporting (discrimination, calibration, clinical utility)
- Decision curve analysis demonstrating net clinical benefit
- SHAP-based interpretability enhancing clinical trust
- Pre-specified analysis plan reducing overfitting risk
- Temporal validation reflecting real-world deployment conditions
- TRIPOD+AI adherence ensuring transparent reporting
- Code and data availability enabling reproducibility

### Typical Limitations

For each limitation, state: (1) the limitation precisely, (2) likely direction of bias, (3) impact on conclusions.

- **Overfitting:** "Despite [VALIDATION METHOD], overfitting cannot be fully excluded, particularly given [high-dimensional feature space / small EPV ratio]. Optimism-corrected estimates may still overstate true performance."
- **Single-centre / single-source data:** "Development and [internal] validation used data from a single centre; model performance may degrade when applied to populations with different case mix, coding practices, or healthcare systems."
- **Missing external validation:** "The absence of external validation limits confidence in the model's generalisability. Prospective validation in an independent cohort is required before clinical implementation."
- **Spectrum effect:** "The development cohort [had a higher/lower event rate than typical clinical populations], which may affect calibration and predictive values in other settings."
- **Feature availability:** "Some predictors (e.g., [FEATURES]) may not be routinely available in all clinical settings, limiting practical applicability."
- **Algorithmic fairness:** "Performance was not formally assessed across demographic subgroups; the model may exhibit differential accuracy that disproportionately affects [GROUPS]."
- **Temporal validity:** "The model was developed on data from [DATES]; temporal shifts in clinical practice, disease epidemiology, or coding standards may reduce performance over time (model drift)."
- **Black-box interpretability:** "Despite SHAP-based post-hoc explanations, the [MODEL TYPE] remains a black-box model whose internal decision process is not fully transparent to clinicians."

---

## Section 5 — Software Citations

**Python:**
> Van Rossum G, Drake FL. Python 3 Reference Manual. Scotts Valley, CA: CreateSpace. [Year].

**scikit-learn:**
> Pedregosa F, Varoquaux G, Gramfort A, et al. Scikit-learn: Machine learning in Python. *J Mach Learn Res*. 2011;12:2825-2830.

**XGBoost:**
> Chen T, Guestrin C. XGBoost: A Scalable Tree Boosting System. In: *Proceedings of the 22nd ACM SIGKDD International Conference on Knowledge Discovery and Data Mining*. 2016:785-794. doi:10.1145/2939672.2939785

**TensorFlow:**
> Abadi M, Barham P, Chen J, et al. TensorFlow: A System for Large-Scale Machine Learning. In: *Proceedings of the 12th USENIX Symposium on Operating Systems Design and Implementation (OSDI)*. 2016:265-283.

**PyTorch:**
> Paszke A, Gross S, Massa F, et al. PyTorch: An Imperative Style, High-Performance Deep Learning Library. In: *Advances in Neural Information Processing Systems 32*. 2019:8024-8035.

**R:**
> R Core Team. R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing, Vienna, Austria. [Year]. Available from: https://www.R-project.org/

**caret (R):**
> Kuhn M. Building Predictive Models in R Using the caret Package. *J Stat Softw*. 2008;28(5):1-26. doi:10.18637/jss.v028.i05

**tidymodels (R):**
> Kuhn M, Wickham H. Tidymodels: a collection of packages for modeling and machine learning using tidyverse principles. Available from: https://www.tidymodels.org/

**glmnet (R):**
> Friedman J, Hastie T, Tibshirani R. Regularization Paths for Generalized Linear Models via Coordinate Descent. *J Stat Softw*. 2010;33(1):1-22. doi:10.18637/jss.v033.i01

**SHAP:**
> Lundberg SM, Lee SI. A Unified Approach to Interpreting Model Predictions. In: *Advances in Neural Information Processing Systems 30*. 2017:4765-4774.

**dcurves (decision curve analysis, R):**
> Sjoberg DD. dcurves: Decision Curve Analysis. R package. Available from: https://CRAN.R-project.org/package=dcurves

**pROC (R, DeLong test):**
> Robin X, Turck N, Hainard A, et al. pROC: an open-source package for R and S+ to analyze and compare ROC curves. *BMC Bioinformatics*. 2011;12:77. doi:10.1186/1471-2105-12-77
