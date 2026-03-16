# Scientific Paper Writer

A section-by-section academic manuscript writing assistant for quantitative research papers. Supports systematic reviews, meta-analyses, RCTs, cohort studies, and machine learning papers. Methods sections are aligned with **PRISMA 2020**, **STROBE**, **CONSORT**, **TRIPOD+AI**, or **STARD** automatically based on study type.

## Installation

There are three ways to install this plugin depending on how you use Claude.

---

### Option 1 — Install from GitHub (Recommended for sharing)

#### Step 1: Clone or download the repository
```bash
git clone https://github.com/YOUR-USERNAME/scientific-paper-writer.git
```
Or download the ZIP from GitHub → **Code → Download ZIP**, then unzip it.

#### Step 2: Install via Claude Code CLI
```bash
# Install directly from the cloned folder
claude plugin install ./scientific-paper-writer

# Or, if you downloaded and unzipped the repo
claude plugin install /path/to/scientific-paper-writer
```

#### Step 3: Install the pre-built .plugin file from a GitHub Release
If the repository has a published Release with a `.plugin` file attached:
1. Go to the repository's **Releases** page on GitHub
2. Download `scientific-paper-writer.plugin` from the latest release assets
3. In Claude Cowork: drag and drop the `.plugin` file into the plugins panel, then click **Accept**
4. In Claude Code: run `claude plugin install /path/to/scientific-paper-writer.plugin`

---

### Option 2 — Install in Claude Cowork (Desktop App) from a local file
1. Download `scientific-paper-writer.plugin` from your workspace folder or GitHub Releases
2. Open the Claude desktop app
3. Go to **Settings → Plugins** (or click the plug icon in the sidebar)
4. Click **"Install Plugin"** or drag and drop the `.plugin` file into the plugins panel
5. Click **"Accept"** when the plugin preview appears
6. All five commands will now be available in any Cowork session

---

### Option 3 — Install in Claude Code from a local file
```bash
# Install from the .plugin file
claude plugin install /path/to/scientific-paper-writer.plugin

# Or install directly from the plugin source folder
claude plugin install /path/to/scientific-paper-writer/
```

---

### Verify Installation
After installing, type `/` in the chat to see available commands. You should see:
- `/write-methods`
- `/write-results`
- `/write-discussion`
- `/write-frontmatter`
- `/write-captions`
- `/write-references`

---

## Publishing to GitHub

To host this plugin on GitHub so others can install it:

### Step 1 — Create a new GitHub repository
```bash
cd scientific-paper-writer
git init
git add .
git commit -m "Release: Scientific Paper Writer plugin v0.2.0"
```

Create a new repo at https://github.com/new (name it `scientific-paper-writer`), then:
```bash
git remote add origin https://github.com/YOUR-USERNAME/scientific-paper-writer.git
git branch -M main
git push -u origin main
```

### Step 2 — Publish a Release with the .plugin file
1. Go to your repository on GitHub
2. Click **Releases → Create a new release**
3. Tag: `v0.1.0`
4. Title: `Scientific Paper Writer v0.2.0`
5. Drag and drop `scientific-paper-writer.plugin` into the **Assets** section
6. Click **Publish release**

Users can now download the `.plugin` file directly from your Releases page and install it in one click.

### Step 3 — Add a badge to your README (optional)
```markdown
![Plugin Version](https://img.shields.io/badge/claude--plugin-v0.2.0-blue)
![Works with Cowork](https://img.shields.io/badge/Claude-Cowork-green)
```

### Repository structure on GitHub
The repo should look exactly like this — the plugin files at the root, not nested inside another folder:
```
scientific-paper-writer/          ← repository root
├── .claude-plugin/
│   └── plugin.json
├── commands/
│   ├── write-methods.md
│   ├── write-results.md
│   ├── write-discussion.md
│   ├── write-frontmatter.md
│   ├── write-captions.md
│   └── write-references.md
├── skills/
│   ├── methods-writing/
│   │   ├── SKILL.md
│   │   └── references/
│   │       └── reporting-guidelines.md
│   ├── quantitative-results-writing/
│   ├── discussion-writing/
│   └── paper-components/
├── hooks/
│   └── hooks.json
└── README.md
```

### Optional: Set Up Study Context
To avoid re-explaining your study at the start of each session, create a `PAPER_CONTEXT.md` file in your working folder. See the **Optional: Pre-load Study Context** section below for the template.

---

## Overview

This plugin guides researchers through writing a complete manuscript in expert writing order — starting with Results, then Discussion, then frontmatter (Abstract and Introduction last). Each section is written step by step, with source materials read before any writing begins. No numbers are invented; all statistics are extracted directly from your analysis outputs and figures.

## Writing Order

Experts write papers in this order — not the reading order:

```
1. Methods         → /write-methods
2. Results         → /write-results
3. Discussion      → /write-discussion
4. Abstract        → /write-frontmatter abstract
5. Introduction    → /write-frontmatter introduction
6. Title           → /write-frontmatter title
7. Captions        → /write-captions
8. References      → /write-references
```

## Commands

### `/write-methods [study-type]`
Writes the Methods section fully aligned with the appropriate reporting guideline.

