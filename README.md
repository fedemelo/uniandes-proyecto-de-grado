# Proyecto de Grado

Este repositorio contiene el código fuente en LaTeX de mi proyecto de grado: *Desarrollo del Perfil del estudiante dentro de No estás solo*.

La documentación técnica está en inglés, como es convencional.

## Local Setup

A Makefile is provided to simplify the compilation process. Prerequisites are `pdflatex`, `bibtex`, and `makeglossaries`. The `latexindent` package is used for code formatting. 

- To compile the thesis from the root directory, use:
    ```bash
    make
    ```
- To compile the thesis proposal, use:
    ```bash
    make proposal
    ```
-  To format the code, use:
    ```bash
    make format
    ```

    To format a single file, use:
    ```bash
    make format FILE=thesis/main.tex
    ```
    where `thesis/main.tex` can be replaced with the path to the file you want to format.

- To clean up the temporary files, use:
    ```bash
    make clean
    ```