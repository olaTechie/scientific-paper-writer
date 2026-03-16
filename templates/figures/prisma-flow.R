# PRISMA 2020 Flow Diagram Template — Scientific Paper Writer
# Requires: R, DiagrammeR package
# Install: install.packages("DiagrammeR")
# Usage: Rscript prisma-flow.R

library(DiagrammeR)

# === MODIFY THIS SECTION WITH YOUR DATA ===
n_databases <- 1500
n_other <- 50
n_duplicates <- 300
n_screened <- 1250
n_excluded_screening <- 950
n_sought <- 300
n_not_retrieved <- 10
n_assessed <- 290
n_excluded_reasons <- c(
  "Wrong population (n = 100)",
  "Wrong outcome (n = 80)",
  "Wrong study design (n = 60)",
  "Duplicate data (n = 30)"
)
n_included_review <- 20
n_included_ma <- 18
# ==========================================

exclusion_text <- paste(n_excluded_reasons, collapse = "\\n")

flow_chart <- grViz(sprintf('
digraph PRISMA {
  graph [rankdir=TB, fontname="Helvetica", nodesep=0.5]
  node [shape=box, style="filled,rounded", fillcolor="#E3F2FD", fontname="Helvetica", fontsize=11, margin="0.3,0.2"]
  edge [color="#666666"]

  id_db [label="Records identified from\\ndatabases (n = %d)"]
  id_other [label="Records identified from\\nother sources (n = %d)"]
  dup [label="Records removed before screening:\\nDuplicates (n = %d)"]
  screen [label="Records screened\\n(n = %d)"]
  exc_screen [label="Records excluded\\n(n = %d)"]
  sought [label="Reports sought for retrieval\\n(n = %d)"]
  not_retrieved [label="Reports not retrieved\\n(n = %d)"]
  assessed [label="Reports assessed for eligibility\\n(n = %d)"]
  exc_ft [label="Reports excluded:\\n%s"]
  included [label="Studies included in review\\n(n = %d)\\nStudies included in meta-analysis\\n(n = %d)", fillcolor="#C8E6C9"]

  id_db -> dup
  id_other -> dup
  dup -> screen
  screen -> exc_screen
  screen -> sought
  sought -> not_retrieved
  sought -> assessed
  assessed -> exc_ft
  assessed -> included
}
', n_databases, n_other, n_duplicates, n_screened, n_excluded_screening,
  n_sought, n_not_retrieved, n_assessed, exclusion_text,
  n_included_review, n_included_ma))

# To save as PDF, install DiagrammeRsvg and rsvg:
# install.packages(c("DiagrammeRsvg", "rsvg"))
# library(DiagrammeRsvg); library(rsvg)
# svg_text <- export_svg(flow_chart)
# rsvg_pdf(charToRaw(svg_text), "prisma-flow.pdf")

cat("PRISMA flow diagram generated.\n")
cat("To export as PDF, uncomment the export lines above (requires DiagrammeRsvg and rsvg packages).\n")
