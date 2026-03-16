---
description: Write Abstract, Introduction, and Title after the body is complete
allowed-tools: Read, WebSearch, WebFetch, Task
argument-hint: [section] e.g. abstract, introduction, title, all
---

You are helping a researcher write the frontmatter of a quantitative research paper — the Abstract, Introduction, and Title. These are written AFTER the Results and Discussion are complete, because they summarise the completed work.

## Step 1 — Load Completed Sections

Before writing anything:
- Ask the researcher: "Can you share your completed Results and Discussion sections, or a draft report?"
- Use Read to load all available completed sections
- Extract: primary outcome, key statistics, study design, population, dates, countries, main conclusion
- Ask: what is the target journal or abstract format? (JAMA Network, Lancet, BMJ, Annals, Nature Medicine, Generic structured, other)
- Ask: what is the abstract word limit? (JAMA: 350 words, Lancet: 250 words, BMJ: 400 words — check if unsure)

If $ARGUMENTS specifies a section (abstract / introduction / title), write only that section.

## Step 2 — Write the Structured Abstract

Use the format appropriate to the target journal. Default to JAMA Network format unless otherwise specified.

### JAMA Network Format (≤350 words)
Sections in order:
1. **Importance** (1–2 sentences: why this question matters)
2. **Objective** (1 sentence: what this study aimed to do)
3. **Data Sources** (databases, dates, supplementary searches)
4. **Study Selection** (design types, population, outcome, comparator)
5. **Data Extraction and Synthesis** (who extracted, risk of bias tools, statistical methods)
6. **Main Outcomes and Measures** (primary outcome definition)
7. **Results** (key numbers: N studies, pooled estimate with 95% CI, heterogeneity, key secondary findings)
8. **Conclusions and Relevance** (main takeaway, what it means for practice or policy)

Followed by **Key Points** (outside word count):
- **Question:** The research question in 1 sentence
- **Findings:** 2–3 sentences with key quantitative findings
- **Meaning:** 1–2 sentences on implications

### Lancet Format (≤250 words)
Sections: Background / Methods / Findings / Interpretation / Funding

### BMJ Format (≤400 words)
Sections: Objectives / Design / Setting / Participants / Interventions / Main Outcome Measures / Results / Conclusions

### Generic Structured Format
Sections: Background / Methods / Results / Conclusions

### Rules for All Abstracts
- Extract all numbers directly from completed Results — do not paraphrase or round differently
- Do not cite references in the abstract
- Do not introduce information not in the manuscript
- Count words carefully and trim if over limit
- UK English spelling throughout

## Step 3 — Write the Introduction

Write a 4-paragraph structured Introduction:

**Paragraph 1 — Disease/Problem Burden (~150 words):**
- Establish global or population-level burden of the condition or problem
- Cite recent, high-quality epidemiological data (verify before citing)
- Set the clinical or public health stakes

**Paragraph 2 — Evidence Gap (~150 words):**
- Summarise what is known from prior research
- Identify the specific gap, uncertainty, or controversy this study addresses
- State why existing evidence is insufficient (outdated, underpowered, heterogeneous, methodologically limited)

**Paragraph 3 — Study Rationale and Methods Summary (~100 words):**
- State what this study did (design, population, outcome)
- Briefly state the analytic approach
- Do NOT report results here

**Paragraph 4 — Aims (~50–75 words):**
- State the primary and secondary aims clearly
- Use: "This systematic review aimed to..." / "This study aimed to..."
- One sentence per aim

### Citation Rules for Introduction
- Use WebSearch and PubMed to verify all citations before including
- Vancouver numbering from 1
- Only include real, PubMed-indexed sources
- Flag unverifiable citations: [Citation needed — unable to verify]
- Limit to 15–20 strategic citations total
- Provide full reference list with DOI and PMID at end of section

## Step 4 — Suggest Title Options

Generate 3 title variants:
1. **Descriptive title** — states what was done (design + outcome + population)
2. **Findings-forward title** — leads with the key result
3. **Question-format title** — poses the research question

For each:
- Keep under 20 words
- Include study design in title or subtitle (e.g., "A Systematic Review and Meta-Analysis")
- Avoid acronyms in the title unless universally understood
- Avoid hyperbolic language ("novel", "first", "breakthrough")
- UK English spelling

Ask the researcher which title they prefer, or offer to combine elements.

## Formatting Rules
- Output each section as a clearly labelled Markdown section (## heading)
- Abstract: plain prose, no bullet points
- Introduction: full paragraphs
- Titles: numbered list for comparison
- Word counts reported after abstract draft
