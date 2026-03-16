---
name: visual-engine
description: >
  Figure interpretation, generation, and caption writing engine. Interprets uploaded
  scientific figures using Claude's multimodal vision, generates publication-quality
  figures via R or Python code templates, and auto-generates structured captions.
  Trigger phrases include: "interpret figure", "read figure", "generate figure",
  "write captions", "figure caption", "describe this figure", "create a forest plot",
  "what does this figure show".
version: 1.0.0
triggers:
  - interpret figure
  - read figure
  - generate figure
  - write captions
  - figure caption
---

# Visual Engine

This skill handles all figure-related tasks: interpreting uploaded figures,
generating publication-quality figures from data, and writing structured captions
that meet journal submission standards.

> **Note:** This skill resolves the missing v0.2.0 phantom reference
> `skills/paper-components/references/caption-standards.md` per spec Section 12.2.
> All caption standards and figure type guidance is now consolidated here.

---

## 1. Figure Interpretation

Claude uses built-in multimodal image understanding to extract structured data
from uploaded scientific figures. When a user uploads a figure or provides an
image path, the assistant reads the image and applies the appropriate extraction
guide based on the figure type.

### 1.1 Forest Plot

Extract the following elements in order:

| Element | What to look for |
|---|---|
| Study names | Left-side labels, including subgroup headers if grouped |
| Point estimates | Centre of each horizontal line or square |
| Confidence intervals | Endpoints of each horizontal line (95% CI) |
| Weights | Square size or explicit percentage column on the right |
| Pooled diamond | Diamond shape at the bottom of each subgroup and overall |
| Heterogeneity statistics | I-squared, tau-squared, Q statistic, p-value for heterogeneity |
| 95% Prediction interval | Dashed line or extended diamond whiskers around pooled estimate |
| Scale | X-axis values (log scale or linear), axis label (OR, RR, HR, MD, SMD) |
| Null line | Vertical line at 1.0 (ratio measures) or 0 (mean differences) |
| Favours labels | Text at bottom indicating direction ("Favours treatment" / "Favours control") |

### 1.2 PRISMA Flow Diagram

Extract the following elements:

| Element | What to look for |
|---|---|
| Identification counts | Records from databases (N), registers (N), other sources (N) |
| Duplicates removed | N removed before screening |
| Screened | N records screened (title/abstract) |
| Excluded at screening | N excluded with reasons if shown |
| Reports sought | N reports sought for retrieval |
| Not retrieved | N not retrieved with reasons |
| Assessed for eligibility | N full-text reports assessed |
| Excluded at full text | N excluded, broken down by reason (each reason with count) |
| Included | N studies in review, N in meta-analysis (if different) |

### 1.3 Funnel Plot

| Element | What to look for |
|---|---|
| Symmetry | Visual assessment: symmetric, mildly asymmetric, clearly asymmetric |
| Outliers | Points far outside the expected funnel boundaries |
| Egger's line | Regression line if overlaid (slope and intercept) |
| Axes | X-axis (effect size type), Y-axis (standard error, precision, or sample size) |
| Reference line | Vertical line at pooled estimate |
| Pseudo-CI boundaries | Diagonal lines forming the funnel shape |
| Fill-and-trim points | Imputed points if trim-and-fill analysis shown |

### 1.4 Calibration Plot

| Element | What to look for |
|---|---|
| Observed vs predicted | Plotted curve or points showing calibration |
| Ideal line | 45-degree diagonal line (perfect calibration) |
| Calibration-in-the-large | Intercept value (ideal = 0) |
| Calibration slope | Slope value (ideal = 1) |
| Confidence bands | Shaded regions or dashed lines around calibration curve |
| Decile markers | Points showing observed vs predicted by risk decile |
| Histogram | Distribution of predicted probabilities (often at bottom) |

### 1.5 Kaplan-Meier Curve

