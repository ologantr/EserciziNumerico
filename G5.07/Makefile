FC=gfortran
FFLAGS?=-std=legacy -Wall
GNUPLOT=gnuplot

.PHONY: all
all: main relative_error.png

main: main.f
	$(FC) $(FFLAGS) -o $@ $<

fort.1: main
	./"$<"

relative_error.png: relative_error.gnuplot fort.1
	$(GNUPLOT) "$<"

.PHONY: clean
clean:
	rm -f main
	rm -f fort.*
	rm -f *.png
