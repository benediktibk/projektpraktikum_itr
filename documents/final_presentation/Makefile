TARGET=final_pres

all: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).dvi
	dvips -Ppdf -G0 -j0 -D1200  $(TARGET).dvi
	ps2pdf -dNOSAFER -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 $(TARGET).ps $(TARGET).pdf

$(TARGET).dvi: $(TARGET).tex
	latex $(TARGET)
	bibtex $(TARGET)
	latex $(TARGET)
	latex $(TARGET)

clean:
	rm -rf *.dvi *.aux *.bbl *.blg *~ *.ps *.nav *.snm *.out *.toc

.PHONY: $(TARGET).pdf $(TARGET).dvi


mrproper:
	make clean
	rm -rf $(TARGET).pdf
