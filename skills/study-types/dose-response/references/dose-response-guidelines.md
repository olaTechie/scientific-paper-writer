# Dose-Response Meta-Analysis Methodological Guidelines

There is no dedicated reporting guideline for dose-response meta-analyses.
This reference file summarises the methodological standards derived from the
foundational literature that should be followed when writing dose-response
meta-analysis manuscripts.

---

## Foundational References

### Greenland and Longnecker (1992) --- GLS Trend Estimation

> Greenland S, Longnecker MP. Methods for trend estimation from summarized
> dose-response data, with applications to meta-analysis. *Am J Epidemiol*.
> 1992;135(11):1301-1309.

**Key principles:**
- Estimates a linear trend from category-specific relative risks
- Accounts for the correlation between log relative risks across categories
  sharing a common reference group
- Requires: dose assigned to each category, number of cases, person-years
  (or non-cases), and effect estimates with CIs
- The variance-covariance matrix of the log RRs is approximated from the
  marginal data using the method described in the appendix

### Berlin, Longnecker, and Greenland (1993) --- Meta-Analysis of Dose-Response Data

> Berlin JA, Longnecker MP, Greenland S. Meta-analysis of epidemiologic
> dose-response data. *Epidemiology*. 1993;4(3):218-228.

**Key principles:**
- Two-stage approach: estimate within-study trends, then pool across studies
- Fixed-effect and random-effects pooling of dose-response slopes
- Discussion of sources of heterogeneity in dose-response relationships

### Orsini, Bellocco, and Greenland (2006) --- Stata Implementation

> Orsini N, Bellocco R, Greenland S. Generalized least squares for trend
> estimation of summarized dose-response data. *Stata J*. 2006;6(1):40-57.

**Key principles:**
- Practical implementation of the Greenland-Longnecker method in Stata
- Handling of different reference categories across studies
- Treatment of open-ended exposure categories

### Orsini et al. (2012) --- Non-Linear Dose-Response

> Orsini N, Li R, Wolk A, Khudyakov P, Spiegelman D. Meta-analysis for
> linear and nonlinear dose-response relations: examples, an evaluation of
> approximations, and software. *Am J Epidemiol*. 2012;175(1):66-73.

**Key principles:**
- Extension to non-linear dose-response using restricted cubic splines
- Comparison of approximation methods for the covariance matrix
- Software implementation in Stata (glst, drmeta)

### Crippa and Orsini (2016) --- R Implementation

> Crippa A, Orsini N. Multivariate dose-response meta-analysis: the
> dosresmeta R package. *J Stat Softw (Code Snippets)*. 2016;72(1):1-15.

**Key principles:**
- R implementation of one-stage and two-stage dose-response meta-analysis
- Flexible specification of non-linear models (RCS, fractional polynomials,
  piecewise linear)
- Multivariate random-effects pooling of spline coefficients

---

## Methodological Checklist for Dose-Response Meta-Analyses

### Eligibility and Data Extraction

| Item | Description | Reported |
|------|-------------|----------|
| 1 | Studies report results for at least 3 quantified exposure categories | [ ] |
| 2 | Dose assigned to each category (midpoint, median, or mean) is stated | [ ] |
| 3 | Method for assigning dose to open-ended categories is described | [ ] |
| 4 | Number of cases and person-years (or non-cases) per category extracted | [ ] |
| 5 | Effect estimates with CIs per category extracted | [ ] |
| 6 | Reference category clearly identified for each study | [ ] |
| 7 | Most adjusted model selected; adjustment variables noted | [ ] |

### Dose-Response Modelling

| Item | Description | Reported |
|------|-------------|----------|
| 8 | GLS trend estimation method cited (Greenland & Longnecker 1992) | [ ] |
| 9 | Non-linear model specified (RCS, fractional polynomials, or other) | [ ] |
| 10 | Number and location of knots stated and justified | [ ] |
| 11 | Reference dose stated (e.g., zero, lowest category, population median) | [ ] |
| 12 | Non-linearity tested (LR test comparing spline vs linear model) | [ ] |
| 13 | Linear slope per unit also reported for comparability | [ ] |

### Pooling and Heterogeneity

| Item | Description | Reported |
|------|-------------|----------|
| 14 | Two-stage pooling method described (multivariate random-effects) | [ ] |
| 15 | Estimation method stated (method of moments, REML, ML) | [ ] |
| 16 | Heterogeneity quantified (multivariate Q, I-squared) | [ ] |
| 17 | Sources of heterogeneity explored (stratified analyses) | [ ] |

### Presentation

| Item | Description | Reported |
|------|-------------|----------|
| 18 | Dose-response curve plotted with 95% CI band | [ ] |
| 19 | Knot locations marked on the curve | [ ] |
| 20 | Reference dose clearly labelled | [ ] |
| 21 | Shape described in words (linear, J, U, threshold, plateau) | [ ] |
| 22 | Risk at specific policy-relevant doses reported | [ ] |

### Sensitivity Analyses

| Item | Description | Reported |
|------|-------------|----------|
| 23 | Alternative knot placements tested | [ ] |
| 24 | Alternative reference dose tested | [ ] |
| 25 | Influence analysis (leave-one-out) conducted | [ ] |
| 26 | Restriction to prospective studies tested (if applicable) | [ ] |
| 27 | Impact of open-ended category assumptions assessed | [ ] |

---

## Knot Placement Recommendations

| Number of Knots | Recommended Percentiles | Source |
|-----------------|------------------------|--------|
| 3 knots | 10th, 50th, 90th | Harrell (2015) |
| 4 knots | 5th, 35th, 65th, 95th | Harrell (2015) |
| 5 knots | 5th, 27.5th, 50th, 72.5th, 95th | Harrell (2015) |

The default recommendation is 3 knots. Use 4 or 5 knots only when the sample
size is large (>15 studies) and the exposure range is wide. Always conduct
sensitivity analyses with alternative knot placements.

---

## Open-Ended Category Conventions

| Category Type | Convention | Example |
|---------------|-----------|---------|
| Lowest open-ended (e.g., "<2") | Midpoint = lower bound / 2 | "<2" -> 1.0 |
| Highest open-ended (e.g., ">=5") | Midpoint = 1.5 x lower bound | ">=5" -> 7.5 |
| Stated median/mean available | Use reported value directly | Median = 6.3 -> 6.3 |

When the width of the open-ended category is uncertain, conduct sensitivity
analyses varying the assigned dose by +/-20% of the assumed midpoint.
