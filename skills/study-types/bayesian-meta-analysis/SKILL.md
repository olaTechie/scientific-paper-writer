---
name: bayesian-meta-analysis
description: >
  Study-type module for Bayesian meta-analyses. Provides section-by-section
  guidance for specifying priors, reporting posterior summaries, assessing
  convergence, conducting prior sensitivity analyses, and interpreting credible
  intervals and posterior probabilities. Follows PRISMA 2020 with Bayesian
  reporting extensions.
version: 1.0.0
triggers:
  - Bayesian meta-analysis
  - Bayesian random-effects
  - Bayesian evidence synthesis
  - informative prior meta-analysis
  - MCMC meta-analysis
  - posterior probability meta-analysis
  - credible interval
---

# Bayesian Meta-Analysis Study-Type Module

This module governs manuscript generation for Bayesian meta-analyses. It
supplements the core engine and section-specific skills with Bayesian-specific
reporting requirements. Bayesian meta-analysis offers advantages including
natural incorporation of prior information, direct probability statements about
treatment effects, posterior predictive distributions, and more principled
handling of between-study heterogeneity, particularly when the number of
studies is small.

---

## Section 1 --- Reporting Guideline

### PRISMA 2020 with Bayesian Extensions

There is no dedicated PRISMA extension for Bayesian meta-analyses. The
manuscript should follow the standard PRISMA 2020 statement:

> Page MJ, McKenzie JE, Bossuyt PM, et al. The PRISMA 2020 statement: an
> updated guideline for reporting systematic reviews. *BMJ*. 2021;372:n71.

Supplemented with Bayesian-specific reporting guidance from:

> Rover C. Bayesian random-effects meta-analysis using the bayesmeta R
> package. *J Stat Softw*. 2020;93(6):1-51.

> Rover C, Bender R, Dias S, et al. On weakly informative prior
> distributions for the heterogeneity parameter in Bayesian random-effects
> meta-analysis. *Res Synth Methods*. 2021;12(4):448-474.

> Turner RM, Jackson D, Wei Y, Thompson SG, Higgins JPT. Predictive
> distributions for between-study heterogeneity and simple methods for their
> application in Bayesian meta-analysis. *Stat Med*. 2015;34(6):984-998.

When citing the approach in the Methods section, use the following phrasing:

> "This systematic review and Bayesian meta-analysis was conducted and
> reported in accordance with PRISMA 2020 (Page et al., BMJ 2021;372:n71),
> with Bayesian-specific reporting following the recommendations of Rover
> (J Stat Softw 2020;93:1-51) and Rover et al. (Res Synth Methods
> 2021;12:448-474)."

See `references/bayesian-reporting.md` for a detailed reporting checklist.

---

## Section 2 --- Methods Subsections

### 2.1 Protocol and Registration

State the prospective registration, noting that the Bayesian analytical
framework was pre-specified. Template sentences:

> "The protocol for this systematic review and Bayesian meta-analysis was
> registered prospectively with PROSPERO (registration number CRD42XXXXXXX).
> The protocol specified the use of a Bayesian random-effects model, the
> choice of prior distributions for the treatment effect and between-study
> heterogeneity, and the planned prior sensitivity analyses."

### 2.2 Eligibility Criteria

Standard PICO eligibility criteria apply. Template sentences:

> "Studies were eligible if they were [study design] comparing [intervention]
> with [comparator] in [population], reporting [outcome] with a minimum
> follow-up of [N] months. Both published and unpublished studies meeting
> these criteria were eligible."

### 2.3 Information Sources and Search Strategy

Standard systematic search methods apply. Template sentences:

> "A systematic search was conducted across MEDLINE (via PubMed), Embase (via
> Elsevier), and the Cochrane Central Register of Controlled Trials (CENTRAL)
> from inception to [date]. The full search strategy is provided in the
> Supplementary Materials (eTable 1)."

### 2.4 Study Selection

Standard dual-reviewer screening process. Template sentences:

> "Two reviewers independently screened titles and abstracts, followed by
> full-text assessment against the eligibility criteria. Disagreements were
> resolved by consensus or consultation with a third reviewer."

### 2.5 Data Extraction

