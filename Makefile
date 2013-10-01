DOCUMENT=thesis
OPEN=acroread

all: check paper open

open:
	$(OPEN) $(DOCUMENT).pdf &

check:
	./spellcheck.sh

paper:
	pdflatex $(DOCUMENT).tex

clean:
	rm -f *.bbl *.blg *.log *.aux *.toc *~
