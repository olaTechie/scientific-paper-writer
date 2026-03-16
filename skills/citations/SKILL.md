---
name: citation-engine
description: >
  Multi-source citation verification and reference formatting engine. Verifies every
  citation against PubMed, CrossRef, Semantic Scholar, and bioRxiv/medRxiv before
  inclusion. Formats references in Vancouver, APA, AMA, Nature, Chicago, or IEEE style.
  Trigger phrases include: "verify citations", "format references", "check references",
  "write references", "citation verification", "verify my reference list",
  "format bibliography", "check my citations".
version: 1.0.0
triggers:
  - verify citations
  - format references
  - check references
  - write references
  - citation verification
---

# Citation Engine

This skill manages all citation verification, reference formatting, and bibliography
generation for the scientific-paper-writer plugin. Every citation must be verified
against at least one authoritative database before inclusion. No citation may ever
be fabricated.

> **Note:** This skill resolves the missing v0.2.0 phantom reference
> `skills/paper-components/references/reference-verification.md` per spec Section 12.2.
> All reference verification logic is now consolidated here.

---

## 1. Verification Pipeline

Citations are verified in a strict, ordered pipeline. Each source is attempted in
sequence. The pipeline advances to the next source only when a **fallback trigger**
fires (no results returned, OR metadata missing critical fields: title, authors, year).

### Step 1 — PubMed (first)

Use `mcp__plugin_pubmed_PubMed__search_articles` or `mcp__claude_ai_PubMed__search_articles`
to search by title or author+year combination.

```
Search query: "<article title>"
Alternative: "<last name of first author> <year>"
```

If a match is found, retrieve full metadata with `mcp__plugin_pubmed_PubMed__get_article_metadata`
or `mcp__claude_ai_PubMed__get_article_metadata`. Extract: authors, title, journal,
year, volume, issue, pages, DOI, PMID.

**Fallback trigger:** No results returned, OR metadata missing title/authors/year.
Proceed to Step 2.

### Step 2 — CrossRef (second)

Use `WebFetch` to query the CrossRef API:

```
URL: https://api.crossref.org/works?query=<URL-encoded-title>&rows=3
```

Parse the JSON response. For each item in `message.items[]`, extract:
- `DOI` — the DOI string
- `author[]` — each entry has `given` and `family` fields
- `title[]` — article title (first element)
- `container-title[]` — journal name (first element)
- `published.date-parts[]` — year from first element
- `volume` — volume number
- `issue` — issue number
- `page` — page range

Match by comparing title similarity (case-insensitive, ignoring punctuation).
Accept if title similarity >85%.

**Fallback trigger:** No results returned, OR title similarity <85% for all results,
OR metadata missing title/authors/year. Proceed to Step 3.

### Step 3 — Semantic Scholar (third)

Use `WebFetch` to query the Semantic Scholar API:

```
URL: https://api.semanticscholar.org/graph/v1/paper/search?query=<URL-encoded-title>&limit=3&fields=title,authors,year,venue,externalIds
```

Parse the JSON response. For each item in `data[]`, extract:
- `paperId` — Semantic Scholar paper ID
- `title` — article title
- `authors[].name` — author names
- `year` — publication year
- `venue` — journal or conference name
- `externalIds.DOI` — DOI (if available)
- `externalIds.PubMed` — PMID (if available)

**Fallback trigger:** No results returned, OR metadata missing title/authors/year.
Proceed to Step 4.

### Step 4 — bioRxiv/medRxiv (fourth)

Use `mcp__claude_ai_bioRxiv__search_preprints` to search for the article. If found,
retrieve full metadata with `mcp__claude_ai_bioRxiv__get_preprint`.

Additionally, use `mcp__claude_ai_bioRxiv__search_published_preprints` to check
whether the preprint has been formally published in a peer-reviewed journal.

**Fallback trigger:** No results returned across any source. Mark citation as
unverified (see Section 6).

---

## 2. Metadata Normalisation

After retrieval from any source, normalise all citation metadata into the following
standardised fields:

| Field | Format | Example |
|---|---|---|
| `authors` | List of "LastName Initials" | `["Page MJ", "McKenzie JE", "Bossuyt PM"]` |
| `title` | Sentence case | `The PRISMA 2020 statement: an updated guideline for reporting systematic reviews` |
| `journal` | Full name (abbreviate per style) | `BMJ` / `The BMJ` |
| `year` | 4-digit integer | `2021` |
| `volume` | String | `372` |
| `issue` | String or null | `null` |
| `pages` | String with en-dash | `n71` |
| `DOI` | Without URL prefix | `10.1136/bmj.n71` |
| `PMID` | String or null | `33782057` |
| `source_database` | Origin of metadata | `PubMed` / `CrossRef` / `SemanticScholar` / `bioRxiv` |

### Author Name Normalisation

