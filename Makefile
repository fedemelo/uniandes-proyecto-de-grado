# Add the `packages` directory to the `TEXINPUTS` environment variable so that pdftex can find custom packages
TEXINPUTS := ./packages/:$(TEXINPUTS)
export TEXINPUTS

# Variables
TEX=pdflatex -shell-escape
BIB=biber
GLOSS=makeglossaries
THESIS_DIR=thesis
PROPOSAL_DIR=proposal
MAIN_TEX=main.tex
OUTPUT_DIR=$(THESIS_DIR)

# Rules
.PHONY: thesis quick proposal format format-one clean all  # Mark targets as always executed

thesis:  # Compile the thesis
	$(TEX) -output-directory=$(THESIS_DIR) $(THESIS_DIR)/$(MAIN_TEX)
	$(BIB) $(THESIS_DIR)/main  # Generate bibliography
	$(GLOSS) -d $(THESIS_DIR) main  # Generate glossary

	# First compilation resolves placeholders for references, TOC, glossaries, and bibliography
	$(TEX) -output-directory=$(THESIS_DIR) $(THESIS_DIR)/$(MAIN_TEX)

	# Second compilation ensures links, page numbers, and layouts are updated correctly after placeholders are filled
	$(TEX) -output-directory=$(THESIS_DIR) $(THESIS_DIR)/$(MAIN_TEX)

quick:	# Compile the thesis without generating the bibliography or glossary
	$(TEX) -output-directory=$(THESIS_DIR) $(THESIS_DIR)/$(MAIN_TEX)

proposal:  # Compile the proposal
	$(TEX) -output-directory=$(PROPOSAL_DIR) $(PROPOSAL_DIR)/proposal.tex

format:  # Format all .tex, .cls, and .sty files
	find . \( -name "*.tex" -o -name "*.cls" -o -name "*.sty" \) -exec latexindent -w {} +
	find . -name "*.bak0" -exec rm {} +

format-one:  # Format a single .tex, .cls, or .sty file
	latexindent -w $(file)

clean:  # Remove all temporary files
	find . \( -name "*.aux" -o -name "*.log" -o -name "*.out" -o -name "*.toc" -o -name "*.pyg" \) -exec rm {} +
	find . -name "*.bak0" -exec rm {} +
	find . \( -name "*.bbl" -o -name "*.blg" \) -exec rm {} +
	find . \( -name "*.glg" -o -name "*.glo" -o -name "*.gls" -o -name "*.ist" \) -exec rm {} +
	find . \( -name "*.fdb_latexmk" -o -name "*.fls" \) -exec rm {} +
	find . \( -name "*.gz" -o -name "*.lof" -o -name "*.lot" -o -name "*.run.xml" \) -exec rm {} +

clean-all: clean  # Remove all temporary files and the generated pdf
	find . -name "*.pdf" -exec rm {} +

all: thesis
