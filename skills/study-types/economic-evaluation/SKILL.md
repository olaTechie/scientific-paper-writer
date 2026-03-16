---
name: economic-evaluation
description: >
  Study-type module for economic evaluations in health care. Provides
  section-by-section guidance aligned with the CHEERS 2022 reporting standard,
  covering cost-effectiveness analysis (CEA), cost-utility analysis (CUA),
  cost-benefit analysis (CBA), decision-analytic modelling, probabilistic
  sensitivity analysis, and presentation of ICERs, cost-effectiveness planes,
  and cost-effectiveness acceptability curves.
version: 1.0.0
triggers:
  - economic evaluation
  - cost-effectiveness analysis
  - cost-utility analysis
  - cost-benefit analysis
  - health economic evaluation
  - CHEERS
  - ICER
  - QALY
  - decision model
  - Markov model
  - microsimulation
  - partitioned survival
---

# Economic Evaluation Study-Type Module

This module governs manuscript generation for economic evaluations of health
care interventions. Economic evaluations compare the costs and health outcomes
of two or more alternatives to inform resource allocation decisions. This
module covers cost-effectiveness analyses (CEA), cost-utility analyses (CUA),
and cost-benefit analyses (CBA), as well as the decision-analytic models that
underpin them (decision trees, Markov models, microsimulations, and partitioned
survival models).

---

## Section 1 --- Reporting Guideline

### CHEERS 2022

The primary reporting guideline for economic evaluations is the Consolidated
Health Economic Evaluation Reporting Standards 2022:

> Husereau D, Drummond M, Augustovski F, et al. Consolidated Health Economic
> Evaluation Reporting Standards 2022 (CHEERS 2022) statement: updated
> reporting guidance for health economic evaluations. *Value Health*.
> 2022;25(1):3-9.

Also published simultaneously in:

> Husereau D, Drummond M, Augustovski F, et al. Consolidated Health Economic
> Evaluation Reporting Standards 2022 (CHEERS 2022) statement: updated
> reporting guidance for health economic evaluations. *BMJ*. 2022;376:e067975.

The CHEERS 2022 checklist contains 28 items organised across seven sections
(Title, Abstract, Introduction, Methods, Results, Discussion, Other).

When citing the guideline in the Methods section, use the following phrasing:

> "This economic evaluation was conducted and reported in accordance with
> the Consolidated Health Economic Evaluation Reporting Standards 2022
> (CHEERS 2022) (Husereau et al., Value Health 2022;25:3-9)."

See `references/cheers-checklist.md` for the full 28-item CHEERS 2022
checklist.

---

## Section 2 --- Methods Subsections

### 2.1 Study Design

Specify the type of economic evaluation and the modelling framework. Template
sentences:

> "A cost-utility analysis was conducted comparing [intervention] with
> [comparator(s)] in patients with [condition]. A decision-analytic Markov
> state-transition model was developed to simulate the clinical pathway and
> estimate lifetime costs and quality-adjusted life-years (QALYs) associated
> with each strategy."

> "The model structure comprised [N] mutually exclusive health states:
> [list states, e.g., stable disease, progressed disease, treatment
> discontinuation, death]. Patients transitioned between states at [cycle
> length, e.g., monthly, annual] intervals according to transition
> probabilities derived from [data source]. A half-cycle correction was
> applied to account for the timing of transitions within each cycle."

*Alternative modelling frameworks:*

> "A decision-tree model was developed to capture the short-term clinical
> pathway following [intervention], with terminal branches representing
> [outcomes]."

> "A partitioned survival analysis model was constructed using parametric
> survival curves fitted to individual patient data from [trial name]. The
> area under the overall survival (OS) and progression-free survival (PFS)
> curves was partitioned into three health states: pre-progression,
> post-progression, and death."

> "An individual-level microsimulation model was developed to capture
> patient-level heterogeneity in disease progression, treatment response,
> and adverse events. Each simulated patient was assigned baseline
> characteristics drawn from distributions reflecting the target population."

### 2.2 Target Population and Setting

Define the population, perspective, and healthcare setting. Template sentences:

> "The target population comprised adults aged [N] years and older with
> [diagnosis/condition] who were eligible for [treatment]. The analysis
> adopted a [societal / healthcare payer / provider] perspective, capturing
> [direct medical costs only / direct medical costs plus indirect costs
> including productivity losses and informal care]. The analysis was set in
> [country/healthcare system], reflecting [system]-specific costs, resource
> use, and clinical practice patterns."

> "A societal perspective was adopted for the base case, including direct
> medical costs (drug acquisition, administration, monitoring, adverse event
> management, hospitalisations), patient out-of-pocket costs, and
> productivity losses valued using the human capital approach. A healthcare
> payer perspective was reported as a sensitivity analysis."

