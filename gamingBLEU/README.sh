#!/bin/bash

mtBleu=/home/blue9/jmp84/exps/0120-Generation/Tune.text.nw.v3x08.1stpass.10best/score1best/Tune.text.nw.v3x08.1.detok.bleu.nist09.log
mtOracleBleu=/home/blue9/jmp84/exps/0120-Generation-more/Tune.text.nw.v3x08.1stpass.10best/mtbaseline/oracle/scoring/1-best.detok.bleu.nist09.log

#done:cat $mtBleu | grep -P "BLEU score using 4-grams = .* on segment" > mt.bleu
#done:cat $mtOracleBleu | grep -P "BLEU score using 4-grams = .* on segment" > mtOracle.bleu

#done:paste mt.bleu mtOracle.bleu | awk '{if ($23 - $6 > 0.05) {print $0}}' > diffGreaterThan5BLEU
