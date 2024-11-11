# Proyecto de Grado

Este repositorio contiene el código fuente en LaTeX de mi proyecto de grado, "Desarrollo del perfil del estudiante
dentro de No estás solo".

El perfil del estudiante es una herramienta que despliega información académica, social y financiera de un estudiante dado. Dentro de No estás solo, se hace disponible a profesores, algunos administrativos y al propio estudiante. La información es presentada en visualmente forma de gráficos, tablas y tarjetas y es actualizada en tiempo real. 

La documentación técnica está escrita en inglés, como es convencional.

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

If the glossary was updated, use:
```bash
pdflatex -shell-escape -output-directory=thesis thesis/main.tex
makeglossaries -d thesis main
pdflatex -shell-escape -output-directory=thesis thesis/main.tex
```

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