### 2.3 Comparators

Justify the choice of comparators. Template sentences:

> "The comparators were selected to reflect current standard of care for
> [condition] in [setting]. The following strategies were compared:
> (i) [intervention], (ii) [active comparator / current standard of care],
> and (iii) [additional comparators if applicable]. The choice of comparators
> was informed by [clinical guidelines, e.g., NICE guidelines, WHO essential
> medicines list, national formulary]."

> "A 'do nothing' or 'watchful waiting' strategy was not included because
> active treatment is the standard of care for [condition] in the target
> population."

### 2.4 Time Horizon

State and justify the time horizon. Template sentences:

> "A lifetime time horizon (modelled as [N] years, corresponding to a
> residual life expectancy of [N] years for a [N]-year-old cohort) was
> adopted to capture all relevant differences in costs and health outcomes
> between strategies. This is consistent with the recommendation of [NICE
> reference case / ISPOR guidelines] for chronic conditions where costs and
> outcomes accrue differentially over the long term."

> "A [N]-year time horizon was selected to align with the duration of
> available clinical trial evidence. The impact of extending the time horizon
> to a lifetime was explored in a scenario analysis."

### 2.5 Discount Rate

State and justify the discount rate. Template sentences:

> "Future costs and health outcomes were discounted at an annual rate of
> [3.5% / 3% / 5%] per year, in accordance with [NICE guidelines / WHO-CHOICE
> recommendations / national pharmacoeconomic guidelines for {country}].
> Discounting reflects the societal preference for benefits received sooner
> rather than later."

> "Alternative discount rates of [0%, 1.5%, 5%, 6%] were explored in
> sensitivity analyses to assess the impact of discounting assumptions on
> the results."

### 2.6 Health Outcomes

Describe the outcome measure and utility values. Template sentences:

> "Health outcomes were measured in quality-adjusted life-years (QALYs).
> Health state utility values were derived from [source: e.g., EQ-5D-5L
> responses from {trial name} mapped to the {country} value set using the
> {crosswalk/mapping algorithm}]. Utility values for each health state were:
> [state 1] = [X.XX], [state 2] = [X.XX], [state 3] = [X.XX]. Disutilities
> for adverse events were applied as temporary decrements lasting [duration]."

> "Utility values were elicited using [EQ-5D-5L / SF-6D / time trade-off
> (TTO) / standard gamble (SG)] and valued using the [country] tariff.
> Sensitivity analyses explored alternative utility sources, including
> values from [published utility catalogue / vignette-based study]."

### 2.7 Cost Measurement

Describe cost categories, sources, currency, and price year. Template
sentences:

> "Costs were estimated from a [perspective] and included: (i) drug
> acquisition costs based on [formulary/list prices from {source}],
> (ii) drug administration costs including [infusion time, monitoring visits],
> (iii) disease management costs by health state, (iv) adverse event
> management costs, and (v) terminal care costs. All costs were expressed
> in [year] [currency] (e.g., 2024 US dollars). Costs from earlier years
> were inflated to the reference year using the [Consumer Price Index /
> Medical Care Component of the CPI / Hospital and Community Health Services
> index]."

> "Resource use was estimated from [source: clinical trial data, national
> hospital episode statistics, expert clinical opinion via Delphi panel,
> published costing studies]. Unit costs were obtained from [source: national
> reference costs, Medicare fee schedule, hospital financial records]."

### 2.8 Model Parameters

Present all input parameters with their distributions. Template sentences:

> "All model input parameters are summarised in Table [N], including the
> base-case value, range or distribution for sensitivity analysis, and the
> source. Parameters were categorised as: transition probabilities (from
> clinical trial data or published literature), utility values (from
> patient-reported outcomes), cost estimates (from national reference costs
> and published sources), and treatment effects (from meta-analysis or
> head-to-head trial)."

> "For the probabilistic sensitivity analysis, each parameter was assigned
> a distribution reflecting its uncertainty: beta distributions for
> probabilities and utilities (bounded 0-1), gamma distributions for costs
> (right-skewed, non-negative), log-normal distributions for relative risks
> and hazard ratios (non-negative, right-skewed), and Dirichlet distributions
> for multinomial probabilities."

### 2.9 Analytical Methods

Describe the ICER calculation, deterministic sensitivity analysis, and
probabilistic sensitivity analysis. Template sentences:

**ICER calculation:**

> "The incremental cost-effectiveness ratio (ICER) was calculated as the
> difference in total costs divided by the difference in total QALYs between
> [intervention] and [comparator]: ICER = (Cost_intervention - Cost_comparator)
> / (QALY_intervention - QALY_comparator). When more than two strategies were
> compared, strategies were ranked by increasing effectiveness, and dominated
> (more costly and less effective) and extendedly dominated strategies were
> eliminated before computing ICERs on the efficiency frontier."

