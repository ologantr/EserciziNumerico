FC=gfortran
FFLAGS?=-std=legacy -Wall
GNUPLOT=gnuplot

.PHONY: all
all: main norms.png

main: main.f
	$(FC) $(FFLAGS) -o $@ $<

fort.1 fort.2 fort.3: main
	./"$<"

norms.png: norms.gnuplot fort.1 fort.2 fort.3
	$(GNUPLOT) "$<"

.PHONY: clean
clean:
	rm -f main
	rm -f fort.1 fort.2 fort.3
	rm -f norms.png
