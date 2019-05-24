set term pngcairo size 1000, 1000
set output "relative_error.png"

set logscale y 10
set yrange[0:*]

plot "fort.1" title "Hilbert Matrix" lt rgb 'red' lw 2 w l, \
     "fort.2" title "Wilkinson Matrix" lt rgb 'blue' lw 2 w l, \
     "fort.3" title "Toeplitz Matrix" lt rgb 'green' lw 2 w l
