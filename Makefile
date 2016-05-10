all: kboom-mini.pdf

%.pdf: %.tex
	latex $* && latex $* && bibtex $* && latex $* && pdflatex $*

clean:
	rm *.{aux,bbl,log,out,blg,dvi}

examples/%.owl: examples/%.obo
	owltools $< -o $@

examples/%.ttl: examples/%.owl
	owltools $< --tbox-to-abox -o -f ttl $@

examples/%-mi.ttl: examples/%.ttl
	owltools $< --reasoner hermit --assert-abox-inferences -o -f ttl $@