Standard extraction with emphasis on the data needed for the likelihood
function. Template sentences:

> "Data were extracted independently by two reviewers using a standardised
> form. For each study, the treatment effect estimate (log odds ratio, log
> risk ratio, or mean difference), its standard error, and the sample sizes
> in each arm were recorded. For dichotomous outcomes, the number of events
> and total participants in each arm were extracted to allow exact binomial
> likelihood specification where appropriate."

### 2.6 Risk of Bias

Standard risk-of-bias assessment. Template sentences:

> "Risk of bias was assessed independently by two reviewers using [RoB 2 /
> ROBINS-I / NOS]. The impact of risk of bias on the pooled estimate was
> explored through sensitivity analyses excluding studies at high risk of
> bias and through informative prior distributions that down-weight
> high-risk-of-bias studies."

### 2.7 Effect Measures

Specify the effect measure and the scale on which the analysis is conducted.
Template sentences:

> "The primary effect measure was the odds ratio (OR), analysed on the log
> scale. The posterior distribution of the log OR was back-transformed to the
> OR scale for reporting. For continuous outcomes, the mean difference (MD)
> or standardised mean difference (SMD) was used."

### 2.8 Bayesian Statistical Methods

This is the central subsection for a Bayesian meta-analysis. It must cover
the model, priors, MCMC implementation, convergence assessment, model
comparison, posterior summaries, and prediction.

**Model specification:**

> "A Bayesian normal-normal hierarchical model (NNHM) was used. The
> observed study-specific treatment effect y_i was assumed normally
> distributed around the true study-specific effect theta_i with known
> within-study variance sigma_i-squared. The true study-specific effects
> theta_i were assumed exchangeable, drawn from a normal distribution with
> overall mean mu (the pooled treatment effect) and between-study standard
> deviation tau (the heterogeneity parameter)."

**Prior distributions:**

> "A weakly informative half-normal prior (HN(0, 0.5)) was placed on the
> between-study standard deviation tau, based on empirical prior distributions
> for [outcome type] (Turner et al., Stat Med 2012). This prior assigns
> approximately 95% of the prior mass to values of tau below 1.0 on the log
> OR scale, reflecting the belief that extreme heterogeneity is unlikely for
> this outcome type. A vague normal prior N(0, 10-squared) was placed on the
> overall treatment effect mu, reflecting minimal prior information about the
> direction or magnitude of the treatment effect."

> "The choice of tau prior was justified by empirical distributions of
> between-study heterogeneity reported by Turner et al. (Stat Med
> 2012;31:3805-3820), who catalogued heterogeneity values across thousands
> of Cochrane meta-analyses by outcome type and intervention comparison."

**Prior sensitivity:**

> "Sensitivity of the posterior to the choice of prior was assessed by
> repeating the analysis with the following alternative priors for tau:
> (i) a half-Cauchy prior HC(0, 0.5) allowing heavier tails; (ii) a uniform
> prior U(0, 2) as a diffuse alternative; (iii) the empirical informative
> prior from Turner et al. specific to [outcome category]; and (iv) a fixed
> tau = 0 model (common-effect). For the treatment effect mu, sensitivity
> was assessed using N(0, 100-squared) as a more diffuse alternative."

**MCMC implementation:**

> "Posterior distributions were estimated using Markov chain Monte Carlo
> (MCMC) sampling implemented in [Stan / JAGS / bayesmeta]. [For MCMC
> samplers:] Four chains were run in parallel, each with [N] iterations
> after a burn-in (warm-up) period of [N] iterations. Every [N]th sample
> was retained (thinning factor of [N]), yielding a total of [N] posterior
> samples for inference. [For bayesmeta:] The bayesmeta package computes the
> posterior analytically without MCMC sampling, yielding exact posterior
> distributions."

**Convergence assessment:**

> "Convergence was assessed using the potential scale reduction factor
> (R-hat), which was required to be below 1.01 for all parameters. The
> effective sample size (ESS) was required to exceed 400 for all parameters
> of interest. Visual inspection of trace plots (caterpillar plots) and
> posterior density plots was performed to confirm adequate mixing and
> unimodality."

**Model comparison:**

