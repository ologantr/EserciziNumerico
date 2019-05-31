set term pngcairo size 1000, 1000
set output "wilkinson_norms.png"

set yrange[0:*]
set style line 5 linetype 3 dt 2 lw 2 linecolor rgb 'blue'

plot "fort.1" title "Norma 1" lt rgb "red" lw 2 w l, \
     "fort.2" title "Norma 2" w l,\
     "fort.3" title "Norma ∞" ls 5 w l
