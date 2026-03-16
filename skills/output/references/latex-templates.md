# LaTeX Template Guide

This reference describes how to select, configure, and use LaTeX templates for
manuscript export. Templates are stored in `templates/latex/`.

---

## 1. Template Selection

### By Target Journal

| Target Journal | Template | Document Class | Key Packages |
|---|---|---|---|
| Generic / unspecified | `templates/latex/generic.tex` | `article` | Standard academic packages |
| JAMA / JAMA Network Open | `templates/latex/jama.tex` | `article` with JAMA formatting | `natbib`, `vancouver` style |
| The Lancet | `templates/latex/lancet.tex` | `article` with Lancet formatting | `natbib`, `numbered` style |

### Selection Logic

1. Check `target_journal` in PAPER_CONTEXT.md
2. Match against the table above
3. If no match: use generic template
4. If no template file exists at the expected path: generate from the preamble structure below

---

## 2. Preamble Structure

Every LaTeX manuscript includes the following preamble. Adapt based on journal requirements.

```latex
% === Document Class ===
\documentclass[12pt,a4paper]{article}

% === Encoding ===
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

% === Font ===
\usepackage{times}                    % Times New Roman (standard for submissions)

% === Page Layout ===
\usepackage[margin=1in]{geometry}     % 1-inch margins
\usepackage{setspace}                 % Line spacing control
\doublespacing                        % Double-spaced for submission

% === Tables ===
\usepackage{booktabs}                 % Professional table rules (\toprule, \midrule, \bottomrule)
\usepackage{longtable}                % Multi-page tables
\usepackage{array}                    % Enhanced column types
\usepackage{multirow}                 % Multi-row cells

% === Figures ===
\usepackage{graphicx}                 % \includegraphics
\usepackage{caption}                  % Caption formatting
\usepackage{subcaption}               % Sub-figures (a), (b), (c)
\usepackage{float}                    % [H] placement option

% === Mathematics ===
\usepackage{amsmath}                  % Equations, aligned environments
\usepackage{amssymb}                  % Mathematical symbols

% === References ===
\usepackage{natbib}                   % Bibliography management
\bibliographystyle{vancouver}         % Vancouver style (change per journal)

% === Hyperlinks ===
\usepackage{hyperref}                 % Clickable DOIs and URLs
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=blue
}

% === Miscellaneous ===
\usepackage{pdflscape}                % Landscape pages for wide tables
\usepackage{enumitem}                 % List formatting (for supplementary)
\usepackage{xcolor}                   % Colour support (for verification flags)
```

---

## 3. Document Structure

```latex
\begin{document}

% === Title Page ===
\title{Manuscript Title}
\author{Author One\textsuperscript{1}, Author Two\textsuperscript{1,2}}
\date{}
\maketitle

% === Abstract ===
\begin{abstract}
\textbf{Background:} ...
\textbf{Methods:} ...
\textbf{Results:} ...
\textbf{Conclusions:} ...
\end{abstract}

% === Keywords ===
\noindent\textbf{Keywords:} keyword1; keyword2; keyword3

% === Main Text ===
\section{Introduction}
...

\section{Methods}
...

\section{Results}
...

\section{Discussion}
...

% === References ===
\bibliography{references}

% === Supplementary Materials ===
\clearpage
\section*{Supplementary Materials}
\setcounter{figure}{0}
\setcounter{table}{0}
\renewcommand{\thefigure}{e\arabic{figure}}
\renewcommand{\thetable}{e\arabic{table}}
...

\end{document}
```

---

## 4. Figure Inclusion

### Standard Figure

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=\textwidth]{figures/figure1.pdf}
  \caption{\textbf{Forest plot of the association between...}
  Each square represents... The diamond represents...}
  \label{fig:forest}
\end{figure}
```

### Multi-Panel Figure

```latex
\begin{figure}[htbp]
  \centering
  \begin{subfigure}[b]{0.48\textwidth}
    \includegraphics[width=\textwidth]{figures/figure2a.pdf}
    \caption{Panel A description}
    \label{fig:panel-a}
  \end{subfigure}
  \hfill
  \begin{subfigure}[b]{0.48\textwidth}
    \includegraphics[width=\textwidth]{figures/figure2b.pdf}
    \caption{Panel B description}
    \label{fig:panel-b}
  \end{subfigure}
  \caption{\textbf{Overall caption for the multi-panel figure.}
  (A) Description of panel A. (B) Description of panel B.}
  \label{fig:multipanel}
\end{figure}
```

### Figure Format Preferences

- **Vector formats (preferred):** PDF, EPS, SVG
- **Raster formats (acceptable):** PNG (min 300 DPI), TIFF (min 300 DPI)
- **Not recommended:** JPG (lossy compression artefacts)

---

## 5. Bibliography Generation

### BibTeX File Format

Generate a `.bib` file alongside the `.tex` file. Each entry follows:

```bibtex
@article{key,
  author    = {LastName, FirstName MiddleInitial. and LastName, FirstName},
  title     = {Article title in sentence case},
  journal   = {Journal Name},
  year      = {YYYY},
  volume    = {VV},
  number    = {II},
  pages     = {PP--PP},
  doi       = {10.XXXX/XXXXX},
  pmid      = {XXXXXXXX}
}
```

### Key Generation Convention

BibTeX keys are formed as: `firstauthorlastname` + `year` + `firstkeyword`

Examples:
- `page2021prisma`
- `sterne2019rob`
- `husereau2022cheers`

### Bibliography Style Files

| Style | `.bst` file | Notes |
|---|---|---|
| Vancouver | `vancouver.bst` | Default for biomedical journals |
| APA | `apalike.bst` | Use with `\bibliographystyle{apalike}` |
| Nature | `naturemag.bst` | Nature family journals |
| IEEE | `IEEEtran.bst` | Engineering journals |

---

## 6. Journal-Specific Adaptations

### JAMA

- Abstract sections as bold labels within the abstract environment
- Key Points box after abstract (use `\noindent\fbox{...}` or custom environment)
- Vancouver-style references
- Structured abstract: Importance, Objective, Data Sources, Study Selection, Data Extraction and Synthesis, Main Outcomes and Measures, Results, Conclusions and Relevance

### Lancet

- Unstructured title page with role-of-funder statement
- Abstract sections: Background, Methods, Findings, Interpretation, Funding
- Panel format for boxes (Panel 1, Panel 2)
- Vancouver-style references

### Generic

- Standard `article` class formatting
- Suitable for initial submission to most journals
- User can adapt preamble for specific requirements
