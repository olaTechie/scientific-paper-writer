# /write-methods

Write the Methods section of a quantitative research paper, fully aligned with the appropriate reporting guideline (PRISMA 2020, STROBE, or TRIPOD+AI).

## Allowed Tools
Read, Write, Glob, Grep, WebSearch, WebFetch, Bash, Task

## Step 1 — Detect Study Type and Load Context

First, check for a PAPER_CONTEXT.md file in the workspace:

```
Glob: **/PAPER_CONTEXT.md
```

If found, read it silently and extract:
- `study_type` (e.g., systematic-review-meta-analysis, cohort, rct, prediction-model)
- `reporting_guideline` (if specified; otherwise infer from study_type)
- `database_names`, `search_dates`, `statistical_software`
- Any other methods-relevant fields

If PAPER_CONTEXT.md is not found, ask the user:

> "To write your Methods section I need a few details. Please answer as many as you can:
>
> 1. **Study type**: Systematic review/meta-analysis, RCT, cohort/cross-sectional/case-control, or prediction model?
> 2. **Reporting guideline**: PRISMA 2020, STROBE, TRIPOD, or other?
> 3. **Databases searched** (for SRMA): e.g., MEDLINE, Embase, CINAHL, Cochrane
> 4. **Search date range**: e.g., January 2000 – December 2024
> 5. **Eligibility criteria**: PICO/PECO/PICOTS elements (population, intervention/exposure, comparator, outcome, time, setting)
> 6. **Statistical software**: e.g., R (metafor), Stata, SAS, Python
> 7. **Ethics/registration**: Protocol registration (PROSPERO, OSF), ethics waiver (if applicable)
>
> Paste any existing methods notes, protocol text, or bullet points — I will expand and structure them."

## Step 2 — Select Reporting Guideline

Map study type to guideline automatically unless user specifies otherwise:

| Study Type | Primary Guideline | Checklist Source |
|---|---|---|
| Systematic review / meta-analysis | **PRISMA 2020** | Page et al. *BMJ* 2021 |
| Observational (cohort, case-control, cross-sectional) | **STROBE** | von Elm et al. *Lancet* 2007 |
| RCT | **CONSORT 2010** | Schulz et al. *BMJ* 2010 |
| Prediction / prognostic model | **TRIPOD+AI** | Collins et al. *BMJ* 2024 |
| Diagnostic accuracy | **STARD 2015** | Bossuyt et al. *BMJ* 2015 |
| Qualitative | **COREQ / SRQR** | Tong et al. 2007 |

Announce the selected guideline to the user before writing, e.g.:
> "I'll write your Methods aligned with **PRISMA 2020** (Page et al., *BMJ* 2021). Let me know if you'd like a different guideline."

## Step 3 — Read Any Source Materials

Before writing, use Glob to look for relevant files in the workspace:
```
**/protocol*.pdf, **/protocol*.docx, **/search_strategy*, **/PROSPERO*, **/methods_notes*
```

Read any that are found. Also check for figure/table files that might include:
- PRISMA flow diagram data (numbers at each stage)
- Forest plot images (to extract model details)
- Table 1 / characteristics tables (to inform population description)

## Step 4 — Write Section by Section

Write each subsection in sequence. **Pause after each subsection** and ask:
> "Does this look accurate? Any corrections before I continue to [next subsection]?"

Do not continue until the user confirms or provides edits.

---

### PRISMA 2020 — Systematic Review / Meta-Analysis

Write the following subsections in this order:

#### 4a. Protocol and Registration
- State PROSPERO/OSF registration number and date
- Note any deviations from protocol
- Template: "This systematic review and meta-analysis was conducted in accordance with the Preferred Reporting Items for Systematic Reviews and Meta-Analyses (PRISMA 2020) guidelines [REF]. The protocol was prospectively registered with PROSPERO (registration number: [ID], registered [DATE])."

#### 4b. Eligibility Criteria
- Explicitly state PICO/PICOTS elements
- Define: population (age, setting, clinical characteristics), intervention/exposure, comparator, outcomes (primary + secondary), study designs included/excluded, time period, language restrictions
- Template structure:
  - "Studies were eligible if they: (i) enrolled [POPULATION]; (ii) assessed [INTERVENTION/EXPOSURE]; (iii) compared [COMPARATOR]; and (iv) reported [OUTCOME]."
  - "Studies were excluded if they: [LIST]."

#### 4c. Information Sources and Search Strategy
- List all databases searched with provider (e.g., MEDLINE via PubMed, Embase via Elsevier, CINAHL via EBSCO)
- State search date range
- Mention grey literature sources (ClinicalTrials.gov, WHO ICTRP, reference lists, expert contact)
- State: "No date or language restrictions were applied" or specify restrictions
- Note: full search strategy to be presented in a supplementary appendix

#### 4d. Study Selection
- Describe screening process (title/abstract then full-text)
- State number of independent reviewers and conflict resolution process
- Mention software used (e.g., Rayyan, Covidence, Endnote)
- Template: "Two reviewers (initials) independently screened titles and abstracts, followed by full-text review of potentially eligible studies. Disagreements were resolved by discussion or adjudication by a third reviewer (initials). Study selection was managed using [SOFTWARE]."

#### 4e. Data Extraction
- List variables extracted (study characteristics, population, intervention/exposure, outcome data, effect estimates)
- State: extraction performed independently by two reviewers; discrepancies resolved by consensus
- Note any attempts to contact authors for missing data

#### 4f. Risk of Bias Assessment
- State tool used: ROBINS-I (observational), RoB 2 (RCTs), QUADAS-2 (diagnostic), Newcastle-Ottawa Scale (NOS)
- State domains assessed
- State: assessed independently by two reviewers

