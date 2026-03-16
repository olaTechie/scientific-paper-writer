# Bayesian Meta-Analysis Reporting Checklist

This checklist summarises the reporting items specific to Bayesian meta-analyses,
supplementing the standard PRISMA 2020 checklist. It draws on recommendations
from Rover (J Stat Softw 2020), Rover et al. (Res Synth Methods 2021), and
general Bayesian reporting standards.

---

## Prior Specification

| Item | Description | Reported |
|------|-------------|----------|
| 1 | Prior distribution for the overall treatment effect (mu) stated with parameters | [ ] |
| 2 | Prior distribution for the between-study heterogeneity (tau) stated with parameters | [ ] |
| 3 | Justification for prior choices provided (empirical, weakly informative, diffuse) | [ ] |
| 4 | Reference to empirical prior distributions cited (e.g., Turner et al. 2012, 2015) | [ ] |
| 5 | Prior distributions for any additional parameters (e.g., meta-regression coefficients) stated | [ ] |

## Prior Sensitivity Analysis

| Item | Description | Reported |
|------|-------------|----------|
| 6 | At least 3 alternative priors for tau specified and analysed | [ ] |
| 7 | At least 1 alternative prior for mu specified and analysed | [ ] |
| 8 | Results compared across all prior specifications in a table | [ ] |
| 9 | Impact of prior choice on conclusions explicitly discussed | [ ] |

## MCMC Implementation (if applicable)

| Item | Description | Reported |
|------|-------------|----------|
| 10 | Software and version stated (JAGS, Stan, OpenBUGS, etc.) | [ ] |
| 11 | Number of chains stated | [ ] |
| 12 | Number of iterations per chain stated | [ ] |
| 13 | Burn-in (warm-up) period stated | [ ] |
| 14 | Thinning factor stated (if used) | [ ] |
| 15 | Total number of posterior samples for inference stated | [ ] |

## Convergence Assessment

| Item | Description | Reported |
|------|-------------|----------|
| 16 | R-hat (potential scale reduction factor) reported for all parameters | [ ] |
| 17 | R-hat threshold stated (recommended: < 1.01) | [ ] |
| 18 | Effective sample size (ESS) reported for key parameters | [ ] |
| 19 | ESS threshold stated (recommended: > 400) | [ ] |
| 20 | Trace plots and/or density plots available (in supplement if not main text) | [ ] |

## Posterior Summaries

| Item | Description | Reported |
|------|-------------|----------|
| 21 | Point estimate reported as posterior median or mean (state which) | [ ] |
| 22 | 95% credible interval (CrI) reported --- NOT confidence interval (CI) | [ ] |
| 23 | Posterior probability of meaningful effect reported (e.g., P(OR < 1)) | [ ] |
| 24 | Posterior distribution of tau reported (median + 95% CrI) | [ ] |
| 25 | 95% prediction interval reported | [ ] |

## Model Comparison

| Item | Description | Reported |
|------|-------------|----------|
| 26 | Information criterion reported (DIC, WAIC, or LOO-CV) | [ ] |
| 27 | Random-effects vs common-effect model compared | [ ] |
| 28 | Interpretation of model comparison stated | [ ] |

## Forest Plot

| Item | Description | Reported |
|------|-------------|----------|
| 29 | Bayesian forest plot presented | [ ] |
| 30 | Observed (frequentist) study estimates shown alongside posterior (shrunken) estimates | [ ] |
| 31 | Pooled posterior estimate with CrI displayed | [ ] |
| 32 | Prediction interval displayed on forest plot | [ ] |

## Terminology

| Item | Description | Reported |
|------|-------------|----------|
| 33 | "Credible interval" (CrI) used consistently, never "confidence interval" (CI), for Bayesian results | [ ] |
| 34 | "Posterior probability" used, not "p-value", for probability statements | [ ] |
| 35 | "Between-study standard deviation" (tau) or "heterogeneity" used consistently | [ ] |

---

## Common Prior Distributions for Reference

### Priors for the Treatment Effect (mu)

| Prior | Notation | Use Case |
|-------|----------|----------|
| Vague normal | N(0, 10^2) or N(0, 100^2) | Default; minimal prior information |
| Weakly informative | N(0, 1^2) | When effect is expected to be modest on log OR scale |
| Sceptical | N(0, 0.5^2) | When large effects are implausible |

### Priors for Between-Study Heterogeneity (tau)

| Prior | Notation | Use Case |
|-------|----------|----------|
| Half-normal | HN(0, 0.5) | Weakly informative; recommended default |
| Half-Cauchy | HC(0, 0.5) | Allows heavier tails than half-normal |
| Uniform | U(0, 2) | Diffuse; less informative |
| Inverse-gamma | IG(0.001, 0.001) | Traditional but problematic (informative near zero) |
| Empirical (Turner) | Outcome-specific | Informative; based on Cochrane meta-analyses |
| Point mass at 0 | tau = 0 | Common-effect model (no heterogeneity) |

### Priors to Avoid

| Prior | Problem |
|-------|---------|
| IG(0.001, 0.001) on tau^2 | Concentrates mass near zero and infinity; sensitive to parameterisation |
| U(0, 100) on tau | Excessively wide; wastes MCMC samples on implausible values |
| Improper flat prior on tau | May not lead to proper posterior with few studies |

---

## Empirical Prior Distributions (Turner et al.)

Reference: Turner RM, Jackson D, Wei Y, Thompson SG, Higgins JPT. Predictive
distributions for between-study heterogeneity and simple methods for their
application in Bayesian meta-analysis. *Stat Med*. 2015;34(6):984-998.

The Turner et al. empirical priors provide log-normal distributions for tau
based on the outcome type and intervention comparison type:

| Outcome Type | Intervention Comparison | Prior for log(tau): Mean (SD) |
|-------------|------------------------|-------------------------------|
| All-cause mortality | Pharmacological vs control | -2.56 (1.74) |
| All-cause mortality | Pharmacological vs pharmacological | -2.34 (1.58) |
| Semi-objective outcome | Pharmacological vs control | -1.97 (1.58) |
| Semi-objective outcome | Pharmacological vs pharmacological | -1.75 (1.42) |
| Subjective outcome | Pharmacological vs control | -1.41 (1.44) |
| Subjective outcome | Pharmacological vs pharmacological | -1.19 (1.28) |

These priors are recommended when the number of studies is small (k < 5) and
the outcome type matches one of the categories above.

---

## Usage Notes

- This checklist should be included as a supplementary table in the submission
- Replace [ ] with [x] for items that are reported
- Items related to MCMC (10-15) may not apply if using bayesmeta (which
  computes posteriors analytically)
- Always conduct and report prior sensitivity analyses; reviewers and editors
  expect this for Bayesian work
- The key terminological distinction is CrI (credible interval, Bayesian)
  versus CI (confidence interval, frequentist); mixing these is a common
  and serious error
