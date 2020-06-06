#!/bin/bash

## AP1s, junAp1
#intersectBed -u -a ap1.nrDMRs -b junAp1.nrDMRs > ap1_junAp1.sharedDMRs

## AP2s
#intersectBed -u -a ap2a.nrDMRs -b ap2c.nrDMRs > ap2a_c.sharedDMRs

## ATFs and CEBP
#intersectBed -u -a atf1.nrDMRs -b atf3.nrDMRs > atf1_3.sharedDMRs
#intersectBed -u -a atf1.nrDMRs -b cebp.nrDMRs > atf1_cebp.sharedDMRs
#intersectBed -u -a atf3.nrDMRs -b cebp.nrDMRs > atf3_cebp.sharedDMRs
#
### HIFs
#intersectBed -u -a hif1a.nrDMRs -b hif2a.nrDMRs > hif1a_2a.sharedDMRs
#intersectBed -u -a hif1a.nrDMRs -b hif1b.nrDMRs > hif1a_1b.sharedDMRs
#
### GATAs
#intersectBed -u -a gata2.nrDMRs -b gata3.nrDMRs > gata2_3.sharedDMRs
#intersectBed -u -a gata3.nrDMRs -b gata4.nrDMRs > gata3_4.sharedDMRs
#intersectBed -u -a gata2.nrDMRs -b gata4.nrDMRs > gata2_4.sharedDMRs
#
### Juns
#intersectBed -u -a junD.nrDMRs -b junAp1.nrDMRs > JunD_Ap1.sharedDMRs
#intersectBed -u -a junD.nrDMRs -b cjun.nrDMRs > junD_cjun.sharedDMRs
#intersectBed -u -a junAp1.nrDMRs -b cjun.nrDMRs > junAp1_cjun.sharedDMRs
#
### Nfkbs
#intersectBed -u -a nfkb-p50.nrDMRs -b nfkb-p65.nrDMRs > nfkb-p50_p65.sharedDMRs

## ES factors
intersectBed -u -a oct2.nrDMRs -b oct4.nrDMRs > oct2_4.sharedDMRs
intersectBed -u -a sox2.nrDMRs -b sox3.nrDMRs > sox2_3.sharedDMRs
intersectBed -u -a oct4Sox2TcfNanog.nrDMRs -b nanog.nrDMRs > nanog_oct4Sox2TcfNanog.sharedDMRs
intersectBed -u -a oct4Sox2TcfNanog.nrDMRs -b sox2.nrDMRs > sox2_oct4Sox2TcfNanog.sharedDMRs
intersectBed -u -a oct4Sox2TcfNanog.nrDMRs -b oct4.nrDMRs > oct4_oct4Sox2TcfNanog.sharedDMRs

# p53 family
intersectBed -u -a p53.nrDMRs -b p63.nrDMRs > p53_p63.sharedDMRs
