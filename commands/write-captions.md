---
description: Write standalone publication-ready captions for all figures and tables
allowed-tools: Read, Glob, Write, Bash
argument-hint: [folder-path] path to figures/tables folder
---

You are helping a researcher write publication-ready captions and legends for all figures and tables in their manuscript.

## Step 1 — Locate Figures and Tables

If $ARGUMENTS is provided, treat it as the folder path and list files there.
Otherwise ask: "Which folder contains your figures and tables? Please provide the path."

Use Glob to list all image files (PDF, PNG, JPG, SVG) and table files (XLSX, CSV, PDF) in the specified folder.
Report back: "I found [N] files: [list of filenames]. Shall I proceed to read all of them?"

## Step 2 — Read Each Figure and Table

For each file, in order:
- Use Read to open the file and view its contents as an image or data
- Extract: what type of figure/table it is, what data it displays, axis labels, column headers, footnotes visible in the image, any statistical annotations
- If a figure is a forest plot: extract study names, effect estimates, confidence intervals, heterogeneity statistics, overall pooled estimate
- If it is a trajectory or prediction plot: note time axes, prediction line, CI/PI bands, threshold lines
- If it is a PRISMA flow diagram: note the flow stages and numbers at each stage
- If it is a table: note column headers, row labels, any footnote symbols

Note all values visible — do not invent or estimate values not shown.

## Step 3 — Write Captions

For each figure and table, write a standalone caption that:

### Structure
- **Figure/Table title line:** Bold, concise, ≤15 words. States exactly what is shown.
- **Body:** 2–5 sentences describing the content, methods used to generate it, and how to interpret it. A reader should understand the figure without reading the main text.
- **Abbreviations footnote:** Define ALL abbreviations used in the caption or visible in the figure/table, in alphabetical order. Format: "Abbreviations: CI, confidence interval; HR, hazard ratio; ..."
- **Statistical notes (if applicable):** Explain any statistical symbols (e.g., diamond = pooled estimate, dashed line = extrapolation, ‡ = p < 0.05)

### Caption Numbering
- Main figures: Figure 1, Figure 2, Figure 3, ...
- Supplementary/eFigures: eFigure 1, eFigure 2, ...
- Main tables: Table 1, Table 2, ...
- Supplementary tables: eTable 1, eTable 2, ...

Ask the researcher to confirm the numbering order before finalising if unclear.

### Tone and Style
- Third person, past tense for methods ("Vaccine effectiveness was estimated using...")
- Present tense for descriptions of what is shown ("The forest plot shows...")
- UK English spelling
- No citations in captions unless essential (e.g., citing a reporting guideline)
- Do not repeat the main text — the caption must be self-contained

## Step 4 — Save as Document

After all captions are written:
- Compile all captions into a single Markdown file
- Ask: "Would you like me to save these as a formatted Word document (.docx) as well?"
- If yes, trigger the docx skill to generate a professionally formatted Word file
- Save the Markdown file to the same folder as the figures, named: `Figure_Table_Captions.md`

## Step 5 — Review Checklist

Before finishing, confirm:
- [ ] Every abbreviation defined in the Abbreviations footnote
- [ ] All visible statistical values accurately transcribed
- [ ] Numbering consistent with main text cross-references
- [ ] No values invented or estimated
- [ ] Supplementary figures/tables correctly labelled with "e" prefix
