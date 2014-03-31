#!/bin/bash

gnuplot <<EOF
set style data histogram
set style histogram cluster gap 1
set ylabel "Count"
set xlabel "Relative size of the partial input"
set xtic scale 0
set yrange [0:30]
set xlabel font ",20"
set ylabel font ",20"
set key font ",30"
set terminal postscript eps enhanced
set output "Tune.text.nw.v3x08.1stpass.10best.exp.allrules.mmap.nbest1000.1.whenlostinput.eps"
plot 'analysisWhenLostInput.10splits' using 2:xtic(1) t "Input loss vs. partial input relative size"
set output "Tune.text.nw.v3x08.1stpass.10best.exp.allrules.mmap.nbest1000.1.futurecost.whenlostinput.eps"
plot 'analysisWhenLostInput.10splits.futurecost' using 2:xtic(1) t "Input loss vs. partial input relative size\n(future cost)"
EOF
