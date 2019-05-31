FC=gfortran
FFLAGS?=-std=legacy -Wall
GNUPLOT=gnuplot

.PHONY: all
all: main hilbert_norms.png wilkinson_norms.png toeplitz_norms.png

main: main.f
	$(FC) $(FFLAGS) -o $@ $<

fort.1 fort.2 fort.3 fort.7 fort.8 fort.9 fort.10 fort.11 fort.12: main
	./"$<"

wilkinson_norms.png: wilkinson_norms.gnuplot fort.1 fort.2 fort.3
	$(GNUPLOT) "$<"

hilbert_norms.png: hilbert_norms.gnuplot fort.7 fort.8 fort.9
	$(GNUPLOT) "$<"

toeplitz_norms.png: toeplitz_norms.gnuplot fort.10 fort.11 fort.12
	$(GNUPLOT) "$<"

.PHONY: clean
clean:
	rm -f main
	rm -f fort.*
	rm -f *.png
