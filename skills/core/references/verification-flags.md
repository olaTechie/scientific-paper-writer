# Verification Flags Reference

This document defines the four types of verification flags used by the
scientific-paper-writer plugin. These flags are inserted into manuscript text
whenever information is missing, ambiguous, unverifiable, or requires a figure
that could not be generated.

**Every flag must be resolved by the user before the manuscript is submitted.**
The assistant must never silently remove, replace, or ignore a flag.

---

## 1. `[PLEASE VERIFY: ___]`

**Purpose**: Marks a missing procedural or methodological detail that the
assistant could not find in the provided source materials.

**When to use**: The information is needed for a complete manuscript but was
not stated in the uploaded documents, extracted tables, or PAPER_CONTEXT.md.

### Examples

1. `[PLEASE VERIFY: randomisation method — was this computer-generated, block randomisation, or stratified?]`

2. `[PLEASE VERIFY: follow-up duration — the protocol states 12 months but the results table appears to report 6-month outcomes]`

3. `[PLEASE VERIFY: number of centres — single-centre or multicentre study?]`

4. `[PLEASE VERIFY: ethical approval — please confirm the ethics committee name and approval reference number]`

5. `[PLEASE VERIFY: funding source and role of funder in study design, data collection, analysis, and manuscript preparation]`

### Placement Rules for PLEASE VERIFY

- Insert inline, immediately after the sentence where the missing detail
  would appear.
- If the missing detail affects an entire subsection (e.g., the blinding
  subsection), place the flag at the beginning of that subsection.
- Use a descriptive note inside the brackets so the user knows exactly what
  to provide.

---

## 2. `[UNCLEAR IN SOURCE — please verify]`

**Purpose**: Marks data that is present in the source materials but is
ambiguous, contradictory, or could be interpreted in more than one way.

**When to use**: The assistant found relevant information but cannot determine
the correct interpretation with confidence.

### Examples

1. `[UNCLEAR IN SOURCE — please verify: Table 2 reports n = 234 for the intervention group, but the CONSORT flow diagram shows 238 participants randomised to intervention. Which is correct?]`

2. `[UNCLEAR IN SOURCE — please verify: the forest plot shows an OR of 1.45 but the text on page 8 states OR 1.43. Please confirm the correct value.]`

3. `[UNCLEAR IN SOURCE — please verify: the abstract states "no significant difference" but Table 3 shows p = 0.048 for the secondary outcome. Is this a different comparison or an error?]`

### Placement Rules for UNCLEAR IN SOURCE

- Insert inline, immediately after the ambiguous value or statement.
- Always describe both conflicting pieces of information so the user can
  adjudicate.
- Do not choose one interpretation over the other; present both and let
  the user decide.

---

## 3. `[Citation needed — unable to verify]`

**Purpose**: Marks a citation or reference that the assistant could not verify
against PubMed, CrossRef, Semantic Scholar, bioRxiv, or other available
databases.

**When to use**:
- The user provided a citation that cannot be found in any accessible database.
- The assistant needs to cite a claim but has no source to cite.
- A factual claim in the Introduction or Discussion lacks a supporting reference.

### Placement Rules for Citation Needed

- Insert at the end of the sentence or claim that requires a citation,
  before the period.
- If the user provided a reference that could not be verified, retain the
  user's reference text and append the flag:
  "...as reported by Smith et al. (2023) [Citation needed — unable to verify]."
- If no reference was provided at all, insert the flag where the citation
  would normally appear:
  "Cardiovascular disease is the leading cause of death worldwide
  [Citation needed — unable to verify]."

---

## 4. `[FIGURE NEEDED: description]`

**Purpose**: Marks a location in the manuscript where a figure is referenced
but could not be generated, located, or interpreted from the source materials.

**When to use**:
- The manuscript text refers to a figure that was not uploaded or generated.
- A figure generation attempt failed or produced unsatisfactory output.
- The user's source materials mention a figure that was not included in the
  uploaded files.

### Examples

1. `[FIGURE NEEDED: PRISMA 2020 flow diagram showing identification, screening, eligibility, and inclusion counts]`

2. `[FIGURE NEEDED: forest plot of primary outcome (overall survival) with subgroup analysis by geographic region]`

3. `[FIGURE NEEDED: funnel plot for assessment of publication bias across all included studies]`

### Placement Rules for FIGURE NEEDED

- Insert on its own line, at the location where the figure would appear
  in the manuscript.
- Include enough detail in the description for the user (or a future figure
  generation step) to create the figure.
- Always include the figure number if it has been assigned:
  `[FIGURE NEEDED: Figure 3 — network geometry plot showing all pairwise comparisons]`

---

## 5. General Flag Placement Rules

1. **Never nest flags.** Each flag stands alone. If a sentence has multiple
   issues, use separate flags for each.

2. **Never remove a flag without resolution.** Flags persist in the manuscript
   until the user explicitly confirms the information or provides the missing
   detail.

3. **Count flags in output.** At the end of each writing output, report the
   total number of flags inserted, grouped by type:
   - "This section contains 2 PLEASE VERIFY flags, 1 UNCLEAR IN SOURCE flag,
     and 0 Citation needed flags."

4. **Flag density warning.** If a single subsection contains more than 3 flags,
   warn the user that the source materials may be insufficient for this section
   and suggest uploading additional documents.

5. **Flags in tables.** When a flag appears inside a table cell, use the
   abbreviated form to save space:
   - `[VERIFY]` instead of `[PLEASE VERIFY: ___]`
   - `[UNCLEAR]` instead of `[UNCLEAR IN SOURCE — please verify]`
   - `[CITE]` instead of `[Citation needed — unable to verify]`
   - `[FIG]` instead of `[FIGURE NEEDED: description]`

   Place the full flag in a footnote below the table.
