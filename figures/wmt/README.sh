#!/bin/bash

gnuplot <<EOF
set key top left
set ytics nomirror
set xtics nomirror
set xlabel "Year"
set ylabel "Number of millions of tokens"
set size 0.7,0.7
set terminal postscript eps enhanced
set output "wmtdata.eps"
plot "data" using 1:2 with lines title "EN parallel data", "data" using 1:3 with lines title "EN monolingual data"
EOF
