---
name: discussion-writing
description: >
  This skill should be used when writing any part of the Discussion section of a
  quantitative research paper. Trigger phrases include: "write my discussion",
  "draft main findings", "write policy implications", "write strengths and limitations",
  "write the conclusion", "compare my results with the literature", "contextualise my findings",
  "write the limitations section", "help me write the discussion".
version: 0.1.0
---

# Discussion Writing for Quantitative Research Papers

## Structure and Order

The standard Discussion order for quantitative papers (never reversed):

1. **Main Findings** — own results first, then comparison with literature, then biological/mechanistic plausibility
2. **Policy Implications and Future Research** — what findings support now; what remains uncertain; specific research agenda
3. **Strengths and Limitations** — honest and balanced; specific not generic
4. **Conclusion** — 3–5 sentences maximum

Each subsection is written as a standalone passage with a clear heading in the manuscript.

## Main Findings

### Paragraph 1 — Own Results Summary
- Restate primary quantitative finding with full statistics (point estimate, CI, heterogeneity, p-value)
- Mirror the hierarchy of Results: primary outcome → secondary → subgroup/exploratory
- State magnitude in plain language: "moderate", "substantial", "marginal", "absent"
- Acknowledge null results proportionately — do not bury them
- Avoid causal language unless design supports it:
  - ✗ "vaccination caused a reduction in..."
  - ✓ "vaccinated participants had lower odds of..."
  - ✓ "the data were consistent with..."

### Paragraph 2–3 — Comparison with Prior Literature
**Before writing: search for comparison papers.** Use WebSearch or PubMed tools.

Search strategy:
- Target: systematic reviews and meta-analyses first, then large cohort studies
- Date range: last 5–7 years preferred
- Only cite PubMed-indexed, verifiable sources
- Flag unverifiable: [Citation needed — unable to verify in PubMed]
- Limit: 4–6 strategic citations in Main Findings

When comparing:
- State whether findings are consistent, divergent, or extending prior work
- For divergences: explain plausible reasons (design differences, population, time window, comparator heterogeneity)
- Do not dismiss prior work — contextualise differences fairly
- Do not cherry-pick studies that support your finding

### Paragraph 3 (optional) — Biological / Mechanistic Plausibility
- Provide scientific rationale for the observed findings
- Draw from immunological, biological, physiological, or computational evidence
- Phrase as possibility, not certainty: "may partly explain", "is consistent with", "could reflect"
- Keep brief (~100 words); do not introduce new primary evidence
- This paragraph is optional — include only if the mechanism adds interpretive value

## Policy Implications and Future Research

### What evidence supports now vs what is uncertain

Framework for policy paragraph:
1. State what the current evidence does support (directly linked to your quantitative findings)
2. State what it does NOT support (insufficient data for, beyond current study scope)
3. Acknowledge uncertainty: wide CIs, single-study findings, limited generalisability
4. Reference existing guidelines if verifiable — WHO, NICE, CDC, national guidelines

Avoid:
- Advocacy tone ("this study clearly shows we should...")
- Prescriptive claims not supported by results ("we recommend X interval")
- Overgeneralising from single-population findings

### Future Research — Be Specific

State:
- The study design needed (registry-based cohort, head-to-head RCT, decision-analytic model)
- The population (specific age groups, comorbidities, geographical setting)
- The outcome measure (continuous VE modelling, incident events, biomarker-confirmed cases)
- The gap addressed (statistical power for age subgroups, LMIC replication, economic modelling)

Avoid vague recommendations:
- ✗ "more research is needed"
- ✓ "registry-based longitudinal cohort studies enrolling at least 50,000 adults aged ≥60 years..."

## Strengths and Limitations

### Strengths (~40% of section)
Focus on methodological strengths specific to this study:
- Pre-specified registered protocol → reduces post-hoc bias
- Comprehensive multi-database search → reduces publication bias
- Novel methodological approach (e.g., three-level meta-regression, explicit absolute/relative VE separation) → extends prior work
- Rigorous heterogeneity assessment (τ², I², PI) → informs generalisability
- Multiple pre-specified sensitivity analyses → tests robustness
- Design-appropriate risk of bias tools (RoB 2, ROBINS-I, NOS, QUADAS-2)
- PRISMA / CONSORT / STROBE adherence → transparent reporting

Avoid generic praise:
- ✗ "this study used a rigorous methodology"
- ✓ "the three-level meta-regression accounts for within-study correlations between repeated estimates from the same cohort, avoiding the assumption of independence that would inflate Type I error"

### Limitations (~60% of section)
Choose 4–5 major, specific limitations. For each:
1. State the limitation precisely
2. Indicate likely direction of bias (upward / downward / uncertain direction)
3. State impact on conclusions

Standard candidates (pick those that actually apply):
- **Small k**: "The waning meta-regression was based on [N] estimates from [N] studies, providing limited statistical power..."
- **Temporal heterogeneity**: "The pooled estimate reflects an average across variable follow-up periods rather than effectiveness at a single time point..."
- **Observational study bias**: "All [N] observational studies were rated at moderate to serious risk of bias from unmeasured confounding; healthy vaccinee bias may have inflated effectiveness estimates..."
- **Comparator heterogeneity**: "Differences in comparator vaccines across studies precluded direct pooling of relative and absolute VE estimates..."
- **Single-study subgroup**: "Age-stratified data were available from a single study, precluding replication of the age-differential finding..."
- **Geographical restriction**: "Evidence was restricted to [N] high-income countries; generalisability to LMIC settings is uncertain..."
- **Midpoint assumption in waning**: "Time since vaccination was derived using the midpoint of study periods; misclassification of this variable may have attenuated the slope estimate..."

Do NOT:
- Repeat Methods text verbatim
- Invent limitations not present in the study
- Use defensive language ("despite these limitations, the study remains valuable")
- List trivial limitations (language restrictions, conference abstracts excluded)

## Conclusion

3–5 sentences maximum. Structure:
1. Restate main finding (1 sentence — quantitative, specific)
2. State what this study adds (1 sentence — methodological contribution or knowledge gap filled)
3. Acknowledge one key limitation (optional but recommended)
4. Forward-looking statement (further research or policy relevance)

Tone: confident but cautious. Forward-looking. Balanced.

Avoid:
- Hyperbole ("this landmark study has definitively shown...")
- New data or citations not previously introduced
- Repetition of the Abstract

## Citation Rules for Discussion

- Vancouver numbering from 1 (Introduction citations carry over)
- Full reference at end: Author(s), Title, Journal, Year, Volume(Issue):Pages, DOI, PMID
- WebSearch or PubMed verify all citations before inclusion
- Unverified: [Citation needed — unable to verify]
- Strategic citation: 8–15 references for Main Findings + Policy; do not over-cite

## Reference Files

For frameworks and templates, see:
- `references/discussion-frameworks.md` — paragraph templates by study type
- `references/contextualisation-guide.md` — how to compare with prior evidence
