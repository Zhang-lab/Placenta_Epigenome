#!/bin/bash

## EXAMPLE
#findMotifsGenome.pl ../../data/sepEnh/MUUid.bed hg19 given/MUU_find_Masked/ -size given -len 6,8,10 -find test_find.motifs -mknown ../custom.motifs -cpg -mask > muu.find_Masked.txt 2>find_Masked.log &


## FIND program -- run in each *_find/ subfolder

findMotifsGenome.pl MUUid.bed hg19 run/ -size given -nomotif -noknown -find ../find.motifs -cpg -mask > muu.find.txt 2>muu.find.log &
findMotifsGenome.pl MUMid.bed hg19 run/ -size given -nomotif -noknown -find ../find.motifs -cpg -mask > mum.find.txt 2>mum.find.log &
findMotifsGenome.pl UMMid.bed hg19 run/ -size given -nomotif -noknown -find ../find.motifs -cpg -mask > umm.find.txt 2>umm.find.log &
