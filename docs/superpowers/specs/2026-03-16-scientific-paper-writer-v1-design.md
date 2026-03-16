# Scientific Paper Writer v1.0.0 — Modular Rewrite Design Spec

**Date:** 2026-03-16
**Author:** Ola + Claude
**Status:** Draft
**Repository:** github.com/olaTechie/scientific-paper-writer

---

## 1. Overview

A comprehensive overhaul of the Scientific Paper Writer Claude plugin (v0.2.0 → v1.0.0). The rewrite restructures the plugin into a modular architecture with separated concerns: core engine, study-type modules, citation engine, visual engine, output engine, and optional integrations. It expands study-type coverage, adds multi-source citation verification, figure interpretation and generation, LaTeX/DOCX export, and public GitHub distribution.

## 2. Goals

1. **Modular architecture** — Each concern (study type, citations, visuals, output) is an independent module with focused responsibility
2. **Expanded study types** — Add network meta-analysis, IPD meta-analysis, dose-response, Bayesian meta-analysis, economic evaluation; deepen existing types
3. **Multi-format output** — Markdown (default) + LaTeX (venue-specific templates) + DOCX (pandoc-based)
4. **Multi-source citation verification** — PubMed → CrossRef → Semantic Scholar → bioRxiv/medRxiv fallback chain
5. **Visual capabilities** — Interpret existing figures and generate new ones (code-based + AI-based)
6. **Optional integrations** — Detect and leverage `claude-scientific-writer` skills when present; fully functional standalone
7. **Public distribution** — GitHub repo, zip releases, polished documentation

## 3. Architecture

### 3.1 Project Structure

```
scientific-paper-writer/
├── .claude-plugin/
│   └── plugin.json
├── hooks/
│   └── hooks.json
├── commands/
│   ├── write-methods.md
│   ├── write-results.md
│   ├── write-discussion.md
│   ├── write-frontmatter.md
│   ├── write-captions.md
│   ├── write-references.md
│   ├── generate-figures.md            # NEW
│   └── export-manuscript.md           # NEW
├── templates/
│   ├── latex/
│   │   ├── generic-article.tex        # Generic article class template
│   │   ├── jama.tex                   # JAMA Network template
│   │   └── lancet.tex                 # Lancet template
│   ├── docx/
│   │   └── reference.docx             # Pandoc reference template (Times New Roman 12pt, double-spaced)
│   └── figures/
│       ├── forest-plot.R              # Template R script for forest plots
│       ├── prisma-flow.R              # Template R script for PRISMA flow diagrams
│       └── funnel-plot.R              # Template R script for funnel plots
├── skills/
│   ├── core/
│   │   ├── SKILL.md
│   │   └── references/
│   │       ├── prose-conventions.md
│   │       └── verification-flags.md
│   ├── study-types/
│   │   ├── systematic-review/
│   │   │   ├── SKILL.md
│   │   │   └── references/
│   │   │       └── prisma-checklist.md
│   │   ├── network-meta-analysis/
│   │   │   ├── SKILL.md
│   │   │   └── references/
│   │   │       └── prisma-nma-checklist.md
│   │   ├── ipd-meta-analysis/
│   │   │   ├── SKILL.md
│   │   │   └── references/
│   │   │       └── prisma-ipd-checklist.md
│   │   ├── dose-response/
│   │   │   ├── SKILL.md
│   │   │   └── references/
│   │   │       └── dose-response-guidelines.md
│   │   ├── bayesian-meta-analysis/
│   │   │   ├── SKILL.md
│   │   │   └── references/
│   │   │       └── bayesian-reporting.md
│   │   ├── rct/
│   │   │   ├── SKILL.md
│   │   │   └── references/
│   │   │       └── consort-checklist.md
│   │   ├── observational/
│   │   │   ├── SKILL.md
│   │   │   └── references/
│   │   │       └── strobe-checklist.md
│   │   ├── economic-evaluation/
│   │   │   ├── SKILL.md
│   │   │   └── references/
│   │   │       └── cheers-checklist.md
│   │   ├── prediction-model/
│   │   │   ├── SKILL.md               # Covers TRIPOD+AI and generic ML papers
│   │   │   └── references/
│   │   │       └── tripod-checklist.md
│   │   ├── diagnostic-accuracy/
│   │   │   ├── SKILL.md
│   │   │   └── references/
│   │   │       └── stard-checklist.md
│   │   └── qualitative/
│   │       ├── SKILL.md
│   │       └── references/
│   │           └── coreq-checklist.md
│   ├── citations/
│   │   ├── SKILL.md
│   │   └── references/
│   │       └── citation-styles.md
│   ├── visual/
│   │   ├── SKILL.md
│   │   └── references/
│   │       └── figure-types.md
│   ├── output/
│   │   ├── SKILL.md
│   │   └── references/
│   │       ├── latex-templates.md
│   │       ├── docx-templates.md
│   │       └── abstract-formats.md    # Journal-specific abstract formats (separate from LaTeX templates)
│   └── integrations/
│       ├── SKILL.md
│       └── references/
│           └── detected-plugins.md
├── README.md
├── LICENSE
├── .gitignore
└── build-release.sh
```