> "The deviance information criterion (DIC) [or the widely applicable
> information criterion (WAIC) or leave-one-out cross-validation (LOO-CV)]
> was used to compare the random-effects model with a common-effect model.
> A difference of more than 3 in DIC was considered meaningful."

**Posterior summaries:**

> "The pooled treatment effect was summarised using the posterior median
> [or mean] and 95% credible interval (CrI). The posterior probability of a
> clinically meaningful effect was computed as P(OR < 1) [or P(mu > delta),
> where delta is the minimum clinically important difference]. The between-
> study heterogeneity was summarised using the posterior median of tau with
> its 95% CrI."

**Prediction:**

> "A 95% prediction interval was derived from the posterior predictive
> distribution to characterise the expected treatment effect in a new study
> drawn from the same population of studies. This interval reflects both
> the uncertainty in the pooled estimate and the between-study
> heterogeneity."

---

## Section 3 --- Results Conventions

Results for Bayesian meta-analyses are reported in the following canonical
order. Note the critical distinction between credible intervals (CrI, Bayesian)
and confidence intervals (CI, frequentist); never use CI for Bayesian results.

1. **Convergence statement** --- Before presenting any results, state that
   convergence was achieved. Example: "All MCMC chains converged (R-hat < 1.01
   for all parameters; minimum ESS = [N])."

2. **Posterior summary for treatment effect** --- Report the posterior
   median (or mean) with 95% CrI. Example: "The posterior median OR was 0.72
   (95% CrI 0.54 to 0.95)." Note: always use "CrI" not "CI".

3. **Posterior probability** --- Report the posterior probability of a
   meaningful effect. Example: "The posterior probability that [intervention]
   reduces the odds of [outcome] was P(OR < 1) = 0.987." This is the key
   advantage of Bayesian analysis: direct probability statements.

4. **Heterogeneity posterior** --- Report the posterior median of tau with
   95% CrI. Example: "The posterior median of the between-study standard
   deviation was tau = 0.23 (95% CrI 0.02 to 0.61)."

5. **Prediction interval** --- Report the 95% prediction interval. Example:
   "The 95% prediction interval for the treatment effect in a new study was
   OR 0.38 to 1.36, indicating that the effect may not be beneficial in all
   settings."

6. **Prior sensitivity table** --- Present a table comparing the posterior
   median, 95% CrI, and P(meaningful effect) across all prior specifications.
   Columns: Prior for tau, Posterior median mu, 95% CrI, P(OR<1), Posterior
   median tau, 95% CrI for tau.

7. **Forest plot with shrinkage** --- Present a Bayesian forest plot showing
   the observed study-specific estimates alongside the posterior (shrunken)
   estimates. Shrinkage towards the pooled estimate is a key feature of
   Bayesian hierarchical models and should be visible in the plot.

8. **Study selection and characteristics** --- Present the PRISMA flow diagram
   and study characteristics table as in any systematic review.

---

## Section 4 --- Discussion Considerations

### Paragraph Template

**Paragraph 1 --- Main findings with probability interpretation:**
Restate the pooled estimate with its CrI and the posterior probability of a
meaningful effect. Emphasise the direct probability interpretation: "There is
a [X]% posterior probability that [intervention] reduces [outcome]." This
language is more intuitive than frequentist p-values and should be highlighted
as an advantage.

**Paragraph 2 --- Prior influence and sensitivity:**
Discuss the extent to which the posterior was influenced by the choice of
prior. If the posterior was robust across all prior specifications (similar
medians and CrIs), state this as a strength. If the posterior was sensitive
to the tau prior (common when the number of studies is small), discuss which
prior is most defensible and why. Reference the empirical prior distributions
of Turner et al. if used.

**Paragraph 3 --- Advantages over frequentist meta-analysis:**
Discuss the specific advantages of the Bayesian approach in the context of
the present analysis:
- Direct probability statements (posterior probability of effect)
- More appropriate handling of between-study heterogeneity when the number
  of studies is small (frequentist REML estimates of tau can be unstable)
- Incorporation of external evidence through informative priors
- Shrinkage of outlying study estimates towards the pooled mean
- Prediction intervals derived naturally from the posterior predictive
  distribution

