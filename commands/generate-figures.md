---
allowed-tools: Read, Write, Glob, Grep, Bash, WebSearch, WebFetch
argument-hint: "[type] e.g. forest-plot, prisma-flow, funnel-plot, network-diagram, dose-response-curve, ceac, calibration-plot, kaplan-meier"
description: "Generate publication-quality figures using R or Python scripts"
---

# /generate-figures

## Step 1: Load visual engine

Read `skills/visual/SKILL.md` for figure generation guidance and supported types. Read any relevant files in `skills/visual/references/` for figure type-specific templates and styling rules.

## Step 2: Determine figure type

If provided as argument (`$ARGUMENTS`), use that. Otherwise, ask the user:

- `forest-plot` — Forest plot showing study-level and pooled estimates
- `prisma-flow` — PRISMA 2020 flow diagram
- `funnel-plot` — Funnel plot for publication bias assessment
- `network-diagram` — Network geometry for NMA
- `dose-response-curve` — Dose-response relationship with splines
- `ceac` — Cost-effectiveness acceptability curve
- `calibration-plot` — Calibration plot for prediction models
- `kaplan-meier` — Kaplan-Meier survival curves

## Step 3: Check dependencies

Run via Bash to detect available tools:
```
which R && echo "R available" || echo "R not found"
which python3 && echo "Python available" || echo "Python not found"
```

Report which tools are available. If neither R nor Python is installed, warn the user that the script will be generated but cannot be executed automatically.

## Step 4: Gather data

Ask the user for the data needed to generate the figure. Read any source files, data files, or analysis output provided.

Data requirements by figure type:
- **Forest plot**: study names, effect estimates, standard errors or confidence intervals, subgroup labels (if applicable)
- **PRISMA flow**: counts at each stage (identified, screened, eligible, included, reasons for exclusion)
- **Funnel plot**: effect estimates and standard errors for each study
- **Network diagram**: treatment names and number of direct comparisons between each pair
- **Dose-response curve**: dose levels, effect estimates, standard errors, reference dose
- **CEAC**: willingness-to-pay thresholds and probability of cost-effectiveness for each strategy
- **Calibration plot**: predicted probabilities and observed event rates (by decile or continuous)
- **Kaplan-Meier**: time-to-event data or survival table with number at risk

## Step 5: Generate figure

**If R is available and figure type has a template:**
1. Read the template script from `templates/figures/` (e.g., `templates/figures/forest-plot.R`)
2. Adapt the script with the user's data (modify the data section, labels, formatting)
3. Write the adapted script to the user's figures folder
4. Execute via Bash: `Rscript <path-to-script>.R`
5. Verify the output file exists: `ls -la <output-path>`

**If Python is available but R is not:**
1. Write a Python equivalent using matplotlib/seaborn or plotnine
2. Execute via Bash: `python3 <path-to-script>.py`
3. Verify the output file exists

**If neither R nor Python is available:**
1. Write the R script to the figures folder
2. Add a header comment: `# To generate this figure, run: Rscript <script-name>.R`
3. List required packages with install commands
4. Flag: `[FIGURE NEEDED: <description>. Script saved to <path>. Install R and required packages to generate.]`

**If no template exists for this figure type:**
1. Write a custom R or Python script from scratch based on the visual engine's guidance
2. Follow the same execution/fallback logic above
3. Use publication-quality defaults: white background, minimal gridlines, Times New Roman or Arial font, 300+ DPI

## Step 6: Generate caption

After the figure is created (or script is saved), draft a publication-ready caption using the visual engine's caption rules:

1. **Title line** (bold, ≤15 words): states exactly what is shown
2. **Body** (2-5 sentences): describes the content, methods used to generate it, and how to interpret it — standalone without requiring the main text
3. **Abbreviations footnote**: define all abbreviations in alphabetical order
4. **Statistical notes**: explain any symbols (e.g., diamond = pooled estimate, dashed line = null effect, error bars = 95% CI)

Present the caption to the user for confirmation.

## Step 7: Save output

Write the figure file (if generated) and caption to the user's figures folder. Report what was created:
- Script file path and how to re-run it
- Output figure file path (if execution succeeded)
- Caption text
- Any required packages that need to be installed