**Deterministic sensitivity analysis (DSA):**

> "A one-way deterministic sensitivity analysis was conducted by varying each
> parameter individually across its plausible range (95% confidence interval
> or +/-20% of the base-case value) while holding all other parameters at
> their base-case values. Results were presented in a tornado diagram
> identifying the parameters with the greatest influence on the ICER."

**Probabilistic sensitivity analysis (PSA):**

> "A probabilistic sensitivity analysis was conducted using [N] Monte Carlo
> simulations. Beta distributions were assigned to transition probabilities,
> gamma distributions to costs, and log-normal distributions to relative risk
> estimates. In each simulation, parameter values were drawn simultaneously
> from their assigned distributions, and the model was re-evaluated to produce
> a joint distribution of incremental costs and incremental QALYs."

> "Results of the PSA were presented on a cost-effectiveness plane (scatter
> plot of incremental costs vs incremental QALYs) and as a cost-effectiveness
> acceptability curve (CEAC) showing the probability that each strategy is
> cost-effective across a range of willingness-to-pay (WTP) thresholds.
> The probability of cost-effectiveness was reported at WTP thresholds of
> [currency][amount] per QALY [e.g., GBP 20,000 and GBP 30,000 per QALY
> for NICE; USD 50,000, USD 100,000, and USD 150,000 per QALY for US
> analyses]."

**Scenario analyses:**

> "Pre-specified scenario analyses assessed the impact of structural
> assumptions on the results, including: (i) alternative time horizon
> ([N] years vs lifetime), (ii) alternative discount rate ([X]%),
> (iii) alternative perspective ([societal vs payer]), (iv) alternative
> parametric survival distributions ([Weibull, log-logistic, gamma]),
> and (v) alternative utility sources."

---

## Section 3 --- Results Conventions

Results for economic evaluations are reported in the following canonical order:

1. **Total costs and effects per strategy** --- Present a table showing, for
   each strategy: total discounted costs, total discounted QALYs (or other
   health outcome), incremental costs, incremental QALYs, and the ICER. State
   the reference strategy clearly. Include the incremental net monetary benefit
   (INMB) at the relevant WTP threshold if applicable.

2. **ICER interpretation** --- State whether the intervention is dominant
   (less costly and more effective), dominated (more costly and less effective),
   or falls in the northeast quadrant (more costly and more effective, requiring
   comparison with the WTP threshold). If the ICER falls below the WTP
   threshold, state that the intervention is cost-effective at that threshold.

3. **Cost-effectiveness plane** --- Present the scatter plot from the PSA,
   with incremental costs on the y-axis and incremental QALYs on the x-axis.
   Include the WTP threshold line. State the proportion of simulations in
   each quadrant.

4. **Cost-effectiveness acceptability curve (CEAC)** --- Present the CEAC
   showing the probability of cost-effectiveness for each strategy across a
   range of WTP thresholds. Report the probability at key thresholds.

5. **Deterministic sensitivity analysis (tornado diagram)** --- Present the
   tornado diagram identifying the most influential parameters. State which
   parameters, when varied individually, change the cost-effectiveness
   conclusion.

6. **PSA probability of cost-effectiveness** --- Report the percentage of
   PSA simulations in which the intervention is cost-effective at the relevant
   WTP threshold(s). Example: "At a WTP threshold of GBP 30,000 per QALY,
   [intervention] was cost-effective in [X]% of [N] Monte Carlo simulations."

7. **Scenario analyses** --- Present a table of ICER results under each
   scenario analysis, compared with the base case.

All monetary values must include the currency, price year, and country.
QALYs should be reported to 2-3 decimal places. ICERs should be reported
as whole numbers (rounded to the nearest [currency unit]).

---

## Section 4 --- Discussion Considerations

### Paragraph Template

**Paragraph 1 --- Main findings:**
Restate the base-case ICER and the probability of cost-effectiveness at the
relevant WTP threshold. State whether the intervention is cost-effective,
cost-saving, or not cost-effective. Put the finding in context: "At a WTP
threshold of [amount] per QALY, [intervention] was cost-effective with an
ICER of [amount] per QALY gained and a [X]% probability of being
cost-effective."

**Paragraph 2 --- Comparison with published economic evaluations:**
Compare the ICER with published cost-effectiveness analyses of the same or
similar interventions. Discuss concordance or discordance and reasons for
differences (model structure, parameter sources, perspective, country,
price year, discount rate).

**Paragraph 3 --- Model assumptions and structural uncertainty:**
Discuss the key structural assumptions of the model and their potential
impact on results. For Markov models: discuss the Markov assumption (memoryless
transitions), cycle length, extrapolation beyond trial data. For partitioned
survival: discuss the proportional hazards assumption and choice of parametric
distribution. For microsimulation: discuss the assumptions about individual
heterogeneity and tracking of event history.

