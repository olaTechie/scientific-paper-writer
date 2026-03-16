# Scientific Paper Writer

Section-by-section academic manuscript writing assistant for quantitative research. Version 1.0.0.

---

## Overview

Scientific Paper Writer is a Claude plugin that guides researchers through writing a complete manuscript in **expert writing order** -- starting with Methods, then Results, Discussion, and frontmatter last. It supports 11 study types, verifies every citation against multiple databases, and exports to LaTeX or DOCX with venue-specific formatting.

**Key principles:**

- **No fabrication** -- all statistics are extracted directly from your analysis outputs, figures, and tables. Values that cannot be verified are flagged with `[PLEASE VERIFY]`.
- **Guideline-aligned** -- every section follows the appropriate reporting guideline (PRISMA 2020, STROBE, CONSORT, TRIPOD+AI, STARD 2015, CHEERS 2022, COREQ/SRQR, PRISMA-NMA, PRISMA-IPD).
- **Expert writing order** -- Methods first, Abstract and Title last, following the order that experienced researchers use.
- **Citation verification** -- every external citation is verified against PubMed, CrossRef, Semantic Scholar, and bioRxiv/medRxiv before inclusion. Unverifiable citations are always flagged, never silently included.

---

## Installation

### Option 1: Install from GitHub (recommended)

```bash
claude plugin install github:olaTechie/scientific-paper-writer
```

### Option 2: Install from a release zip

