---
allowed-tools: Read, Write, Glob, Grep, Bash
argument-hint: "[format] e.g. latex, docx, both [venue] e.g. jama, lancet, generic"
description: "Export the manuscript to LaTeX and/or DOCX format"
---

# /export-manuscript

## Step 1: Load output engine

Read `skills/output/SKILL.md` for export format guidance. Read relevant files in `skills/output/references/` for LaTeX and DOCX template details:
- `skills/output/references/latex-templates.md`
- `skills/output/references/docx-templates.md`

## Step 2: Determine format and venue

Parse `$ARGUMENTS` for:
- **Format:** `latex`, `docx`, or `both` (required)
- **Venue:** `jama`, `lancet`, or `generic` (optional, defaults to `generic`)

If not provided as arguments, check `PAPER_CONTEXT.md` for `Output format` and `Target journal`. If still unknown, ask the user:
- What output format do you need? (latex / docx / both)
- What is the target journal or venue? (jama / lancet / generic)

## Step 3: Gather manuscript sections

Use Glob to find all written manuscript sections in the working folder:
- `**/*title*.md`
- `**/*abstract*.md`
- `**/*introduction*.md`
- `**/*methods*.md`
- `**/*results*.md`
- `**/*discussion*.md`
- `**/*captions*.md`
- `**/*references*.md`

Read each section found. If critical sections are missing (Methods, Results, Discussion), warn the user:
> "Warning: The following sections are missing: [list]. The exported manuscript will be incomplete. Continue anyway?"

## Step 4: Create output directory

Run via Bash:
```
mkdir -p manuscript
mkdir -p manuscript/figures
```

## Step 5: Export LaTeX (if format is `latex` or `both`)

1. Read the appropriate template from `templates/latex/`:
   - `generic` — `templates/latex/generic-article.tex`
   - `jama` — `templates/latex/jama.tex`
   - `lancet` — `templates/latex/lancet.tex`
2. Assemble the manuscript: insert each section into the template at the correct location
3. Generate `manuscript/references.bib` from the verified reference list — convert each reference to BibTeX format with proper entry types (@article, @book, @inproceedings, etc.)
4. Copy figure files to `manuscript/figures/` via Bash
5. Write `manuscript/manuscript.tex`
6. Notify the user:
   > "LaTeX manuscript saved to `manuscript/manuscript.tex`. Compile with: `pdflatex manuscript.tex && bibtex manuscript && pdflatex manuscript.tex && pdflatex manuscript.tex`"

## Step 6: Export DOCX (if format is `docx` or `both`)

1. Check for pandoc via Bash: `which pandoc`
2. **If pandoc is available:**
   - Assemble all sections into a single Markdown file: `manuscript/manuscript.md`
   - Check for reference template: `ls templates/docx/reference.docx 2>/dev/null`
   - If reference.docx exists: `pandoc manuscript/manuscript.md -o manuscript/manuscript.docx --reference-doc=templates/docx/reference.docx`
   - If no reference.docx: `pandoc manuscript/manuscript.md -o manuscript/manuscript.docx`
   - Notify the user: "DOCX manuscript saved to `manuscript/manuscript.docx`"
3. **If pandoc is NOT available:**
   - Save assembled Markdown to `manuscript/manuscript.md`
   - Notify: "DOCX export requires pandoc. Install via `brew install pandoc` (macOS) or `apt install pandoc` (Linux), then re-run `/export-manuscript docx`"

## Step 7: Summary

List all files created in `manuscript/` and their purposes:
- `manuscript/manuscript.tex` — LaTeX source (if LaTeX export)
- `manuscript/references.bib` — BibTeX bibliography (if LaTeX export)
- `manuscript/figures/` — Figure files (if LaTeX export)
- `manuscript/manuscript.docx` — Word document (if DOCX export)
- `manuscript/manuscript.md` — Assembled Markdown (if DOCX export or pandoc not available)

Report any warnings or missing sections that may need attention before submission.