| Element | What to look for |
|---|---|
| Median survival | Time at which curve crosses 50% (for each group) |
| Number at risk | Table below the plot showing N at each time point |
| Log-rank p-value | Statistical comparison between curves |
| Separation points | Time points where curves begin to diverge or converge |
| Censoring marks | Tick marks or crosses on the curves |
| Curve labels | Group names and colour/line style coding |
| Axes | X-axis (time in months/years), Y-axis (survival probability 0-1 or 0-100%) |
| Confidence bands | Shaded regions if shown |
| Hazard ratio | HR with 95% CI if displayed |

### 1.6 Dose-Response Curve

| Element | What to look for |
|---|---|
| Shape | Linear, J-shaped, U-shaped, threshold, plateau, monotonic |
| Knots | Number and position of spline knots (if restricted cubic spline) |
| Reference dose | The dose used as the reference category (typically lowest or zero) |
| Confidence bands | 95% CI shading around the dose-response curve |
| Threshold | Dose at which the effect becomes statistically significant |
| Individual study points | Plotted study-level estimates with sizes proportional to weight |
| Axes | X-axis (dose units), Y-axis (relative risk, odds ratio, or hazard ratio) |

### 1.7 Network Geometry Plot

| Element | What to look for |
|---|---|
| Nodes | Count, labels (treatment names), size (proportional to sample size or study count) |
| Edges | Count, thickness (proportional to number of direct comparisons) |
| Direct comparisons | Which treatment pairs have head-to-head evidence |
| Disconnected components | Any isolated nodes or subnetworks |
| Node positioning | Layout pattern (circle, spring, hierarchical) |
| Multi-arm indicators | Studies comparing 3+ treatments shown as triangles or polygons |

### 1.8 Cost-Effectiveness Plane (CE Plane)

| Element | What to look for |
|---|---|
| Quadrant distribution | NE (more effective, more costly), SE (more effective, less costly = dominant), NW (less effective, more costly = dominated), SW (less effective, less costly) |
| ICER point | Central estimate point (incremental cost / incremental QALY) |
| Scatter points | Bootstrap or PSA iterations showing uncertainty |
| WTP line | Willingness-to-pay threshold line (slope = WTP per QALY) |
| Axes | X-axis (incremental effectiveness, QALYs), Y-axis (incremental cost) |
| Ellipse | 95% confidence ellipse if shown |
| Origin | Intersection at (0,0) representing the comparator |

### 1.9 Cost-Effectiveness Acceptability Curve (CEAC)

| Element | What to look for |
|---|---|
| Probability at WTP thresholds | Read probability of cost-effectiveness at key WTP values (e.g., $50,000/QALY, $100,000/QALY, $150,000/QALY) |
| Crossover points | WTP threshold where one strategy becomes preferred over another |
| Number of curves | Each curve represents a comparator strategy |
| Curve labels | Strategy names |
| Axes | X-axis (WTP threshold), Y-axis (probability cost-effective, 0-1) |
| Decision threshold markers | Vertical lines at commonly used WTP thresholds |

---

## 2. Figure Generation (Code-Based)

When the user requests a figure to be generated from data:

### 2.1 Environment Detection

```bash
which R
which python3
```

Run both commands via Bash to detect available environments.

### 2.2 If R or Python is Available

1. Identify the appropriate figure type from the user's request
2. Adapt the corresponding template from `templates/figures/` if one exists
3. Generate an R or Python script tailored to the user's data
4. Execute the script via Bash
5. Report the output file path to the user

**R packages commonly used:**
- `ggplot2` — general plotting
- `meta` / `metafor` — forest plots, funnel plots
- `survival` / `survminer` — Kaplan-Meier curves
- `dosresmeta` — dose-response curves
- `netmeta` — network plots
- `BCEA` / `hesim` — cost-effectiveness planes and CEACs

**Python packages commonly used:**
- `matplotlib` / `seaborn` — general plotting
- `forestplot` — forest plots
- `lifelines` — survival analysis
- `networkx` — network geometry

