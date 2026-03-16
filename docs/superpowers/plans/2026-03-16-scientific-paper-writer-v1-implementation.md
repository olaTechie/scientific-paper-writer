# Scientific Paper Writer v1.0.0 Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rewrite the scientific-paper-writer Claude plugin from v0.2.0 to v1.0.0 with modular architecture, expanded study types, multi-source citations, visual engine, LaTeX/DOCX export, and GitHub distribution.

**Architecture:** Modular skill-based plugin with separated concerns: core engine (shared conventions), 11 study-type modules, citation engine (4-source fallback), visual engine (interpretation + code-gen), output engine (Markdown/LaTeX/DOCX), and optional integrations. Commands are thin workflow dispatchers that route to skills.

**Tech Stack:** Claude plugin (Markdown commands + skills), JSON config, LaTeX templates, R scripts, Bash build script

**Spec:** `docs/superpowers/specs/2026-03-16-scientific-paper-writer-v1-design.md`

**Parallelism note:** Chunks 2, 3, and 4 are independent of each other (they only depend on Chunk 1). If multiple agents or engineers are available, these chunks can be executed in parallel.

---

## Chunk 1: Foundation — Plugin Config, Hooks, Core Engine

### Task 1: Clean up old structure and create directory tree

**Files:**
- Modify: `.claude-plugin/plugin.json`
- Modify: `hooks/hooks.json`
- Modify: `.gitignore`
- Create: `build-release.sh`
- Create: `LICENSE`
- Create: directory tree for all new modules

- [ ] **Step 0: Initialize git repo**

The project directory is not currently a git repository. Initialize it first so all subsequent task commits work.

```bash
git init
git add -A
git commit -m "chore: initial commit of scientific-paper-writer v0.2.0"
```

- [ ] **Step 1: Create all new directories**

```bash
# Study-type modules
mkdir -p skills/core/references
mkdir -p skills/study-types/systematic-review/references
mkdir -p skills/study-types/network-meta-analysis/references
mkdir -p skills/study-types/ipd-meta-analysis/references
mkdir -p skills/study-types/dose-response/references
mkdir -p skills/study-types/bayesian-meta-analysis/references
mkdir -p skills/study-types/rct/references
mkdir -p skills/study-types/observational/references
mkdir -p skills/study-types/economic-evaluation/references
mkdir -p skills/study-types/prediction-model/references
mkdir -p skills/study-types/diagnostic-accuracy/references
mkdir -p skills/study-types/qualitative/references
# Engine modules
mkdir -p skills/citations/references
mkdir -p skills/visual/references
mkdir -p skills/output/references
mkdir -p skills/integrations/references
# Templates
mkdir -p templates/latex
mkdir -p templates/docx
mkdir -p templates/figures
```

Run: `find skills/ templates/ -type d | sort`
Expected: All directories listed

- [ ] **Step 2: Update plugin.json to v1.0.0**

Replace `.claude-plugin/plugin.json` with:

```json
{
  "name": "scientific-paper-writer",
  "version": "1.0.0",
  "description": "Modular academic manuscript writing assistant for quantitative research. Supports 10 study types (systematic reviews, network/IPD/dose-response/Bayesian meta-analyses, RCTs, cohort studies, economic evaluations, prediction models, diagnostic accuracy, qualitative). Multi-source citation verification (PubMed, CrossRef, Semantic Scholar, bioRxiv). Figure interpretation and generation. LaTeX and DOCX export with venue-specific templates. Guides researchers through Methods, Results, Discussion, Abstract, Introduction, Captions, and References in expert writing order.",
  "author": {
    "name": "Ola"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/olaTechie/scientific-paper-writer"
  },
  "keywords": [
    "scientific-writing",
    "systematic-review",
    "meta-analysis",
    "network-meta-analysis",
    "bayesian",
    "dose-response",
    "economic-evaluation",
    "research",
    "academic",
    "manuscript",
    "latex",
    "docx",
    "citation-verification"
  ],
  "license": "MIT"
}
```

- [ ] **Step 3: Update hooks.json**

Replace `hooks/hooks.json` with:

```json
{
  "SessionStart": [
    {
      "matcher": "",
      "hooks": [
        {
          "type": "prompt",
          "prompt": "At the start of this session, check if a file named PAPER_CONTEXT.md exists in the user's working folder. If it exists, read it silently and use the study details (study type, primary outcome, target journal, citation style, output format, folder structure, integration preferences, figure generation preferences) to pre-load context for all writing commands. Do not announce this to the user unless they ask — simply use the context when they invoke writing commands. If the file does not exist, do nothing.",
          "timeout": 15
        }
      ]
    }
  ]
}
```

- [ ] **Step 4: Update .gitignore**

Replace `.gitignore` with:

```
.DS_Store
*.plugin
__pycache__/
*.pyc
.env
node_modules/
manuscript/
dist/
```

- [ ] **Step 5: Create LICENSE (MIT)**

Create `LICENSE` with MIT license, copyright "2024-2026 Ola".

- [ ] **Step 6: Create build-release.sh**

Create `build-release.sh` with:

```bash
#!/usr/bin/env bash
set -euo pipefail

VERSION=$(grep '"version"' .claude-plugin/plugin.json | sed 's/.*: "\(.*\)".*/\1/')
RELEASE_NAME="scientific-paper-writer-v${VERSION}"
DIST_DIR="dist"

echo "Building ${RELEASE_NAME}..."

rm -rf "${DIST_DIR}"
mkdir -p "${DIST_DIR}/scientific-paper-writer"

rsync -a \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --exclude='dist' \
  --exclude='docs' \
  --exclude='manuscript' \
  --exclude='node_modules' \
  . "${DIST_DIR}/scientific-paper-writer/"

cd "${DIST_DIR}"
zip -r "${RELEASE_NAME}.zip" scientific-paper-writer/
cd ..

echo "Release built: ${DIST_DIR}/${RELEASE_NAME}.zip"
```

Run: `chmod +x build-release.sh`

- [ ] **Step 7: Verify structure**

Run: `ls -la .claude-plugin/plugin.json hooks/hooks.json .gitignore LICENSE build-release.sh`
Expected: All files exist

- [ ] **Step 8: Commit foundation files**

```bash
git add .claude-plugin/plugin.json hooks/hooks.json .gitignore LICENSE build-release.sh
git commit -m "chore: update plugin config to v1.0.0, add license and build script"
```

---

### Task 2: Create Core Engine skill

**Files:**
- Create: `skills/core/SKILL.md`
- Create: `skills/core/references/prose-conventions.md`
- Create: `skills/core/references/verification-flags.md`

- [ ] **Step 1: Write skills/core/SKILL.md**

This is the shared foundation loaded by all commands. Content:

```markdown
---
name: core-engine
description: Shared conventions, precision rules, verification flags, and study-type routing for all scientific paper writing commands
version: 1.0.0
triggers:
  - "write methods"
  - "write results"
  - "write discussion"
  - "write frontmatter"
  - "write abstract"
  - "write introduction"
  - "write captions"
  - "write references"
  - "generate figures"
  - "export manuscript"
---

# Core Engine — Shared Conventions

This skill is loaded by every writing command. It defines universal rules that all study-type modules and engine skills inherit.

## No-Fabrication Guarantee

**Every number in the manuscript must be extracted directly from source materials.** Never estimate, round, paraphrase, or infer numerical values. If a value cannot be found in the source:

- Flag with `[PLEASE VERIFY: ___]` for missing procedural details
- Flag with `[UNCLEAR IN SOURCE — please verify]` for ambiguous data values
- Flag with `[Citation needed — unable to verify]` for unverifiable references

See `references/verification-flags.md` for the complete flag taxonomy.

## Prose Conventions

See `references/prose-conventions.md` for the complete style guide. Key rules:

- **Tense:** Past tense for Methods and Results ("was estimated", "were included"). Present tense for established knowledge ("diabetes is associated with").
- **Voice:** Passive voice acceptable and common in scientific writing. Active voice for clarity where it aids readability ("We conducted" is acceptable).
- **Language:** UK English spelling throughout (organisation, randomised, analysed, behaviour, colour, centre, programme).
- **Format:** Full paragraphs only — never bullet points in final manuscript output. Bullet points are acceptable in checklists and internal guidance only.
- **Precision:** Never use vague quantifiers ("several", "various", "many", "some") when an exact number exists or should exist. Every statistical finding must include: point estimate + 95% CI + p-value + sample size.
- **Quantification:**
  - Percentages: 1 decimal place (67.8%)
  - Odds ratios / hazard ratios / risk ratios: 2 decimal places (1.43)
  - P-values: 2–3 decimal places (p = 0.061, p = 0.91, p < 0.001 only when truly < 0.001)
  - Never: p < 0.05, p = NS, p = 0.000

## Workflow Protocol

1. **Read source materials first** — before writing any section, read all relevant source files (protocol, data extractions, figures, tables, analysis output)
2. **Pause after each subsection** — present the drafted subsection to the user for confirmation before proceeding to the next
3. **Cross-reference** — all figures and tables mentioned inline: (Figure 1), (Table 2)
4. **No external citations in Results** — the Results section reports findings only; citations belong in Discussion and Introduction

## Study-Type Routing

When a writing command is invoked:

1. Check if study type is pre-loaded from `PAPER_CONTEXT.md` (via SessionStart hook)
2. If not pre-loaded, ask the user: "What type of study is this?" and present the options:
   - `systematic-review` — Systematic Review / Pairwise Meta-Analysis (PRISMA 2020)
   - `network-meta-analysis` — Network Meta-Analysis (PRISMA-NMA)
   - `ipd-meta-analysis` — Individual Patient Data Meta-Analysis (PRISMA-IPD)
   - `dose-response` — Dose-Response Meta-Analysis
   - `bayesian-meta-analysis` — Bayesian Meta-Analysis
   - `rct` — Randomised Controlled Trial (CONSORT 2010)
   - `observational` — Observational: Cohort, Case-Control, Cross-Sectional (STROBE)
   - `economic-evaluation` — Economic Evaluation: CEA/CUA/CBA (CHEERS 2022)
   - `prediction-model` — Prediction/Prognostic Model or Generic ML (TRIPOD+AI)
   - `diagnostic-accuracy` — Diagnostic Accuracy Study (STARD 2015)
   - `qualitative` — Qualitative / Mixed Methods (COREQ/SRQR)
3. Once determined, read the corresponding `skills/study-types/<identifier>/SKILL.md` and its `references/` files
4. Apply the core conventions from this file throughout

## Reporting Guideline Mapping

| Study Type Identifier | Reporting Guideline | Key Reference |
|---|---|---|
| `systematic-review` | PRISMA 2020 | Page et al., *BMJ* 2021;372:n71 |
| `network-meta-analysis` | PRISMA-NMA | Hutton et al., *Ann Intern Med* 2015;162:777–784 |
| `ipd-meta-analysis` | PRISMA-IPD | Stewart et al., *BMJ* 2015;350:h1765 |
| `dose-response` | — | Berlin et al., *Stat Med* 2002 |
| `bayesian-meta-analysis` | — | Röver, *J Stat Softw* 2020 |
| `rct` | CONSORT 2010 | Schulz et al., *BMJ* 2010;340:c332 |
| `observational` | STROBE | von Elm et al., *Lancet* 2007;370:1453–1457 |
| `economic-evaluation` | CHEERS 2022 | Husereau et al., *Value Health* 2022;25:3–9 |
| `prediction-model` | TRIPOD+AI | Collins et al., *BMJ* 2024;385:e078378 |
| `diagnostic-accuracy` | STARD 2015 | Bossuyt et al., *BMJ* 2015;351:h5527 |
| `qualitative` | COREQ / SRQR | Tong et al., *Int J Qual Health Care* 2007 |

## Risk of Bias Tools

| Study Design | Recommended Tool |
|---|---|
| RCTs | Cochrane RoB 2 |
| Non-randomised interventions | ROBINS-I |
| Observational (aetiology) | Newcastle-Ottawa Scale (NOS) |
| Diagnostic/prognostic | QUADAS-2 |
| Prevalence studies | JBI prevalence tool |
| Prediction models | PROBAST |

## Expert Writing Order

Manuscripts are written in expert order (not reading order):

1. **Methods** — written first (what you did)
2. **Results** — written second (what you found)
3. **Discussion** — written third (what it means)
4. **Abstract** — written after body (summarises finished work)
5. **Introduction** — written after body (frames the completed story)
6. **Title** — written last (distils the finished paper)
7. **Captions** — written alongside or after Results
8. **References** — verified and formatted last
```