### 3.2 Module Responsibilities

**Core Engine (`skills/core/`):**
- Shared prose conventions: past tense for methods/results, present for established knowledge, UK English, full paragraphs (never bullets in manuscript output)
- Precision rules: no vague quantifiers, every finding needs point estimate + 95% CI + p-value + sample size
- Verification flags: `[PLEASE VERIFY: ___]`, `[UNCLEAR IN SOURCE — please verify]`, `[Citation needed — unable to verify]`
- No-fabrication guarantee: every number extracted from source materials
- Workflow protocol: pause after each subsection for user confirmation
- Study-type routing: detect or ask for study type, then instruct Claude to read the corresponding `skills/study-types/<type>/SKILL.md` and its reference files

**Study-Type Modules (`skills/study-types/`):**
Each module follows a standard internal structure:
1. Reporting guideline — which guideline governs, with checklist
2. Methods subsections — ordered list with per-subsection prose guidance, template sentences, and checklist items (migrated from existing command files — must be at least as detailed as v0.2.0 inline guidance)
3. Results conventions — study-type-specific statistical reporting, subsection ordering
4. Discussion considerations — relevant comparisons, typical limitations
5. Software citations — standard packages/tools to cite

**Citation Engine (`skills/citations/`):**
- Verification pipeline: PubMed → CrossRef → Semantic Scholar → bioRxiv/medRxiv
- **Tool usage per source:**
  - PubMed: `mcp__plugin_pubmed_PubMed__search_articles` or `mcp__claude_ai_PubMed__search_articles` → `get_article_metadata` for full metadata
  - CrossRef: `WebFetch` to `https://api.crossref.org/works?query=<title>&rows=3` → parse JSON for DOI, authors, title, journal, year, volume, pages
  - Semantic Scholar: `WebFetch` to `https://api.semanticscholar.org/graph/v1/paper/search?query=<title>&limit=3&fields=title,authors,year,venue,externalIds` → parse JSON
  - bioRxiv/medRxiv: `mcp__claude_ai_bioRxiv__search_preprints` → `get_preprint` for details; `search_published_preprints` to check if formally published
- **Fallback triggers:** No results returned, or returned metadata missing critical fields (title, authors, year). Move to next source in chain.
- Metadata normalization: standardized fields regardless of source (authors, title, journal, year, volume, issue, pages, DOI, PMID if available)
- Supported citation styles: **Vancouver** (default), **APA**, **AMA**, **Nature**, **Chicago**, **IEEE**
- Duplicate detection: same paper with different identifiers
- Cross-referencing: in-text citations ↔ reference list validation
- Preprint status check: suggests updating to published version when available

