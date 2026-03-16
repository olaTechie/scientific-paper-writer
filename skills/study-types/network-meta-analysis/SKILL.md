---
name: network-meta-analysis
description: >
  Study-type module for network meta-analyses (NMAs). Provides section-by-section
  guidance aligned with the PRISMA-NMA extension, covering network geometry,
  consistency assessment, ranking metrics, and league-table presentation.
version: 1.0.0
triggers:
  - network meta-analysis
  - NMA
  - mixed treatment comparison
  - multiple treatments comparison
  - indirect comparison meta-analysis
  - PRISMA-NMA
---

# Network Meta-Analysis Study-Type Module

This module governs manuscript generation for network meta-analyses (NMAs),
also known as mixed treatment comparisons. It supplements the core engine and
section-specific skills with NMA-specific reporting requirements derived from
the PRISMA-NMA extension statement.

---

## Section 1 --- Reporting Guideline

### PRISMA-NMA

The primary reporting guideline for network meta-analyses is the PRISMA
extension statement for NMA:

> Hutton B, Salanti G, Caldwell DM, et al. The PRISMA extension statement
> for reporting of systematic reviews incorporating network meta-analyses of
> health care interventions: checklist and explanations. *Ann Intern Med*.
> 2015;162(11):777-784.

The PRISMA-NMA checklist extends PRISMA 2020 with items specific to network
geometry, consistency evaluation, treatment ranking, and league-table
presentation. All NMA manuscripts must satisfy every applicable PRISMA 2020
item plus every NMA-specific extension item.

When citing the guideline in the Methods section, use the following phrasing:

> "This systematic review and network meta-analysis was conducted and reported
> in accordance with the Preferred Reporting Items for Systematic Reviews and
> Meta-Analyses extension for Network Meta-Analyses (PRISMA-NMA) (Hutton et al.,
> Ann Intern Med 2015;162:777-784)."

See `references/prisma-nma-checklist.md` for the full NMA-specific extension
items.

---

## Section 2 --- Methods Subsections

### 2.1 Protocol and Registration

State the prospective registration number and repository. Template sentences:

> "The protocol for this systematic review and network meta-analysis was
> registered prospectively with PROSPERO (registration number CRD42XXXXXXX)
> before the literature search was initiated. The protocol specified the
> eligibility criteria, search strategy, planned network geometry, and
> statistical methods for the network meta-analysis, including the approach
> to consistency assessment."

If the protocol was not registered, flag with `[PLEASE VERIFY: protocol
registration number]` and note the omission as a limitation.

### 2.2 Eligibility Criteria

Define eligibility using the PICO framework with additional NMA-specific
requirements: eligible comparisons and the connected-network requirement.
Template sentences:

> "Studies were eligible if they compared at least two of the following
> interventions in patients with [condition]: [list interventions]. Both
> direct comparisons (head-to-head trials) and indirect comparisons via a
> common comparator were eligible. Only studies that contributed to a single
> connected network of interventions were included; disconnected nodes were
> excluded from the analysis."

> "Eligible study designs included randomised controlled trials with a minimum
> follow-up of [N] weeks. Studies reporting [outcome] as a dichotomous or
> continuous measure were included."

Ensure each PICO element is explicitly addressed: Population (diagnosis, age,
setting), Intervention/Comparator (all eligible treatments), Outcome (primary
and secondary), and study design.

### 2.3 Information Sources and Search Strategy

List all databases searched, date of last search, and any supplementary
sources. Template sentences:

> "A systematic search was conducted across MEDLINE (via PubMed), Embase (via
> Elsevier), the Cochrane Central Register of Controlled Trials (CENTRAL), and
> [additional databases] from inception to [date]. Reference lists of included
> studies and relevant systematic reviews were hand-searched. Trial registries
> (ClinicalTrials.gov, WHO ICTRP) were searched for unpublished or ongoing
> trials. The full electronic search strategy for each database is provided in
> the Supplementary Materials (eTable 1)."

### 2.4 Study Selection

Describe the screening process including number of reviewers and conflict
resolution. Template sentences:

> "Two reviewers independently screened titles and abstracts against the
> eligibility criteria using [software, e.g., Covidence or Rayyan]. Full-text
> articles of potentially eligible records were retrieved and assessed
> independently by both reviewers. Disagreements were resolved by consensus
> or, when necessary, by consultation with a third reviewer. Inter-rater
> agreement at the full-text stage was quantified using Cohen's kappa."

### 2.5 Data Extraction

Describe the extraction process, specifying that all pairwise comparisons
within multi-arm trials are extracted. Template sentences:

> "Data were extracted independently by two reviewers using a standardised
> piloted extraction form. For each study, the following data were recorded:
> study characteristics (author, year, country, design, sample size),
> participant characteristics (age, sex, disease severity), intervention
> details (drug, dose, duration, comparator), and outcome data (events and
> totals for dichotomous outcomes; means, standard deviations, and sample
> sizes for continuous outcomes). For multi-arm trials, all pairwise comparisons
> were extracted to preserve within-study correlations."

