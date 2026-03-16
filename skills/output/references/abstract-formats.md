# Structured Abstract Formats by Journal

This reference provides complete abstract formatting rules for all supported journal
types. Every abstract must be verified for word count after drafting.

> **Migrated from:** `skills/paper-components/references/abstract-formats.md`
> This is the canonical location for abstract format definitions.

---

## JAMA Network Open (max 350 words + Key Points outside word count)

**Section order:**
1. Importance
2. Objective
3. Data Sources
4. Study Selection
5. Data Extraction and Synthesis
6. Main Outcomes and Measures
7. Results
8. Conclusions and Relevance

**Key Points (outside word limit):**
- **Question:** The research question in 1 sentence
- **Findings:** 2-3 sentences; all key quantitative findings with statistics
- **Meaning:** 1-2 sentences; what the findings mean for practice, policy, or science

**Section guidance:**

| Section | Content | Length |
|---|---|---|
| Importance | 1-2 sentences establishing why this question matters clinically or for public health | ~30 words |
| Objective | 1 sentence beginning "To [verb]..." | ~20 words |
| Data Sources | Databases searched, dates, supplementary strategies | ~30 words |
| Study Selection | Study designs, population, outcome, comparator. State who selected and how. | ~40 words |
| Data Extraction and Synthesis | Who extracted (2 independent reviewers). Risk of bias tool. Statistical method (random-effects, REML, HKSJ). Heterogeneity assessment. | ~50 words |
| Main Outcomes and Measures | Define the primary outcome measure including how it was calculated | ~30 words |
| Results | N studies, N participants. Primary estimate (95% CI, I-squared, PI). Key secondary findings. Sensitivity analysis range. | ~100 words |
| Conclusions and Relevance | 2-3 sentences. What was found. What it means. What should happen next. | ~50 words |

---

## The Lancet (max 250 words)

**Section order:** Background / Methods / Findings / Interpretation / Funding

| Section | Content | Length |
|---|---|---|
| Background | 2-3 sentences on context and rationale. End with aim. | ~50 words |
| Methods | Study design, databases/setting, population, outcome, primary analysis method. | ~60 words |
| Findings | Primary result with CI and p-value. Key secondary results. | ~80 words |
| Interpretation | 2 sentences: what the findings mean; what should change. | ~40 words |
| Funding | Funding body and grant numbers. | ~20 words |

---

## BMJ (max 400 words)

**Section order:** Objectives / Design / Setting / Participants / Interventions (if applicable) / Main Outcome Measures / Results / Conclusions

| Section | Content | Length |
|---|---|---|
| Objectives | Aims of the study | ~30 words |
| Design | Study design and dates | ~20 words |
| Setting | Country/countries, healthcare setting | ~20 words |
| Participants | Who was included (N), inclusion/exclusion criteria summary | ~40 words |
| Interventions | If applicable: intervention and comparator description | ~30 words |
| Main Outcome Measures | Primary and key secondary outcomes | ~30 words |
| Results | Primary result (estimate, CI, p). Secondary results. | ~150 words |
| Conclusions | 2-3 sentences | ~60 words |

---

## Annals of Internal Medicine (max 250 words)

**Section order:** Background / Objective / Design / Setting / Participants / Measurements / Results / Limitation / Conclusion / Primary Funding Source

**Note:** This format uniquely includes a Limitation statement within the abstract (1 sentence on the primary limitation).

| Section | Content | Length |
|---|---|---|
| Background | Context and rationale | ~30 words |
| Objective | Study aim | ~20 words |
| Design | Study design | ~15 words |
| Setting | Healthcare setting | ~10 words |
| Participants | Population and N | ~25 words |
| Measurements | Primary outcome measure | ~20 words |
| Results | Key findings with statistics | ~70 words |
| Limitation | 1 sentence on primary limitation | ~20 words |
| Conclusion | 2 sentences | ~30 words |
| Primary Funding Source | Funding body | ~10 words |

---

## Nature Medicine (max 150 words, unstructured)

Single paragraph, no section headers. Structure within the paragraph:
1. Background context (1-2 sentences)
2. Methods summary (1-2 sentences)
3. Primary finding with statistics (2-3 sentences)
4. Significance and implications (1-2 sentences)

Write in present tense for established facts, past tense for study findings.
Every word counts at this limit — eliminate all redundancy.

---

## CHEERS-Compliant Abstract (Economic Evaluation)

**Section order:** Background / Objective / Perspective / Setting / Comparators / Time Horizon / Methods / Results / Conclusions / Funding

This format is required for health economic evaluations following CHEERS 2022.

| Section | Content | Length |
|---|---|---|
| Background | Economic context and rationale | ~30 words |
| Objective | Aim of the economic evaluation | ~20 words |
| Perspective | Healthcare system, societal, or third-party payer | ~10 words |
| Setting | Country, healthcare system | ~15 words |
| Comparators | Interventions being compared | ~20 words |
| Time Horizon | Duration of the analysis (e.g., lifetime, 10 years) | ~10 words |
| Methods | Model type, data sources, outcome measure (QALY, DALY, LYG) | ~40 words |
| Results | ICER, probability cost-effective at WTP threshold, sensitivity analysis findings | ~80 words |
| Conclusions | 2 sentences on cost-effectiveness and implications | ~40 words |
| Funding | Funding body | ~15 words |

---

## Generic Structured (for journals not listed above)

**Section order:** Background / Methods / Results / Conclusions

| Section | Content | Length |
|---|---|---|
| Background | 2 sentences on context and gap | ~40 words |
| Methods | Design, population, databases/setting, primary outcome, analysis | ~60 words |
| Results | Primary result + CI. Key secondary results. N studies/participants. | ~100 words |
| Conclusions | 2 sentences | ~50 words |

Word limit: Flexible. Default to 250 words unless the journal specifies otherwise.

---

## Word Count Verification

After drafting any abstract, always verify the word count programmatically:

```bash
echo "abstract text here" | wc -w
```

If over the limit:
1. Trim from the Results section first — maintain statistics but reduce qualifying phrases
2. Then trim from Methods — reduce procedural detail while keeping essentials
3. Never trim from Conclusions or Key Points (JAMA)

**Formatting note:** Section headers (e.g., "Background:", "Methods:") may or may not
count toward the word limit depending on the journal. When in doubt, count them.
