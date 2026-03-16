# DOCX Reference Template

The `reference.docx` file is required for styled DOCX export via `/export-manuscript docx`.

## To create the reference template:

1. Install pandoc: `brew install pandoc` (macOS) or `apt install pandoc` (Linux)
2. Generate the default reference doc:
   ```bash
   pandoc -o reference.docx --print-default-data-file reference.docx
   ```
3. Open `reference.docx` in Microsoft Word or LibreOffice Writer
4. Modify the following styles:
   - **Normal:** Times New Roman, 12pt, double-spaced, justified
   - **Heading 1:** Times New Roman, 14pt, bold
   - **Heading 2:** Times New Roman, 12pt, bold
   - **Title:** Times New Roman, 16pt, bold, centred
   - **Author:** Times New Roman, 12pt, centred
   - **Abstract:** Times New Roman, 11pt, single-spaced
5. Set margins: 1 inch (2.54 cm) all sides
6. Add page numbers: bottom centre
7. Save as `reference.docx` in this directory

The `/export-manuscript` command will use this file automatically when generating DOCX output.
