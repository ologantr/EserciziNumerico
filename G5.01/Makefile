FC=gfortran
FFLAGS?=-std=legacy -Wall

main: main.f
	$(FC) $(FFLAGS) -o $@ $<

.PHONY: clean
clean:
	rm -f main
