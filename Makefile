LATEX = pdflatex
SRCS=$(wildcard *.tex)

all: thesis.pdf

clean:
	rm *.aux *.bbl *.blg *.brf thesis.pdf *.log *.out *.toc *.lot *.lof

thesis.pdf: $(SRCS) $(wildcard figures/*) thesis.bbl
	$(LATEX) thesis
	$(LATEX) thesis

# We need to re-run bibtex when .tex files change to handle the case where we
# referene a source that already existed in proposal.bib, but was not referenced
# the last time bibtex was run.
thesis.bbl: thesis.bib $(SRCS)
	$(LATEX) thesis
	bibtex thesis