**Visual Engine (`skills/visual/`):**
- Figure interpretation: uses Claude's built-in multimodal image understanding (not a separate programmatic pipeline) to extract structured data from figures. The skill provides structured guidance for how to interpret each figure type: forest plots, PRISMA flows, funnel plots, calibration plots, Kaplan-Meier curves, dose-response curves, network geometry plots, CEACs
- Figure generation (code-based): R/Python scripts adapted from templates in `templates/figures/`. **Dependency detection:** before executing, run `which R` / `which python3` via Bash. If not found, output the script as a file with instructions for the user to run manually. If R/Python is found but required packages are missing, output `install.packages(...)` / `pip install ...` instructions before the script.
- Figure generation (AI-based): delegate to `scientific-schematics`/`generate-image` if detected (v1.1 enhancement), otherwise code-generated SVGs or `[FIGURE NEEDED: description]` flag. AI-based generation is marked as optional enhancement, not core functionality for v1.0.0.
- Caption auto-generation: title line, body, abbreviation footnotes, statistical notes

**Output Engine (`skills/output/`):**
- Markdown: clean, paste-ready (default working format)
- **Abstract formats** (separate from LaTeX templates): JAMA Network (structured, ≤350 words + Key Points), Lancet (≤250), BMJ (≤400), Annals (≤250), Nature Medicine (unstructured ≤150), CHEERS-compliant (economic evaluation), Generic Structured. Defined in `skills/output/references/abstract-formats.md`.
- **LaTeX venue templates** (v1.0.0 ships 3, more in point releases): generic article, JAMA, Lancet. Templates stored in `templates/latex/`. BibTeX generation, figure integration via `\includegraphics`, supplementary materials.
- **DOCX:** Pandoc-based conversion. Detection: run `which pandoc` via Bash. If found, convert using bundled `templates/docx/reference.docx` (Times New Roman 12pt, double-spaced, 1-inch margins, numbered headings). If pandoc not installed, output Markdown with message: "DOCX export requires pandoc. Install via `brew install pandoc` (macOS) or `apt install pandoc` (Linux), then re-run `/export-manuscript docx`."
- Per-command DOCX offers (e.g., captions export in v0.2.0) are deprecated in favour of the unified `/export-manuscript` command.

**Integrations Module (`skills/integrations/`):**
- **Detection mechanism:** On first command invocation per session, run `Glob` for `~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/*/SKILL.md`. Cache results in a `[DETECTED INTEGRATIONS]` section at the top of the command's working context. If no match found, all fallbacks activate.
- Never required: plugin works fully standalone
- Silent detection: no user notification
- User override: `integrations: none` in PAPER_CONTEXT.md skips detection entirely

### 3.3 Command-Skill Interaction Pattern

Commands and skills have distinct roles:

**Command files** (`commands/*.md`) contain:
- User-facing workflow: step-by-step instructions, pause points, user interaction prompts
- `allowed-tools` declaration in frontmatter
- Instructions to read the core skill and the appropriate study-type skill
- Output format and file-writing instructions

**Skill SKILL.md files** (`skills/*/SKILL.md`) contain:
- Domain knowledge: conventions, rules, templates, reporting standards
- Trigger phrases for natural-language activation (e.g., "write methods for a systematic review")
- Study-type-specific prose guidance, template sentences, and subsection checklists
- All inline guidance currently in v0.2.0 command files is migrated here

**Skill reference files** (`skills/*/references/*.md`) contain:
- Detailed checklists (PRISMA, CONSORT, STROBE, etc.)
- Formatting examples, style guides, journal-specific templates
- Statistical reporting standards

**How a command activates skills:** Each command file includes explicit instructions: "Read `skills/core/SKILL.md` for shared conventions. Then read `skills/study-types/<study-type>/SKILL.md` and its `references/` files for study-type-specific guidance." The study type is determined from PAPER_CONTEXT.md (if loaded via hook) or by asking the user. There is no implicit skill matching — commands explicitly direct which skill files to read.

