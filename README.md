# Proyecto de Grado

Este repositorio contiene el código fuente en LaTeX de mi proyecto de grado, "Desarrollo del Perfil del estudiante dentro de No estás solo".

La documentación técnica del código está en inglés, como es convencional.

# Local Setup

In the root directory of the project, add the `packages` directory to the `TEXINPUTS` environment variable:
```bash
export TEXINPUTS=./packages/:
```

## Compile the thesis

Quick compile from the root directory:
```bash
pdflatex -shell-escape -output-directory=thesis thesis/main.tex
```

If the glossary or bibliography was updated, use:
```bash
pdflatex -shell-escape -output-directory=thesis thesis/main.tex

bibtex thesis/main
makeglossaries -d thesis main

pdflatex -shell-escape -output-directory=thesis thesis/main.tex
pdflatex -shell-escape -output-directory=thesis thesis/main.tex
```
The bibliography is generated using `bibtex` and the glossary is generated using `makeglossaries`.

The use of two successive `pdflatex` compilations is deliberate: the first resolves placeholders for references, TOC, glossaries, and bibliography; the second ensures all links, page numbers, and layouts are updated correctly after these elements are integrated.

## Compile the thesis proposal

From the root directory:
```bash
pdflatex -shell-escape -output-directory=proposal proposal/proposal.tex
```

## Formatting

This repository uses `latexindent` to format the code.

To format a single file, use:
```bash
latexindent -w thesis/main.tex
```
Replace `thesis/main.tex` with the path to the file you want to format.

To format all TeX files, use:
```bash
find . -name "*.tex" -o -name "*.cls" -o -name "*.sty" -exec latexindent -w {} +
```

After formatting the code, clean up the temporary files:
```bash
find . -name "*.bak0" -exec rm {} +
```
