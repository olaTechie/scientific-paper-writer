---
allowed-tools: Read, Write, Glob, Grep, Bash
argument-hint: "[folder-path] path to figures/tables folder"
description: "Generate publication-ready captions for figures and tables"
---

# /write-captions

## Step 1: Load core conventions

Read `skills/core/SKILL.md` for shared conventions (prose rules, precision, verification flags, no-fabrication guarantee).

## Step 2: Determine figure/table location

If provided as argument (`$ARGUMENTS`), treat it as the folder path. Otherwise, check `PAPER_CONTEXT.md` for a `Source materials` or `Figures` folder. If still unknown, ask the user: "Which folder contains your figures and tables? Please provide the path."

## Step 3: Load visual engine

Read `skills/visual/SKILL.md` for figure interpretation and caption guidance. Read any relevant files in `skills/visual/references/` for figure type-specific rules.

## Step 4: Check for optional integrations

Read `skills/integrations/SKILL.md`. Run detection if this is the first command invocation this session.

## Step 5: Read source materials

Use Glob to locate all figures and tables in the specified folder:
- Image files: `**/*.pdf`, `**/*.png`, `**/*.jpg`, `**/*.svg`, `**/*.tiff`
- Table files: `**/*.xlsx`, `**/*.csv`

Report back: "I found [N] files: [list of filenames]. Shall I proceed to read all of them?"

Read each figure/table image using the Read tool. For each file, extract:
- What type of figure/table it is and what data it displays
- Axis labels, column headers, footnotes visible in the image
- Statistical annotations and values
- For forest plots: study names, effect estimates, confidence intervals, heterogeneity statistics, overall pooled estimate
- For PRISMA flow diagrams: flow stages and numbers at each stage
- For tables: column headers, row labels, footnote symbols

**Critical rule:** Note all values visible — do not invent or estimate values not shown.

## Step 6: Write captions

For each figure and table, draft a publication-ready caption following the visual engine's caption rules:

1. **Title line** (bold, ≤15 words): states exactly what is shown
2. **Body** (2-5 sentences): describes the content, methods used to generate it, and how to interpret it. A reader should understand the figure without reading the main text.
3. **Abbreviations footnote**: define ALL abbreviations used in the caption or visible in the figure/table, in alphabetical order. Format: "Abbreviations: CI, confidence interval; HR, hazard ratio; ..."
4. **Statistical notes** (if applicable): explain any statistical symbols (e.g., diamond = pooled estimate, dashed line = extrapolation)

**Numbering convention:**
- Main figures: Figure 1, Figure 2, Figure 3, ...
- Supplementary figures: eFigure 1, eFigure 2, ...
- Main tables: Table 1, Table 2, ...
- Supplementary tables: eTable 1, eTable 2, ...

**Style rules:**
- Third person, past tense for methods ("Vaccine effectiveness was estimated using...")
- Present tense for descriptions of what is shown ("The forest plot shows...")
- UK English spelling
- Never invent values not visible in the source material

Present each caption to the user for confirmation before proceeding to the next.

## Step 7: Output review checklist

After all captions are written, output a review checklist:
- All abbreviations defined in the Abbreviations footnote?
- All visible statistical values accurately transcribed?
- Numbering consistent with main text cross-references?
- No values invented or estimated?
- Supplementary figures/tables correctly labelled with "e" prefix?

## Step 8: Save output

Compile all captions into a single document. Ask the user where to save. Write to file using the Write tool. If `PAPER_CONTEXT.md` specifies a `Manuscript output` folder, suggest saving there as `Figure_Table_Captions.md`.
