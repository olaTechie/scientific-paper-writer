---
name: dose-response
description: >
  Study-type module for dose-response meta-analyses. Provides section-by-section
  guidance for modelling non-linear exposure-outcome relationships using restricted
  cubic splines, Greenland and Longnecker trend estimation, and two-stage pooling.
  Follows PRISMA 2020 with dose-response-specific extensions.
version: 1.0.0
triggers:
  - dose-response meta-analysis
  - dose-response
  - exposure-response
  - non-linear meta-analysis
  - restricted cubic spline meta-analysis
  - Greenland Longnecker
---

# Dose-Response Meta-Analysis Study-Type Module

This module governs manuscript generation for dose-response meta-analyses. These
analyses estimate the shape of the relationship between a quantified exposure
(dose, duration, intake, biomarker level) and a health outcome across multiple
studies. Because no dedicated reporting guideline exists for dose-response
meta-analyses, this module follows PRISMA 2020 with dose-response-specific
extensions drawn from the foundational methodological literature.

---

## Section 1 --- Reporting Guideline

### PRISMA 2020 with Dose-Response Extensions

There is no dedicated PRISMA extension for dose-response meta-analyses. The
manuscript should follow the standard PRISMA 2020 statement:

> Page MJ, McKenzie JE, Bossuyt PM, et al. The PRISMA 2020 statement: an
> updated guideline for reporting systematic reviews. *BMJ*. 2021;372:n71.

Supplemented with methodological standards from the foundational dose-response
meta-analysis literature:

> Berlin JA, Longnecker MP, Greenland S. Meta-analysis of epidemiologic
> dose-response data. *Epidemiology*. 1993;4(3):218-228.

> Greenland S, Longnecker MP. Methods for trend estimation from summarized
> dose-response data, with applications to meta-analysis. *Am J Epidemiol*.
> 1992;135(11):1301-1309.

> Orsini N, Bellocco R, Greenland S. Generalized least squares for trend
> estimation of summarized dose-response data. *Stata J*. 2006;6(1):40-57.

When citing the approach in the Methods section, use the following phrasing:

> "This systematic review and dose-response meta-analysis was conducted and
> reported in accordance with PRISMA 2020 (Page et al., BMJ 2021;372:n71),
> with dose-response modelling following the methods of Greenland and
> Longnecker (Am J Epidemiol 1992;135:1301-1309) and Orsini et al.
> (Stata J 2006;6:40-57)."

See `references/dose-response-guidelines.md` for a summary of the
methodological standards.

---

## Section 2 --- Methods Subsections

### 2.1 Protocol and Registration

State the prospective registration. Template sentences:

> "The protocol for this systematic review and dose-response meta-analysis
> was registered prospectively with PROSPERO (registration number
> CRD42XXXXXXX). The protocol specified the eligibility criteria, the
> dose-response modelling strategy including the choice of spline model, and
> the pre-specified sensitivity analyses."

### 2.2 Eligibility Criteria

Specify that eligible studies must report results for at least three
quantified exposure categories. Template sentences:

> "Studies were eligible if they reported risk estimates (odds ratios, relative
> risks, or hazard ratios) with 95% confidence intervals for at least three
> quantified categories of [exposure] in relation to [outcome]. The
> requirement for three or more categories was necessary to estimate the
> dose-response trend using the generalised least-squares method of Greenland
> and Longnecker."

> "Studies reporting only dichotomous exposure (exposed vs unexposed) or
> continuous exposure without category-specific estimates were excluded.
> Case reports, ecological studies, and cross-sectional studies were excluded.
> Both cohort studies and case-control studies reporting adjusted estimates
> were eligible."

### 2.3 Information Sources

List all databases and supplementary sources. Template sentences:

> "A systematic search was conducted across MEDLINE (via PubMed), Embase (via
> Elsevier), and Web of Science from inception to [date]. Reference lists of
> included studies and published dose-response meta-analyses on [topic] were
> hand-searched. The full search strategy is provided in the Supplementary
> Materials (eTable 1)."

### 2.4 Data Extraction

Describe the specific data required for dose-response modelling. Template
sentences:

> "For each study, the following data were extracted from each exposure
> category: the assigned dose level (or midpoint of the category range), the
> number of cases and non-cases (or person-years of follow-up for cohort
> studies), the effect estimate (OR, RR, or HR) with its 95% confidence
> interval, and the reference category used. For studies reporting open-ended
> upper categories (e.g., '>5 servings/day'), the upper boundary was estimated
> as 1.5 times the lower boundary of that category."

> "Two reviewers independently extracted all dose-response data. The most
> fully adjusted model was selected from each study. When multiple exposure
> definitions were reported, the definition most consistent across studies
> was prioritised."