> "When multiple publications reported data from the same trial, the most
> complete dataset was used. Discrepancies between reviewers were resolved by
> discussion and reference to the original publications."

### 2.6 Risk of Bias

Specify the risk-of-bias tool and the use of CINeMA for confidence in NMA
estimates. Template sentences:

> "Risk of bias in individual studies was assessed independently by two
> reviewers using the Cochrane Risk of Bias 2 (RoB 2) tool for randomised
> trials [or ROBINS-I for non-randomised studies]. Each study was evaluated
> across [five/seven] domains, and an overall risk-of-bias judgement (low,
> some concerns, high) was assigned."

> "Confidence in the NMA estimates was evaluated using the Confidence in
> Network Meta-Analysis (CINeMA) framework, which considers six domains:
> within-study bias, across-studies bias (reporting bias), indirectness,
> imprecision, heterogeneity, and incoherence. Each comparison was rated as
> very low, low, moderate, or high confidence."

### 2.7 Geometry of the Network

Describe the network structure and how it is presented. Template sentences:

> "The network comprised [N] nodes representing [interventions/treatment
> classes] connected by [N] edges based on [N] direct comparisons from [N]
> studies. The network geometry was visualised using a network plot in which
> node size was proportional to the number of participants randomised to each
> treatment and edge thickness was proportional to the number of studies
> informing each direct comparison."

> "The distribution of direct evidence across comparisons was assessed to
> identify potential gaps in the network and comparisons informed solely by
> indirect evidence."

### 2.8 Effect Measures

Specify the effect measure and any transformations. Template sentences:

> "For dichotomous outcomes, the odds ratio (OR) with 95% confidence interval
> (CI) was used as the summary measure. For continuous outcomes, the
> standardised mean difference (SMD) with 95% CI was used. All effect
> estimates were reported relative to a common reference treatment ([treatment
> name])."

### 2.9 Statistical Methods

This subsection must cover: the modelling framework (frequentist or Bayesian),
consistency evaluation, ranking metrics, heterogeneity assessment, and
sensitivity analyses. Template sentences:

> "A frequentist random-effects network meta-analysis was conducted using the
> netmeta package (version [X.X]) in R (version [X.X]). The model was fitted
> using a graph-theoretical approach based on electrical network theory
> (Rucker, Res Synth Methods 2012). For multi-arm trials, within-study
> correlations were accounted for using a back-calculation method."

*Alternatively, for Bayesian implementation:*

> "A Bayesian random-effects network meta-analysis was conducted using the
> gemtc package (version [X.X]) in R, which interfaces with JAGS for Markov
> chain Monte Carlo (MCMC) sampling. Three chains were run with [N] iterations
> after a burn-in of [N] iterations. Convergence was assessed using the
> Brooks-Gelman-Rubin diagnostic (potential scale reduction factor < 1.05)
> and visual inspection of trace plots."

**Consistency assessment:**

> "The assumption of consistency (agreement between direct and indirect
> evidence) was evaluated globally using the design-by-treatment interaction
> test and locally using a node-splitting approach. A p-value < 0.10 for the
> design-by-treatment interaction test or a node-splitting comparison was
> considered indicative of potential inconsistency."

**Rankings:**

> "Treatments were ranked using P-scores [frequentist] or the surface under
> the cumulative ranking curve (SUCRA) [Bayesian], where a value of 1.0
> indicates the treatment is certain to be the best and 0.0 indicates it is
> certain to be the worst. A league table presenting all pairwise comparisons
> with 95% CIs was constructed."

**Contribution matrix:**

> "The contribution matrix was computed to quantify the percentage contribution
> of each direct comparison to the network estimates, providing transparency
> about the evidence base underlying each mixed estimate."

**Heterogeneity:**

> "A common between-study heterogeneity variance (tau-squared) was assumed
> across all comparisons. Heterogeneity was quantified using tau-squared and
> the I-squared statistic for each pairwise comparison."

**Publication bias:**

> "Publication bias was assessed visually using a comparison-adjusted funnel
> plot and formally tested using Egger's regression test (when the number of
> studies per comparison was at least 10)."

**Sensitivity analyses:**

> "Pre-specified sensitivity analyses included: (i) exclusion of studies at
> high risk of bias; (ii) restriction to studies with a minimum sample size of
> [N]; (iii) use of an alternative effect measure ([OR/RR]); and (iv) a
> fixed-effect network meta-analysis to assess the impact of the random-effects
> assumption."

---

## Section 3 --- Results Conventions

Results for network meta-analyses are reported in the following canonical order:

1. **Study selection and network geometry** --- Present the PRISMA flow diagram
   followed by the network plot. State the number of studies, participants,
   treatments, and direct comparisons.

