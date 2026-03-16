# Figure Types: Extraction Templates and Example Captions

This reference provides detailed extraction templates and complete example captions
for all nine supported figure types. Each entry defines what to extract, how to
describe it in prose, and a publication-ready example caption.

---

## 1. Forest Plot

### What to Extract

1. **Study identifiers:** Author name, year, subgroup label
2. **Effect estimates:** Point estimate for each study (OR, RR, HR, MD, SMD)
3. **Confidence intervals:** Lower and upper bounds of each 95% CI
4. **Weights:** Percentage contribution of each study (square size or explicit column)
5. **Pooled estimate:** Diamond position and width (overall and per subgroup)
6. **Heterogeneity:** I-squared, tau-squared, Q statistic, p-value for heterogeneity
7. **Prediction interval:** Extended whiskers or dashed line around the pooled estimate
8. **Scale and null line:** X-axis metric, position of the null value (1.0 or 0)
9. **Favours labels:** Directional labels beneath the x-axis

### How to Describe

- State the number of studies and total participants
- Report the pooled estimate with 95% CI and the statistical model used
- Comment on heterogeneity (low/moderate/high based on I-squared thresholds: <25% low, 25-75% moderate, >75% high)
- Note any outlier studies that visually dominate the plot
- Mention whether the prediction interval crosses the null

### Example Caption

> **Figure 1. Forest plot of the association between statin therapy and
> cardiovascular mortality in adults aged 65 years and older.**
>
> Each square represents the odds ratio (OR) from an individual study, with
> the square size proportional to the study weight. Horizontal lines indicate
> 95% confidence intervals (CIs). The diamond represents the pooled OR from
> a random-effects model (DerSimonian-Laird). The dashed vertical line
> indicates the null value (OR = 1.0). The pooled OR was 0.78 (95% CI 0.69
> to 0.88; I-squared = 42%, p for heterogeneity = 0.08). The 95% prediction
> interval (0.58 to 1.05) is shown as the extended horizontal line through
> the diamond.
>
> Abbreviations: CI, confidence interval; OR, odds ratio.

---

## 2. PRISMA Flow Diagram

### What to Extract

1. **Identification:** Number of records from each database, registers, and other sources
2. **Duplicate removal:** Number of duplicates removed (automated and manual)
3. **Screening:** Number screened at title/abstract, number excluded
4. **Retrieval:** Number of reports sought, number not retrieved (with reasons)
5. **Eligibility:** Number assessed at full text, number excluded per reason (with counts for each reason)
6. **Inclusion:** Number of studies in qualitative synthesis, number in quantitative synthesis (meta-analysis)

### How to Describe

- Walk through the flow from identification to inclusion
- Quantify each step with exact numbers
- List the top exclusion reasons at full-text stage with counts
- Distinguish between "studies" and "reports" where applicable

### Example Caption

> **Figure 2. PRISMA 2020 flow diagram of the study selection process.**
>
> The initial search identified 3,842 records from PubMed, Embase, and the
> Cochrane Library, plus 12 records from reference list screening. After
> removing 1,204 duplicates, 2,650 records were screened at title and
> abstract. Of 187 full-text reports assessed for eligibility, 143 were
> excluded: 62 for wrong study design, 41 for wrong population, 23 for
> wrong outcome, 12 for wrong comparator, and 5 for insufficient data.
> A total of 44 studies (reported in 52 publications) were included in the
> qualitative synthesis, of which 38 contributed data to the meta-analysis.
> This diagram follows the PRISMA 2020 reporting guideline (Page et al., 2021).
>
> Abbreviations: PRISMA, Preferred Reporting Items for Systematic Reviews
> and Meta-Analyses.

---

## 3. Funnel Plot

### What to Extract

1. **Symmetry:** Overall visual assessment (symmetric, mildly asymmetric, clearly asymmetric)
2. **Outlier studies:** Points lying outside the pseudo-95% CI boundaries
3. **Egger's regression line:** Presence, slope direction, and intercept
4. **Axes:** X-axis metric (effect size type), Y-axis metric (standard error or precision)
5. **Reference line:** Position of the vertical line (at pooled estimate)
6. **Trim-and-fill points:** Imputed studies if present (usually shown as open circles)

### How to Describe

- State the visual symmetry assessment
- Quantify any asymmetry using Egger's test result if available
- Note the number of outlier points
- If trim-and-fill is shown, state the number of imputed studies and the adjusted estimate

### Example Caption

> **Figure 3. Funnel plot assessing publication bias across included studies.**
>
> Each point represents one study, plotted as the effect estimate (log odds
> ratio) against its standard error. The vertical dashed line indicates the
> pooled estimate. The diagonal lines represent the pseudo-95% confidence
> limits. Visual inspection suggests mild asymmetry with a deficit of small
> studies reporting null or negative effects. Egger's regression test yielded
> a bias coefficient of 1.42 (95% CI 0.18 to 2.66; p = 0.03), suggesting
> possible small-study effects. Two open circles represent imputed studies
> from the Duval and Tweedie trim-and-fill analysis; the adjusted pooled
> OR was 0.82 (95% CI 0.72 to 0.94).
>
> Abbreviations: CI, confidence interval; OR, odds ratio.

