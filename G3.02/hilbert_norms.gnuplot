set term pngcairo
set output "hilbert_norms.png"

set yrange[0:*]

plot "fort.7" title "Norma 1" w line dt '-', \
     "fort.8" title "Norma 2" w line dt '.', \
     "fort.9" title "Norma ∞" w line dt '-.'
