FC=gfortran
FFLAGS?=-std=legacy -Wall

main: main.f
	$(FC) $(FFLAGS) -o $@ $<

.PHONY: plot
plot: norm1.png norm2.png norm3.png

fort.1 fort.2 fort.3: main
	./$<

norm1.png: fort.1
	gnuplot -e 'set term png; set output "$@"; plot "$<" w l'

norm2.png: fort.2
	gnuplot -e 'set term png; set output "$@"; plot "$<" w l'

norm3.png: fort.3
	gnuplot -e 'set term png; set output "$@"; plot "$<" w l'

.PHONY: clean
clean:
	rm -f main
	rm -f fort.1 fort.2 fort.3
	rm -f norm1.png norm2.png norm3.png