---

## 4. Calibration Plot

### What to Extract

1. **Calibration curve:** Position relative to the ideal 45-degree line
2. **Ideal line:** The diagonal representing perfect calibration
3. **Calibration-in-the-large (CITL):** Intercept value (ideal = 0)
4. **Calibration slope:** Value (ideal = 1)
5. **Confidence bands:** Width and pattern (shaded or dashed)
6. **Decile markers:** Observed vs predicted event rates by risk group
7. **Histogram:** Distribution of predicted probabilities (if shown at base)

### How to Describe

- State whether the model over-predicts or under-predicts overall
- Report CITL and slope with their interpretation
- Identify risk ranges where calibration is poor
- Note whether confidence bands are narrow (precise) or wide (imprecise)

### Example Caption

> **Figure 4. Calibration plot of the predicted versus observed 5-year
> cardiovascular event risk.**
>
> The solid curve shows the relationship between model-predicted risk
> (x-axis) and observed event rates (y-axis) across deciles of predicted
> risk. The dashed diagonal line represents perfect calibration. The
> calibration-in-the-large was 0.02 (95% CI -0.05 to 0.09), indicating
> minimal overall miscalibration. The calibration slope was 0.91 (95% CI
> 0.83 to 0.99), suggesting slight overfitting with mild over-prediction
> at high risk levels. The grey shaded region represents the 95% confidence
> band. The histogram at the base shows the distribution of predicted
> probabilities, with the majority of patients clustered in the 5-15%
> predicted risk range.
>
> Abbreviations: CI, confidence interval.

---

## 5. Kaplan-Meier Curve

### What to Extract

1. **Median survival:** Time at which each curve crosses 50% (with 95% CI)
2. **Number at risk:** Table values at each time point for each group
3. **Log-rank p-value:** Statistical comparison between groups
4. **Curve separation:** Time point at which curves begin to diverge
5. **Censoring marks:** Tick marks indicating censored observations
6. **Hazard ratio:** HR with 95% CI if displayed on the figure
7. **Confidence bands:** Shaded regions around each curve
8. **Time scale:** Units on x-axis (days, months, years) and maximum follow-up

### How to Describe

- State the median survival for each group with 95% CI
- Report the log-rank p-value and HR if available
- Describe the pattern of curve separation (early, late, crossing)
- Comment on the number at risk at key time points

### Example Caption

> **Figure 5. Kaplan-Meier estimates of overall survival by treatment group.**
>
> The solid blue curve represents patients receiving combination therapy
> (n = 245) and the dashed red curve represents patients receiving
> monotherapy (n = 238). Median overall survival was 18.3 months (95% CI
> 15.7 to 21.0) in the combination group versus 12.8 months (95% CI 10.4
> to 15.2) in the monotherapy group (log-rank p < 0.001; hazard ratio
> 0.68, 95% CI 0.55 to 0.84). Curves began to separate at approximately
> 3 months. Tick marks indicate censored observations. The number at risk
> at each 6-month interval is shown below the plot.
>
> Abbreviations: CI, confidence interval; HR, hazard ratio.

---

## 6. Dose-Response Curve

### What to Extract

1. **Curve shape:** Linear, J-shaped, U-shaped, threshold, plateau, sigmoid
2. **Spline knots:** Number and positions (for restricted cubic spline models)
3. **Reference dose:** The dose category used as the baseline (typically zero or lowest)
4. **Confidence bands:** Width and shape of the 95% CI region
5. **Threshold dose:** Dose at which the effect becomes statistically significant
6. **Individual study points:** Study-level estimates plotted with size proportional to weight
7. **Axes:** X-axis (dose in specific units), Y-axis (relative measure: RR, OR, HR)
8. **Nonlinearity test:** P-value for departure from linearity

### How to Describe

- State the overall shape and direction of the dose-response relationship
- Identify the threshold dose (where CI no longer includes the null)
- Describe whether the relationship is linear or nonlinear
- Report the test for nonlinearity if shown

### Example Caption

> **Figure 6. Dose-response relationship between daily sodium intake and
> risk of hypertension.**
>
> The dose-response curve was modelled using a restricted cubic spline with
> three knots (at the 10th, 50th, and 90th percentiles of the dose
> distribution). The reference category was a sodium intake of 2.0 g/day.
> The solid curve shows the pooled relative risk (RR) and the grey shaded
> area represents the 95% confidence interval. A J-shaped relationship was
> observed, with risk increasing above approximately 3.5 g/day (RR 1.12,
> 95% CI 1.03 to 1.22). The test for nonlinearity was statistically
> significant (p = 0.004). Circles represent individual study estimates,
> with size proportional to the inverse of the variance.
>
> Abbreviations: CI, confidence interval; RR, relative risk.

---

## 7. Network Geometry Plot

### What to Extract

