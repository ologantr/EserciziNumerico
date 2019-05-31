set term pngcairo size 1000, 1000
set output "relative_error.png"

set yrange[0:*]

plot "fort.1" title "Toeplitz Matrix" lt rgb 'red' lw 2 w l, \
