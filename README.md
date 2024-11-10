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


