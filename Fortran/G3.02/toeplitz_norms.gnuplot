set term pngcairo size 1000, 1000
set output "toeplitz_norms.png"

set yrange[0:*]
set style line 5 linetype 3 dt 2 lw 2 linecolor rgb 'blue'

plot "fort.10" title "Norma 1" lt rgb "red" lw 2 w l, \
     "fort.11" title "Norma 2" w l, \
     "fort.12" title "Norma ∞" ls 5 w l