- [ ] **Step 2: Write skills/core/references/prose-conventions.md**

```markdown
# Prose Conventions for Scientific Manuscripts

## Tense

| Section | Tense | Example |
|---|---|---|
| Methods | Past | "Studies were screened independently by two reviewers" |
| Results | Past | "The pooled estimate was 0.72 (95% CI: 0.58, 0.89)" |
| Discussion — own findings | Past | "This review found that..." |
| Discussion — established knowledge | Present | "Influenza vaccination is recommended annually" |
| Discussion — prior literature | Past | "Smith et al. reported a similar effect" |
| Introduction — burden | Present | "Cardiovascular disease remains the leading cause..." |
| Introduction — gap | Present perfect | "Few studies have examined..." |
| Captions — methods | Past | "Data were pooled using random-effects meta-analysis" |
| Captions — descriptions | Present | "The forest plot shows individual study estimates" |

## Voice

- Passive voice is standard and acceptable: "Data were extracted by two reviewers"
- Active voice ("We") is acceptable and increasingly common: "We conducted a systematic review"
- Be consistent within a section — do not alternate randomly
- Avoid first person in Results

## Language

UK English spelling throughout:
- organis**a**tion (not organization)
- randomi**s**ed (not randomized)
- analy**s**ed (not analyzed)
- behavi**ou**r (not behavior)
- col**ou**r (not color)
- cent**re** (not center)
- programme (not program, except for computer programs)
- haemoglobin (not hemoglobin)
- oestrogen (not estrogen)
- diarrh**oe**a (not diarrhea)
- paediatric (not pediatric)
- anaemia (not anemia)
- tumour (not tumor)
- favour (not favor)
- labour (not labor)
- modelling (not modeling)
- travelled (not traveled)
- catalogue (not catalog)
- defence (not defense)
- licence (noun) / license (verb)
- practise (verb) / practice (noun)

## Precision

| Instead of | Write |
|---|---|
| "several studies" | "seven studies" or "the included studies (k = 7)" |
| "a large number of participants" | "14 382 participants" |
| "the effect was significant" | "the pooled OR was 1.43 (95% CI: 1.12, 1.83; p = 0.004)" |
| "results were consistent" | "sensitivity analyses yielded pooled ORs ranging from 1.38 to 1.51" |
| "there was moderate heterogeneity" | "heterogeneity was moderate (I² = 58%; 95% CI: 24%, 78%)" |
| "most studies were from" | "eight of 12 studies (67%) were conducted in" |

## Formatting

- **Paragraphs only** in final manuscript — never bullet points
- **Subsection headings** as `##` in Markdown
- **Cross-references:** (Figure 1), (Table 2), (eFigure 3), (eTable 4)
- **Supplementary items:** prefix with "e" — eFigure, eTable, eAppendix
- **Abbreviations:** Define on first use in each section. Do not abbreviate terms used fewer than 3 times.
- **Numbers:** Spell out one through nine in running text unless paired with a unit (3 mg, 5 years). Use numerals for 10 and above, all statistical values, and all values in Results.
- **Page ranges:** Use en-dash (–), not hyphen (-): pp. 1234–1245

## Common Errors

1. "Data was" → "Data **were**" (data is plural)
2. "which" vs "that" — use "that" for restrictive clauses, "which" for non-restrictive
3. "compared to" (similarities) vs "compared with" (differences) — use "compared with" in Results
4. "significant" — reserve for statistical significance only; use "substantial", "important", or "notable" for clinical significance
5. "prove" — studies do not prove; they "demonstrate", "suggest", "indicate", or "show"
6. "novel" / "unique" / "first" — avoid unless strictly true and verifiable
7. "interestingly" / "notably" / "importantly" — remove; let the data speak
```

- [ ] **Step 3: Write skills/core/references/verification-flags.md**

```markdown
# Verification Flags

## Flag Types

### [PLEASE VERIFY: ___]

**Use when:** A procedural detail is missing from the source materials but is needed for the Methods section.

**Examples:**
- `[PLEASE VERIFY: number of reviewers who performed screening]`
- `[PLEASE VERIFY: specific version of R used for analysis]`
- `[PLEASE VERIFY: date range of database searches]`
- `[PLEASE VERIFY: PROSPERO registration number]`
- `[PLEASE VERIFY: conflict resolution method for disagreements]`

**Resolution:** The user fills in the detail from their records.

### [UNCLEAR IN SOURCE — please verify]

**Use when:** A numerical value or data point is present in source materials but is ambiguous, partially legible, or potentially inconsistent.

**Examples:**
- `[UNCLEAR IN SOURCE — please verify: the forest plot shows OR 1.43 but the text states OR 1.34]`
- `[UNCLEAR IN SOURCE — please verify: I² appears to be 58% from the figure but is not stated in text]`
- `[UNCLEAR IN SOURCE — please verify: sample size differs between Table 1 (N=1204) and flow diagram (N=1198)]`

**Resolution:** The user checks the original data and confirms the correct value.

### [Citation needed — unable to verify]

**Use when:** A citation is referenced in the manuscript but cannot be verified through PubMed, CrossRef, Semantic Scholar, or bioRxiv/medRxiv.

**Examples:**
- `[Citation needed — unable to verify in PubMed, CrossRef, Semantic Scholar, or bioRxiv]`
- `[UNVERIFIED — please check manually]`

**Resolution:** The user manually verifies the citation details (authors, title, journal, year, DOI).

### [FIGURE NEEDED: description]

**Use when:** A figure should be generated but the required tools (R/Python) are not available, or the figure type is not supported by the template scripts.

**Examples:**
- `[FIGURE NEEDED: forest plot showing pooled OR with 95% CI for 12 included studies]`
- `[FIGURE NEEDED: network geometry diagram with 8 nodes and 15 direct comparisons]`
- `[FIGURE NEEDED: dose-response curve with restricted cubic splines, 3 knots]`

**Resolution:** The user generates the figure using the provided R/Python script or creates it manually.

## Flag Placement