- Extract last name and initials from each source format:
  - PubMed: typically provides "LastName Initials" directly
  - CrossRef: combine `family` + first letter(s) of `given`
  - Semantic Scholar: parse "FirstName LastName" → "LastName F"
  - bioRxiv: parse as available
- Remove periods from initials (e.g., "Page MJ" not "Page M.J.")
- Preserve hyphenated surnames: "García-López A"
- Preserve multi-part surnames: "van der Berg A", "de Souza M"

---

## 3. Duplicate Detection

When the same paper is found across multiple databases, merge records to produce
the most complete metadata set.

**Detection criteria (any one is sufficient):**
- DOI exact match (case-insensitive)
- Title similarity >90% (case-insensitive, ignoring punctuation and whitespace differences)

**Merge strategy:**
1. Prefer PubMed metadata when available (most authoritative for biomedical literature)
2. Fill missing fields from CrossRef (best for DOI and page ranges)
3. Fill remaining gaps from Semantic Scholar
4. Use bioRxiv only for preprint-specific information

---

## 4. Preprint Status Check

When a citation is found on bioRxiv or medRxiv:

1. Run `mcp__claude_ai_bioRxiv__search_published_preprints` with the preprint DOI
   or title
2. If a published version exists:
   - Retrieve the published version's metadata via PubMed or CrossRef
   - Suggest to the user: `[NOTE: This preprint has been published as: <full published reference>. Consider updating the citation.]`
3. If no published version exists:
   - Include the preprint citation with the bioRxiv/medRxiv DOI
   - Add a note: `[Preprint — not yet peer-reviewed]`

---

## 5. Cross-Referencing

After all references are formatted, perform a bidirectional audit:

### In-text to reference list
- For every in-text citation number (e.g., `[1]`, `[2]`, `[1-3]`), confirm a
  corresponding entry exists in the reference list
- Flag missing: `[WARNING: In-text citation [N] has no matching reference]`

### Reference list to in-text
- For every reference in the list, confirm it is cited at least once in the text
- Flag orphans: `[WARNING: Reference N is listed but never cited in-text]`

### Numbering integrity
- Verify citation numbers are sequential (1, 2, 3, ...) with no gaps
- Verify numbers follow order of first appearance in the text
- Flag any discontinuities

---

## 6. Unverifiable Citations

When a citation cannot be verified through any of the four pipeline sources:

```
[UNVERIFIED — not found in PubMed, CrossRef, Semantic Scholar, or bioRxiv. Please check manually]
```

This flag is appended after the reference entry. The reference is retained exactly
as the user provided it, but the flag alerts to manual verification need.

**Never fabricate.** If the user provides incomplete citation information and no
database match is found, do not guess missing fields. Instead:

- Retain what the user provided
- Mark missing fields: `[year unknown]`, `[volume/pages unknown]`, `[DOI unknown]`
- Append the `[UNVERIFIED]` flag

---

## 7. Citation Style Formatting

The citation style is determined by:
1. `citation_style` field in PAPER_CONTEXT.md (if present)
2. User request (e.g., "format in APA style")
3. Default: Vancouver

See `references/citation-styles.md` for complete formatting rules and examples for
all six supported styles:

| Style | Typical Use |
|---|---|
| Vancouver | Biomedical journals (JAMA, BMJ, Lancet) — **default** |
| APA | Psychology, social sciences, nursing |
| AMA | American Medical Association journals |
| Nature | Nature family journals |
| Chicago | Humanities-adjacent health sciences, author-date |
| IEEE | Biomedical engineering, health informatics |

---

## 8. Workflow Integration

### When invoked by `/write-references` or "write references"
1. Collect all in-text citations from the manuscript
2. Run each through the verification pipeline (Section 1)
3. Normalise metadata (Section 2)
4. Detect and merge duplicates (Section 3)
5. Check preprint status (Section 4)
6. Format in the selected citation style (Section 7)
7. Cross-reference in-text numbers against the list (Section 5)
8. Output the formatted reference list with any flags

### When invoked by `/verify-citations` or "verify citations"
1. Parse the existing reference list
2. Run each reference through the verification pipeline
3. Report verification status for each reference:
   - **Verified**: metadata confirmed against database
   - **Partial**: some fields confirmed, others unverifiable
   - **Unverified**: no database match found
4. Suggest corrections for any discrepancies found

---

## 9. Error Handling

| Error Condition | Action |
|---|---|
| API timeout or rate limit | Wait 2 seconds, retry once. If still fails, note source as unavailable and proceed to next. |
| Malformed API response | Log the error, skip that source, proceed to next. |
| No source materials or text provided | Ask user to provide manuscript text or citation list. |
| Ambiguous citation (multiple close matches) | Present top 2-3 candidates to the user for selection. |
| User-provided citation contradicts database | Flag discrepancy: `[DISCREPANCY: user-provided <field> does not match <database>. Please verify.]` |

---

## References

- `references/citation-styles.md` — Full formatting rules for all 6 citation styles