2. **League table** --- Present the full league table of all pairwise
   comparisons with point estimates and 95% CIs. Highlight statistically
   significant differences.

3. **Rankings** --- Report P-scores or SUCRA values for all treatments with
   the corresponding ranking probabilities. Present the rankogram if Bayesian.

4. **Consistency** --- Report the global test for inconsistency (design-by-
   treatment interaction p-value) and local node-splitting results. State
   whether the consistency assumption was supported.

5. **Forest plots** --- Present forest plots of all treatments versus the
   reference treatment. Label each comparison clearly.

6. **Heterogeneity** --- Report tau-squared and I-squared values. Interpret
   the magnitude of heterogeneity using established thresholds (Higgins et al.,
   BMJ 2003).

7. **Publication bias** --- Present the comparison-adjusted funnel plot and
   Egger's test result.

All estimates must include the point estimate, 95% CI, and sample sizes.
Rankings must be accompanied by a statement about their uncertainty.

---

## Section 4 --- Discussion Considerations

### Paragraph Template

The Discussion for an NMA should follow this structure:

**Paragraph 1 --- Main findings:**
Restate the primary finding (which treatment ranks best, which comparisons
are statistically significant). State the number of treatments and studies
contributing to the network.

**Paragraph 2 --- Transitivity assumption:**
Discuss whether the transitivity assumption (similarity of studies across
different comparisons in terms of effect modifiers) was plausible. Identify
potential effect modifiers (dose, duration, severity, study design, year of
publication) and state whether their distribution was balanced across
comparisons.

**Paragraph 3 --- Consistency findings:**
Discuss the results of the design-by-treatment and node-splitting tests. If
inconsistency was detected, explore possible explanations (violation of
transitivity, differences in study populations, dose heterogeneity). If
consistency was supported, state this as a strength.

**Paragraph 4 --- Comparison with pairwise meta-analyses:**
Compare the NMA results with previously published pairwise meta-analyses.
Note whether the NMA confirms, refines, or contradicts previous findings.
Emphasise the added value of the NMA (indirect comparisons, comprehensive
ranking, simultaneous consideration of all treatments).

**Paragraph 5 --- Ranking uncertainty:**
Discuss the uncertainty in treatment rankings. Emphasise that SUCRA/P-scores
are summary measures and small differences between adjacent ranks may not be
clinically meaningful. Do not overinterpret rankings when confidence intervals
overlap substantially.

### Typical Strengths

- Comprehensive network enabling indirect comparisons not available from
  head-to-head trials
- Formal assessment of transitivity and consistency
- Pre-registered protocol with transparent methods
- Use of CINeMA to rate confidence in NMA estimates
- Multiple sensitivity analyses testing robustness

### Typical Limitations

- Transitivity may not hold if effect modifiers are unevenly distributed
  across comparisons (direction of bias: uncertain)
- Sparse network for some comparisons, with estimates driven primarily by
  indirect evidence (may reduce precision)
- Common heterogeneity variance assumption may not hold if treatment effects
  are heterogeneous across different comparison types
- Ranking metrics (SUCRA/P-scores) may be misleading when effect estimates
  are imprecise or the network is sparse
- Limited number of studies per comparison precluding robust assessment of
  publication bias for some edges

---

## Section 5 --- Software Citations

### netmeta (R)

> Rucker G, Krahn U, Konig J, Efthimiou O, Davies A, Papakonstantinou T,
> Schwarzer G. netmeta: Network Meta-Analysis using Frequentist Methods.
> R package version [X.X]. Available from: https://CRAN.R-project.org/package=netmeta

Cite the methodological paper:

> Rucker G. Network meta-analysis, electrical networks, and graph theory.
> *Res Synth Methods*. 2012;3(4):312-324.

### gemtc (R)

> van Valkenhoef G, Lu G, de Brock B, Hillege H, Ades AE, Welton NJ.
> Automating network meta-analysis. *Res Synth Methods*. 2012;3(4):285-299.

> van Valkenhoef G, Kuber JN. gemtc: Network Meta-Analysis Using Bayesian
> Methods. R package version [X.X]. Available from:
> https://CRAN.R-project.org/package=gemtc

### CINeMA

> Nikolakopoulou A, Higgins JPT, Papakonstantinou T, et al. CINeMA: An
> approach for assessing confidence in the results of a network meta-analysis.
> *PLoS Med*. 2020;17(4):e1003082.

> CINeMA web application. Available from: https://cinema.ispm.unibe.ch/

### Additional Software

When reporting the analysis, always cite the specific R version and, for
Bayesian analyses, the MCMC software (JAGS, OpenBUGS, or Stan) with version
numbers. Example:

> "All analyses were performed in R (version [X.X]; R Foundation for
> Statistical Computing, Vienna, Austria) using the netmeta package
> (version [X.X]) for the frequentist network meta-analysis and the
> CINeMA web application for confidence assessment."