### 2.5 Dose Assignment

Describe the midpoint calculation and any transformations. Template sentences:

> "A two-stage dose-response meta-analysis was conducted using restricted
> cubic splines with [N] knots placed at the [Xth, Yth, Zth] percentiles
> of the exposure distribution. For each exposure category, the midpoint of
> the reported range was assigned as the representative dose. When only the
> median or mean within a category was reported, that value was used directly.
> For open-ended lowest categories, the midpoint was set at half the upper
> boundary; for open-ended highest categories, the midpoint was set at 1.5
> times the lower boundary."

> "The reference dose was set at the lowest exposure category (or zero intake
> for dietary exposures). Sensitivity analyses varied the reference dose and
> the method for assigning open-ended category midpoints."

### 2.6 Statistical Methods

Describe the GLS trend estimation, spline modelling, non-linearity testing,
and pooling. Template sentences:

**GLS trend estimation:**

> "Within each study, the dose-response trend was estimated using generalised
> least-squares (GLS) regression, which accounts for the correlation between
> log relative risks across exposure categories sharing a common reference
> group (Greenland and Longnecker, Am J Epidemiol 1992). The method requires
> the number of cases and person-years (or non-cases) in each exposure
> category to reconstruct the variance-covariance matrix of the log relative
> risks."

**Restricted cubic spline modelling:**

> "The shape of the dose-response relationship was modelled using restricted
> cubic splines (RCS) with three knots placed at the 10th, 50th, and 90th
> percentiles of the overall exposure distribution, following the
> recommendation of Harrell (Regression Modeling Strategies, 2015). This
> approach allows flexible non-linear modelling while constraining the curve
> to be linear in the tails."

> "A linear dose-response model was also fitted for comparison. Non-linearity
> was assessed by comparing the spline model with the linear model using a
> likelihood ratio (LR) test; a p-value < 0.05 was considered evidence of
> non-linearity."

**Two-stage pooling:**

> "In the first stage, study-specific dose-response coefficients (spline
> regression coefficients) were estimated using GLS regression. In the second
> stage, the study-specific coefficients were combined using multivariate
> random-effects meta-analysis (method of moments or restricted maximum
> likelihood). The pooled dose-response curve with 95% confidence intervals
> was then reconstructed from the combined coefficients."

**Heterogeneity:**

> "Between-study heterogeneity in the dose-response coefficients was assessed
> using the multivariate Cochran Q statistic and the I-squared statistic.
> Sources of heterogeneity were explored through stratified analyses by study
> design (cohort vs case-control), geographical region, sex, and adjustment
> for key confounders."

**Sensitivity analyses:**

> "Pre-specified sensitivity analyses included: (i) varying the number and
> location of knots (4 knots at 5th, 35th, 65th, 95th percentiles; 5 knots
> at equally spaced percentiles); (ii) varying the reference dose (median
> category vs lowest category); (iii) exclusion of studies rated at high risk
> of bias; (iv) restriction to prospective cohort studies; and (v) influence
> analysis excluding one study at a time."

---

## Section 3 --- Results Conventions

Results for dose-response meta-analyses are reported in the following
canonical order:

1. **Study selection** --- Present the PRISMA flow diagram. State the number
   of studies and the total number of participants or cases. Summarise the
   range of exposure levels across studies.

2. **Dose-response curve** --- Present the pooled dose-response curve with the
   95% confidence interval band, plotted on the x-axis (exposure dose) and
   y-axis (relative risk on a log scale). Include tick marks at the knot
   locations. Label the reference dose clearly.

3. **Shape characterisation** --- Describe the shape of the curve in plain
   language: linear, J-shaped, U-shaped, inverse U-shaped, threshold, plateau,
   or monotonically increasing/decreasing. State whether the curve suggests a
   threshold below which no association exists, or a plateau above which
   additional exposure confers no further risk.

4. **Risk at specific doses** --- Report the pooled relative risk (with 95% CI)
   at clinically or policy-relevant dose levels. For example: "Compared with
   zero intake, the pooled RR at 2 servings/day was 0.85 (95% CI 0.78 to 0.93)
   and at 5 servings/day was 0.76 (95% CI 0.66 to 0.88)."

5. **Non-linearity test** --- Report the p-value from the likelihood ratio
   test comparing the spline model with the linear model. State whether the
   evidence supports a non-linear relationship.

6. **Linear slope** --- Report the pooled linear slope per unit increase in
   exposure (e.g., per serving/day, per 10 g/day, per unit increase) with
   95% CI, even when the non-linear model is preferred, to allow comparison
   with other published estimates.

