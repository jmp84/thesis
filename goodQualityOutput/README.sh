#!/bin/bash

# recompute bleu score for our system
nist12hyps=/home/blue9/jmp84/exps/0102-ZHENnist12-A/syscomb.writedec/0109-0102-0111/nist12.test_A.nw.012b-012bgoogle-012bgoogle-OK/lmbrdec/nist12.test_A.nw.detok.mt08.text.nw.nnorm

#done:cat $nist12hyps | awk 'NF > 40 && NF < 60' > longsentences.40-60
cat $nist12hyps | awk 'NF > 30 && NF <= 40' > longsentences.30-40
