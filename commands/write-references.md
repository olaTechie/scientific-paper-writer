---
description: Build and verify the reference list section by section
allowed-tools: Read, WebSearch, WebFetch, Bash
argument-hint: [style] e.g. vancouver, apa, ama, chicago
---

You are helping a researcher build a verified, formatted reference list for a quantitative research paper.

## Step 1 — Gather Context

Ask (only what is not already clear from $ARGUMENTS or context):
1. What citation style is required? (Vancouver, APA, AMA, Chicago, IEEE, Nature, other)
2. Which sections need references compiled? (Introduction only / Discussion only / All sections / Specific section)
3. Is there a completed draft to extract citations from, or will the researcher provide a list of references to format?

If $ARGUMENTS specifies a citation style (e.g., "vancouver"), use that style throughout.

## Step 2 — Extract Citations from Draft

If a completed manuscript draft is available:
- Use Read to load the draft
- Identify all in-text citation markers (numbered superscripts, author-year, etc.)
- List all cited works: "I found [N] citations. Let me now verify each one."

If the researcher provides a list:
- Accept the list and proceed to verification.

## Step 3 — Verify Each Reference

For each cited work, verify it is real and accurately cited:
- Use WebSearch or WebFetch to locate the PubMed entry: https://pubmed.ncbi.nlm.nih.gov/[PMID]/
- Extract: all authors (last name + initials), title, journal name (abbreviated per NLM style for Vancouver/AMA), year, volume, issue, pages, DOI, PMID
- For guidelines and reports (WHO, CDC, NICE): use official website URL and access date
- For books: authors, title, edition, publisher, year, chapter if applicable
- Flag any reference that cannot be verified: [UNVERIFIED — please check manually]
- Do NOT fabricate or invent citations under any circumstances

## Step 4 — Format References by Style

### Vancouver Style (numbered, superscript in-text)
Format: Author AA, Author BB, Author CC. Title of article. *Journal Abbrev*. Year;Volume(Issue):Pages. doi:XX.XXXX/XXXXX PMID: XXXXXXXX

Example:
1. Wilkinson K, Righolt CH, Elliott LJ, Fanella S, Mahmud SM. Pertussis vaccine effectiveness and duration of protection — a systematic review and meta-analysis. *Vaccine*. 2021;39(23):3120–3130. doi:10.1016/j.vaccine.2021.04.032 PMID: 33934917

Rules:
- Up to 6 authors; if more, list first 6 then "et al."
- Journal names abbreviated per NLM standard
- Article titles: sentence case
- Volume and issue in format: 39(23)
- Pages with en-dash (3120–3130), not hyphen

### APA Style (author-year in-text)
Format: Author, A. A., & Author, B. B. (Year). Title of article. *Journal Name*, *Volume*(Issue), Pages. https://doi.org/XXXXX

### AMA Style (numbered superscript)
Format: Author AA, Author BB. Title of article. *Journal Name*. Year;Volume(Issue):Pages. doi:XXXXX

### Nature Style (numbered, bracketed in-text)
Format: Author, A. A. et al. Title of article. *J. Abbrev.* **Volume**, Pages (Year). https://doi.org/XXXXX

## Step 5 — Output the Reference List

Present the complete reference list:
- Numbered sequentially from 1 (Vancouver / AMA / Nature) or alphabetically by first author (APA)
- Each entry on a new line
- Include DOI and PMID (where available) for all journal articles
- Group by section if the researcher wants (Introduction references / Discussion references)
- Confirm the total count: "Reference list complete: [N] references verified."

## Step 6 — Cross-Check In-Text Citations

If a completed draft is available:
- Verify that every in-text citation number matches the correct reference in the list
- Flag any discrepancies: "⚠️ Citation [4] in the Discussion appears to reference a different paper than Reference 4 in the list."
- Do not silently correct — flag and ask the researcher to confirm the intended citation

## Formatting Rules
- UK English spelling in reference titles where applicable
- Italicise journal names in Markdown using *asterisks*
- Bold volume numbers for Nature style using **double asterisks**
- Use en-dash (–) not hyphen (-) in page ranges