1. **Nodes:** Count, labels (treatment names), relative sizes
2. **Edges:** Count, relative thickness (proportional to number of comparisons or total sample size)
3. **Direct comparisons:** Which treatment pairs are directly compared
4. **Network connectivity:** Whether the network is fully connected or has disconnected components
5. **Multi-arm studies:** Triangles or polygons indicating 3+ arm studies
6. **Node sizing basis:** Whether size reflects number of studies, participants, or something else

### How to Describe

- State the total number of treatments (nodes) and direct comparisons (edges)
- Identify the most-studied comparison (thickest edge)
- Note any treatments with limited evidence (thin edges or single connections)
- Comment on overall network geometry (star-shaped, well-connected, sparse)

### Example Caption

> **Figure 7. Network geometry of direct treatment comparisons for acute
> pain management.**
>
> The network comprises 12 treatments (nodes) connected by 28 direct
> comparisons (edges). Node size is proportional to the total number of
> patients randomised to each treatment. Edge thickness is proportional
> to the number of studies making each direct comparison. Placebo was the
> most commonly used comparator, with direct evidence against 10 of the
> 11 active treatments. The thickest edge connects ibuprofen and placebo
> (14 studies, 3,842 participants). Two treatments (Treatment K and
> Treatment L) are connected to the network by a single comparison each,
> indicating limited direct evidence.
>
> Abbreviations: None required.

---

## 8. Cost-Effectiveness Plane (CE Plane)

### What to Extract

1. **Quadrant distribution:** Percentage or count of iterations in each quadrant (NE, SE, NW, SW)
2. **ICER point:** Central estimate coordinates (incremental cost, incremental QALY)
3. **Scatter distribution:** Spread and shape of the bootstrap/PSA cloud
4. **WTP line:** Slope and whether most points fall below it
5. **Confidence ellipse:** 95% ellipse boundary if shown
6. **Axes:** X-axis (incremental QALYs), Y-axis (incremental cost, currency)
7. **Comparator:** What the origin (0,0) represents

### How to Describe

- State the ICER and the quadrant where the central estimate falls
- Report the proportion of iterations below the WTP threshold
- Describe the spread: concentrated (low uncertainty) or dispersed (high uncertainty)
- Note any iterations in the dominated (NW) quadrant

### Example Caption

> **Figure 8. Cost-effectiveness plane for the new intervention compared
> with standard care.**
>
> Each point represents one of 10,000 probabilistic sensitivity analysis
> iterations, plotted as incremental quality-adjusted life years (QALYs,
> x-axis) against incremental cost in 2024 GBP (y-axis). The central ICER
> estimate was GBP 22,450 per QALY gained (black triangle). The diagonal
> dashed line represents a willingness-to-pay threshold of GBP 30,000 per
> QALY. Approximately 72% of iterations fell below this threshold,
> indicating a high probability of cost-effectiveness. The majority of
> iterations (89%) were in the northeast quadrant (more effective, more
> costly), with 8% in the southeast quadrant (dominant). The 95% confidence
> ellipse is shown in grey.
>
> Abbreviations: GBP, British pounds sterling; ICER, incremental
> cost-effectiveness ratio; QALY, quality-adjusted life year; WTP,
> willingness-to-pay.

---

## 9. Cost-Effectiveness Acceptability Curve (CEAC)

### What to Extract

1. **Probability at key WTP thresholds:** Read p(cost-effective) at standard thresholds (e.g., GBP 20,000; GBP 30,000; USD 50,000; USD 100,000; USD 150,000)
2. **Crossover points:** WTP threshold where one strategy overtakes another in probability
3. **Number of curves:** One per strategy compared
4. **Curve labels:** Strategy names and visual coding (colour, line style)
5. **Axes:** X-axis (WTP threshold range and currency), Y-axis (probability cost-effective, 0-1)
6. **Decision threshold markers:** Vertical lines at commonly used thresholds

### How to Describe

- State the probability of cost-effectiveness at the most relevant WTP threshold for the jurisdiction
- Identify the crossover point where strategy preference changes
- Comment on the shape: steep rise (clear dominance), gradual (uncertainty), or flat (insensitive to WTP)
- Report the probability at multiple thresholds for sensitivity

### Example Caption

> **Figure 9. Cost-effectiveness acceptability curves for three treatment
> strategies.**
>
> The curves show the probability of each strategy being cost-effective
> (y-axis) across a range of willingness-to-pay (WTP) thresholds (x-axis,
> GBP per QALY gained). At the NICE threshold of GBP 20,000 per QALY,
> Strategy A had a 45% probability of being cost-effective, Strategy B had
> 38%, and Strategy C had 17%. At GBP 30,000 per QALY, Strategy A remained
> most likely cost-effective (52%). Strategy B overtook Strategy C at a WTP
> of approximately GBP 15,000 per QALY. The vertical dashed lines indicate
> the GBP 20,000 and GBP 30,000 per QALY thresholds commonly used by NICE.
>
> Abbreviations: GBP, British pounds sterling; NICE, National Institute for
> Health and Care Excellence; QALY, quality-adjusted life year; WTP,
> willingness-to-pay.
