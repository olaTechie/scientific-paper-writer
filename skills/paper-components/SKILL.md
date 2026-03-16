---
name: paper-components
description: >
  This skill should be used when writing the Abstract, Introduction, Title, figure/table
  captions, or reference list of a quantitative research paper. Trigger phrases include:
  "write my abstract", "write the introduction", "suggest a title", "write figure captions",
  "write table captions", "format my references", "write the Key Points", "write a
  structured abstract", "write JAMA abstract", "write Lancet abstract",
  "help me write the introduction", "generate caption for figure".
version: 0.1.0
---

# Paper Components: Abstract, Introduction, Title, Captions, References

## Guiding Principle

The Abstract, Introduction, and Title are written LAST — after Results and Discussion are complete. They summarise the finished work. Never draft frontmatter before the body exists.

Captions and references can be written at any stage but are finalised after all sections are complete.

---

## Abstract

### When to Write
After Results and Discussion are both complete.

### What the Abstract Must Contain
Every number in the abstract must match exactly the numbers in the completed Results section. Extract directly — do not round differently, paraphrase, or approximate.

### Format by Journal Type (see `references/abstract-formats.md` for full detail)

| Journal | Sections | Word limit |
|---------|----------|------------|
| JAMA Network Open | Importance, Objective, Data Sources, Study Selection, Data Extraction and Synthesis, Main Outcomes and Measures, Results, Conclusions and Relevance + Key Points | ≤350 |
| The Lancet | Background, Methods, Findings, Interpretation, Funding | ≤250 |
| BMJ | Objectives, Design, Setting, Participants, Interventions, Main Outcome Measures, Results, Conclusions | ≤400 |
| Annals of Internal Medicine | Background, Objective, Design, Setting, Participants, Measurements, Results, Limitations, Conclusion, Primary Funding Source | ≤250 |
| Nature Medicine | Unstructured paragraph | ≤150 |
| Generic structured | Background, Methods, Results, Conclusions | flexible |

### Key Points (JAMA format only)
Three items, outside the word count:
- **Question:** The research question in 1 sentence
- **Findings:** 2–3 sentences; all key quantitative findings with statistics
- **Meaning:** 1–2 sentences; what the findings mean for practice, policy, or science

### Rules
- No citations in the abstract
- No information not in the manuscript
- UK English spelling
- Count words after drafting; trim from longest section first
- Verify word count programmatically using bash: `echo "text" | wc -w`

---

## Introduction

### Structure (4 paragraphs)

**Paragraph 1 — Disease / Problem Burden (~150 words)**
- Establish global or population-level burden of the disease, condition, or problem
- Use recent, specific epidemiological data (incidence, mortality, economic cost, disability)
- Cite high-quality sources: GBD, WHO, ECDC, national surveillance data
- Set the clinical or public health stakes — why this matters to readers

**Paragraph 2 — Knowledge Gap (~150 words)**
- Summarise what is known from prior research (prior SRMAs, landmark trials, current guidelines)
- Identify the specific gap, uncertainty, or controversy this study addresses
- State precisely why existing evidence is insufficient: outdated, underpowered, heterogeneous methods, restricted populations, limited follow-up
- Do not over-claim the novelty — be precise about what was not known

**Paragraph 3 — Study Rationale and Methods Summary (~100 words)**
- State what this study did: design, population, outcome, analytic approach
- The reader should understand the "what" before the "why matters" (paragraph 4)
- Do NOT report results in the Introduction

**Paragraph 4 — Aims (~50–75 words)**
- Primary aim: 1 sentence
- Secondary aims: 1 sentence each (if applicable)
- Standard formula: "This [systematic review / RCT / cohort study] aimed to [primary aim]. Secondary objectives were to [aim 2] and [aim 3]."

### Citation Rules for Introduction
- Verify all citations via PubMed or WebSearch before including
- Vancouver numbering from 1 (numbers carry across sections)
- Flag unverifiable: [Citation needed — unable to verify in PubMed]
- Limit: 12–18 strategic citations
- Full reference list at end with DOI and PMID

---

## Title

### Principles
- Under 20 words (main title); subtitle acceptable for extra context
- Include study design (e.g., "A Systematic Review and Meta-Analysis")
- Include the exposure/intervention and outcome
- Include the population
- Avoid: "novel", "first", "breakthrough", "new", "unique" (these are unverifiable claims)
- Avoid acronyms unless universally understood in the field
- UK English spelling

### Three Title Types to Offer
1. **Descriptive** — states what was done: "[Exposure] and [Outcome] in [Population]: A [Study Design]"
2. **Findings-forward** — leads with result: "[X% VE / Significant Association] of [Exposure] with [Outcome]: A [Study Design]"
3. **Question-format** — poses the research question: "Does [Exposure] Reduce [Outcome] in [Population]? A [Study Design]"

---

## Figure and Table Captions

### Structure of Every Caption
1. **Title line** (bold): concise, ≤15 words, states exactly what is shown
2. **Body** (2–5 sentences): describes content, methods used to generate it, how to interpret it
3. **Abbreviations footnote**: all abbreviations defined alphabetically — "Abbreviations: AUC, area under the receiver operating curve; CI, confidence interval; ..."
4. **Statistical notes** (if applicable): diamond = pooled estimate; dashed line = extrapolation; ‡ = p < 0.05

### Rules
- Standalone: a reader must understand the figure without reading the main text
- UK English spelling
- No citations unless citing a reporting guideline (e.g., PRISMA)
- Never invent values — only transcribe what is visible in the figure/table
- Supplementary items: eFigure, eTable prefix

---

## References

### Vancouver Style (most common in biomedical journals)
Format: `Author AA, Author BB, Author CC. Title. *Journal Abbrev*. Year;Volume(Issue):Pages. doi:XX PMID: XXXXXXXX`

Rules:
- ≤6 authors: list all; >6 authors: first 6 then "et al."
- Journal abbreviated per NLM standard (search: NLM catalog)
- Title in sentence case
- Volume(Issue):Pages format: 39(23):3120–3130
- En-dash in page ranges (–), not hyphen (-)
- DOI format: doi:10.XXXX/XXXXX (no "https://doi.org/" prefix in Vancouver)
- Include PMID for all journal articles

### Verification Protocol
For every citation:
1. Search PubMed: https://pubmed.ncbi.nlm.nih.gov/[PMID]/ or by title/author
2. Confirm: authors, title, journal, year, volume, pages, DOI all match
3. Flag if unverifiable: [UNVERIFIED — please check manually]
4. Never fabricate a citation

### Reference Files
See `references/abstract-formats.md` for full journal-specific abstract templates.
See `references/caption-standards.md` for caption examples by figure type.
See `references/reference-verification.md` for PubMed search strategies.
