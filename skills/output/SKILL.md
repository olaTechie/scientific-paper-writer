---
name: output-engine
description: >
  Manuscript export and formatting engine. Supports Markdown (default working format),
  LaTeX (venue-specific templates with BibTeX generation), and DOCX (via pandoc with
  reference template). Handles format conversion, template selection, and
  supplementary material packaging. Trigger phrases include: "export manuscript",
  "convert to LaTeX", "generate DOCX", "format for JAMA", "export to Word",
  "write in LaTeX", "create bibliography".
version: 1.0.0
triggers:
  - export manuscript
  - convert to LaTeX
  - generate DOCX
  - format for journal
  - create bibliography
---

# Output Engine

This skill manages all manuscript output formatting and export. It supports three
output formats — Markdown, LaTeX, and DOCX — and handles venue-specific template
selection, bibliography generation, figure integration, and supplementary material
packaging.

---

## 1. Markdown (Default Working Format)

Markdown is the default working format for all manuscript drafting. All section-writing
skills produce Markdown output that is clean and paste-ready.

### Format Conventions

- **Headings:** `#` for manuscript title, `##` for major sections (Methods, Results, etc.), `###` for subsections
- **Bold:** `**text**` for emphasis (used sparingly)
- **Italic:** `*text*` for journal names, statistical symbols, and gene/species names
- **Tables:** Pipe-delimited Markdown tables with header separator row
- **Figures:** Referenced by label: `Figure 1`, `eFigure 1`, not embedded as images
- **Citations:** Numbered in square brackets: `[1]`, `[2,3]`, `[4-7]`
- **Supplementary:** Clearly separated with a `## Supplementary Materials` heading

### Paste-Ready Output

When the user copies Markdown output into a manuscript:
- No raw HTML tags
- No code fences (except in supplementary code appendices)
- No emoji or special Unicode beyond standard scientific symbols (en-dash, multiplication sign, degree symbol)
- Clean line breaks: one blank line between paragraphs, no trailing whitespace

---

## 2. LaTeX Export

### 2.1 Venue Template Selection

The LaTeX template is selected based on `target_journal` in PAPER_CONTEXT.md or
user request. See `references/latex-templates.md` for detailed guidance.

| Template | Target Journals | Document Class |
|---|---|---|
| Generic | Any journal not listed below | `article` with standard packages |
| JAMA | JAMA, JAMA Network Open, JAMA Internal Medicine | Custom JAMA class or `article` with JAMA formatting |
| Lancet | The Lancet, Lancet Infectious Diseases, Lancet Public Health | `article` with Lancet formatting |

Template files are stored in `templates/latex/`. If no template exists for the
requested journal, use the generic template and note: `[NOTE: Using generic LaTeX
template. Journal-specific formatting may need manual adjustment.]`

### 2.2 Preamble Structure

Every LaTeX document includes:

```latex
\documentclass[12pt,a4paper]{article}

% Essential packages
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{times}              % Times New Roman font
\usepackage[margin=1in]{geometry}
\usepackage{setspace}           % Line spacing
\usepackage{graphicx}           % Figure inclusion
\usepackage{booktabs}           % Professional tables
\usepackage{amsmath}            % Mathematical notation
\usepackage{hyperref}           % DOI and URL links
\usepackage{natbib}             % Bibliography management
\usepackage{caption}            % Caption formatting
\usepackage{subcaption}         % Sub-figures

\doublespacing                  % Double-spaced by default
```

Additional packages are loaded as needed based on content (e.g., `tikz` for
diagrams, `longtable` for multi-page tables, `pdflscape` for landscape pages).

### 2.3 BibTeX Generation

When exporting to LaTeX, generate a corresponding `.bib` file:

```bibtex
@article{page2021prisma,
  author    = {Page, Matthew J. and McKenzie, Joanne E. and Bossuyt, Patrick M.
               and Boutron, Isabelle and Hoffmann, Tammy C. and Mulrow, Cynthia D.
               and Shamseer, Larissa and Tetzlaff, Jennifer M. and Akl, Elie A.
               and Brennan, Sue E. and others},
  title     = {The {PRISMA} 2020 statement: an updated guideline for reporting
               systematic reviews},
  journal   = {BMJ},
  year      = {2021},
  volume    = {372},
  pages     = {n71},
  doi       = {10.1136/bmj.n71},
  pmid      = {33782057}
}
```

**BibTeX key convention:** `firstauthorlastname` + `year` + `firstkeyword` (all lowercase, no spaces).