- Place flags **inline** where the missing information would appear
- Use flags in **any section** — Methods, Results, Discussion, Captions
- **Never silently omit** information — always flag what's missing
- **Never fabricate** a value to avoid placing a flag
```

- [ ] **Step 4: Verify core skill files**

Run: `ls -la skills/core/SKILL.md skills/core/references/prose-conventions.md skills/core/references/verification-flags.md`
Expected: All 3 files exist

- [ ] **Step 5: Commit core engine**

```bash
git add skills/core/
git commit -m "feat: add core engine skill with prose conventions and verification flags"
```

---

## Chunk 2: Existing Study-Type Modules (Migrate from v0.2.0)

### Task 3: Create systematic-review module

**Files:**
- Create: `skills/study-types/systematic-review/SKILL.md`
- Create: `skills/study-types/systematic-review/references/prisma-checklist.md`

**Source content to migrate:**
- `skills/methods-writing/SKILL.md` — PRISMA 2020 subsection guidance (lines covering SRMA)
- `skills/methods-writing/references/reporting-guidelines.md` — PRISMA checklist items, GRADE, software citations
- `skills/quantitative-results-writing/SKILL.md` — SRMA results conventions
- `skills/quantitative-results-writing/references/statistical-reporting.md` — SRMA reporting checklist
- `skills/discussion-writing/SKILL.md` — SRMA discussion framework
- `skills/discussion-writing/references/discussion-frameworks.md` — SRMA paragraph templates

- [ ] **Step 1: Write skills/study-types/systematic-review/SKILL.md**

This file must contain ALL the following migrated from v0.2.0, organised under 5 standard sections:

**Section 1 — Reporting Guideline:** PRISMA 2020 (Page et al., BMJ 2021;372:n71). State that this module governs systematic reviews and pairwise meta-analyses.

**Section 2 — Methods Subsections (canonical order):**
1. Protocol and Registration — PROSPERO/OSF, registration number, amendments
2. Eligibility Criteria — PICO/PICOTS elements (population, intervention, comparator, outcome, time, study design)
3. Information Sources and Search Strategy — databases (MEDLINE via PubMed, Embase, CENTRAL, etc.), grey literature, dates, full strategy in supplement
4. Study Selection — # reviewers, software (Rayyan, Covidence), pilot, kappa, conflict resolution
5. Data Extraction — form description, pilot, duplicate extraction, variables extracted
6. Risk of Bias Assessment — RoB 2 for RCTs, ROBINS-I for non-randomised, NOS for observational. Domain-level + overall judgement.
7. Effect Measures — primary effect measure (OR, RR, HR, MD, SMD), VE formula if applicable: VE% = (1 − θ) × 100%
8. Synthesis Methods — model (random-effects, REML/DL), HKSJ adjustment, heterogeneity (Q, I², τ², 95% PI), subgroup (pre-specified, χ² interaction test), meta-regression (REML + HKSJ), publication bias (Egger's, funnel, trim-and-fill if ≥10), sensitivity analyses

Include template sentences from existing methods-writing SKILL.md (e.g., "We conducted a systematic review...", "Studies were eligible if they enrolled...", "Data were extracted independently by two reviewers...").

**v1.0.0 additions:** Three-level meta-analysis (`rma.mv` in metafor), robust variance estimation, dose-response submodule cross-reference.

**Section 3 — Results Conventions:**
- Subsection order: Study Selection → Characteristics → Risk of Bias → Primary Analysis → Sensitivity → Subgroup → Secondary/Exploratory
- Always report: pooled point estimate + 95% CI + method
- Heterogeneity: always report all four (Q with df and p, I² with 95% CI, τ² with 95% CI, 95% PI)
- VE: state direction, distinguish absolute from relative
- Waning: slope, p-value, predicted VE at key time points, interpolated vs extrapolated
- Sensitivity: each alternative with own CI + I²
- Subgroup: test for subgroup difference (χ², df, p)
- No citations in Results

**Section 4 — Discussion Considerations:**
- Main Findings paragraph template: "This systematic review and meta-analysis of [N] studies... found that [intervention] was associated with [outcome] of [estimate] (95% CI: [X], [X]; I² = [X]%; 95% PI: [X] to [X])."
- Literature comparison: search PubMed for prior SRMAs, state if consistent/divergent/extends
- Typical strengths: pre-registered protocol, multi-database search, PRISMA adherence, HKSJ adjustment, three-level model, 95% PI reporting
- Typical limitations: small k, temporal heterogeneity, healthy vaccinee bias, single-study subgroups, geographical restriction

**Section 5 — Software Citations:**
- R Core Team citation
- metafor package (Viechtbauer W, JSS 2010)
- Rayyan (Ouzzani et al., Syst Rev 2016)
- Covidence citation
- RevMan citation
- PROSPERO registration template sentence
- OSF registration template sentence

- [ ] **Step 2: Write skills/study-types/systematic-review/references/prisma-checklist.md**

Migrate full PRISMA 2020 checklist from `skills/methods-writing/references/reporting-guidelines.md` (Methods items 4a–4k, Registration items 2a–2c, Synthesis sub-items). Also include GRADE certainty of evidence section (5 domains, 4 levels).

- [ ] **Step 3: Verify files exist**

Run: `wc -l skills/study-types/systematic-review/SKILL.md skills/study-types/systematic-review/references/prisma-checklist.md`
Expected: Both files exist, SKILL.md should be ≥200 lines (at least as detailed as v0.2.0 methods-writing SKILL.md for SRMA content)

- [ ] **Step 4: Commit**

```bash
git add skills/study-types/systematic-review/
git commit -m "feat: add systematic-review study-type module (PRISMA 2020)"
```

---

### Task 4: Create observational module

**Files:**
- Create: `skills/study-types/observational/SKILL.md`
- Create: `skills/study-types/observational/references/strobe-checklist.md`

**Source content:** Migrate STROBE guidance from existing methods-writing SKILL.md + reporting-guidelines.md, cohort results conventions from quantitative-results-writing SKILL.md + statistical-reporting.md, cohort discussion template from discussion-frameworks.md.

- [ ] **Step 1: Write skills/study-types/observational/SKILL.md**

**Section 1 — Reporting Guideline:** STROBE (von Elm et al., Lancet 2007;370:1453–1457). Covers cohort, case-control, and cross-sectional designs.

**Section 2 — Methods Subsections (7 subsections from v0.2.0):**
1. Study Design and Setting — state design + rationale, locations, dates, recruitment, follow-up
2. Participants — eligibility, sources, selection methods. Case-control: case/control definition separately. Cohort: follow-up description.
3. Variables — outcome definition, exposure definition, potential confounders, effect modifiers
4. Data Sources and Measurement — describe data sources, validation methods, assessment tools
5. Bias — efforts to address potential sources of bias
6. Study Size — how determined, power considerations
7. Statistical Methods — regression model type (logistic, Cox, Poisson, linear), adjustment variables + rationale, missing data approach, interaction/effect modification testing, sensitivity analyses, software + version

**v1.0.0 additions:** Target trial emulation framework (state target trial elements: eligibility, treatment strategy, outcome, causal contrast, follow-up). E-value for unmeasured confounding (state formula and interpretation).

**Section 3 — Results Conventions:**
- Subsection order: Population → Characteristics → Primary Association → Sensitivity → Subgroup
- Crude and adjusted estimates reported separately
- Name all covariates in final adjusted model
- Propensity scores: report SMD before and after matching/weighting
- Effect estimates: HR (time-to-event), OR (binary), RR (cohort), MD (continuous)
- State primary = adjusted, secondary = crude

**Section 4 — Discussion Considerations:**
- Paragraph template: "In this [cohort/case-control] study of [N], [exposure] was associated with [outcome] (adjusted [OR/HR/RR]: [estimate]; 95% CI), after adjustment for [confounders]."
- Typical strengths: large sample size, validated exposure measurement, long follow-up, comprehensive confounding adjustment
- Typical limitations: residual confounding, healthy vaccinee/user bias, selection bias, measurement error, generalisability

**Section 5 — Software Citations:** R, Stata, SAS as appropriate

- [ ] **Step 2: Write skills/study-types/observational/references/strobe-checklist.md**

Migrate full STROBE checklist from reporting-guidelines.md (design-specific versions for cohort, case-control, cross-sectional). Include Statistical Methods Checklist (Item 12 expanded).

- [ ] **Step 3: Commit**

```bash
git add skills/study-types/observational/
git commit -m "feat: add observational study-type module (STROBE)"
```

---

### Task 5: Create RCT module

**Files:**
- Create: `skills/study-types/rct/SKILL.md`
- Create: `skills/study-types/rct/references/consort-checklist.md`

- [ ] **Step 1: Write skills/study-types/rct/SKILL.md**

**Section 1 — Reporting Guideline:** CONSORT 2010 (Schulz et al., BMJ 2010;340:c332).

**Section 2 — Methods Subsections (new detailed prose guidance — was checklist-only in v0.2.0):**
1. Trial Design — parallel, factorial, crossover, cluster; allocation ratio; important changes after commencement
2. Participants — eligibility criteria, settings, locations
3. Interventions — per group, sufficient detail for replication, dosing, frequency, duration
4. Outcomes — pre-specified primary + secondary, how and when assessed; changes after commencement
5. Sample Size — determination method, target, interim analyses, stopping guidelines
6. Randomisation — sequence generation (computer-generated, block size), allocation concealment (sealed envelopes, central), implementation (who generated, enrolled, assigned)
7. Blinding — who was blinded (participants, care providers, assessors), similarity of interventions
8. Statistical Methods — primary + secondary outcome analysis, subgroup and adjusted analyses, ITT definition

**v1.0.0 additions:** Adaptive designs (pre-planned modifications based on interim data), platform trials (master protocol, multiple arms, perpetual enrollment), estimand framework (ICH E9 R1: treatment policy, hypothetical, composite, while-on-treatment, principal stratum).

**Section 3 — Results Conventions:**
- Subsection order: Flow → Baseline → Primary Outcome → Secondary Outcomes → Subgroup → Adverse Events
- Primary = ITT analysis; secondary = per-protocol
- Include absolute + relative risk estimates
- NNT = 1 / ARR where appropriate
- Time-to-event: log-rank test + median follow-up
- CONSORT flow: randomised N, allocated N, received/not received, lost to follow-up, discontinued, analysed (ITT and per-protocol)

**Section 4 — Discussion Considerations:**
- Paragraph template: "In this randomised controlled trial of [N] participants followed for [median X], [intervention] [significantly/not significantly] reduced [outcome] vs [comparator] ([estimate]; 95% CI; p-value). ARR [X]% (95% CI), NNT [X]."
- Typical strengths: randomisation, blinding, pre-registration, ITT analysis, adequate power
- Typical limitations: single-centre, short follow-up, open-label, per-protocol attrition, generalisability

**Section 5 — Software Citations:** As appropriate

- [ ] **Step 2: Write skills/study-types/rct/references/consort-checklist.md**

Migrate CONSORT 2010 checklist from reporting-guidelines.md (items 3a–12b). Add RCT reporting checklist from statistical-reporting.md (CONSORT flow, baseline characteristics, primary outcome format).

- [ ] **Step 3: Commit**

```bash
git add skills/study-types/rct/
git commit -m "feat: add RCT study-type module (CONSORT 2010)"
```

---

### Task 6: Create prediction-model module

**Files:**
- Create: `skills/study-types/prediction-model/SKILL.md`
- Create: `skills/study-types/prediction-model/references/tripod-checklist.md`

- [ ] **Step 1: Write skills/study-types/prediction-model/SKILL.md**

**Section 1 — Reporting Guideline:** TRIPOD+AI (Collins et al., BMJ 2024;385:e078378). Also covers generic ML papers (NLP, computer vision, etc.) that are not clinical prediction models.

**Section 2 — Methods Subsections (10 subsections from v0.2.0 TRIPOD):**
1. Source of Data — name, type, country, dates
2. Participants — eligibility, index date, follow-up, outcome ascertainment
3. Predictors — list, definitions, timing, transformations
4. Sample Size — n events, EPV/EPP
5. Missing Data — proportion per predictor, handling method
6. Model Development — type (logistic, Cox, random forest, XGBoost, neural net), variable selection, shrinkage/regularisation, hyperparameter tuning
7. Model Performance — discrimination (AUC-ROC/C), calibration (Brier score, calibration plot, calibration-in-the-large, calibration slope), clinical utility (decision curve analysis, net benefit)
8. Internal Validation — bootstrap, cross-validation, temporal split
9. External Validation — dataset description, temporal/geographical
10. Software and Reproducibility — packages, versions, code availability

**v1.0.0 additions:** Calibration-in-the-large, decision curve analysis, net benefit, model updating/recalibration.

**Generic ML subsection (non-clinical):**
- Hyperparameter tuning: grid search, random search, Bayesian optimisation
- Cross-validation: k-fold (state k), stratified, grouped, temporal
- Feature importance: SHAP, permutation, integrated gradients
- Threshold selection: method (Youden, sensitivity-specificity tradeoff)
- Resampling for class imbalance: SMOTE, oversampling, class weights
- Train/validation/test split ratios

**Section 3 — Results Conventions:**
- **Clinical prediction model order:** Data → Model Performance → Calibration → Clinical Utility → Comparison → Validation
- **Generic ML order (preserved from v0.2.0):** Data Description → Model Performance → Secondary Metrics → Comparison → Feature Importance → Subgroup/Fairness Analyses
- Discrimination: AUC-ROC (with 95% CI via bootstrap), AUC-PR for imbalanced data
- Calibration: Brier score, calibration plot (observed vs predicted)
- Threshold-based: sensitivity, specificity, PPV, NPV at specified threshold
- Report on held-out test set, not training
- Comparison: baseline model (logistic, clinical score), DeLong test for AUC difference
- Confidence intervals: bootstrap (≥1000 iterations) or nested CV, 95% CI for all primary metrics

**Section 4 — Discussion Considerations:**
- Paragraph template: "The [model] achieved AUC-ROC [X] (95% CI), sensitivity [X]%, specificity [X]%, PPV [X]% at threshold [X]. This [exceeded/similar to/not different from] [baseline] (AUC difference [X]; p-value)."
- Typical strengths: large dataset, external validation, rigorous cross-validation, SHAP interpretability, TRIPOD compliance
- Typical limitations: single-centre data, class imbalance, limited generalisability, no prospective validation, threshold sensitivity

**Section 5 — Software Citations:** Python (scikit-learn, XGBoost, TensorFlow, PyTorch), R (caret, tidymodels, glmnet)

- [ ] **Step 2: Write skills/study-types/prediction-model/references/tripod-checklist.md**

Migrate TRIPOD+AI checklist from reporting-guidelines.md (items 4a–4j). Add ML reporting checklist from statistical-reporting.md.

- [ ] **Step 3: Commit**

```bash
git add skills/study-types/prediction-model/
git commit -m "feat: add prediction-model study-type module (TRIPOD+AI + generic ML)"
```

---

### Task 7: Create diagnostic-accuracy module

**Files:**
- Create: `skills/study-types/diagnostic-accuracy/SKILL.md`
- Create: `skills/study-types/diagnostic-accuracy/references/stard-checklist.md`

- [ ] **Step 1: Write skills/study-types/diagnostic-accuracy/SKILL.md**

**Section 1 — Reporting Guideline:** STARD 2015 (Bossuyt et al., BMJ 2015;351:h5527).

**Section 2 — Methods Subsections (new detailed prose guidance — was checklist-only in v0.2.0):**
1. Study Design — prospective or retrospective, single-gate or two-gate
2. Participants — eligibility criteria, recruitment setting, period, consecutive/random
3. Index Test — name, description, reader training, threshold, blinding
4. Reference Standard — name, rationale for choice, timing relative to index test
5. Sample Size — how determined, expected sensitivity/specificity, precision
6. Missing Data — handling of indeterminate index test results, missing reference standard
7. Statistical Methods — sensitivity, specificity, 95% CI (exact binomial), likelihood ratios, predictive values, ROC analysis, pre-test probability

**Section 3 — Results Conventions:**
- Subsection order: Participants → 2×2 Table → Diagnostic Accuracy Estimates → Subgroup
- Report: sensitivity + specificity + 95% CI + PPV + NPV + likelihood ratios (positive and negative)
- Cross-tabulation: true positive, false positive, false negative, true negative
- If multiple thresholds: ROC curve with AUC

**Section 4 — Discussion Considerations:**
- Compare with existing diagnostic tests/standards
- Discuss spectrum bias, verification bias, incorporation bias
- Clinical utility: how would this change clinical decisions?

**Section 5 — Software Citations:** As appropriate

- [ ] **Step 2: Write references/stard-checklist.md**

Migrate STARD 2015 checklist from reporting-guidelines.md. Expand with full item descriptions.

- [ ] **Step 3: Commit**

```bash
git add skills/study-types/diagnostic-accuracy/
git commit -m "feat: add diagnostic-accuracy study-type module (STARD 2015)"
```

---

### Task 8: Create qualitative module

**Files:**
- Create: `skills/study-types/qualitative/SKILL.md`
- Create: `skills/study-types/qualitative/references/coreq-checklist.md`

- [ ] **Step 1: Write skills/study-types/qualitative/SKILL.md**

**Section 1 — Reporting Guideline:** COREQ (Tong et al., Int J Qual Health Care 2007) for qualitative; SRQR for mixed methods.

**Section 2 — Methods Subsections (new detailed prose guidance — was checklist-only in v0.2.0):**
1. Research Team and Reflexivity — interviewer credentials, relationship with participants, researcher assumptions
2. Study Design — methodology (grounded theory, phenomenology, ethnography, thematic analysis), theoretical framework
3. Participant Selection — sampling strategy (purposive, snowball, theoretical), recruitment, sample size justification (data saturation)
4. Setting — where data collected, presence of non-participants
5. Data Collection — interview guide, recording, field notes, duration, data saturation assessment
6. Data Analysis — coding approach (inductive, deductive, hybrid), software (NVivo, ATLAS.ti), number of coders, member checking, audit trail
7. Trustworthiness — credibility, transferability, dependability, confirmability strategies

**Section 3 — Results Conventions:**
- Themes presented with supporting quotes
- Participant identifiers (pseudonyms or codes)
- Theme prevalence described qualitatively, not with percentages (unless mixed methods)

**Section 4 — Discussion Considerations:**
- Reflexivity on researcher influence
- Transferability to other contexts
- Comparison with existing qualitative and quantitative evidence

**Section 5 — Software Citations:** NVivo, ATLAS.ti, MAXQDA as appropriate

- [ ] **Step 2: Write references/coreq-checklist.md**

Create full COREQ checklist (32 items across 3 domains: research team, study design, analysis/findings) and SRQR standards.

- [ ] **Step 3: Commit**

```bash
git add skills/study-types/qualitative/
git commit -m "feat: add qualitative study-type module (COREQ/SRQR)"
```

---

## Chunk 3: New Study-Type Modules

### Task 9: Create network-meta-analysis module

**Files:**
- Create: `skills/study-types/network-meta-analysis/SKILL.md` (target: ≥200 lines; include 2-3 template sentences per subsection)
- Create: `skills/study-types/network-meta-analysis/references/prisma-nma-checklist.md`

- [ ] **Step 1: Write skills/study-types/network-meta-analysis/SKILL.md**

**Density requirement:** Each Methods subsection must include 2-3 template sentences showing exactly how the prose should read (matching the density of the systematic-review module). For example, in the Geometry subsection: "The network comprised [N] nodes representing [interventions] connected by [N] edges based on [N] direct comparisons from [N] studies."

**Section 1 — Reporting Guideline:** PRISMA-NMA (Hutton et al., Ann Intern Med 2015;162:777–784).

**Section 2 — Methods Subsections:**
1. Protocol and Registration — as per standard SRMA
2. Eligibility Criteria — PICO + eligible comparisons, connected network requirement
3. Information Sources and Search Strategy — as per SRMA
4. Study Selection — as per SRMA
5. Data Extraction — as per SRMA + extraction of all pairwise comparisons
6. Risk of Bias Assessment — RoB 2 / ROBINS-I + CINeMA for NMA-specific confidence
7. Geometry of the Network — describe nodes (interventions), edges (direct comparisons), plot network geometry. State number of nodes, edges, studies per comparison.
8. Effect Measures — common effect measure across network (OR, RR, SMD)
9. Statistical Methods:
   - Frequentist (netmeta in R) or Bayesian (gemtc, JAGS/OpenBUGS)
   - Consistency assumption: global (design-by-treatment interaction, Q statistic) and local (node-splitting / side-splitting)
   - Ranking: SUCRA (surface under cumulative ranking curve) or P-score
   - League table: all pairwise comparisons with 95% CI
   - Contribution matrix: which studies contribute most to each comparison
   - Heterogeneity: common τ² assumption or comparison-specific
   - Publication bias: comparison-adjusted funnel plot
   - Sensitivity analyses: exclude high RoB, restrict to head-to-head

**Section 3 — Results Conventions:**
- Network geometry description + figure reference
- League table (present or reference supplementary)
- Rankings (SUCRA/P-score table)
- Consistency/inconsistency results
- Forest plot of NMA estimates vs reference treatment
- Heterogeneity: τ² and I² for the network

**Section 4 — Discussion Considerations:**
- Discuss transitivity assumption (are populations comparable across comparisons?)
- Discuss consistency findings (any incoherence?)
- Ranking uncertainty (CIs around SUCRA/P-score)
- Comparison with pairwise MA results if available

**Section 5 — Software Citations:**
- netmeta R package (Rücker et al.)
- gemtc R package (van Valkenhoef et al.)
- CINeMA (Confidence in Network Meta-Analysis)

- [ ] **Step 2: Write references/prisma-nma-checklist.md**

Full PRISMA-NMA extension checklist items specific to NMA (network geometry, consistency, ranking, league tables).

- [ ] **Step 3: Commit**

```bash
git add skills/study-types/network-meta-analysis/
git commit -m "feat: add network-meta-analysis study-type module (PRISMA-NMA)"
```

---

### Task 10: Create IPD meta-analysis module

**Files:**
- Create: `skills/study-types/ipd-meta-analysis/SKILL.md` (target: ≥200 lines; include 2-3 template sentences per subsection)
- Create: `skills/study-types/ipd-meta-analysis/references/prisma-ipd-checklist.md`

- [ ] **Step 1: Write skills/study-types/ipd-meta-analysis/SKILL.md**

**Density requirement:** Each Methods subsection must include 2-3 template sentences. For example, in Data Collection: "Individual participant data were requested from all eligible study investigators. Of [N] eligible studies, IPD were obtained from [N] ([X]%), representing [N] participants."

**Section 1 — Reporting Guideline:** PRISMA-IPD (Stewart et al., BMJ 2015;350:h1765).

**Section 2 — Methods Subsections:**
1. Protocol and Registration
2. Eligibility Criteria — as per SRMA + IPD availability requirement
3. Information Sources — systematic search + direct contact with trialists/investigators
4. Study Selection
5. Data Collection — IPD request process, response rate, data harmonisation, variable recoding, quality checks (range checks, consistency, missingness patterns)
6. Risk of Bias Assessment — study-level + IPD-specific (data integrity, completeness)
7. Statistical Methods:
   - **One-stage model:** Mixed-effects regression with participants nested in studies. Specify: fixed/random intercepts, fixed/random treatment effects, stratification by study, interaction terms for subgroups.
   - **Two-stage model:** Analyse each study separately, then pool study-level estimates via standard MA. Specify when used (sensitivity, comparison with one-stage).
   - Individual-level covariates: treatment-covariate interactions (subgroup effects at participant level)
   - Missing data: study-level (not all studies provide IPD) + participant-level (missing covariates within IPD studies). Multiple imputation within studies vs across studies.
   - Available-case analysis vs IPD + aggregate data combined

**Section 3 — Results Conventions:**
- Report: proportion of eligible studies providing IPD (N IPD / N eligible, %)
- Participant-level characteristics table (pooled across IPD studies)
- One-stage and two-stage results side by side if both performed
- Subgroup analyses at individual level (treatment-covariate interactions with p-values)
- Forest plot with study-level contributions

**Section 4 — Discussion Considerations:**
- Availability bias (studies not providing IPD may differ systematically)
- Harmonisation challenges (different measurement tools, outcome definitions)
- Advantages over aggregate data (subgroup precision, time-to-event, confounding adjustment)

**Section 5 — Software Citations:** ipdmeta (Stata), metafor + lme4 (R), one-stage mixed-effects packages

- [ ] **Step 2: Write references/prisma-ipd-checklist.md**

PRISMA-IPD extension checklist items.

- [ ] **Step 3: Commit**

```bash
git add skills/study-types/ipd-meta-analysis/
git commit -m "feat: add IPD meta-analysis study-type module (PRISMA-IPD)"
```

---

### Task 11: Create dose-response module

**Files:**
- Create: `skills/study-types/dose-response/SKILL.md` (target: ≥180 lines; include 2-3 template sentences per subsection)
- Create: `skills/study-types/dose-response/references/dose-response-guidelines.md`

- [ ] **Step 1: Write skills/study-types/dose-response/SKILL.md**

**Density requirement:** Each Methods subsection must include 2-3 template sentences. For example, in Statistical Methods: "A two-stage dose-response meta-analysis was conducted using restricted cubic splines with [N] knots placed at the [Xth, Yth, Zth] percentiles of the exposure distribution. Non-linearity was assessed using a likelihood ratio test comparing the spline model with the linear model."

**Section 1 — Reporting Guideline:** No dedicated guideline; follows PRISMA 2020 with dose-response-specific extensions (Berlin et al., Stat Med 2002; Greenland & Longnecker, Am J Epidemiol 1992; Orsini et al., Stata J 2006).

**Section 2 — Methods Subsections:**
1. Protocol and Registration — as per SRMA
2. Eligibility Criteria — must include ≥3 quantified exposure categories with dose/level specified
3. Information Sources — as per SRMA
4. Data Extraction — extract dose categories (midpoint or assigned value), case counts, person-time or total N, effect estimates per category, reference category specification
5. Dose Assignment — how dose midpoints were calculated (median, midpoint of range, assigned for open-ended categories)
6. Statistical Methods:
   - **Linear dose-response:** Generalised least squares (GLS) trend estimation (Greenland & Longnecker method). Within-study correlation accounted for via covariance matrix.
   - **Non-linear dose-response:** Restricted cubic splines (RCS) with knot placement (3–5 knots at fixed percentiles: 10th, 50th, 90th or 5th, 25th, 75th, 95th). Test for non-linearity (likelihood ratio test or Wald test comparing linear vs spline model, p < 0.05 = non-linear).
   - **Reference dose:** Specify which dose level is the referent (usually lowest category or 0)
   - **Pooling:** Two-stage (study-specific curves → pooled via multivariate random-effects) or one-stage
   - **Heterogeneity:** τ² for dose-response coefficients
   - **Sensitivity:** Exclude studies with <3 categories, vary knot positions, vary reference dose

**Section 3 — Results Conventions:**
- Report pooled dose-response curve with 95% CI band
- State shape: linear, J-shaped, U-shaped, threshold, plateau
- Report risk at specific dose levels (e.g., OR at 10 mg/day, 20 mg/day, 50 mg/day)
- Test for non-linearity: p-value
- If linear: pooled slope per unit increase (e.g., OR per 10 mg/day increase)

**Section 4 — Discussion Considerations:**
- Discuss biological plausibility of the dose-response shape
- Limitations of exposure categorisation (ecological fallacy within categories)
- Extrapolation beyond observed dose range

**Section 5 — Software Citations:**
- dosresmeta R package (Crippa et al.)
- mvmeta R package (Gasparrini et al.)
- Stata drmeta (Orsini et al.)

- [ ] **Step 2: Write references/dose-response-guidelines.md**

Dose-response-specific checklist items, knot placement guidance, GLS method details.

- [ ] **Step 3: Commit**

```bash
git add skills/study-types/dose-response/
git commit -m "feat: add dose-response meta-analysis study-type module"
```

---

### Task 12: Create Bayesian meta-analysis module

**Files:**
- Create: `skills/study-types/bayesian-meta-analysis/SKILL.md` (target: ≥200 lines; include 2-3 template sentences per subsection)
- Create: `skills/study-types/bayesian-meta-analysis/references/bayesian-reporting.md`

- [ ] **Step 1: Write skills/study-types/bayesian-meta-analysis/SKILL.md**

**Density requirement:** Each Methods subsection must include 2-3 template sentences. For example, in Prior Specification: "A weakly informative half-normal prior (HN(0, 0.5)) was placed on the between-study standard deviation τ, based on empirical prior distributions for [outcome type] (Turner et al., Stat Med 2012). Sensitivity analyses used a half-Cauchy(0, 1) prior and an informative prior based on [source]."

**Section 1 — Reporting Guideline:** No dedicated guideline; follows PRISMA 2020 with Bayesian-specific reporting (Röver, J Stat Softw 2020; Röver et al., Res Synth Methods 2021).

**Section 2 — Methods Subsections:**
1–6: As per standard SRMA
7. Effect Measures — as per SRMA
8. Bayesian Statistical Methods:
   - **Model specification:** Random-effects normal-normal hierarchical model (NNHM). State: likelihood, link function.
   - **Prior specification:**
     - Treatment effect (μ): typically vague/non-informative (e.g., N(0, 10²)) or weakly informative
     - Between-study heterogeneity (τ): half-normal, half-Cauchy, or informative prior (specify source, e.g., Turner et al. empirical priors). State prior distribution and parameters explicitly.
     - Justify prior choices. Sensitivity analysis with alternative priors required.
   - **MCMC settings:** Software (JAGS, Stan, OpenBUGS, R bayesmeta/brms), chains (≥2), iterations (e.g., 50,000), burn-in/warmup (e.g., 10,000), thinning if used
   - **Convergence diagnostics:** Rhat (<1.01), effective sample size (ESS > 400), trace plots, density plots. Report these explicitly.
   - **Model comparison:** DIC, WAIC, or LOO-CV for model selection (e.g., comparing fixed-effect vs random-effects, or different prior specifications)
   - **Posterior summaries:** Posterior median or mean + 95% credible interval (CrI). Report posterior probability of clinically meaningful effect (e.g., P(OR < 1) = 0.94).
   - **Prediction:** 95% prediction interval from posterior predictive distribution

**Section 3 — Results Conventions:**
- Report posterior median/mean + 95% CrI (not CI — "credible interval" for Bayesian)
- Report posterior probability of effect direction: P(θ < 0) or P(OR < 1)
- Report τ posterior: median + 95% CrI
- Convergence: "All parameters achieved Rhat < 1.01 and ESS > [X]"
- Prior sensitivity: tabulate results under different priors
- Present forest plot with posterior study-specific estimates (shrinkage visible)

**Section 4 — Discussion Considerations:**
- Interpret posterior probability (not p-value)
- Discuss prior influence: how sensitive are conclusions to prior choice?
- Advantages over frequentist: direct probability statements, coherent uncertainty, predictive distributions, borrowing of strength
- Typical limitations: prior subjectivity, computational burden, convergence challenges

**Section 5 — Software Citations:**
- bayesmeta R package (Röver C, J Stat Softw 2020)
- brms R package (Bürkner P-C, J Stat Softw 2017)
- JAGS (Plummer M)
- Stan (Stan Development Team)
- R2jags, rjags, rstan as appropriate

- [ ] **Step 2: Write references/bayesian-reporting.md**

Bayesian-specific reporting checklist, prior specification examples, convergence diagnostic thresholds, credible interval interpretation guide.

- [ ] **Step 3: Commit**

```bash
git add skills/study-types/bayesian-meta-analysis/
git commit -m "feat: add Bayesian meta-analysis study-type module"
```

---

### Task 13: Create economic-evaluation module

**Files:**
- Create: `skills/study-types/economic-evaluation/SKILL.md` (target: ≥220 lines; include 2-3 template sentences per subsection)
- Create: `skills/study-types/economic-evaluation/references/cheers-checklist.md`

- [ ] **Step 1: Write skills/study-types/economic-evaluation/SKILL.md**

**Density requirement:** Each Methods subsection must include 2-3 template sentences. For example, in Analytical Methods: "A probabilistic sensitivity analysis was conducted using [N] Monte Carlo simulations. Beta distributions were assigned to transition probabilities, gamma distributions to costs, and log-normal distributions to relative risk estimates. Results were presented on the cost-effectiveness plane and as a cost-effectiveness acceptability curve at willingness-to-pay thresholds of [£X] to [£Y] per QALY."

**Section 1 — Reporting Guideline:** CHEERS 2022 (Husereau et al., Value Health 2022;25:3–9).

**Section 2 — Methods Subsections:**
1. Study Design — type of economic evaluation (CEA, CUA, CBA, cost-minimisation), analytic framework (decision tree, Markov model, microsimulation, partitioned survival), model structure description
2. Target Population and Setting — population characteristics, healthcare system, country, perspective (societal, healthcare payer, provider)
3. Comparators — all comparators, rationale for selection, current standard of care
4. Time Horizon — duration of analysis, justification (should capture all relevant costs and outcomes)
5. Discount Rate — rate for costs and outcomes (typically 3–5%), justify if different rates used
6. Health Outcomes — primary outcome measure (QALYs, DALYs, life-years, clinical events averted), utility values (source, elicitation method: EQ-5D, SF-6D, TTO, SG)
7. Cost Measurement — cost categories (direct medical, direct non-medical, indirect), data sources, currency, price year, currency conversion if applicable
8. Model Parameters — all input parameters with distributions (mean, SE, distribution type for PSA), data sources for each
9. Analytical Methods:
   - **Base case:** deterministic analysis, ICER = ΔCost / ΔEffect
   - **Deterministic sensitivity analysis (DSA):** one-way and multi-way, tornado diagram
   - **Probabilistic sensitivity analysis (PSA):** Monte Carlo simulation (N iterations, e.g., 10,000), distributions for each parameter (beta for probabilities, gamma for costs, log-normal for relative risks)
   - **Cost-effectiveness plane:** scatter plot of incremental cost vs incremental effect
   - **Cost-effectiveness acceptability curve (CEAC):** probability cost-effective at range of WTP thresholds
   - **Budget impact analysis** (if included)
   - **Threshold analysis** and willingness-to-pay (WTP) threshold (e.g., £20,000–£30,000/QALY for NICE, $50,000–$150,000/QALY for US)

**Section 3 — Results Conventions:**
- Report ICER and/or INMB (incremental net monetary benefit)
- Report total costs and total effects for each comparator
- Present CE plane and CEAC figures
- DSA: tornado diagram with top 10 most influential parameters
- PSA: % iterations cost-effective at stated WTP threshold
- Report base case deterministic result and PSA mean separately

**Section 4 — Discussion Considerations:**
- Compare with published CEA/CUA in same disease area
- Discuss model assumptions and structural uncertainty
- Discuss generalisability across healthcare systems
- Policy implications: is the intervention likely cost-effective at prevailing WTP thresholds?
- Typical limitations: model assumptions, data quality, utility elicitation method, time horizon adequacy, excluded costs

**Section 5 — Software Citations:**
- TreeAge Pro
- R heemod / BCEA / hesim packages
- Microsoft Excel (if model-based)
- NICE reference case citation

- [ ] **Step 2: Write references/cheers-checklist.md**

Full CHEERS 2022 checklist (28 items across title, abstract, introduction, methods, results, discussion, other).

- [ ] **Step 3: Commit**

```bash
git add skills/study-types/economic-evaluation/
git commit -m "feat: add economic-evaluation study-type module (CHEERS 2022)"
```

---

## Chunk 4: Engine Skills (Citations, Visual, Output, Integrations)

### Task 14: Create citation engine skill

**Files:**
- Create: `skills/citations/SKILL.md`
- Create: `skills/citations/references/citation-styles.md`

- [ ] **Step 1: Write skills/citations/SKILL.md**

Content must include:

**Verification Pipeline:**
1. **PubMed** (first): Use `mcp__plugin_pubmed_PubMed__search_articles` or `mcp__claude_ai_PubMed__search_articles` → `get_article_metadata` for full metadata. Search by title or author+year.
2. **CrossRef** (second): `WebFetch` to `https://api.crossref.org/works?query=<URL-encoded-title>&rows=3`. Parse JSON response for DOI, authors, title, container-title, published-date, volume, issue, page.
3. **Semantic Scholar** (third): `WebFetch` to `https://api.semanticscholar.org/graph/v1/paper/search?query=<URL-encoded-title>&limit=3&fields=title,authors,year,venue,externalIds`. Parse JSON.
4. **bioRxiv/medRxiv** (fourth): Use `mcp__claude_ai_bioRxiv__search_preprints` → `get_preprint`. Also `search_published_preprints` to check if a published version exists.