**Paragraph 4 --- Generalisability:**
Discuss the generalisability of results to other healthcare settings,
countries, or populations. Note that costs, utility values, and clinical
practice patterns vary by country. State whether the model is adaptable to
other settings and what parameters would need to be re-estimated.

**Paragraph 5 --- Policy implications:**
Discuss the implications at the relevant WTP thresholds. For UK analyses,
reference NICE thresholds (GBP 20,000-30,000 per QALY). For US analyses,
reference commonly used thresholds (USD 50,000-150,000 per QALY) and note
the absence of a single official threshold. For WHO-CHOICE analyses,
reference the GDP-per-capita thresholds. Discuss budget impact if relevant.

**Paragraph 6 --- Limitations:**
Discuss specific limitations of the economic evaluation.

### Typical Strengths

- Model structure validated against published survival data or natural
  history studies
- Comprehensive inclusion of cost categories from a [societal/payer]
  perspective
- Extensive sensitivity analyses (DSA, PSA, scenario analyses)
- Utility values derived from a validated preference-based instrument
  (EQ-5D) in the target population
- Adherence to CHEERS 2022 and [NICE reference case / national guidelines]
- Transparent model with all parameters, distributions, and sources tabulated

### Typical Limitations

- Model extrapolation beyond trial follow-up (direction of impact: longer
  extrapolation may favour the intervention if treatment benefit is assumed
  to persist, or penalise it if long-term adverse effects accumulate)
- Utility values derived from [trial population / catalogue values] may not
  reflect preferences of the target population (impact: uncertain direction
  of bias on QALYs)
- Transition probabilities assumed constant over time (Markov assumption;
  impact: may overestimate or underestimate disease progression in time-
  dependent conditions)
- Costs based on [national reference costs / expert opinion] may not reflect
  actual resource use in clinical practice
- Single-country analysis limits generalisability
- Indirect treatment comparison used for [comparator] in the absence of
  head-to-head trial data (impact: increased uncertainty in relative
  treatment effect)
- Price year and currency conversion may not capture real-world pricing
  agreements (rebates, patient access schemes)

---

## Section 5 --- Software Citations

### TreeAge Pro

> TreeAge Software, Inc. TreeAge Pro [version]. Williamstown, MA: TreeAge
> Software, Inc.; [year]. Available from: https://www.treeage.com

Widely used commercial software for decision-tree and Markov modelling with
built-in PSA capabilities.

### R: heemod

> Filipovic-Pierucci A, Zarca K, Durand-Zaleski I. Markov models for
> health economic evaluation modelling in R with the heemod package.
> R package version [X.X]. Available from:
> https://CRAN.R-project.org/package=heemod

Used for Markov state-transition models in R, with support for PSA, DSA,
and scenario analysis.

### R: BCEA

> Baio G, Berardi A, Heath A. Bayesian Cost-Effectiveness Analysis with
> the R Package BCEA. Cham: Springer; 2017.

> Baio G. BCEA: Bayesian Cost-Effectiveness Analysis. R package version
> [X.X]. Available from: https://CRAN.R-project.org/package=BCEA

Used for Bayesian cost-effectiveness analysis, CE planes, CEACs, and EVPI.

### R: hesim

> Incerti D, Jansen JP. hesim: Health Economic Simulation Modeling and
> Decision Analysis. R package version [X.X]. Available from:
> https://CRAN.R-project.org/package=hesim

Used for cohort state-transition models, partitioned survival models, and
individual-level simulations.

### Microsoft Excel

> Microsoft Corporation. Microsoft Excel [version]. Redmond, WA: Microsoft
> Corporation; [year].

Many published economic evaluations are built in Excel with VBA macros for
PSA. If Excel is used, state the version and confirm that the model is
available on request or as supplementary material.

### NICE Reference Case

For UK-based economic evaluations, reference:

> National Institute for Health and Care Excellence (NICE). NICE health
> technology evaluations: the manual. Process and methods [PMG36]. London:
> NICE; 2022. Available from: https://www.nice.org.uk/process/pmg36

The NICE reference case specifies: NHS and personal social services
perspective, lifetime time horizon, 3.5% annual discount rate for costs and
QALYs, EQ-5D for utility measurement, and a WTP threshold of GBP 20,000-
30,000 per QALY.

### Additional Software

When reporting the analysis, always cite the specific software version.
Example:

> "The decision-analytic model was constructed using TreeAge Pro (version
> [X.X]; TreeAge Software, Williamstown, MA). Probabilistic sensitivity
> analysis was conducted using [N] second-order Monte Carlo simulations.
> Post-processing and figure generation were performed in R (version [X.X])
> using the BCEA package (version [X.X])."