## 4. Hooks

### 4.1 SessionStart Hook (carried forward from v0.2.0)

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

**Notes:**
- Integration detection is NOT a hook — it is lazy, triggered on first command invocation (see Section 3.2, Integrations Module)
- The hook is updated from v0.2.0 to also read the new PAPER_CONTEXT.md fields: `output format`, `integrations`, `figure generation`

## 5. Study-Type Coverage

### 5.1 Study-Type Identifiers (canonical vocabulary)

Used consistently in PAPER_CONTEXT.md, command arguments, and skill file paths:

| Identifier | Display Name |
|---|---|
| `systematic-review` | Systematic Review / Pairwise Meta-Analysis |
| `network-meta-analysis` | Network Meta-Analysis |
| `ipd-meta-analysis` | Individual Patient Data Meta-Analysis |
| `dose-response` | Dose-Response Meta-Analysis |
| `bayesian-meta-analysis` | Bayesian Meta-Analysis |
| `rct` | Randomised Controlled Trial |
| `observational` | Observational (Cohort, Case-Control, Cross-Sectional) |
| `economic-evaluation` | Economic Evaluation (CEA/CUA/CBA) |
| `prediction-model` | Prediction/Prognostic Model (TRIPOD+AI) and Generic ML |
| `diagnostic-accuracy` | Diagnostic Accuracy Study |
| `qualitative` | Qualitative / Mixed Methods |

**Note on `prediction-model`:** This module covers both clinical prediction models (TRIPOD+AI) and generic ML papers (NLP, computer vision, etc.). The SKILL.md file includes a subsection for non-clinical ML scenarios with their own Results ordering (data description, model performance, secondary metrics, comparison, feature importance, fairness analyses — carried forward from v0.2.0).

### 5.2 New Modules

| Module | Guideline | Key Coverage |
|---|---|---|
| Network meta-analysis | PRISMA-NMA | Geometry of network, consistency/inconsistency models, SUCRA/P-score rankings, league tables, contribution matrix, node-splitting |
| IPD meta-analysis | PRISMA-IPD | One-stage vs two-stage models, individual covariates, interaction effects, participant-level missing data |
| Dose-response meta-analysis | — | Restricted cubic splines, knot placement, non-linearity tests, dose-response curves, reference dose |
| Bayesian meta-analysis | — | Prior specification, MCMC diagnostics (Rhat, ESS, trace plots), posterior distributions, credible intervals, model comparison (DIC/WAIC/LOO) |
| Economic evaluation | CHEERS 2022 | Perspective, time horizon, discount rate, ICER/INMB, CE planes, CEACs, sensitivity analyses, WTP threshold |

### 5.3 Existing Module Upgrades

| Module | Additions |
|---|---|
| Systematic review | Three-level meta-analysis, robust variance estimation, meta-regression with HKSJ, dose-response submodule reference |
| Prediction model | Deeper TRIPOD+AI: calibration-in-the-large, decision curve analysis, net benefit, model updating/recalibration. Preserves generic ML Results ordering from v0.2.0 (data description → model performance → secondary metrics → comparison → feature importance → fairness) |
| RCT | Adaptive designs, platform trials, estimand framework (ICH E9 R1). Add full CONSORT methods subsection-by-subsection prose guidance (parallel to existing PRISMA/STROBE detail) |
| Observational | Target trial emulation framework, E-value for unmeasured confounding |
| Diagnostic accuracy | Add STARD methods subsection-by-subsection prose guidance (was checklist-only in v0.2.0) |
| Qualitative | Reorganised into modular structure. Add COREQ/SRQR methods subsection-by-subsection prose guidance (was checklist-only in v0.2.0). No new study-type features — structural upgrade only |

## 6. Integration Map