**Fallback triggers:** No results returned, OR returned metadata missing critical fields (title, authors, year). Move to next source.

**Metadata normalisation:** Regardless of source, output standardised fields: authors (list), title, journal, year, volume, issue, pages, DOI, PMID (if available), source (which database found it in).

**Duplicate detection:** If the same paper appears from multiple sources (e.g., DOI match, title match with >90% similarity), merge and use the most complete metadata set.

**Preprint status check:** When a bioRxiv/medRxiv preprint is cited, run `search_published_preprints` to check if a peer-reviewed version exists. If yes, suggest updating the citation to the published version.

**Cross-referencing:** After formatting the reference list, validate that every in-text citation number has a matching reference, and every reference is cited in the text. Flag discrepancies.

**Never fabricate.** If a citation cannot be verified through any source, output: `[UNVERIFIED — not found in PubMed, CrossRef, Semantic Scholar, or bioRxiv. Please check manually]`

**Note:** This skill also resolves the missing v0.2.0 phantom reference `skills/paper-components/references/reference-verification.md` per spec Section 12.2.

- [ ] **Step 2: Write skills/citations/references/citation-styles.md**

Full formatting rules and examples for all 6 supported styles:

1. **Vancouver** (default): `Author AA, Author BB. Title. *J Abbrev*. Year;Vol(Issue):Pages. doi:XX PMID: XXXXXXXX` — ≤6 authors list all, >6 first 6 + "et al.", NLM journal abbreviations, sentence case title, en-dash page ranges, DOI without https prefix, PMID required
2. **APA**: `Author, A. A., & Author, B. B. (Year). Title. *Journal Name*, *Volume*(Issue), Pages. https://doi.org/XXXXX` — hanging indent, ampersand before last author, italicised journal + volume
3. **AMA**: `Author AA, Author BB. Title. *Journal Name*. Year;Vol(Issue):Pages. doi:XXXXX` — similar to Vancouver but unabbreviated journal name
4. **Nature**: `Author, A. A. et al. Title. *J. Abbrev.* **Volume**, Pages (Year). https://doi.org/XXXXX` — bold volume, et al. after first author if >5
5. **Chicago**: Author-date format with full details
6. **IEEE**: `[N] A. A. Author, "Title," *J. Abbrev.*, vol. X, no. Y, pp. XX–XX, Month Year. doi:XXXXX` — numbered brackets, abbreviated first names, quoted title

