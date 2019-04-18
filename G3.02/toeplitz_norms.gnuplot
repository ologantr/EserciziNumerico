set term png
set output "toeplitz_norms.png"

set yrange[0:*]

plot "fort.10" title "Norma 1" with lines, \
     "fort.11" title "Norma 2" with lines, \
     "fort.12" title "Norma ∞" with lines
