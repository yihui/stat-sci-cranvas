paper =reactive-programming

all:
	Rscript -e 'knitr::knit("$(paper).Rnw")' && pdflatex $(paper).tex && bibtex $(paper).aux && pdflatex $(paper).tex && pdflatex $(paper).tex
	Rscript part-ii.R