Include complete example reference for each style using the same paper.

- [ ] **Step 3: Commit**

```bash
git add skills/citations/
git commit -m "feat: add citation engine skill with multi-source verification pipeline"
```

---

### Task 15: Create visual engine skill

**Files:**
- Create: `skills/visual/SKILL.md`
- Create: `skills/visual/references/figure-types.md`

- [ ] **Step 1: Write skills/visual/SKILL.md**

**Figure Interpretation (Claude multimodal):**

When reading a figure, follow these structured extraction guides by type:

- **Forest plot:** Extract study names, point estimates, CIs, weights, pooled diamond (lower, point, upper CI), heterogeneity stats (I², τ², Q, p), 95% PI if shown, scale (log/linear), null line position
- **PRISMA flow diagram:** Extract counts at each stage (identified, screened, assessed, included), exclusion reasons with counts per reason
- **Funnel plot:** Assess symmetry, note outliers, check for Egger's line
- **Calibration plot:** Observed vs predicted line, ideal (diagonal) line, calibration-in-the-large, calibration slope, confidence bands
- **Kaplan-Meier curve:** Median survival per group, number at risk table, log-rank p-value, separation points, censoring marks
- **Dose-response curve:** Shape description, knot positions, reference dose, CI bands, threshold/inflection points
- **Network geometry:** Nodes (count, labels), edges (count, thickness proportional to studies), direct comparisons available
- **Cost-effectiveness plane:** Quadrant distribution (NE=more effective+more costly, SE=more effective+less costly, etc.), ICER point, WTP threshold line
- **CEAC:** Probability cost-effective at WTP thresholds, crossover points between comparators

