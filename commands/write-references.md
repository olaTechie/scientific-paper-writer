---
allowed-tools: Read, Write, Glob, Grep, WebSearch, WebFetch, Bash
argument-hint: "[style] e.g. vancouver, apa, ama, nature, chicago, ieee"
description: "Verify citations via multi-source pipeline and format the reference list"
---

# /write-references

## Step 1: Load core conventions

Read `skills/core/SKILL.md` for shared conventions (prose rules, precision, verification flags, no-fabrication guarantee).

## Step 2: Determine citation style

If provided as argument (`$ARGUMENTS`), use that as the citation style. Otherwise, check `PAPER_CONTEXT.md` for a `Citation style` or `Target journal` field. If still unknown, ask the user:
- Vancouver (numbered, superscript in-text)
- APA (author-year in-text)
- AMA (numbered superscript)
- Nature (numbered, bracketed in-text)
- Chicago (author-date or notes-bibliography)
- IEEE (numbered, bracketed in-text)

## Step 3: Load citation engine and style guide

Read `skills/citations/SKILL.md` for the multi-source verification pipeline. Read `skills/citations/references/citation-styles.md` for formatting rules specific to the selected style.

## Step 4: Check for optional integrations

Read `skills/integrations/SKILL.md`. Run detection if this is the first command invocation this session. If `citation-management` integration is detected, delegate to it for Google Scholar + BibTeX workflows.

## Step 5: Read manuscript and extract citations

Read the manuscript draft. Use Glob to find all written sections:
- `**/*methods*.md`, `**/*results*.md`, `**/*discussion*.md`, `**/*abstract*.md`, `**/*introduction*.md`

Read each section and extract all in-text citation markers (numbered superscripts, author-year references, or placeholder markers like `[REF]`).

List all cited works: "I found [N] citation markers. Let me now verify each one."

## Step 6: Verify and format references

For each citation, run the 4-source verification pipeline from `skills/citations/SKILL.md`:

1. **PubMed** — Search by title/author, extract PMID, DOI, full metadata
2. **CrossRef** — Verify DOI, extract additional metadata if PubMed incomplete
3. **Semantic Scholar** — Cross-check, find alternative identifiers
4. **bioRxiv** — Check for preprints, identify preprint-to-published upgrades

For each verified reference:
- Normalise metadata (author names, journal abbreviations, page ranges with en-dash)
- Format per the selected citation style
- Check for preprint-to-published upgrades (suggest replacing preprints with published versions)

After all references are formatted:
- Number sequentially from 1 (Vancouver/AMA/Nature/IEEE) or sort alphabetically by first author (APA/Chicago)
- Cross-reference in-text citation numbers against the reference list
- Flag any discrepancies between in-text markers and the reference list
- Flag any reference that cannot be verified: `[UNVERIFIED — please check manually]`

**Critical rule:** Do NOT fabricate or invent citations under any circumstances.

## Step 7: Output verification summary

After all references are processed, output a verification summary:
- N references verified (with source: PubMed / CrossRef / Semantic Scholar)
- N references unverified (flagged for manual review)
- N preprint-to-published upgrade suggestions
- Any in-text citation numbering discrepancies

## Step 8: Save output

Ask the user where to save the completed reference list. Write to file using the Write tool. If `PAPER_CONTEXT.md` specifies a `Manuscript output` folder, suggest saving there.

Include DOI and PMID (where available) for all journal articles in the output.