#### 4g. Effect Measures
- Define primary effect measure: OR, RR, HR, MD, SMD, vaccine effectiveness (VE%)
- If VE: state formula explicitly — VE = (1 − OR/RR/HR) × 100%
- State direction of effect (higher = better or worse)

#### 4h. Synthesis Methods
- State meta-analytic model: random-effects (DerSimonian-Ladd or REML), fixed-effects, or three-level
- State pooling method: inverse-variance weighting
- If three-level / multilevel: state nesting structure (e.g., effect sizes nested within studies) and software (metafor::rma.mv in R)
- Heterogeneity: Cochran's Q (p-value), I² statistic, τ², 95% prediction interval
- Small-sample correction if applicable: Knapp-Hartung (HKSJ) adjustment
- Subgroup analyses: pre-specified vs post-hoc, grouping variables, interaction test (χ² test for subgroup differences)
- Meta-regression: covariates, estimation method (REML), HKSJ standard errors
- Publication bias: Egger's test, funnel plot, trim-and-fill (if ≥10 studies)
- Sensitivity analyses: list each (e.g., exclude high-RoB studies, restrict to laboratory-confirmed outcomes)
- State software: "All analyses were performed in R version [X.X] (R Foundation for Statistical Computing, Vienna, Austria) using the metafor package version [X.X]."

---

### STROBE — Observational Study (Cohort / Case-Control / Cross-Sectional)

Write the following subsections:

#### 4a. Study Design and Setting
- Explicitly name design: "We conducted a [population-based / hospital-based] [prospective / retrospective] cohort study..."
- Setting: country, region, healthcare system, time period of data collection

#### 4b. Participants
- Cohort: eligibility criteria, source population, recruitment method, follow-up period
- Case-control: case definition and source, control selection and matching criteria, matching ratio
- Cross-sectional: sampling frame, survey period, response rate

#### 4c. Variables
- Outcome(s): primary and secondary, definition, measurement method, validation
- Exposure(s): definition, measurement, categorisation
- Covariates: list all, rationale for inclusion, how measured

#### 4d. Data Sources and Measurement
- Source of data: electronic health records, registry, survey, biobank
- Linkage method if applicable
- Validity/reliability of exposure and outcome measures

#### 4e. Bias
- Acknowledge potential sources: selection bias, information bias (recall, misclassification), confounding
- State steps taken to minimise each

#### 4f. Study Size and Statistical Power
- State planned or achieved sample size
- Power calculation if applicable

#### 4g. Statistical Methods
- Descriptive statistics: continuous (mean ± SD or median [IQR]), categorical (n, %)
- Primary analysis: regression model type (logistic, Cox, Poisson, linear), adjustment variables
- Handling of missing data: complete case, multiple imputation (state m= and method)
- Interaction/effect modification testing
- Sensitivity analyses
- Software

---

### TRIPOD+AI — Prediction / Prognostic Model

Write the following subsections:

#### 4a. Source of Data
- Data source name, type (EHR, registry, trial, claims), country, time period
- Linkage and data cleaning procedures

#### 4b. Participants
- Inclusion/exclusion criteria
- Start of follow-up (index date definition)
- Outcome definition and ascertainment; competing risks if applicable

#### 4c. Predictors
- List candidate predictors
- Definition, measurement, timing relative to index date
- Any transformations (e.g., log, categorisation, splines)

#### 4d. Sample Size
- State n events / n total
- Events-per-variable (EPV) or events-per-predictor parameter (EPP) for regression; training set size for ML

#### 4e. Missing Data
- Proportion missing per predictor
- Handling method: complete case, single/multiple imputation (state package and m=)

#### 4f. Model Development
- Model type: logistic regression, Cox regression, random forest, XGBoost, neural network, etc.
- Variable selection strategy: full-model, stepwise (specify direction and criterion), LASSO (λ selection method), pre-specified
- Shrinkage/regularisation if applicable
- For ML: hyperparameter tuning strategy, cross-validation folds

#### 4g. Model Performance
- Discrimination: C-statistic / AUC (with 95% CI), Harrell's C for survival
- Calibration: calibration plot, Brier score, calibration-in-the-large, E/O ratio
- Decision curve analysis if applicable

#### 4h. Internal Validation
- Bootstrap resampling (state B=), cross-validation, or temporal split
- Optimism correction for shrinkage

#### 4i. External Validation (if applicable)
- Validation dataset description
- Performance metrics in validation set

#### 4j. Software and Reproducibility
- Software, packages, version numbers
- Code availability statement

---

## Step 5 — Formatting Rules

- Write in **past tense** (Methods describes what was done)
- Use **passive voice** where conventional for the field; active voice is acceptable when clearer
- Use **precise quantitative language**: do not write "several databases" — write the exact database names
- Flag any value you cannot verify with: `[PLEASE VERIFY: ___]`
- Use **Vancouver-style in-text references**: [1], [2] etc., sequential from 1 unless user specifies the Methods section continues numbering from another section
- Do **not** present results in the Methods
- For software citations: cite the package/software itself, not just the language

## Step 6 — Reporting Guideline Checklist Reminder

At the end of the complete Methods section, output a brief checklist:

```
REPORTING CHECKLIST — [GUIDELINE NAME]
✅ Item satisfied   ⚠️ Partially addressed   ❌ Missing

[List each mandatory item from the relevant guideline with status]
```

Flag any items that could not be addressed due to missing information, and prompt the user to supply the details.

## Step 7 — Output

Output the complete Methods section as clean Markdown with level-3 headers (`###`) for each subsection. Offer to save to a file:

> "Shall I save this to `Methods_Section.md` in your workspace folder?"

If yes, write the file using the Write tool.