| Detected Skill | Used By | What It Provides | Fallback If Absent |
|---|---|---|---|
| `research-lookup` | Discussion writing | Literature search beyond PubMed | Built-in PubMed + web search |
| `literature-review` | Discussion writing | Systematic multi-database search | Manual PubMed search |
| `citation-management` | Citation engine | Google Scholar search, BibTeX generation | Built-in multi-source pipeline |
| `scientific-schematics` | Visual engine | Publication-quality diagrams | Code-generated SVGs or `[FIGURE NEEDED]` flag |
| `generate-image` | Visual engine | AI-generated images, visual abstracts | Skip or `[FIGURE NEEDED]` flag |
| `venue-templates` | Output engine | Venue-specific LaTeX formatting | Built-in template set |
| `scientific-writing` | All commands | Two-stage outline → prose workflow | Built-in section-by-section workflow |
| `parallel-web` | Discussion, Citations | Web search with synthesized summaries | Standard WebSearch/WebFetch |

## 7. Commands

### 7.1 Upgraded Commands

| Command | Key Changes |
|---|---|
| `/write-methods [study-type]` | Routes to modular study-type skills; supports all 10 study types; loads core skill automatically |
| `/write-results [study-type]` | Same routing; visual engine for figure interpretation before writing; deeper statistical conventions per new study types |
| `/write-discussion [section]` | Citation engine for multi-source literature search; optional `research-lookup` integration; study-type-aware comparison frameworks |
| `/write-frontmatter [section]` | Adds economic evaluation abstract format; numbers cross-checked against Results via core engine |
| `/write-captions [folder-path]` | Visual engine interprets figures first; supports new figure types (network geometry, CEACs, dose-response curves) |
| `/write-references [citation-style]` | Multi-source verification via citation engine; preprint-to-published upgrade suggestions |

### 7.2 New Commands

**`/generate-figures [type]`**
- `allowed-tools`: Read, Write, Glob, Grep, Bash, WebSearch, WebFetch
- Arguments: figure type (forest-plot, prisma-flow, funnel-plot, network-diagram, dose-response-curve, ceac, calibration-plot, kaplan-meier)
- **Step 1:** Check for R (`which R`) and/or Python (`which python3`) via Bash
- **Step 2:** If available, adapt template script from `templates/figures/`, populate with user data, execute via Bash
- **Step 3:** If R/Python not available, write the script to `figures/` folder with instructions for manual execution
- Falls back to `[FIGURE NEEDED: description]` flag if no code path is viable
- AI-based schematics via `scientific-schematics` is a v1.1 enhancement
- Outputs figure files (PDF/PNG) + auto-generated captions

**`/export-manuscript [format]`**
- `allowed-tools`: Read, Write, Glob, Grep, Bash
- Arguments: format (`latex`, `docx`, `both`), optionally venue name
- **Step 1:** Read all written sections from the working folder via Glob
- **Step 2:** For LaTeX — assemble using template from `templates/latex/`, generate `.bib` from citation engine output, copy figures. For DOCX — check for pandoc (`which pandoc`), convert using `templates/docx/reference.docx`
- **Step 3:** Output to `manuscript/` subfolder with all supporting files
- If pandoc not installed for DOCX: output Markdown + instructions

## 8. PAPER_CONTEXT.md Template

```markdown
## Study Details
- Study type: [systematic-review | network-meta-analysis | ipd-meta-analysis | dose-response | bayesian-meta-analysis | rct | observational | economic-evaluation | prediction-model | diagnostic-accuracy | qualitative]
- Primary outcome:
- Secondary outcomes:
- Target journal:
- Citation style: [vancouver | apa | ama | nature | chicago | ieee]
- Output format: [markdown | latex | docx | both]

## Folders
- Source materials: ./sources/
- Figures: ./figures/
- Manuscript output: ./manuscript/

## Options
- Integrations: [auto | none]
- Figure generation: [code | ai | both]
```

## 9. Distribution & Packaging