### 2.4 Figure Integration

Figures are included using standard LaTeX float environments:

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=\textwidth]{figures/figure1.pdf}
  \caption{Caption text here.}
  \label{fig:figure1}
\end{figure}
```

- Prefer PDF or EPS vector formats for figures
- PNG/JPG acceptable at minimum 300 DPI
- Figures referenced via `\ref{fig:figure1}` in text

### 2.5 Supplementary Materials

Supplementary materials are placed in a separate section or file:

```latex
\clearpage
\section*{Supplementary Materials}
\setcounter{figure}{0}
\setcounter{table}{0}
\renewcommand{\thefigure}{e\arabic{figure}}
\renewcommand{\thetable}{e\arabic{table}}
```

This resets counters and prefixes with "e" for eFigure and eTable numbering.

---

## 3. DOCX Export

### 3.1 Pandoc Detection

```bash
which pandoc
```

Run via Bash to detect whether pandoc is installed.

### 3.2 If Pandoc is Available

Convert Markdown to DOCX using a reference template:

```bash
pandoc manuscript.md \
  --reference-doc=templates/docx/reference.docx \
  --bibliography=references.bib \
  --csl=vancouver.csl \
  -o manuscript.docx
```

The `reference.docx` template defines:
- **Font:** Times New Roman, 12pt
- **Spacing:** Double-spaced throughout
- **Margins:** 1 inch (2.54 cm) on all sides
- **Page numbers:** Bottom centre, starting from title page
- **Heading styles:** Mapped from Markdown headings

See `references/docx-templates.md` for detailed template specifications.

### 3.3 If Pandoc is Not Available

Provide the user with instructions:

```
[DOCX EXPORT: Pandoc is not installed on this system. To convert to DOCX:

1. Install pandoc: https://pandoc.org/installing.html
2. Run: pandoc manuscript.md --reference-doc=templates/docx/reference.docx -o manuscript.docx

Alternatively, copy the Markdown output into Google Docs or Microsoft Word
and apply formatting manually.]
```

### 3.4 Deprecation Note

Per-command DOCX output (e.g., "write methods as DOCX") is deprecated. All DOCX
conversion is handled via the `/export-manuscript` command, which processes the
complete manuscript at once. This ensures consistent formatting across all sections.

---

## 4. Export Workflow

When the user invokes `/export-manuscript` or "export manuscript":

### Step 1 — Determine Output Format
1. Check `output_format` in PAPER_CONTEXT.md
2. If not specified, ask: "Which format? Markdown (default), LaTeX, or DOCX?"

### Step 2 — Assemble Manuscript
1. Collect all drafted sections in expert writing order (Methods, Results, Discussion, Abstract, Introduction, Title, Captions, References)
2. Verify all sections are present; warn about missing sections
3. Run cross-reference check: figure/table mentions match actual figures/tables

### Step 3 — Format and Export

**Markdown:**
- Combine sections into a single clean Markdown file
- Append reference list at the end
- Add supplementary materials after main text

**LaTeX:**
- Select venue template (Section 2.1)
- Generate preamble (Section 2.2)
- Convert each section to LaTeX
- Generate `.bib` file (Section 2.3)
- Integrate figures (Section 2.4)
- Add supplementary materials (Section 2.5)
- Output: `.tex` file + `.bib` file + figure files

**DOCX:**
- Detect pandoc (Section 3.1)
- Convert via pandoc with reference template (Section 3.2)
- Or provide manual instructions (Section 3.3)

### Step 4 — Post-Export Checks
- Verify word counts for abstract and main text against journal limits
- Confirm all figures are referenced and files exist
- Confirm reference numbering is sequential and complete
- Report export location and any warnings

---

## 5. Error Handling

| Error Condition | Action |
|---|---|
| Missing sections in manuscript | Warn user with list of missing sections; export available sections with placeholders |
| Unknown target journal | Use generic template; note that manual formatting may be needed |
| Pandoc not installed | Provide installation instructions and manual conversion guidance |
| LaTeX compilation fails | Report error; suggest checking package dependencies |
| Figure files not found | Flag with `[FIGURE MISSING: expected at <path>]` |
| Word count exceeds journal limit | Report excess and suggest sections to trim |

---

## References

- `references/abstract-formats.md` — Structured abstract formats for all supported journals
- `references/latex-templates.md` — LaTeX template selection and preamble guide
- `references/docx-templates.md` — DOCX template specifications and pandoc commands
