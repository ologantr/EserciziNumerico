set term pngcairo
set output "wilkinson_norms.png"

set yrange[0:*]

plot "fort.1" title "Norma 1" w line dt '-', \
     "fort.2" title "Norma 2" w line dt '.', \
     "fort.3" title "Norma ∞" w line dt '-.'
