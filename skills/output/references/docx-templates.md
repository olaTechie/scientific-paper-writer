# DOCX Template Guide

This reference describes how to generate Microsoft Word (DOCX) output from
Markdown manuscripts using pandoc and a reference template.

---

## 1. Pandoc Conversion Command

### Basic Command

```bash
pandoc manuscript.md \
  --reference-doc=templates/docx/reference.docx \
  -o manuscript.docx
```

### With Bibliography

```bash
pandoc manuscript.md \
  --reference-doc=templates/docx/reference.docx \
  --bibliography=references.bib \
  --csl=vancouver.csl \
  -o manuscript.docx
```

### With Table of Contents

```bash
pandoc manuscript.md \
  --reference-doc=templates/docx/reference.docx \
  --bibliography=references.bib \
  --csl=vancouver.csl \
  --toc \
  -o manuscript.docx
```

### Full Command with All Options

```bash
pandoc manuscript.md \
  --reference-doc=templates/docx/reference.docx \
  --bibliography=references.bib \
  --csl=vancouver.csl \
  --citeproc \
  --number-sections \
  -o manuscript.docx
```

---

## 2. Reference Template Specification (reference.docx)

The `reference.docx` file stored at `templates/docx/reference.docx` defines the
styling for the output DOCX. It must contain the following style definitions:

### Font and Spacing

| Property | Value |
|---|---|
| Body font | Times New Roman, 12pt |
| Heading 1 font | Times New Roman, 14pt, Bold |
| Heading 2 font | Times New Roman, 12pt, Bold |
| Heading 3 font | Times New Roman, 12pt, Bold, Italic |
| Line spacing | Double-spaced (2.0) throughout |
| Paragraph spacing | 0pt before, 0pt after (spacing from line spacing only) |
| First line indent | 0.5 inches (for body text after the first paragraph of each section) |

### Margins

| Edge | Value |
|---|---|
| Top | 1 inch (2.54 cm) |
| Bottom | 1 inch (2.54 cm) |
| Left | 1 inch (2.54 cm) |
| Right | 1 inch (2.54 cm) |

### Page Numbers

- Position: bottom centre
- Starting from: title page (page 1)
- Format: Arabic numerals

### Heading Styles

The reference.docx maps Markdown headings to Word styles:

| Markdown | Word Style | Formatting |
|---|---|---|
| `#` | Heading 1 | 14pt, Bold, left-aligned |
| `##` | Heading 2 | 12pt, Bold, left-aligned |
| `###` | Heading 3 | 12pt, Bold Italic, left-aligned |
| Body text | Normal | 12pt, double-spaced |
| Table text | Table Normal | 10pt, single-spaced within cells |

---

## 3. Creating the Reference Template

If `templates/docx/reference.docx` does not exist, create it:

### Method 1 — Generate from Pandoc Default

```bash
pandoc -o templates/docx/reference.docx --print-default-data-file reference.docx
```

Then open the generated file in Word and modify styles as specified in Section 2.

### Method 2 — Create Manually

1. Open a new Word document
2. Set page margins: 1 inch all sides
3. Modify the "Normal" style: Times New Roman, 12pt, double-spaced
4. Modify "Heading 1": Times New Roman, 14pt, Bold, double-spaced
5. Modify "Heading 2": Times New Roman, 12pt, Bold, double-spaced
6. Modify "Heading 3": Times New Roman, 12pt, Bold Italic, double-spaced
7. Add page numbers: bottom centre
8. Save as `templates/docx/reference.docx`

---

## 4. Citation Style Language (CSL) Files

Pandoc uses CSL files to format citations and bibliographies. Common CSL files:

| Style | CSL File | Source |
|---|---|---|
| Vancouver | `vancouver.csl` | https://www.zotero.org/styles/vancouver |
| APA 7th | `apa.csl` | https://www.zotero.org/styles/apa |
| AMA | `american-medical-association.csl` | https://www.zotero.org/styles/american-medical-association |
| Nature | `nature.csl` | https://www.zotero.org/styles/nature |
| Chicago Author-Date | `chicago-author-date.csl` | https://www.zotero.org/styles/chicago-author-date |
| IEEE | `ieee.csl` | https://www.zotero.org/styles/ieee |

Download the appropriate CSL file and place it in the project root or a `csl/` directory.

---

## 5. Troubleshooting

### Pandoc Not Installed

If `which pandoc` returns nothing:

```
[DOCX EXPORT: Pandoc is not installed on this system. To install:

macOS:    brew install pandoc
Ubuntu:   sudo apt-get install pandoc
Windows:  Download from https://pandoc.org/installing.html

After installation, run:
pandoc manuscript.md --reference-doc=templates/docx/reference.docx -o manuscript.docx]
```

### Common Errors

| Error | Cause | Solution |
|---|---|---|
| `reference.docx not found` | Template file missing | Create using Method 1 or 2 in Section 3 |
| `CSL file not found` | Citation style file missing | Download from Zotero Style Repository |
| `Bibliography not found` | `.bib` file missing or wrong path | Check the `--bibliography` path |
| `Images not rendering` | Image paths are relative | Use absolute paths or ensure working directory is correct |
| `Tables misformatted` | Complex Markdown tables | Simplify table structure or use pipe tables |

### Fallback Without Pandoc

If pandoc cannot be installed, provide the Markdown output with these instructions:

1. Copy the Markdown text
2. Paste into Google Docs or Microsoft Word
3. Apply formatting manually:
   - Font: Times New Roman, 12pt
   - Spacing: Double-spaced
   - Margins: 1 inch all sides
4. Format references manually or use Zotero/Mendeley integration

---

## 6. Supplementary Materials in DOCX

Supplementary materials can be:

1. **Appended to the main document** — add after the reference list with a page break
2. **Exported as a separate file** — `pandoc supplementary.md --reference-doc=templates/docx/reference.docx -o supplementary.docx`

For supplementary materials:
- Use eFigure and eTable numbering
- Reset figure/table counters (handled automatically by pandoc if using separate files)
- Include a supplementary table of contents if more than 5 supplementary items
