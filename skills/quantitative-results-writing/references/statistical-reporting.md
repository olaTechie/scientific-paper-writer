# Statistical Reporting Reference

## Systematic Review / Meta-Analysis Checklist

### Study Selection
- [ ] Total records identified (by database)
- [ ] Records after deduplication
- [ ] Records screened (title/abstract)
- [ ] Full-texts assessed for eligibility
- [ ] Studies included in synthesis
- [ ] Reasons for exclusion (for full-text exclusions)

### Study Characteristics Table
Required columns: First author, Year, Country, Design, Population (N), Exposure/Intervention, Comparator, Outcome definition, Follow-up duration, Confounders adjusted

### Risk of Bias (PRISMA 2020 / Cochrane standards)
- For RCTs: RoB 2 domains (randomisation, deviations, missing data, outcome measurement, selection of results)
- For observational: ROBINS-I domains (confounding, participant selection, classification of interventions, deviations, missing data, outcome measurement, selection of results)
- Report: domain-level judgement + overall judgement for each study
- Summarise: overall distribution of RoB ratings across included studies

### Primary Meta-Analysis
Required elements:
1. Number of studies (k) and participants (N)
2. Model: fixed vs random effects; estimator (REML, DL, PM, etc.)
3. Variance adjustment: HKSJ, knapp-hartung, or none — state which
4. Pooled point estimate + 95% CI
5. Q statistic (df, p-value)
6. I² (with 95% CI)
7. τ² (with 95% CI via profile likelihood if available)
8. 95% Prediction interval
9. Visual: forest plot referenced as (Figure X)

### Three-Level / Multilevel Meta-Analysis
Additional elements:
- σ²_between (between-cluster variance) + I²_between
- σ²_within (within-cluster variance) + I²_within
- Profile likelihood CIs for variance components
- Structure justification (why three-level was used)

### Meta-Regression
Required elements:
- Moderator variable(s) and coding
- Slope coefficient + SE + 95% CI + p-value
- Intercept + SE + 95% CI + p-value
- R² analogue (% variance explained)
- Residual heterogeneity after moderator

## RCT Reporting Checklist

### CONSORT Flow
- Randomised (N)
- Allocated to intervention (N received / N did not receive)
- Lost to follow-up (N, reasons)
- Discontinued (N, reasons)
- Analysed ITT (N)
- Analysed per-protocol (N)

### Baseline Characteristics
- Report by group (intervention vs control)
- Include: age (mean ± SD or median [IQR]), sex, ethnicity, key clinical variables
- Do NOT test for balance (p-values for baseline characteristics are deprecated — report standardised mean differences instead)

### Primary Outcome
- Effect estimate (RR, OR, HR, MD, SMD) + 95% CI + p-value
- Absolute risk in each group (events/N, %)
- Absolute risk difference + 95% CI + NNT (if appropriate)

## Cohort / Observational Reporting Checklist

### Exposure Definition
- How exposure was defined and measured
- Time reference point (index date, first exposure, etc.)

### Confounders
- List all variables included in the adjusted model
- State selection approach (a priori, DAG-based, stepwise)
- Report crude and adjusted estimates side by side

### Effect Estimates
- Report HR (time-to-event), OR (binary outcome), RR (cohort), MD (continuous)
- Always report adjusted as primary, crude as secondary
- For propensity scores: report SMD before and after

## Machine Learning Reporting Checklist

### Data Split
- N training / N validation / N test (or k-fold CV details)
- Class prevalence in each split
- Any oversampling or undersampling used

### Performance Metrics
Primary metric (pre-specified): AUC-ROC or other
Required secondary metrics:
- Sensitivity (recall) at specified threshold
- Specificity at specified threshold
- PPV (precision) at specified threshold
- NPV at specified threshold
- F1 score
- Calibration: Brier score + calibration plot

### Comparison
- Baseline model (e.g., logistic regression, clinical score)
- Statistical test of difference (e.g., DeLong test for AUC comparison)

### Confidence Intervals
- Bootstrap (1000 iterations minimum) or nested CV
- Report 95% CI for all primary metrics

## P-value Reporting Standards

Do NOT: p < 0.05, p = NS, p = 0.000
DO: p = 0.061, p = 0.91, p < 0.001 (only when truly < 0.001)
Format in JAMA journals: italicised P with capital letter (*P* = .061, not p = 0.061)
Format in most other journals: lowercase p (p = 0.061)
