# Detected Plugins: Integration Map

This reference defines the complete integration map between optional external
plugins and the built-in scientific-paper-writer skills. Each row describes what
a detected plugin provides, which built-in skill uses it, and what happens when
the plugin is absent.

---

## Integration Map

| Detected Skill | Used By | What It Provides | Fallback If Absent |
|---|---|---|---|
| research-lookup | Discussion | Literature search beyond PubMed: Google Scholar, Scopus, Web of Science, and institutional repository access | Built-in PubMed via `mcp__plugin_pubmed_PubMed__search_articles` + `WebSearch` for supplementary searches |
| literature-review | Discussion | Systematic multi-database search with deduplication, PRISMA-compliant search documentation, and automated screening | Manual PubMed search with `mcp__plugin_pubmed_PubMed__search_articles`; user responsible for multi-database coverage |
| citation-management | Citations | Google Scholar integration, BibTeX import/export, Zotero/Mendeley sync, and automated reference list management | Built-in citation verification pipeline (PubMed → CrossRef → Semantic Scholar → bioRxiv) with manual BibTeX generation |
| scientific-schematics | Visual | Publication-quality vector diagrams: pathway diagrams, mechanism figures, study design schematics, anatomical illustrations | Code-generated SVGs via R/Python scripts; if no runtime available, `[FIGURE NEEDED: detailed description]` placeholder |
| generate-image | Visual | AI-generated images including visual abstracts, graphical abstracts, and conceptual diagrams | `[FIGURE NEEDED: detailed description including data points, layout, labels, and visual elements]` placeholder with script if possible |
| venue-templates | Output | Pre-configured LaTeX and DOCX templates with exact journal-specific formatting rules, submission checklists, and cover letter templates | Built-in generic, JAMA, and Lancet templates in `templates/latex/`; manual formatting adjustments noted for other journals |
| scientific-writing | All | Two-stage outline-then-prose workflow with section-level planning, coherence checking, and iterative refinement across all manuscript sections | Built-in workflow defined in core engine: read sources → confirm study type → write one subsection at a time → cross-reference → flag uncertainties |
| parallel-web | Discussion, Citations | Synthesised parallel web search across multiple engines with result deduplication, relevance ranking, and structured extraction | Sequential `WebSearch` and `WebFetch` calls; results may be less comprehensive but functionally equivalent |

---

## Detailed Integration Descriptions

### research-lookup

**Detection path:** `~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/research-lookup/SKILL.md`

**Integration points:**
- Discussion writing: comparison with prior literature (Main Findings paragraphs 2-3)
- Introduction writing: disease burden and knowledge gap paragraphs
- Citation verification: supplementary source for hard-to-find references

**Fallback behaviour:**
- PubMed is searched via `mcp__plugin_pubmed_PubMed__search_articles`
- `WebSearch` is used for non-PubMed sources
- User is advised to manually search additional databases if comprehensive coverage is needed

---

### literature-review

**Detection path:** `~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/literature-review/SKILL.md`

**Integration points:**
- Methods writing: search strategy documentation
- PRISMA flow diagram data: counts per stage
- Discussion writing: comprehensive literature context

**Fallback behaviour:**
- Manual PubMed searches with documented search terms
- User responsible for Embase, Cochrane, and other database searches
- PRISMA counts must be provided by user from their own search

---

### citation-management

**Detection path:** `~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/citation-management/SKILL.md`

**Integration points:**
- Reference formatting: all citation styles
- BibTeX generation: for LaTeX export
- Duplicate detection: cross-reference with external library

**Fallback behaviour:**
- Built-in citation pipeline: PubMed → CrossRef → Semantic Scholar → bioRxiv
- BibTeX generated manually from normalised metadata
- Duplicate detection via DOI match or title similarity >90%

---

### scientific-schematics

**Detection path:** `~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/scientific-schematics/SKILL.md`

**Integration points:**
- Figure generation: pathway diagrams, mechanism figures, study design schematics
- Visual abstract creation: graphical summary figures
- Supplementary figures: anatomical illustrations, flow charts

**Fallback behaviour:**
- R or Python scripts for code-generatable figures (forest plots, funnel plots, etc.)
- SVG generation for simple diagrams
- `[FIGURE NEEDED: description]` placeholder for figures that cannot be code-generated

---

### generate-image

**Detection path:** `~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/generate-image/SKILL.md`

**Integration points:**
- Visual abstracts: AI-generated graphical summaries
- Conceptual diagrams: non-data-driven illustrations
- Cover images: journal cover art or social media figures

**Fallback behaviour:**
- `[FIGURE NEEDED: detailed description]` placeholder
- Code-based generation attempted first if R/Python available
- AI-based figure generation noted as v1.1 enhancement

---

### venue-templates

**Detection path:** `~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/venue-templates/SKILL.md`

**Integration points:**
- LaTeX export: journal-specific document classes and formatting
- DOCX export: journal-specific reference templates
- Submission checklists: journal-specific requirements

**Fallback behaviour:**
- Built-in templates: generic, JAMA, Lancet (in `templates/latex/`)
- Generic `reference.docx` for DOCX export
- Manual formatting notes for unsupported journals: `[NOTE: Using generic template. Journal-specific formatting may need manual adjustment.]`

---

### scientific-writing

**Detection path:** `~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/scientific-writing/SKILL.md`

**Integration points:**
- All section writing: two-stage outline → prose workflow
- Cross-section coherence: ensuring consistency between Methods, Results, Discussion
- Iterative refinement: structured revision process

**Fallback behaviour:**
- Built-in core engine workflow (Section 3 of core SKILL.md)
- Read sources → confirm study type → write one subsection at a time
- Cross-reference figures and tables → flag uncertainties
- Expert writing order: Methods → Results → Discussion → Abstract → Introduction → Title → Captions → References

---

### parallel-web

**Detection path:** `~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/parallel-web/SKILL.md`

**Integration points:**
- Discussion writing: rapid literature search for contextualisation
- Citation verification: cross-checking references across multiple web sources
- Epidemiological data: burden-of-disease statistics for Introduction

**Fallback behaviour:**
- Sequential `WebSearch` calls for each query
- `WebFetch` for specific URLs (CrossRef API, Semantic Scholar API)
- Results may be less comprehensive but are functionally equivalent for most use cases