**Figure Generation (code-based):**

Before generating:
1. Run `which R` and/or `which python3` via Bash to check availability
2. If found: adapt template from `templates/figures/`, populate with user data, execute via Bash
3. If not found: write script to `figures/` folder with header comment explaining how to run it manually
4. If R/Python found but packages missing: output `install.packages("metafor")` or `pip install matplotlib` instructions

AI-based figure generation (via `scientific-schematics` or `generate-image`) is a v1.1 enhancement — for v1.0.0, fall back to `[FIGURE NEEDED: description]` for non-code figures.

**Caption auto-generation:**

After interpreting or generating a figure, draft a caption:
1. **Title line** (bold, ≤15 words): exactly what's shown
2. **Body** (2–5 sentences): content, methods, interpretation — standalone without main text
3. **Abbreviations footnote**: ALL abbreviations defined alphabetically
4. **Statistical notes**: explain symbols (diamond = pooled estimate, dashed line = extrapolation, ‡ = p < 0.05)

Numbering: Figure 1, 2, 3... (main); eFigure 1, 2... (supplementary); Table 1, 2... (main); eTable 1, 2... (supplementary)

- [ ] **Step 2: Write skills/visual/references/figure-types.md**

Detailed extraction templates and caption examples for each of the 9 figure types listed above. Include example captions.

**Note:** This file also resolves the missing v0.2.0 phantom reference `skills/paper-components/references/caption-standards.md` per spec Section 12.2.

- [ ] **Step 3: Commit**

```bash
git add skills/visual/
git commit -m "feat: add visual engine skill (figure interpretation + generation)"
```

---

### Task 16: Create output engine skill

**Files:**
- Create: `skills/output/SKILL.md`
- Create: `skills/output/references/abstract-formats.md`
- Create: `skills/output/references/latex-templates.md`
- Create: `skills/output/references/docx-templates.md`

- [ ] **Step 1: Write skills/output/SKILL.md**

Cover three output formats:

**Markdown (default):** Clean, paste-ready. Working format throughout writing process. All sections output as Markdown by default.

**LaTeX export:** Via `/export-manuscript latex [venue]`.
- Select template from `templates/latex/` based on venue (generic-article, jama, lancet)
- Generate `.bib` file from citation engine's verified references
- Place figures via `\includegraphics{figures/filename.pdf}`
- Handle supplementary materials (eFigures, eTables in appendix)
- Line numbering, word counts

**DOCX export:** Via `/export-manuscript docx`.
- Detection: `which pandoc`
- If found: `pandoc manuscript.md -o manuscript.docx --reference-doc=templates/docx/reference.docx`
- Reference template: Times New Roman 12pt, double-spaced, 1-inch margins, numbered headings
- If not found: output message with install instructions

- [ ] **Step 2: Write skills/output/references/abstract-formats.md**

Migrate from `skills/paper-components/references/abstract-formats.md` — all journal-specific abstract templates:
- JAMA Network (≤350 + Key Points)
- Lancet (≤250)
- BMJ (≤400)
- Annals (≤250)
- Nature Medicine (≤150 unstructured)
- CHEERS-compliant (NEW for economic evaluation)
- Generic Structured

Include word count verification command.

- [ ] **Step 3: Write skills/output/references/latex-templates.md**

Guide for how LaTeX templates work: how to select venue, what goes in preamble, how figures are included, how bibliography is generated. Reference the template files in `templates/latex/`.

- [ ] **Step 4: Write skills/output/references/docx-templates.md**

Guide for DOCX export: pandoc command, reference.docx format specification, fallback instructions.

- [ ] **Step 5: Commit**

```bash
git add skills/output/
git commit -m "feat: add output engine skill (Markdown, LaTeX, DOCX)"
```

---

### Task 17: Create integrations skill

**Files:**
- Create: `skills/integrations/SKILL.md`
- Create: `skills/integrations/references/detected-plugins.md`

- [ ] **Step 1: Write skills/integrations/SKILL.md**

**Detection mechanism:**

On first command invocation per session:
1. If `PAPER_CONTEXT.md` has `Integrations: none`, skip detection entirely — use all fallbacks
2. Otherwise, run: `Glob` for `~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/*/SKILL.md`
3. Parse matched paths to determine which skills are available
4. Cache detection results for the session

**Integration map** (8 integrations with explicit fallback for each — see `references/detected-plugins.md` for details).

**Principles:**
- Never required — plugin works standalone
- Silent — no user notification about detection
- No hard coupling — if a detected skill changes interface, fallback activates

- [ ] **Step 2: Write skills/integrations/references/detected-plugins.md**

Full integration map table (same as spec Section 6):

| Detected Skill | Used By | What It Provides | Fallback |
|---|---|---|---|
| research-lookup | Discussion | Literature search beyond PubMed | Built-in PubMed + WebSearch |
| literature-review | Discussion | Systematic multi-database search | Manual PubMed search |
| citation-management | Citations | Google Scholar + BibTeX | Built-in pipeline |
| scientific-schematics | Visual | Publication-quality diagrams | Code SVGs / [FIGURE NEEDED] |
| generate-image | Visual | AI images, visual abstracts | [FIGURE NEEDED] |
| venue-templates | Output | LaTeX formatting rules | Built-in templates |
| scientific-writing | All | Two-stage outline→prose | Built-in workflow |
| parallel-web | Discussion, Citations | Synthesised web search | WebSearch/WebFetch |

- [ ] **Step 3: Commit**

```bash
git add skills/integrations/
git commit -m "feat: add integrations skill for optional claude-scientific-writer detection"
```

---

## Chunk 5: Commands (Rewrite Existing + Create New)

### Task 18: Rewrite all 6 existing commands as thin dispatchers

**Files:**
- Modify: `commands/write-methods.md`
- Modify: `commands/write-results.md`
- Modify: `commands/write-discussion.md`
- Modify: `commands/write-frontmatter.md`
- Modify: `commands/write-captions.md`
- Modify: `commands/write-references.md`

Each command follows the same pattern: frontmatter with allowed-tools → instruct to read core skill → route to study-type skill → execute workflow with pause points → output result.

- [ ] **Step 1: Rewrite commands/write-methods.md**

```markdown
---
allowed-tools: Read, Write, Glob, Grep, WebSearch, WebFetch, Bash, Task
argument-hint: "[study-type] e.g. systematic-review, rct, observational, prediction-model"
description: "Write the Methods section for a scientific manuscript, aligned with the appropriate reporting guideline"
---

# /write-methods

## Step 1: Load core conventions

Read `skills/core/SKILL.md` for shared conventions (prose rules, precision, verification flags, no-fabrication guarantee).

## Step 2: Determine study type

If the study type was pre-loaded from `PAPER_CONTEXT.md`, use it. If provided as argument (`$ARGUMENTS`), use that. Otherwise, ask the user using the study-type list from the core skill.

## Step 3: Load study-type module

Read `skills/study-types/<study-type>/SKILL.md` and all files in `skills/study-types/<study-type>/references/`. The SKILL.md file contains the canonical subsection order and prose guidance for this study type.

## Step 4: Check for optional integrations

Read `skills/integrations/SKILL.md`. Run detection if first command invocation this session. If `scientific-writing` is detected, use its two-stage outline→prose workflow.

## Step 5: Read source materials

Ask the user for the location of source materials (protocol, search strategy, analysis scripts, figures, tables). Read them using the Read tool.

## Step 6: Write section by section

Follow the canonical subsection order from the study-type SKILL.md. For each subsection:

1. Draft the subsection using the prose guidance and template sentences from the SKILL.md
2. Apply core conventions (tense, voice, precision, UK English, verification flags)
3. Present to user for confirmation
4. Wait for approval before proceeding to the next subsection

## Step 7: Output reporting checklist

After all subsections are written, output a reporting guideline checklist (from the study-type `references/` files) with ✅/⚠️/❌ for each item.

## Step 8: Save output

Ask the user where to save the completed Methods section. Write to file using the Write tool.
```

- [ ] **Step 2: Rewrite commands/write-results.md**

**Follow the exact 8-step structure of write-methods.md above** (Load core → Determine study type → Load module → Check integrations → Read sources → Write section by section → Output checklist → Save), replacing study-type-specific instructions with the notes below:

Same pattern but:
- Step 5 emphasises reading figures/tables first using visual engine guidance
- Step 6 follows Results subsection order from study-type SKILL.md (Section 3)
- Explicit rule: no citations in Results
- Cross-reference all figures and tables inline

```markdown
---
allowed-tools: Read, Write, Glob, Grep, WebSearch, Task
argument-hint: "[study-type] e.g. systematic-review, rct, cohort, prediction-model"
description: "Write the Results section, extracting all numbers directly from source materials"
---
```

- [ ] **Step 3: Rewrite commands/write-discussion.md**

**Follow the exact 8-step structure of write-methods.md above**, replacing study-type-specific instructions with the notes below:

Same pattern but:
- Step 4: Use citation engine (`skills/citations/SKILL.md`) for literature search
- Step 5: Search PubMed (and optionally `research-lookup` integration) for comparison literature before writing Main Findings
- Step 6: Follow Discussion structure from study-type SKILL.md (Section 4) — Main Findings → Policy & Future → Strengths & Limitations → Conclusion
- Citation rules: Vancouver from 1, verify all, limit 8–15, flag unverifiable