Download the zip from the [Releases page](https://github.com/olaTechie/scientific-paper-writer/releases), then:

```bash
claude plugin install ./scientific-paper-writer-v1.0.0.zip
```

### Option 3: Install from local clone

```bash
git clone https://github.com/olaTechie/scientific-paper-writer.git
claude plugin install ./scientific-paper-writer
```

### Verify installation

Type `/` in a Claude session. You should see all 8 commands listed below.

---

## Quick Start

1. Create a `PAPER_CONTEXT.md` file in your working directory (see template below)
2. Follow the expert writing order:

```
/write-methods           Write Methods aligned with the reporting guideline
/write-results           Write Results from your analysis outputs
/write-discussion        Write Discussion with verified literature citations
/write-frontmatter       Write Abstract, Introduction, and Title
/write-captions          Write figure and table captions
/write-references        Build and verify the reference list
/generate-figures        Generate publication-quality figures (R/Python)
/export-manuscript       Export to LaTeX or DOCX
```

---

## Commands

| Command | Description | Example |
|---|---|---|
| `/write-methods [study-type]` | Write the Methods section aligned with the reporting guideline for your study type | `/write-methods systematic-review` |
| `/write-results [study-type]` | Write the Results section, extracting all numbers from source materials | `/write-results rct` |
| `/write-discussion [section]` | Write the Discussion with literature comparison and citation verification | `/write-discussion main-findings` |
| `/write-frontmatter [section]` | Write Abstract, Introduction, and Title after the body is complete | `/write-frontmatter abstract` |
| `/write-captions [folder-path]` | Generate publication-ready captions for figures and tables | `/write-captions ./figures/` |
| `/write-references [style]` | Verify citations and format the reference list | `/write-references vancouver` |
| `/generate-figures [type]` | Generate figures using R or Python scripts | `/generate-figures forest-plot` |
| `/export-manuscript [format] [venue]` | Export the manuscript to LaTeX and/or DOCX | `/export-manuscript latex jama` |

---

## Supported Study Types

| Identifier | Reporting Guideline | Key Features |
|---|---|---|
| `systematic-review` | PRISMA 2020 | PRISMA flow, risk of bias, pooled estimates, heterogeneity, subgroup/sensitivity analyses |
| `network-meta-analysis` | PRISMA-NMA | Network geometry, inconsistency testing, SUCRA/P-score rankings, league tables |
| `ipd-meta-analysis` | PRISMA-IPD | One-stage/two-stage models, participant-level subgroups, missing data handling |
| `dose-response` | PRISMA 2020 + dose-response extensions | Restricted cubic splines, non-linearity testing, threshold detection |
| `bayesian-meta-analysis` | PRISMA 2020 + Bayesian extensions | Prior specification, MCMC diagnostics, posterior summaries, model comparison |
| `rct` | CONSORT 2010 | CONSORT flow, ITT/PP analyses, primary/secondary outcomes, adverse events |
| `observational` | STROBE | Cohort/case-control/cross-sectional, crude + adjusted estimates, bias assessment |
| `economic-evaluation` | CHEERS 2022 | Cost-effectiveness analysis, ICER, sensitivity analyses, CEAC, budget impact |
| `prediction-model` | TRIPOD+AI | Model development, calibration, discrimination, internal/external validation |
| `diagnostic-accuracy` | STARD 2015 | STARD flow, sensitivity/specificity, ROC analysis, likelihood ratios |
| `qualitative` | COREQ / SRQR | Thematic/framework analysis, reflexivity, trustworthiness, transferability |

---

## Output Formats

| Format | Description |
|---|---|
| **Markdown** | Default output for all writing commands. Clean `.md` ready for manuscript editing. |
| **LaTeX (generic)** | Standard article template with line numbers and double spacing. |
| **LaTeX (JAMA)** | JAMA Network template with Key Points box and structured abstract sections. |
| **LaTeX (Lancet)** | Lancet template with Research in Context panel. |
| **DOCX** | Pandoc-based export with professional reference template (Times New Roman, double-spaced). |

---

## Citation Verification

Every citation passes through a 4-source verification pipeline before inclusion:

1. **PubMed** (first) -- search by title or author+year. Retrieve PMID, DOI, full metadata.
2. **CrossRef** (second) -- query the CrossRef API. Match by title similarity (>85% threshold).
3. **Semantic Scholar** (third) -- query the Semantic Scholar Graph API. Extract paper ID, DOI, venue.
4. **bioRxiv/medRxiv** (fourth) -- search preprints. Check whether a published version exists.

If a citation cannot be verified through any source, it is flagged:

```
[UNVERIFIED -- not found in PubMed, CrossRef, Semantic Scholar, or bioRxiv. Please check manually]
```

Citations are never fabricated. Missing metadata fields are marked (e.g., `[year unknown]`, `[DOI unknown]`).

---

## PAPER_CONTEXT.md Template

Create this file in your working directory to pre-load study context across all commands.

```markdown
# Paper Context

## Study Details
- Study type: systematic review and meta-analysis
- Primary outcome: vaccine effectiveness against laboratory-confirmed pertussis
- Population: adults aged >=18 years
- Target journal: JAMA Network Open
- Citation style: Vancouver
- Abstract word limit: 350

## Folder Structure
- Figures folder: ./figures/
- Draft report: ./drafts/report.pdf
- Analysis outputs: ./results/

## Conventions
- UK English spelling throughout
- VE% = (1 - OR) x 100
- Report heterogeneity: I-squared, tau-squared, Q, 95% prediction interval
- Distinguish absolute VE from relative VE
```

---

## Optional Integrations

Scientific Paper Writer works standalone but can optionally enhance its capabilities when the [claude-scientific-writer](https://github.com/example/claude-scientific-writer) plugin is also installed.

When detected, the integrations engine:

- Uses enhanced literature search capabilities if available
- Coordinates shared PAPER_CONTEXT.md between plugins
- Avoids duplicating functionality that the companion plugin provides

Detection is automatic and graceful -- the plugin works identically whether or not the companion is installed.

---

## Expert Writing Order

Experienced researchers write papers in this order, not the reading order:

```
1. Methods         /write-methods          What you did (most concrete)
2. Results         /write-results          What you found (from outputs)
3. Discussion      /write-discussion       What it means (needs Results)
4. Abstract        /write-frontmatter      Summary (needs all sections)
5. Introduction    /write-frontmatter      Context (needs Abstract)
6. Title           /write-frontmatter      Distillation (needs everything)
7. Captions        /write-captions         Standalone figure descriptions
8. References      /write-references       Final verification pass
```

This order ensures each section is written with the information it depends on already complete.

---

## Repository Structure

```
scientific-paper-writer/
  .claude-plugin/
    plugin.json
  commands/
    write-methods.md
    write-results.md
    write-discussion.md
    write-frontmatter.md
    write-captions.md
    write-references.md
    generate-figures.md
    export-manuscript.md
  skills/
    core/                       Core prose conventions and verification flags
    citations/                  Multi-source citation verification engine
    visual/                     Figure interpretation and caption generation
    output/                     LaTeX, DOCX, and abstract format engine
    integrations/               Optional plugin detection
    study-types/
      systematic-review/        PRISMA 2020
      network-meta-analysis/    PRISMA-NMA
      ipd-meta-analysis/        PRISMA-IPD
      dose-response/            Dose-response meta-analysis
      bayesian-meta-analysis/   Bayesian meta-analysis
      rct/                      CONSORT 2010
      observational/            STROBE
      economic-evaluation/      CHEERS 2022
      prediction-model/         TRIPOD+AI
      diagnostic-accuracy/      STARD 2015
      qualitative/              COREQ / SRQR
  templates/
    latex/                      LaTeX templates (generic, JAMA, Lancet)
    figures/                    R script templates (forest, PRISMA, funnel)
    docx/                       DOCX reference template
  hooks/
    hooks.json
  build-release.sh
  LICENSE
  README.md
```

---

## Setup

No external API keys required. The plugin uses Claude's built-in web search, PubMed tools, and bioRxiv tools for citation verification and literature search.

For figure generation, R (with metafor, DiagrammeR packages) or Python (with matplotlib) should be available on your system. If neither is available, the plugin generates script files for manual execution.

For DOCX export, [pandoc](https://pandoc.org/) is required: `brew install pandoc` (macOS) or `apt install pandoc` (Linux).

---

## License

MIT License. See [LICENSE](LICENSE) for details.