**GitHub Repository:**
- Public repo: `olaTechie/scientific-paper-writer`
- MIT license
- Polished README: overview, installation (3 methods), quick start, command reference, study-type matrix, output formats, optional integrations, PAPER_CONTEXT.md template
- `.gitignore`: `.DS_Store`, `node_modules`, `manuscript/`, `.git`

**Installation Methods:**
1. GitHub: `claude plugin install github:olaTechie/scientific-paper-writer`
2. Zip: download from GitHub Releases, `claude plugin install ./scientific-paper-writer.zip`
3. Local: `git clone` + `claude plugin install ./scientific-paper-writer`

**Release Process:**
- `build-release.sh` script zips plugin contents (excluding `.git`, `.DS_Store`)
- GitHub Releases tagged `v1.0.0` with zip artifact attached

**Zip structure:**
```
scientific-paper-writer.zip
└── scientific-paper-writer/
    ├── .claude-plugin/plugin.json
    ├── hooks/
    ├── commands/
    ├── templates/
    ├── skills/
    ├── README.md
    ├── LICENSE
    └── .gitignore
```

## 10. Build Script (`build-release.sh`)

```bash
#!/usr/bin/env bash
set -euo pipefail

VERSION=$(grep '"version"' .claude-plugin/plugin.json | sed 's/.*: "\(.*\)".*/\1/')
RELEASE_NAME="scientific-paper-writer-v${VERSION}"
DIST_DIR="dist"

echo "Building ${RELEASE_NAME}..."

rm -rf "${DIST_DIR}"
mkdir -p "${DIST_DIR}/scientific-paper-writer"

# Copy plugin contents, excluding development/runtime artifacts
rsync -a \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --exclude='dist' \
  --exclude='docs' \
  --exclude='manuscript' \
  --exclude='node_modules' \
  . "${DIST_DIR}/scientific-paper-writer/"

# Create zip
cd "${DIST_DIR}"
zip -r "${RELEASE_NAME}.zip" scientific-paper-writer/
cd ..

echo "Release built: ${DIST_DIR}/${RELEASE_NAME}.zip"
```

## 11. Plugin Manifest (`plugin.json`)

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

## 12. Migration Notes (v0.2.0 → v1.0.0)

### 12.1 Content Migration

All inline prose guidance currently embedded in v0.2.0 command files (`commands/write-methods.md`, `commands/write-results.md`, etc.) must be migrated to the corresponding study-type SKILL.md files. The skill files must be **at least as detailed** as the current command files. Specifically:

- `write-methods.md` (~250 lines of PRISMA/STROBE/TRIPOD subsection guidance) → split into `skills/study-types/systematic-review/SKILL.md`, `skills/study-types/observational/SKILL.md`, `skills/study-types/prediction-model/SKILL.md`
- `write-results.md` ML subsection ordering (data description → model performance → secondary metrics → comparison → feature importance → fairness) → `skills/study-types/prediction-model/SKILL.md`
- Discussion, frontmatter, captions, references inline guidance → corresponding engine skills

### 12.2 Missing Reference Files (v0.2.0 bugs to fix)

The following reference files are referenced in v0.2.0 skill files but do not exist. They must be created in v1.0.0:

- `skills/paper-components/references/caption-standards.md` → migrate to `skills/visual/references/figure-types.md`
- `skills/paper-components/references/reference-verification.md` → migrate to `skills/citations/SKILL.md`
- `skills/discussion-writing/references/contextualisation-guide.md` → migrate to `skills/study-types/*/SKILL.md` discussion sections
- `skills/quantitative-results-writing/references/study-type-templates.md` → migrate to individual study-type `SKILL.md` files

### 12.3 Deprecated Features

- Per-command DOCX export offers (e.g., "save captions as Word document?" in `/write-captions`) are replaced by the unified `/export-manuscript` command

## 13. Non-Goals

- No interactive UI or web dashboard
- No database or persistent storage beyond files
- No user authentication or multi-user features
- No automatic journal submission
- No real-time collaboration
- No support for non-English languages in this version
