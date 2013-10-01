#!/bin/sh

for f in `ls *.tex`; do
   echo "** $f **"
   aspell -d "/usr/lib/aspell/en_GB.multi" --home-dir=. -t -c $f
done