```markdown
---
allowed-tools: Read, Write, Glob, Grep, WebSearch, WebFetch, Task
argument-hint: "[section] e.g. main-findings, policy, strengths-limitations, conclusion, all"
description: "Write the Discussion section with literature comparison and multi-source citation verification"
---
```

- [ ] **Step 4: Rewrite commands/write-frontmatter.md**

**Follow the exact 8-step structure of write-methods.md above**, replacing study-type-specific instructions with the notes below:

Same pattern but:
- Requires Results and Discussion to be complete first
- Loads abstract format from `skills/output/references/abstract-formats.md` based on target journal
- Introduction: 4-paragraph structure from paper-components guidance
- Title: 3 variants (descriptive, findings-forward, question-format)
- All numbers cross-checked against Results
- Citation rules for Introduction: verify via citation engine, limit 12–18

```markdown
---
allowed-tools: Read, Write, Glob, Grep, WebSearch, WebFetch, Task
argument-hint: "[section] e.g. abstract, introduction, title, all"
description: "Write the Abstract, Introduction, and Title after the manuscript body is complete"
---
```

- [ ] **Step 5: Rewrite commands/write-captions.md**

**Follow the exact 8-step structure of write-methods.md above**, replacing study-type-specific instructions with the notes below:

Same pattern but:
- Uses visual engine (`skills/visual/SKILL.md`) to interpret figures first
- Then generates captions following visual engine caption rules
- Numbering: Figure/eFigure/Table/eTable
- No per-command DOCX offer (deprecated — use `/export-manuscript` instead)

```markdown
---
allowed-tools: Read, Write, Glob, Grep, Bash
argument-hint: "[folder-path] path to figures/tables folder"
description: "Generate publication-ready captions for figures and tables"
---
```

- [ ] **Step 6: Rewrite commands/write-references.md**

**Follow the exact 8-step structure of write-methods.md above**, replacing study-type-specific instructions with the notes below:

Same pattern but:
- Delegates entirely to citation engine (`skills/citations/SKILL.md`)
- Multi-source verification pipeline (PubMed → CrossRef → Semantic Scholar → bioRxiv)
- Format per citation style from `skills/citations/references/citation-styles.md`
- Cross-reference in-text citations ↔ reference list
- Preprint-to-published upgrade suggestions

```markdown
---
allowed-tools: Read, Write, Glob, Grep, WebSearch, WebFetch, Bash
argument-hint: "[style] e.g. vancouver, apa, ama, nature, chicago, ieee"
description: "Verify citations via multi-source pipeline and format the reference list"
---
```

- [ ] **Step 7: Verify all commands are updated**

Run: `head -5 commands/write-methods.md commands/write-results.md commands/write-discussion.md commands/write-frontmatter.md commands/write-captions.md commands/write-references.md`
Expected: All show updated frontmatter with `allowed-tools`

- [ ] **Step 8: Commit**

```bash
git add commands/write-methods.md commands/write-results.md commands/write-discussion.md commands/write-frontmatter.md commands/write-captions.md commands/write-references.md
git commit -m "refactor: rewrite commands as thin dispatchers routing to modular skills"
```

---

### Task 19: Create new commands (generate-figures, export-manuscript)

**Files:**
- Create: `commands/generate-figures.md`
- Create: `commands/export-manuscript.md`

- [ ] **Step 1: Write commands/generate-figures.md**

```markdown
---
allowed-tools: Read, Write, Glob, Grep, Bash, WebSearch, WebFetch
argument-hint: "[type] e.g. forest-plot, prisma-flow, funnel-plot, network-diagram, dose-response-curve, ceac, calibration-plot, kaplan-meier"
description: "Generate publication-quality figures using R or Python scripts"
---

# /generate-figures

## Step 1: Load visual engine

Read `skills/visual/SKILL.md` for figure generation guidance and supported types.

## Step 2: Determine figure type

If provided as argument (`$ARGUMENTS`), use that. Otherwise, ask the user what type of figure they need:
- `forest-plot` — Forest plot showing study-level and pooled estimates
- `prisma-flow` — PRISMA 2020 flow diagram
- `funnel-plot` — Funnel plot for publication bias assessment
- `network-diagram` — Network geometry for NMA
- `dose-response-curve` — Dose-response relationship with splines
- `ceac` — Cost-effectiveness acceptability curve
- `calibration-plot` — Calibration plot for prediction models
- `kaplan-meier` — Kaplan-Meier survival curves

## Step 3: Check dependencies

Run via Bash:
```bash
which R && echo "R available" || echo "R not found"
which python3 && echo "Python available" || echo "Python not found"
```

## Step 4: Gather data

Ask the user for the data needed to generate the figure. Read any source files provided.

## Step 5: Generate figure

If R is available and figure type has a template in `templates/figures/`:
1. Read the template script
2. Adapt it with the user's data
3. Write the adapted script to `figures/`
4. Execute via Bash: `Rscript figures/<script>.R`
5. Verify output file exists

If R/Python not available:
1. Write the script to `figures/` folder
2. Add a header comment: `# To generate this figure, run: Rscript figures/<script>.R`
3. List required packages with install commands
4. Flag: `[FIGURE NEEDED: <description>. Script saved to figures/<script>.R]`

## Step 6: Generate caption

After the figure is created (or flagged), draft a caption using the visual engine caption rules.

## Step 7: Save output

Write the figure file and caption to the user's figures folder.
```

- [ ] **Step 2: Write commands/export-manuscript.md**

```markdown
---
allowed-tools: Read, Write, Glob, Grep, Bash
argument-hint: "[format] e.g. latex, docx, both [venue] e.g. jama, lancet, generic"
description: "Export the manuscript to LaTeX and/or DOCX format"
---

# /export-manuscript

## Step 1: Load output engine

Read `skills/output/SKILL.md` for export format guidance.

## Step 2: Determine format and venue

Parse `$ARGUMENTS` for format (`latex`, `docx`, `both`) and optional venue name.
If not provided, ask the user.
Check `PAPER_CONTEXT.md` for `Output format` and `Target journal` as defaults.

## Step 3: Gather manuscript sections

Use Glob to find all written sections in the working folder. Read each section.
Expected files: methods.md, results.md, discussion.md, abstract.md, introduction.md, title.md, captions.md, references.md (or similar naming).

## Step 4: Create output directory

```bash
mkdir -p manuscript
```

## Step 5: Export LaTeX (if requested)

1. Read the appropriate template from `templates/latex/` (generic-article.tex, jama.tex, or lancet.tex)
2. Assemble the manuscript: insert each section into the template at the correct location
3. Generate `manuscript/references.bib` from the verified reference list
4. Copy figure files to `manuscript/figures/`
5. Write `manuscript/manuscript.tex`
6. Notify user: "LaTeX manuscript saved to `manuscript/manuscript.tex`. Compile with `pdflatex manuscript.tex && bibtex manuscript && pdflatex manuscript.tex && pdflatex manuscript.tex`"

## Step 6: Export DOCX (if requested)

1. Check for pandoc: `which pandoc`
2. If found:
   - Assemble all sections into a single Markdown file (`manuscript/manuscript.md`)
   - Run: `pandoc manuscript/manuscript.md -o manuscript/manuscript.docx --reference-doc=templates/docx/reference.docx`
   - Notify user: "DOCX manuscript saved to `manuscript/manuscript.docx`"
3. If not found:
   - Save assembled Markdown to `manuscript/manuscript.md`
   - Notify: "DOCX export requires pandoc. Install via `brew install pandoc` (macOS) or `apt install pandoc` (Linux), then re-run `/export-manuscript docx`"

## Step 7: Summary

List all files created in `manuscript/` and their purposes.
```

- [ ] **Step 3: Commit**

```bash
git add commands/generate-figures.md commands/export-manuscript.md
git commit -m "feat: add /generate-figures and /export-manuscript commands"
```

---

## Chunk 6: Templates, Old Skill Cleanup, README, and GitHub Distribution

### Task 20: Create template files

**Files:**
- Create: `templates/latex/generic-article.tex`
- Create: `templates/latex/jama.tex`
- Create: `templates/latex/lancet.tex`
- Create: `templates/figures/forest-plot.R`
- Create: `templates/figures/prisma-flow.R`
- Create: `templates/figures/funnel-plot.R`

Note: `templates/docx/reference.docx` must be created manually or with a tool that can generate .docx files. For the plan, create a placeholder README explaining the format.

- [ ] **Step 1: Write templates/latex/generic-article.tex**

Standard LaTeX article template with:
- `\documentclass[12pt]{article}`
- Packages: geometry (1in margins), setspace (double-spacing), natbib, graphicx, booktabs, hyperref, lineno
- Title page: `\title`, `\author`, `\date`
- Sections: Abstract, Introduction, Methods, Results, Discussion, References
- Figure float template, table float template
- BibTeX bibliography: `\bibliography{references}`
- Line numbering: `\linenumbers`
- Supplementary appendix section

- [ ] **Step 2: Write templates/latex/jama.tex**

JAMA-specific template:
- Two-column format
- Structured abstract with Key Points box
- Word count in title page
- JAMA reference style (superscript numbers)
- Specific section headings per JAMA style

- [ ] **Step 3: Write templates/latex/lancet.tex**

Lancet-specific template:
- Single-column
- Structured abstract (Background/Methods/Findings/Interpretation/Funding)
- Lancet reference style (superscript numbers)
- Research in Context panel (Evidence before this study / Added value / Implications)

- [ ] **Step 4: Write templates/figures/forest-plot.R**

```r
# Forest Plot Template
# Requires: R, metafor package
# Install: install.packages("metafor")
# Usage: Rscript forest-plot.R
#
# Modify the data section below with your study data

library(metafor)

# === MODIFY THIS SECTION ===
# Study data: name, effect estimate (log scale for OR/RR), standard error
study_data <- data.frame(
  study = c("Study 1", "Study 2", "Study 3"),
  yi = c(-0.23, -0.51, -0.10),   # log(OR) or log(RR)
  sei = c(0.15, 0.20, 0.12)       # standard error
)
# ===========================

res <- rma(yi = yi, sei = sei, data = study_data, method = "REML")

pdf("forest-plot.pdf", width = 10, height = max(4, nrow(study_data) * 0.5 + 2))
forest(res,
       slab = study_data$study,
       xlab = "Odds Ratio",
       atransf = exp,
       at = log(c(0.25, 0.5, 1, 2, 4)),
       header = TRUE,
       mlab = "Pooled Estimate (Random-Effects, REML)")
dev.off()

cat("Forest plot saved to forest-plot.pdf\n")
```

- [ ] **Step 5: Write templates/figures/prisma-flow.R**

```r
# PRISMA 2020 Flow Diagram Template
# Requires: R, DiagrammeR package
# Install: install.packages("DiagrammeR")
# Usage: Rscript prisma-flow.R

library(DiagrammeR)

# === MODIFY THIS SECTION ===
n_identified <- 1500
n_duplicates <- 300
n_screened <- 1200
n_excluded_screening <- 900
n_fulltext <- 300
n_excluded_fulltext <- 280
n_included <- 20
exclusion_reasons <- "Not relevant (n=150)\\nWrong outcome (n=80)\\nWrong population (n=50)"
# ===========================

