# Proyecto de Grado

Este repositorio contiene el código fuente en LaTeX de mi proyecto de grado: *Desarrollo del Perfil del estudiante dentro de No estás solo*, para optar al título de Ingeniero de Sistemas y Computación de la Universidad de los Andes.

La documentación técnica está en inglés, como es convencional.

## Local Setup

A Makefile is provided to simplify the compilation process. Prerequisites are `pdflatex`, `bibtex`, and `makeglossaries`. The `latexindent` package is used for code formatting. 

### Compile the Thesis
To compile the thesis from the root directory, use:
```bash
make
```

If neither the bibliography nor the glossary were updated, and auxiliary files have already been generated with the previous compilation, a faster content-only compilation can be done with:
```bash
make quick
``` 

If the compilation was working fine but it suddenly stopped working, try cleaning auxiliary files with:
```bash
make clean
```
And then compile again.

To compile the thesis proposal, use `make proposal`.

### Format the Code

To format the code, use:
```bash
make format
```

To format a single file, use:
```bash
make format FILE=thesis/main.tex
```
where `thesis/main.tex` can be replaced with the path to the file you want to format.