### 2.3 If Neither R nor Python is Available

1. Write the script to the `figures/` directory (create if needed)
2. Provide clear instructions for running the script:
   ```
   [FIGURE SCRIPT: figures/<filename>.R — requires R with packages: ggplot2, meta.
   Run with: Rscript figures/<filename>.R]
   ```
3. Do not attempt to install R or Python

### 2.4 AI-Based Figure Generation

AI-generated figures (e.g., using image generation models) are a v1.1 enhancement
and are not yet supported. When a user requests a figure that cannot be generated
with code:

```
[FIGURE NEEDED: <detailed description of the requested figure, including data
points, axes, labels, and visual elements>]
```

---

## 3. Caption Auto-Generation

Every figure and table caption follows a strict five-part structure. Captions must
be standalone — a reader must understand the figure without reading the main text.

### 3.1 Caption Structure

**1. Title line (bold)**
- Maximum 15 words
- States exactly what the figure shows
- Format: `**Figure N. <Title>**` or `**eFigure N. <Title>**`

**2. Body (2-5 sentences)**
- Describes the content of the figure
- Explains the methods used to generate it (if applicable)
- Tells the reader how to interpret key visual elements
- Uses past tense for study findings, present tense for general statements about the figure

**3. Abbreviations footnote**
- List all abbreviations used in the figure or caption
- Alphabetical order
- Format: `Abbreviations: AUC, area under the receiver operating curve; CI, confidence interval; HR, hazard ratio; OR, odds ratio.`

**4. Statistical notes (if applicable)**
- Explain visual symbols: "The diamond represents the pooled estimate."
- Explain lines: "The dashed vertical line indicates the null value of 1.0."
- Explain markers: "Asterisks (*) indicate p < 0.05; daggers (dagger) indicate p < 0.01."

**5. Numbering convention**
- Main figures: Figure 1, Figure 2, Figure 3, ...
- Supplementary figures: eFigure 1, eFigure 2, ...
- Main tables: Table 1, Table 2, ...
- Supplementary tables: eTable 1, eTable 2, ...
- Number sequentially in order of first mention in the text

### 3.2 Caption Rules

- UK English spelling (unless target journal requires US English)
- No citations unless citing a reporting guideline (e.g., PRISMA flow diagram)
- Never invent values — only describe what is visible in the figure or derivable from the data
- Supplementary items use the "e" prefix: eFigure, eTable
- Tables follow the same structure (title line, body, abbreviations, notes)

---

## 4. Workflow Integration

### When invoked by "interpret figure" or "read figure"
1. Read the uploaded image using Claude's multimodal capabilities
2. Identify the figure type (forest plot, PRISMA, funnel, etc.)
3. Apply the corresponding extraction guide from Section 1
4. Present extracted data in a structured format
5. Flag any elements that are unclear: `[UNCLEAR: <element> is not legible in the image]`

### When invoked by "generate figure"
1. Determine figure type from user request
2. Detect available tools (Section 2.1)
3. Generate and execute code (Section 2.2) or provide script (Section 2.3)
4. Auto-generate a caption (Section 3)

### When invoked by "write captions" or "figure caption"
1. For each figure/table in the manuscript:
   - Read the figure (if image provided) or use the description from the text
   - Generate a caption following the structure in Section 3.1
2. Number all captions sequentially
3. Verify all abbreviations are defined
4. Present captions for user review

---

## 5. Error Handling

| Error Condition | Action |
|---|---|
| Image upload fails or is unreadable | Ask user to re-upload in PNG, JPG, or PDF format |
| Figure type cannot be determined | Ask user to specify the figure type |
| R/Python script execution fails | Report the error, suggest package installation, save script for manual execution |
| Caption references data not in figure | Flag with `[PLEASE VERIFY: value not visible in figure]` |
| Supplementary numbering conflicts | Warn user and suggest renumbering |

---

## References

- `references/figure-types.md` — Detailed extraction templates and example captions for all 9 figure types