flow <- grViz(sprintf("
digraph prisma {
  graph [rankdir=TB, fontname=Helvetica]
  node [shape=box, style=filled, fillcolor=white, fontname=Helvetica, fontsize=10]

  id [label='Records identified\\n(n = %d)']
  dup [label='Duplicates removed\\n(n = %d)']
  screen [label='Records screened\\n(n = %d)']
  exc_screen [label='Records excluded\\n(n = %d)']
  ft [label='Full-text assessed\\n(n = %d)']
  exc_ft [label='Full-text excluded\\n(n = %d)\\n%s']
  inc [label='Studies included\\n(n = %d)', fillcolor='#E8F5E9']

  id -> dup
  dup -> screen
  screen -> exc_screen
  screen -> ft
  ft -> exc_ft
  ft -> inc
}
", n_identified, n_duplicates, n_screened, n_excluded_screening,
  n_fulltext, n_excluded_fulltext, exclusion_reasons, n_included))

# Save as HTML then convert (or use export_graph)
# For PDF output, consider using the PRISMAstatement package instead
cat('PRISMA flow diagram generated. For PDF export, use:\n')
cat('  library(DiagrammeRsvg); library(rsvg)\n')
cat('  svg <- export_svg(flow)\n')
cat('  rsvg_pdf(charToRaw(svg), "prisma-flow.pdf")\n')
```

- [ ] **Step 6: Write templates/figures/funnel-plot.R**

```r
# Funnel Plot Template
# Requires: R, metafor package
# Install: install.packages("metafor")
# Usage: Rscript funnel-plot.R

library(metafor)

# === MODIFY THIS SECTION ===
study_data <- data.frame(
  yi = c(-0.23, -0.51, -0.10, -0.35, -0.42),
  sei = c(0.15, 0.20, 0.12, 0.18, 0.25)
)
# ===========================

res <- rma(yi = yi, sei = sei, data = study_data, method = "REML")

pdf("funnel-plot.pdf", width = 8, height = 6)
funnel(res,
       xlab = "Effect Estimate",
       main = "Funnel Plot with Pseudo 95% Confidence Limits")
dev.off()

# Egger's test for asymmetry
egger <- regtest(res)
cat(sprintf("Egger's test: z = %.3f, p = %.3f\n", egger$zval, egger$pval))
cat("Funnel plot saved to funnel-plot.pdf\n")
```

- [ ] **Step 7: Generate templates/docx/reference.docx**

Generate the pandoc reference document that defines DOCX export formatting:

```bash
# Check if pandoc is available
which pandoc
```

**If pandoc is available:**

```bash
# Generate default reference doc
pandoc -o templates/docx/reference.docx --print-default-data-file reference.docx
```

Then note for the user: "The reference.docx has been generated with pandoc defaults. For full journal-style formatting (Times New Roman 12pt, double-spaced, 1-inch margins), open it in Word/LibreOffice and modify the Normal, Heading 1-4, Title, and Abstract styles."

**If pandoc is NOT available:**

Create a `templates/docx/README.md` explaining how to create it:

```markdown
# DOCX Reference Template

The `reference.docx` file is required for DOCX export via `/export-manuscript docx`.

## To create it:

1. Install pandoc: `brew install pandoc` (macOS) or `apt install pandoc` (Linux)
2. Run: `pandoc -o templates/docx/reference.docx --print-default-data-file reference.docx`
3. Open in Word/LibreOffice and modify styles:
   - Normal: Times New Roman, 12pt, double-spaced
   - Margins: 1 inch (2.54 cm) all sides
   - Headings: Numbered (1, 1.1, 1.2)
   - Page numbers: Bottom centre
4. Save the modified file as `reference.docx` in this directory
```

The `/export-manuscript` command will check for this file before attempting DOCX conversion and will provide instructions if it is missing.

- [ ] **Step 8: Commit**

```bash
git add templates/
git commit -m "feat: add LaTeX, R figure, and DOCX reference templates"
```

---

### Task 21: Remove old skill directories

**Files:**
- Delete: `skills/methods-writing/` (migrated to study-type modules)
- Delete: `skills/quantitative-results-writing/` (migrated to study-type modules)
- Delete: `skills/discussion-writing/` (migrated to study-type modules + citation engine)
- Delete: `skills/paper-components/` (migrated to output engine + visual engine)

- [ ] **Step 1: Verify all content has been migrated**

Check that the following v0.2.0 content has a home in v1.0.0:

| v0.2.0 Source | v1.0.0 Destination |
|---|---|
| methods-writing/SKILL.md PRISMA guidance | study-types/systematic-review/SKILL.md |
| methods-writing/SKILL.md STROBE guidance | study-types/observational/SKILL.md |
| methods-writing/SKILL.md TRIPOD guidance | study-types/prediction-model/SKILL.md |
| methods-writing/references/reporting-guidelines.md | split across study-type references/ files |
| quantitative-results-writing/SKILL.md SRMA results | study-types/systematic-review/SKILL.md §3 |
| quantitative-results-writing/SKILL.md RCT results | study-types/rct/SKILL.md §3 |
| quantitative-results-writing/SKILL.md cohort results | study-types/observational/SKILL.md §3 |
| quantitative-results-writing/SKILL.md ML results | study-types/prediction-model/SKILL.md §3 |
| quantitative-results-writing/references/statistical-reporting.md | split across study-type references/ |
| discussion-writing/SKILL.md | study-type modules §4 + citations/SKILL.md |
| discussion-writing/references/discussion-frameworks.md | study-type modules §4 |
| paper-components/SKILL.md abstract section | output/references/abstract-formats.md |
| paper-components/SKILL.md introduction section | commands/write-frontmatter.md |
| paper-components/SKILL.md title section | commands/write-frontmatter.md |
| paper-components/SKILL.md captions section | visual/SKILL.md |
| paper-components/SKILL.md references section | citations/SKILL.md |
| paper-components/references/abstract-formats.md | output/references/abstract-formats.md |

- [ ] **Step 2: Remove old skill directories**

```bash
rm -rf skills/methods-writing
rm -rf skills/quantitative-results-writing
rm -rf skills/discussion-writing
rm -rf skills/paper-components
```

- [ ] **Step 3: Verify no orphaned references**

Run: `grep -r "methods-writing\|quantitative-results-writing\|discussion-writing\|paper-components" commands/ skills/`
Expected: No matches (all references should point to new module paths)

- [ ] **Step 4: Commit**

```bash
git add -A
git commit -m "refactor: remove old v0.2.0 skill directories (content migrated to modular structure)"
```

---

### Task 22: Write README.md

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Rewrite README.md**

Complete rewrite covering:

1. **Header:** Plugin name, one-line description, version badge
2. **Overview:** What it does (section-by-section manuscript writing), key principles (no fabrication, guideline-aligned, expert writing order, citation verification)
3. **Installation:** Three methods:
   - `claude plugin install github:olaTechie/scientific-paper-writer`
   - Download zip from GitHub Releases → `claude plugin install ./scientific-paper-writer.zip`
   - `git clone` → `claude plugin install ./scientific-paper-writer`
4. **Quick Start:** Example workflow (create PAPER_CONTEXT.md → /write-methods → /write-results → /write-discussion → /write-frontmatter → /write-captions → /write-references → /export-manuscript)
5. **Commands:** Table of all 8 commands with description and example usage
6. **Study Types:** Table of all 11 study types with identifier, guideline, and key features
7. **Output Formats:** Markdown (default), LaTeX (3 venues), DOCX (pandoc-based)
8. **Citation Verification:** Multi-source pipeline (PubMed → CrossRef → Semantic Scholar → bioRxiv)
9. **PAPER_CONTEXT.md Template:** Full template with all fields documented
10. **Optional Integrations:** How it works with claude-scientific-writer if installed
11. **Expert Writing Order:** Diagram showing Methods → Results → Discussion → Abstract → Introduction → Title
12. **License:** MIT

- [ ] **Step 2: Commit**

```bash
git add README.md
git commit -m "docs: rewrite README for v1.0.0 with full command reference and installation guide"
```

---

### Task 23: Initialize git repo and push to GitHub

**Files:**
- No new files — git operations only

- [ ] **Step 1: Verify git repo and commit history**

The repo was initialized in Task 1, Step 0. Verify all prior task commits are present:

```bash
git log --oneline
```

Expected: Multiple commits from Tasks 1–22. If any changes are unstaged:

```bash
git add -A
git status
```

- [ ] **Step 3: Create GitHub repo**

```bash
gh repo create olaTechie/scientific-paper-writer --public --description "Section-by-section academic paper writing assistant for quantitative research. Supports 11 study types, multi-source citation verification, LaTeX/DOCX export." --source=. --push
```

- [ ] **Step 4: Verify push**

```bash
gh repo view olaTechie/scientific-paper-writer --web
```

- [ ] **Step 5: Build release zip**

```bash
./build-release.sh
ls -la dist/
```

Expected: `dist/scientific-paper-writer-v1.0.0.zip` exists

- [ ] **Step 6: Create GitHub release**

```bash
gh release create v1.0.0 dist/scientific-paper-writer-v1.0.0.zip --title "v1.0.0 — Modular Rewrite" --notes "$(cat <<'EOF'
## Scientific Paper Writer v1.0.0

Complete modular rewrite of the scientific paper writing plugin.

### What's New
- **11 study types** — Added network meta-analysis, IPD meta-analysis, dose-response, Bayesian meta-analysis, and economic evaluation
- **Multi-source citation verification** — PubMed → CrossRef → Semantic Scholar → bioRxiv/medRxiv fallback chain
- **LaTeX export** — Venue-specific templates (JAMA, Lancet, generic article)
- **DOCX export** — Pandoc-based with professional reference template
- **Figure generation** — R script templates for forest plots, PRISMA flows, funnel plots
- **Visual engine** — Structured figure interpretation with Claude's multimodal understanding
- **Optional integrations** — Gracefully enhances with claude-scientific-writer plugin when installed
- **Modular architecture** — Core engine + independent study-type modules + engine skills

### Installation
```
claude plugin install github:olaTechie/scientific-paper-writer
```

Or download the zip and run:
```
claude plugin install ./scientific-paper-writer-v1.0.0.zip
```
EOF
)"
```

- [ ] **Step 7: Verify installation works**

```bash
claude plugin install github:olaTechie/scientific-paper-writer
```

---

### Task 24: Final validation

- [ ] **Step 1: Verify complete file structure**

Run: `find . -type f | grep -v '.git/' | grep -v '.DS_Store' | grep -v 'dist/' | sort`

Expected output should match the project structure from the spec (Section 3.1), with all files present.

- [ ] **Step 2: Verify no broken internal references**

Run: `grep -r "skills/" commands/ | grep -v ".git"` — all skill paths should resolve to existing files.
Run: `grep -r "templates/" commands/ skills/ | grep -v ".git"` — all template paths should resolve.
Run: `grep -r "references/" skills/ | grep -v ".git"` — all reference paths should resolve.

- [ ] **Step 3: Verify study-type coverage**

Count study-type module directories:
```bash
ls -d skills/study-types/*/
```
Expected: 11 directories (systematic-review, network-meta-analysis, ipd-meta-analysis, dose-response, bayesian-meta-analysis, rct, observational, economic-evaluation, prediction-model, diagnostic-accuracy, qualitative)

- [ ] **Step 4: Verify command count**

```bash
ls commands/*.md | wc -l
```
Expected: 8 commands

- [ ] **Step 5: Commit any final fixes**

If any issues found in validation, fix and commit.