- **Automatically selects** the correct guideline based on study type:
  - Systematic review / meta-analysis → **PRISMA 2020**
  - Observational (cohort, case-control, cross-sectional) → **STROBE**
  - RCT → **CONSORT 2010**
  - Prediction / prognostic model → **TRIPOD+AI**
  - Diagnostic accuracy → **STARD 2015**
- Writes each subsection separately and pauses for confirmation before proceeding
- Outputs a **guideline checklist** at the end (✅ / ⚠️ / ❌) flagging any missing items
- Flags any value it cannot verify with `[PLEASE VERIFY: ___]`
- For SRMA: covers protocol registration, eligibility (PICOTS), search strategy, study selection, data extraction, risk of bias, effect measures, and full synthesis methods (heterogeneity, subgroup, meta-regression, publication bias, sensitivity)
- For STROBE: covers study design, setting, participants, variables, data sources, bias, study size, and statistical methods
- For TRIPOD+AI: covers data source, participants, predictors, sample size, missing data, model development, performance metrics, and internal/external validation

**Example usage:**
```
/write-methods
/write-methods systematic-review
/write-methods cohort
/write-methods prediction-model
```

---

### `/write-results [study-type]`
Writes the Results section step by step.

- Reads your figures, tables, and analysis outputs before writing
- Adapts to study type: `systematic-review`, `rct`, `cohort`, `ml`, or describe your own
- Writes one subsection at a time and confirms before proceeding
- Flags any unclear values as `[UNCLEAR IN SOURCE — please verify]`

**Example usage:**
```
/write-results systematic-review
/write-results rct
/write-results cohort
```

---

### `/write-discussion [section]`
Writes the Discussion section step by step.

- Searches PubMed and the web for comparison literature before writing Main Findings
- Only cites verified, PubMed-indexed sources
- Flags unverifiable citations as `[Citation needed — unable to verify in PubMed]`
- Optionally write one section at a time

**Section options:** `main-findings`, `policy`, `strengths-limitations`, `conclusion`, `all`

**Example usage:**
```
/write-discussion
/write-discussion main-findings
/write-discussion conclusion
```

---

### `/write-frontmatter [section]`
Writes Abstract, Introduction, and Title — after the body is complete.

- Extracts all numbers directly from your completed Results section
- Adapts abstract format to your target journal
- Verifies all Introduction citations via PubMed before including
- Offers three title variants for you to choose from

**Section options:** `abstract`, `introduction`, `title`, `all`

**Journal formats supported:** JAMA Network, Lancet, BMJ, Annals of Internal Medicine, Nature Medicine, or generic structured

**Example usage:**
```
/write-frontmatter abstract
/write-frontmatter introduction
/write-frontmatter all
```

---

### `/write-captions [folder-path]`
Writes standalone publication-ready captions for all figures and tables.

- Reads every figure and table image in the specified folder
- Writes self-contained captions with abbreviation footnotes
- Numbers figures and eFigures correctly
- Optionally saves as a formatted Word document

**Example usage:**
```
/write-captions
/write-captions /path/to/figures/folder
```

---

### `/write-references [citation-style]`
Builds and verifies the complete reference list.

- Verifies each citation against PubMed before formatting
- Flags unverifiable citations rather than silently including them
- Cross-checks in-text citation numbers against the reference list

**Style options:** `vancouver` (default), `apa`, `ama`, `chicago`, `nature`

**Example usage:**
```
/write-references
/write-references vancouver
/write-references apa
```

---

## Optional: Pre-load Study Context

Create a file named `PAPER_CONTEXT.md` in your working folder to pre-load your study details at the start of each session. Claude will read it silently and use the context across all writing commands.

**Template:**
```markdown
# Paper Context

## Study Details
- Study type: systematic review and meta-analysis
- Primary outcome: vaccine effectiveness against laboratory-confirmed pertussis
- Population: adults aged ≥18 years
- Target journal: JAMA Network Open
- Citation style: Vancouver
- Abstract word limit: 350

## Folder Structure
- Figures folder: ./For_Caption/
- Draft report: ./DraftReport/Draft_report.pdf
- Analysis outputs: ./06_results_waning_analyses_v2/

## Conventions
- UK English spelling throughout
- VE% = (1 − OR) × 100
- Report heterogeneity: I², τ², Q, 95% prediction interval
- Distinguish absolute VE from relative VE
```

---

## Supported Study Types

| Study Type | Results Subsections Covered |
|---|---|
| Systematic review / meta-analysis | PRISMA flow, characteristics, risk of bias, pooled estimates, sensitivity analyses, subgroup analyses, waning/meta-regression |
| RCT | CONSORT flow, baseline characteristics, primary/secondary outcomes, adverse events |
| Cohort / observational | Population flow, characteristics, crude + adjusted estimates, sensitivity analyses, subgroup analyses |
| Machine learning | Data split, primary metric (AUC), secondary metrics, calibration, comparison, feature importance, fairness |

## Citation Verification

All external citations are verified via PubMed or web search before inclusion. Unverifiable citations are always flagged — never silently included or fabricated.

## Output Format

All sections are output as clean Markdown (`.md`), ready to paste into your manuscript or convert to Word/PDF using other tools.

---

## Setup

No external API keys or MCP servers required. The plugin uses Claude's built-in web search and PubMed tools for citation verification.
