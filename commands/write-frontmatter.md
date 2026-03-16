---
allowed-tools: Read, Write, Glob, Grep, WebSearch, WebFetch, Task
argument-hint: "[section] e.g. abstract, introduction, title, all"
description: "Write the Abstract, Introduction, and Title after the manuscript body is complete"
---

# /write-frontmatter

## Step 1: Load core conventions

Read `skills/core/SKILL.md` for shared conventions (prose rules, precision, verification flags, no-fabrication guarantee).

## Step 2: Determine target journal and section

If provided as argument (`$ARGUMENTS`), use that to determine which section(s) to write (abstract, introduction, title, or all). If not specified, write all three.

Check `PAPER_CONTEXT.md` for `Target journal` and `Output format`. If not found, ask the user:
- What is the target journal or abstract format? (JAMA Network, Lancet, BMJ, Annals, Nature Medicine, Generic structured, other)
- What is the abstract word limit?

## Step 3: Load output engine and abstract formats

Read `skills/output/SKILL.md` for export format guidance. Read `skills/output/references/abstract-formats.md` for journal-specific abstract templates and word limits.

Also read `skills/citations/SKILL.md` for citation verification — the Introduction requires verified citations.

## Step 4: Check for optional integrations

Read `skills/integrations/SKILL.md`. Run detection if this is the first command invocation this session. If `scientific-writing` is detected, use its two-stage outline-then-prose workflow. If `research-lookup` integration is detected, use it for Introduction citations.

## Step 5: Read completed manuscript sections

This command REQUIRES completed Results and Discussion sections. Read them first. Also read any completed Methods section.

If `PAPER_CONTEXT.md` specifies a `Manuscript output` folder, look there. Otherwise, ask the user for the file locations.

Extract from the completed sections:
- Primary outcome estimate and key statistics
- Study design, population, dates, countries
- Main conclusion and implications
- All numerical values (to cross-check against the Abstract)

## Step 6: Write section by section

Write each section in order, pausing after each for user confirmation.

### Abstract

1. Select the journal-specific format from `skills/output/references/abstract-formats.md`
2. Draft the structured abstract following the template sections for the target journal
3. Extract all numbers directly from the completed Results — never round or paraphrase differently than the Results section
4. Do not cite references in the abstract
5. Do not introduce information not in the manuscript
6. After drafting, count words using Bash: `echo "<abstract text>" | wc -w`
7. Trim if over the word limit; report the final word count

### Introduction

Write a 4-paragraph structured Introduction (~450-475 words total):

**Paragraph 1 — Disease/Problem Burden (~150 words):**
- Establish global or population-level burden
- Cite recent, high-quality epidemiological data (verify via citation engine before citing)

**Paragraph 2 — Knowledge Gap (~150 words):**
- Summarise what is known from prior research
- Identify the specific gap, uncertainty, or controversy this study addresses
- State why existing evidence is insufficient

**Paragraph 3 — Study Rationale (~100 words):**
- State what this study did (design, population, outcome)
- Briefly state the analytic approach
- Do NOT report results here

**Paragraph 4 — Aims (~50-75 words):**
- State primary and secondary aims clearly
- One sentence per aim

**Citation rules for Introduction:**
- Vancouver numbering from 1
- Verify all citations via the citation engine pipeline
- Limit to 12-18 references total
- Flag any unverifiable citation: `[Citation needed — unable to verify]`

### Title

Generate 3 title variants:
1. **Descriptive title** — states what was done (design + outcome + population)
2. **Findings-forward title** — leads with the key result
3. **Question-format title** — poses the research question

For each:
- Keep under 20 words
- Include study design in title or subtitle
- Avoid acronyms unless universally understood
- Avoid hyperbolic language ("novel", "first", "breakthrough")
- UK English spelling

Ask the researcher which title they prefer, or offer to combine elements.

## Step 7: Save output

Ask the user where to save the completed frontmatter sections. Write to file using the Write tool. If `PAPER_CONTEXT.md` specifies a `Manuscript output` folder, suggest saving there.
