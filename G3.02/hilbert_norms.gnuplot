set term png
set output "hilbert_norms.png"

set yrange[0:*]

plot "fort.7" title "Norma 1" with lines, \
     "fort.8" title "Norma 2" with lines, \
     "fort.9" title "Norma ∞" with lines