7. **Heterogeneity** --- Report tau-squared and I-squared for the
   dose-response coefficients. Present results of stratified analyses to
   explain heterogeneity.

8. **Sensitivity analyses** --- Report results with alternative knot
   placements and reference doses. State whether the shape was robust.

---

## Section 4 --- Discussion Considerations

### Paragraph Template

**Paragraph 1 --- Shape of the dose-response relationship:**
Restate the main finding regarding the shape (linear, non-linear, threshold,
plateau). Discuss the biological plausibility of the observed shape. For
example, a J-shaped curve may reflect beneficial effects at moderate doses
and harmful effects at high doses.

**Paragraph 2 --- Biological plausibility:**
Provide mechanistic explanations for the observed dose-response shape. Draw
on physiological, pharmacological, or toxicological evidence. Phrase as
possibility: "The plateau observed above [dose] may reflect saturation of
[biological mechanism]."

**Paragraph 3 --- Exposure categorisation limitations:**
Discuss the inherent limitations of analysing categorical exposure data. Note
that category boundaries vary across studies, that within-category exposure
is assumed homogeneous (midpoint assumption), and that open-ended categories
require assumptions about the representative dose. Discuss the potential
impact of exposure measurement error on the shape of the curve.

**Paragraph 4 --- Comparison with previous dose-response analyses:**
Compare the observed shape and magnitude with previously published
dose-response meta-analyses. Note whether the present analysis confirms,
refines, or contradicts prior findings. Discuss methodological differences
(number of knots, reference dose, inclusion criteria) that may explain
discrepancies.

**Paragraph 5 --- Extrapolation caution:**
Caution against extrapolating the dose-response curve beyond the range of
observed data. State the range of exposure levels represented in the
included studies. Note that the curve is constrained to be linear in the
tails (beyond the extreme knots) and that this constraint may not reflect
the true relationship at extreme doses.

### Typical Strengths

- Flexible non-linear modelling using restricted cubic splines
- Formal test for non-linearity
- Two-stage pooling accounting for between-study heterogeneity
- Pre-specified sensitivity analyses with alternative knot placements
- Correlated data structure properly handled via GLS estimation

### Typical Limitations

- Midpoint assumption for dose assignment (direction of bias: uncertain;
  misclassification likely attenuates the dose-response slope)
- Open-ended category boundaries requiring arbitrary assumptions
- Reliance on published categorical data rather than individual-level
  exposure measurements
- Inability to account for within-category variability in exposure
- Potential residual confounding in observational studies
- Extrapolation beyond the observed data range is unreliable

---

## Section 5 --- Software Citations

### dosresmeta (R)

> Crippa A, Orsini N. Multivariate dose-response meta-analysis: the
> dosresmeta R package. *J Stat Softw (Code Snippets)*. 2016;72(1):1-15.

> Crippa A, Orsini N. dosresmeta: Performing Multivariate Dose-Response
> Meta-Analysis. R package version [X.X]. Available from:
> https://CRAN.R-project.org/package=dosresmeta

### mvmeta (R)

> Gasparrini A, Armstrong B, Kenward MG. Multivariate meta-analysis for
> non-linear and other multi-parameter associations. *Stat Med*.
> 2012;31(29):3821-3839.

> Gasparrini A. mvmeta: Multivariate and Univariate Meta-Analysis and
> Meta-Regression. R package version [X.X]. Available from:
> https://CRAN.R-project.org/package=mvmeta

### drmeta (Stata)

> Orsini N, Li R, Wolk A, Khudyakov P, Spiegelman D. Meta-analysis for
> linear and nonlinear dose-response relations: examples, an evaluation of
> approximations, and software. *Am J Epidemiol*. 2012;175(1):66-73.

> Orsini N, Bellocco R, Greenland S. Generalized least squares for trend
> estimation of summarized dose-response data. *Stata J*. 2006;6(1):40-57.

### rms (R)

> Harrell FE. rms: Regression Modeling Strategies. R package version [X.X].
> Available from: https://CRAN.R-project.org/package=rms

> Harrell FE. *Regression Modeling Strategies: With Applications to Linear
> Models, Logistic and Ordinal Regression, and Survival Analysis*. 2nd ed.
> New York: Springer; 2015.

Used for restricted cubic spline specification and knot placement.

### Additional Software

When reporting the analysis, always cite the specific R or Stata version.
Example:

> "All analyses were performed in R (version [X.X]; R Foundation for
> Statistical Computing, Vienna, Austria) using the dosresmeta package
> (version [X.X]) for dose-response modelling and the mvmeta package
> (version [X.X]) for multivariate random-effects pooling."
