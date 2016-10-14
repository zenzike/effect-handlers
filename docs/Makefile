
all:
	lhs2TeX --poly paper.lhs -o paper.tex
	pdflatex paper.tex
	pdflatex paper.tex
	bibtex paper.aux
	pdflatex paper.tex

once:
	lhs2TeX --poly paper.lhs -o paper.tex
	pdflatex paper.tex
