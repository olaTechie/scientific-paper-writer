---
name: core-engine
description: >
  Central engine loaded by every writing command. Enforces no-fabrication guarantees,
  prose conventions, verification flags, study-type routing, reporting guideline compliance,
  risk-of-bias tool selection, and expert writing order. All section-specific skills
  inherit these rules.
version: 1.0.0
triggers:
  - write-methods
  - write-results
  - write-discussion
  - write-abstract
  - write-introduction
  - write-frontmatter
  - write-captions
  - write-references
  - write-title
  - verify-citations
  - generate-figure
  - interpret-figure
  - export-manuscript
---

# Core Engine

This skill is the foundation of the scientific-paper-writer plugin. It is loaded
automatically by every writing command and establishes the rules that govern all
manuscript output. No section-specific skill may override the guarantees defined here.

---

## 1. No-Fabrication Guarantee

**Absolute rule**: Every number, statistic, finding, and factual claim in the generated
manuscript text must be traceable to a source material provided by the user (uploaded
PDFs, extracted tables, pasted text, figures, or PAPER_CONTEXT.md).

The assistant must **never**:
- Invent sample sizes, effect sizes, p-values, confidence intervals, or counts.
- Guess the direction or magnitude of an effect.
- Fabricate author names, journal names, years, or DOIs for citations.
- Fill in methodological details (randomisation method, blinding, follow-up duration)
  that are not stated in or clearly inferable from the source materials.

When information is missing or ambiguous, the assistant must insert the appropriate
verification flag (see `references/verification-flags.md`):

| Situation | Flag |
|---|---|
| Missing procedural or methodological detail | `[PLEASE VERIFY: ___]` |
| Data present but ambiguous or contradictory | `[UNCLEAR IN SOURCE — please verify]` |
| Citation cannot be verified against known databases | `[Citation needed — unable to verify]` |
| Figure that could not be generated or located | `[FIGURE NEEDED: description]` |

The user is responsible for resolving every flag before submission. The assistant
must never silently drop a flag or replace it with a guess.

---

## 2. Prose Conventions

A summary of key rules is provided here. The full reference is in
`references/prose-conventions.md`.

### 2.1 Tense

- **Methods and Results**: Past tense ("Participants were randomised...",
  "The pooled odds ratio was 1.45...").
- **Introduction and Discussion** (established knowledge): Present tense
  ("Cardiovascular disease remains the leading cause of death...").
- **Discussion** (interpretation of current study): Past tense
  ("Our analysis demonstrated...").

### 2.2 Voice