**Paragraph 4 --- Limitations of the Bayesian approach:**
Acknowledge potential criticisms:
- Subjectivity in prior selection (mitigated by sensitivity analysis)
- Computational complexity (mitigated by modern software)
- Unfamiliarity of some readers with Bayesian terminology
- When the number of studies is large, Bayesian and frequentist results
  typically converge, reducing the added value of the Bayesian approach

**Paragraph 5 --- Comparison with frequentist results:**
If a frequentist analysis was also conducted (recommended as a sensitivity
analysis), compare the results. Discuss concordance in point estimates, interval
widths, and heterogeneity. Note that the Bayesian CrI is typically wider than
the frequentist CI when informative tau priors are used with small numbers of
studies, reflecting more honest uncertainty quantification.

### Typical Strengths

- Direct posterior probability of clinically meaningful effect
- Principled handling of heterogeneity via prior distributions
- Formal prior sensitivity analysis demonstrating robustness
- Prediction intervals for future study effects
- Shrinkage estimates correcting for between-study variability
- Pre-registered protocol with pre-specified priors

### Typical Limitations

- Subjectivity in prior selection for tau (direction of influence: tighter
  priors on tau will shrink the CrI; wider priors may inflate it)
- Posterior sensitivity to tau prior when the number of studies is small
  (k < 5) (impact: conclusions may depend on prior choice)
- Computational requirements and potential convergence issues (mitigated by
  reporting convergence diagnostics)
- Readers unfamiliar with Bayesian statistics may misinterpret CrI as CI
- When k is large, Bayesian advantage diminishes as priors become
  overwhelmed by data

---

## Section 5 --- Software Citations

### bayesmeta (R)

> Rover C. Bayesian random-effects meta-analysis using the bayesmeta R
> package. *J Stat Softw*. 2020;93(6):1-51.

> Rover C. bayesmeta: Bayesian Random-Effects Meta-Analysis. R package
> version [X.X]. Available from:
> https://CRAN.R-project.org/package=bayesmeta

Note: bayesmeta computes the posterior analytically (no MCMC required) for
the normal-normal hierarchical model, making it particularly suitable for
standard meta-analyses.

### brms (R)

> Burkner PC. brms: An R package for Bayesian multilevel models using Stan.
> *J Stat Softw*. 2017;80(1):1-28.

> Burkner PC. Advanced Bayesian multilevel modeling with the R package brms.
> *R Journal*. 2018;10(1):395-411.

> Burkner PC. brms: Bayesian Regression Models using 'Stan'. R package
> version [X.X]. Available from: https://CRAN.R-project.org/package=brms

Used for more complex Bayesian meta-analytic models (multilevel,
meta-regression, multivariate outcomes) via the Stan back-end.

### JAGS

> Plummer M. JAGS: A program for analysis of Bayesian graphical models using
> Gibbs sampling. In: *Proceedings of the 3rd International Workshop on
> Distributed Statistical Computing (DSC 2003)*. Vienna, Austria; 2003.

R interfaces:

> Plummer M. rjags: Bayesian Graphical Models using MCMC. R package version
> [X.X]. Available from: https://CRAN.R-project.org/package=rjags

> Su YS, Yajima M. R2jags: Using R to Run 'JAGS'. R package version [X.X].
> Available from: https://CRAN.R-project.org/package=R2jags

### Stan

> Stan Development Team. Stan Modeling Language Users Guide and Reference
> Manual, version [X.X]. Available from: https://mc-stan.org

> Carpenter B, Gelman A, Hoffman MD, et al. Stan: a probabilistic
> programming language. *J Stat Softw*. 2017;76(1):1-32.

R interface:

> Stan Development Team. RStan: the R interface to Stan. R package version
> [X.X]. Available from: https://mc-stan.org/rstan/

### Additional Software

When reporting the analysis, always cite the specific R version and the
MCMC software with version numbers. Example:

> "All analyses were performed in R (version [X.X]; R Foundation for
> Statistical Computing, Vienna, Austria) using the bayesmeta package
> (version [X.X]) for the primary Bayesian meta-analysis. Sensitivity
> analyses using alternative model specifications were conducted using
> brms (version [X.X]) interfacing with Stan (version [X.X])."
