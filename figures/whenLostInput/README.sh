#!/bin/bash

gnuplot <<EOF
set style data histogram
set style histogram cluster gap 1
set ylabel "Proportion of lost MT hypotheses (%)"
set xlabel "Proportion of words covered (%)"
set xtic scale 0
set yrange [0:30]
set xlabel font ",25"
set ylabel font ",25"
set key font ",30"
set terminal postscript eps enhanced
set output "Tune.text.nw.v3x08.1stpass.10best.exp.allrules.mmap.nbest1000.1.whenlostinput.eps"
plot 'analysisWhenLostInput.10splits.proportion' using 2:xtic(1) t "Lost MT hypotheses vs. words covered"
set output "Tune.text.nw.v3x08.1stpass.10best.exp.allrules.mmap.nbest1000.1.futurecost.whenlostinput.eps"
plot 'analysisWhenLostInput.10splits.futurecost.proportion' using 2:xtic(1) t "Lost MT hypotheses vs. words covered\n(future cost)"

set yrange [0:100]
set ylabel "Cumulative proportion of lost MT hypotheses (%)"
set key font ",20"
set ylabel font ",20"
set key top left
set output "Tune.text.nw.v3x08.1stpass.10best.exp.allrules.mmap.nbest1000.1.whenlostinput.cumulative.eps"
plot 'analysisWhenLostInput.10splits.proportion.cumulative' using 2:xtic(1) t "Lost MT hypotheses vs.\n  words covered (cumulative)"
set output "Tune.text.nw.v3x08.1stpass.10best.exp.allrules.mmap.nbest1000.1.futurecost.whenlostinput.cumulative.eps"
plot 'analysisWhenLostInput.10splits.futurecost.proportion.cumulative' using 2:xtic(1) t "Lost MT hypotheses vs.\n  words covered (cumulative)\n(future cost)"
EOF
