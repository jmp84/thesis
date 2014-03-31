#!/bin/bash

# we measure the BLEU obtained by a human on MT08

originalRefs=/home/blue1/agile/mt/Data/agile.v8.0.3/devtestsets/chinese/mt08.text.nw.nnorm.sgm
originalSrcs=/home/blue1/agile/mt/Data/agile.v8.0.3/devtestsets/chinese/mt08.text.nw.nnorm_src.sgm
docids=/home/blue1/agile/mt/Data/agile.v8.0.3/devtestsets/chinese/mt08.text.nw.nnorm.docid
prepareSGML=/home/blue1/agile/mt/Data/agile.v3.1/spring07dev/put_in_SGML_format.v2.pl
bleuscore=/home/blue7/ad465/data/nist09/scorer/mteval-v13-ADRIA.pl

# get the ith (i=1,2,3,4) reference in text format and in doc id order
#done:for i in `seq 1 4`; do
#done:    ./get_refs_for_sysid.pl $originalRefs r$i $docids > ref.$i
#done:done

# prepare sgml
#done:for i in `seq 1 4`; do
#done:    $prepareSGML -i ref.$i -nist $originalSrcs -sys 1 -o ref.$i.sgml
#done:done

# compute bleu score
#done:for i in `seq 1 4`; do
#done:    $bleuscore -i -d 2 -r $originalRefs -s $originalSrcs -t ref.$i.sgml -b >& ref.$i.bleu
#done:done
# thankfully we get a bleu score of 1 since the ith reference is one of the references...

# now let's get rid of the ith reference
#done:./remove_sysid.pl $originalRefs r1 > mt08.text.nw.nnorm.2-3-4.sgm
#done:./remove_sysid.pl $originalRefs r2 > mt08.text.nw.nnorm.1-3-4.sgm
#done:./remove_sysid.pl $originalRefs r3 > mt08.text.nw.nnorm.1-2-4.sgm
#done:./remove_sysid.pl $originalRefs r4 > mt08.text.nw.nnorm.1-2-3.sgm
#done: remove duplicated </refset> for first 3 sgm files

# recompute bleu score
#done:$bleuscore -i -d 2 -r mt08.text.nw.nnorm.2-3-4.sgm -s $originalSrcs -t ref.1.sgml -b >& ref.1.2-3-4.bleu
#done:$bleuscore -i -d 2 -r mt08.text.nw.nnorm.1-3-4.sgm -s $originalSrcs -t ref.2.sgml -b >& ref.2.1-3-4.bleu
#done:$bleuscore -i -d 2 -r mt08.text.nw.nnorm.1-2-4.sgm -s $originalSrcs -t ref.3.sgml -b >& ref.3.1-2-4.bleu
#done:$bleuscore -i -d 2 -r mt08.text.nw.nnorm.1-2-3.sgm -s $originalSrcs -t ref.4.sgml -b >& ref.4.1-2-3.bleu

# recompute bleu score for our system
nist12hyps=/home/blue9/jmp84/exps/0102-ZHENnist12-A/syscomb.writedec/0109-0102-0111/nist12.test_A.nw.012b-012bgoogle-012bgoogle-OK/lmbrdec/nist12.test_A.nw.detok.mt08.text.nw.nnorm.sgml
#done:$bleuscore -i -d 2 -r $originalRefs -s $originalSrcs -t $nist12hyps -b >& nist12.bleu

#done:$bleuscore -i -d 2 -r mt08.text.nw.nnorm.2-3-4.sgm -s $originalSrcs -t $nist12hyps -b >& nist12.2-3-4.bleu
#done:$bleuscore -i -d 2 -r mt08.text.nw.nnorm.1-3-4.sgm -s $originalSrcs -t $nist12hyps -b >& nist12.1-3-4.bleu
#done:$bleuscore -i -d 2 -r mt08.text.nw.nnorm.1-2-4.sgm -s $originalSrcs -t $nist12hyps -b >& nist12.1-2-4.bleu
#done:$bleuscore -i -d 2 -r mt08.text.nw.nnorm.1-2-3.sgm -s $originalSrcs -t $nist12hyps -b >& nist12.1-2-3.bleu
