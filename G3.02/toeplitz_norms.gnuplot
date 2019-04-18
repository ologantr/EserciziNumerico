set term pngcairo
set output "toeplitz_norms.png"

set yrange[0:*]

plot "fort.10" title "Norma 1" w line dt '-', \
     "fort.11" title "Norma 2" w line dt '.', \
     "fort.12" title "Norma ∞" w line dt '-.'
