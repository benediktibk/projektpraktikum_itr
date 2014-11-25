TARGET=report

all: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex
	latex $(TARGET)
	bibtex $(TARGET)
	latex $(TARGET)
	latex $(TARGET)
	dvips $(TARGET).dvi
	ps2pdf $(TARGET).ps $(TARGET).pdf
clean:
	rm -rf *.dvi *.aux *.bbl *.blg *~ *.ps *.nav *.snm *.out *.toc

.PHONY: $(TARGET).pdf $(TARGET).dvi


mrproper:
	make clean
	rm -rf $(TARGET).pdf