- Passive voice is acceptable and standard in scientific writing.
- Active voice is preferred when it improves clarity ("We excluded studies
  that..." rather than "Studies that were excluded by the authors...").
- Maintain consistency within each section.

### 2.3 Language

All manuscript output uses **UK English** by default unless the user specifies
otherwise or the target journal requires US English:

| UK (default) | US (if requested) |
|---|---|
| organisation | organization |
| randomised | randomized |
| analysed | analyzed |
| behaviour | behavior |
| colour | color |
| centre | center |
| programme | program |
| haemoglobin | hemoglobin |
| oestrogen | estrogen |
| diarrhoea | diarrhea |

The full list of 20+ spelling pairs is in `references/prose-conventions.md`.

### 2.4 Formatting

- **Full paragraphs only** — never output bullet points or numbered lists in
  manuscript sections. Bullets are acceptable only in non-manuscript output
  (planning notes, checklists, summaries for the user).
- Subsection headings use `##` (Markdown H2) within each major section.
- Cross-reference figures and tables by label: "Figure 1", "Table 2",
  "Supplementary eFigure 3".

### 2.5 Precision

- No vague quantifiers ("some", "many", "a few", "several", "most").
- Every finding requires: **point estimate + 95% CI + p-value + sample size**.
- Percentages: 1 decimal place (e.g., 34.7%).
- Odds ratios, hazard ratios, risk ratios: 2 decimal places (e.g., OR 1.45).
- P-values: 2-3 significant digits (e.g., p = 0.034, p < 0.001).
- Do not write "p = 0.000"; write "p < 0.001".

---

## 3. Workflow Protocol

The assistant follows this protocol for every writing command:

1. **Read source materials first.** Before writing any prose, read and digest all
   uploaded documents, extracted data, figures, and PAPER_CONTEXT.md. Identify
   gaps early.

2. **Confirm study type.** Use the routing table (Section 5) to load the correct
   study-type skill and reporting guideline.

3. **Write one subsection at a time.** Pause after completing each subsection
   to allow the user to review, correct, and approve before proceeding.

4. **Cross-reference figures and tables.** Every figure and table mentioned in
   the text must exist in the source materials or be flagged with
   `[FIGURE NEEDED: description]`.

5. **No citations in Results.** The Results section reports the current study's
   findings only. Citations belong in Discussion and Introduction.

6. **Flag all uncertainties.** Insert verification flags immediately when
   information is missing. Do not leave blank spaces or ellipses.

7. **Respect expert writing order.** Unless the user explicitly requests a
   different order, follow Section 7.

---

## 4. PAPER_CONTEXT.md Integration

When a `PAPER_CONTEXT.md` file exists in the working folder, the session hook
reads it at startup. The core engine uses the following fields:

| Field | Purpose |
|---|---|
| `study_type` | Routes to correct study-type skill |
| `primary_outcome` | Ensures Results and Abstract focus on the right endpoint |
| `target_journal` | Loads journal-specific formatting and word limits |
| `citation_style` | Configures reference formatting (Vancouver, APA, etc.) |
| `output_format` | Sets export target (LaTeX, DOCX, Markdown) |
| `folder_structure` | Locates source files, figures, and output directory |
| `integration_preferences` | Enables/disables PubMed, CrossRef, Semantic Scholar, bioRxiv |
| `figure_preferences` | Configures figure generation style and resolution |

---

## 5. Study-Type Routing

When the user provides a study type (via PAPER_CONTEXT.md or directly), the core
engine loads the corresponding study-type skill from `skills/study-types/`.

| Identifier | Display Name | Reporting Guideline | Skill Path |
|---|---|---|---|
| `systematic-review` | Systematic Review & Meta-Analysis | PRISMA 2020 | `skills/study-types/systematic-review/` |
| `network-meta-analysis` | Network Meta-Analysis | PRISMA-NMA | `skills/study-types/network-meta-analysis/` |
| `ipd-meta-analysis` | Individual Participant Data Meta-Analysis | PRISMA-IPD | `skills/study-types/ipd-meta-analysis/` |
| `dose-response` | Dose-Response Meta-Analysis | PRISMA 2020 (adapted) | `skills/study-types/dose-response/` |
| `bayesian-meta-analysis` | Bayesian Meta-Analysis | PRISMA 2020 + BUGS/Stan reporting | `skills/study-types/bayesian-meta-analysis/` |
| `rct` | Randomised Controlled Trial | CONSORT 2010 | `skills/study-types/rct/` |
| `observational` | Observational Study (Cohort/Case-Control/Cross-Sectional) | STROBE | `skills/study-types/observational/` |
| `economic-evaluation` | Economic Evaluation | CHEERS 2022 | `skills/study-types/economic-evaluation/` |
| `prediction-model` | Prediction Model Study | TRIPOD+AI | `skills/study-types/prediction-model/` |
| `diagnostic-accuracy` | Diagnostic Accuracy Study | STARD 2015 | `skills/study-types/diagnostic-accuracy/` |
| `qualitative` | Qualitative Research | COREQ / SRQR | `skills/study-types/qualitative/` |

If the study type is not recognised, the assistant must ask the user to clarify
before proceeding, suggesting the closest match from the table above.

---

## 6. Reporting Guideline Mapping

Each reporting guideline has a canonical reference that must be cited when the
guideline is invoked in the Methods section.

| Study Type | Guideline | Key Reference |
|---|---|---|
| Systematic Review & Meta-Analysis | PRISMA 2020 | Page MJ, McKenzie JE, Bossuyt PM, et al. The PRISMA 2020 statement: an updated guideline for reporting systematic reviews. *BMJ*. 2021;372:n71. |
| Network Meta-Analysis | PRISMA-NMA | Hutton B, Salanti G, Caldwell DM, et al. The PRISMA extension statement for reporting of systematic reviews incorporating network meta-analyses. *Ann Intern Med*. 2015;162(11):777-784. |
| IPD Meta-Analysis | PRISMA-IPD | Stewart LA, Clarke M, Rovers M, et al. Preferred reporting items for a systematic review and meta-analysis of individual participant data: the PRISMA-IPD statement. *JAMA*. 2015;313(16):1657-1665. |
| Dose-Response Meta-Analysis | PRISMA 2020 (adapted) | Page MJ, McKenzie JE, Bossuyt PM, et al. *BMJ*. 2021;372:n71. (With dose-response-specific extensions as described by Crippa et al.) |
| Bayesian Meta-Analysis | PRISMA 2020 + Bayesian reporting | Page MJ et al. *BMJ*. 2021;372:n71. (Supplemented with Bayesian-specific reporting per Rover et al., *Res Synth Methods*. 2021.) |
| Randomised Controlled Trial | CONSORT 2010 | Schulz KF, Altman DG, Moher D. CONSORT 2010 statement: updated guidelines for reporting parallel group randomised trials. *BMJ*. 2010;340:c332. |
| Observational Study | STROBE | von Elm E, Altman DG, Egger M, et al. The Strengthening the Reporting of Observational Studies in Epidemiology (STROBE) statement. *Lancet*. 2007;370(9596):1453-1457. |
| Economic Evaluation | CHEERS 2022 | Husereau D, Drummond M, Augustovski F, et al. Consolidated Health Economic Evaluation Reporting Standards 2022 (CHEERS 2022) statement. *BMJ*. 2022;376:e067975. |
| Prediction Model Study | TRIPOD+AI | Collins GS, Reitsma JB, Altman DG, Moons KGM. Transparent Reporting of a multivariable prediction model for Individual Prognosis Or Diagnosis (TRIPOD). *Ann Intern Med*. 2015;162(1):55-63. |
| Diagnostic Accuracy Study | STARD 2015 | Bossuyt PM, Reitsma JB, Bruns DE, et al. STARD 2015: an updated list of essential items for reporting diagnostic accuracy studies. *BMJ*. 2015;351:h5527. |
| Qualitative Research | COREQ / SRQR | Tong A, Sainsbury P, Craig J. Consolidated criteria for reporting qualitative research (COREQ). *Int J Qual Health Care*. 2007;19(6):349-357. |

---

## 7. Risk of Bias Tools

The assistant selects the appropriate risk-of-bias tool based on study design.
This table is used when writing the Methods section (quality assessment subsection)
and when interpreting quality findings in the Discussion.

| Tool | Full Name | Applicable Study Designs | Key Reference |
|---|---|---|---|
| RoB 2 | Revised Cochrane Risk-of-Bias Tool for Randomised Trials | Randomised trials (parallel, crossover, cluster) | Sterne JAC, Savovic J, Page MJ, et al. *BMJ*. 2019;366:l4898. |
| ROBINS-I | Risk Of Bias In Non-randomised Studies of Interventions | Non-randomised comparative studies | Sterne JA, Hernan MA, Reeves BC, et al. *BMJ*. 2016;355:i4919. |
| NOS | Newcastle-Ottawa Scale | Cohort and case-control studies | Wells GA, Shea B, O'Connell D, et al. Ottawa Hospital Research Institute; 2000. |
| QUADAS-2 | Quality Assessment of Diagnostic Accuracy Studies, version 2 | Diagnostic accuracy studies | Whiting PF, Rutjes AW, Westwood ME, et al. *Ann Intern Med*. 2011;155(8):529-536. |
| JBI | Joanna Briggs Institute Critical Appraisal Tools | Qualitative, prevalence, case series, text/opinion | Joanna Briggs Institute. *JBI Manual for Evidence Synthesis*. 2020. |
| PROBAST | Prediction model Risk Of Bias ASsessment Tool | Prediction and prognostic model studies | Wolff RF, Moons KGM, Riley RD, et al. *Ann Intern Med*. 2019;170(1):51-58. |

---

## 8. Expert Writing Order

Sections are written in the following order, which reflects how experienced
researchers compose manuscripts. This order maximises internal consistency and
minimises rework:

| Order | Section | Rationale |
|---|---|---|
| 1 | **Methods** | Establishes what was done; anchors all other sections. |
| 2 | **Results** | Reports findings that follow directly from Methods. |
| 3 | **Discussion** | Interprets Results in context of existing literature. |
| 4 | **Abstract** | Summarises Methods, Results, and Discussion accurately. |
| 5 | **Introduction** | Frames the study after the full scope of findings is known. |
| 6 | **Title** | Captures the key finding after all sections are drafted. |
| 7 | **Captions** | Finalises figure and table descriptions for consistency. |
| 8 | **References** | Compiles and verifies all cited works as the last step. |

The user may request sections in any order. When they do, the assistant follows
the request but warns if critical upstream sections have not been written yet
(e.g., writing the Abstract before Results are finalised).

---

## 9. Cross-Cutting Rules

### 9.1 Abbreviations

- Define each abbreviation at first use in each major section (Methods, Results,
  Discussion, Abstract, Introduction are treated as independent units).
- Do not abbreviate terms used fewer than three times in a section.
- Standard abbreviations that need no definition: DNA, RNA, HIV, AIDS, BMI, WHO, CI, OR, HR, RR, SD, IQR.

### 9.2 Numbers

- Spell out numbers zero through nine when used in general text.
- Use numerals for 10 and above, and for all measurements, statistics, and
  quantities (e.g., "5 mg", "3 studies", "12 participants").
- Never start a sentence with a numeral; rephrase or spell out the number.

### 9.3 Statistical Notation

- Italicise statistical symbols: *p*, *n*, *r*, *t*, *F*, *z*, *I*^2^.
- Use the multiplication sign (x) not the letter x for interactions.
- Report exact p-values (p = 0.034) except when p < 0.001.
- Always report 95% confidence intervals in parentheses: (95% CI 1.12 to 1.89).
- Use "to" not a dash for CI ranges in text; dashes are acceptable in tables.

### 9.4 Supplementary Materials

- Refer to supplementary items with the "e" prefix: eFigure 1, eTable 2,
  eMethods, eResults.
- Number supplementary items sequentially in order of first mention.

---

## 10. Error Handling

| Error Condition | Action |
|---|---|
| No source materials provided | Ask the user to upload files before writing. |
| Study type not specified | Ask the user to specify or provide PAPER_CONTEXT.md. |
| Contradictory data in sources | Flag with `[UNCLEAR IN SOURCE — please verify]` and note the discrepancy. |
| Requested section depends on unwritten upstream section | Warn the user and suggest writing upstream sections first. |
| Target journal not specified | Use generic academic formatting; note that journal-specific formatting can be applied later. |
| Citation cannot be verified | Flag with `[Citation needed — unable to verify]` and retain the user-provided reference. |

---

## References

- `references/prose-conventions.md` — Full prose style guide
- `references/verification-flags.md` — Complete flag definitions and examples
