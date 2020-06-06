#!/bin/bash

grep 'Gcm1' mum.find.txt > gcm1.sites
python motifDMRs.py gcm1.sites MUMid.bed gcm1.DMRs
intersectBed -u -a MUMid.bed -b gcm1.DMRs > gcm1.nrDMRs

grep 'AP-1(bZIP)/ThioMac-PU.1-ChIP-Seq/Homer' mum.find.txt > ap1.sites
python motifDMRs.py ap1.sites MUMid.bed ap1.DMRs
intersectBed -u -a MUMid.bed -b ap1.DMRs > ap1.nrDMRs

grep 'AP2gamma(AP2)/MCF7-TFAP2c-ChIP-Seq/Homer' mum.find.txt > ap2c.sites
python motifDMRs.py ap2c.sites MUMid.bed ap2c.DMRs
intersectBed -u -a MUMid.bed -b ap2c.DMRs > ap2c.nrDMRs

grep 'AP-2alpha(AP2)/Hela-AP2alpha-ChIP-Seq/Homer' mum.find.txt > ap2a.sites
python motifDMRs.py ap2a.sites MUMid.bed ap2a.DMRs
intersectBed -u -a MUMid.bed -b ap2a.DMRs > ap2a.nrDMRs

grep 'Atf1(bZIP)/K562-ATF1-ChIP-Seq(GSE31477)/Homer' mum.find.txt > atf1.sites
python motifDMRs.py atf1.sites MUMid.bed atf1.DMRs
intersectBed -u -a MUMid.bed -b atf1.DMRs > atf1.nrDMRs

grep 'ATF3(bZIP)/K562-ATF3-ChIP-Seq/Homer' mum.find.txt > atf3.sites
python motifDMRs.py atf3.sites MUMid.bed atf3.DMRs
intersectBed -u -a MUMid.bed -b atf3.DMRs > atf3.nrDMRs

grep 'bHLHE40(HLH)/HepG2-BHLHE40-ChIP-Seq/Homer' mum.find.txt > bhlh.sites
python motifDMRs.py bhlh.sites MUMid.bed bhlh.DMRs
intersectBed -u -a MUMid.bed -b bhlh.DMRs > bhlh.nrDMRs

grep 'c-Jun-CRE(bZIP)/K562-cJun-ChIP-Seq/Homer' mum.find.txt > cjun.sites
python motifDMRs.py cjun.sites MUMid.bed cjun.DMRs
intersectBed -u -a MUMid.bed -b cjun.DMRs > cjun.nrDMRs

grep 'c-Myc(HLH)/LNCAP-cMyc-ChIP-Seq/Homer' mum.find.txt > cmyc.sites
python motifDMRs.py cmyc.sites MUMid.bed cmyc.DMRs
intersectBed -u -a MUMid.bed -b cmyc.DMRs > cmyc.nrDMRs

grep 'CEBP(bZIP)/CEBPb-ChIP-Seq/Homer' mum.find.txt > cebp.sites
python motifDMRs.py cebp.sites MUMid.bed cebp.DMRs
intersectBed -u -a MUMid.bed -b cebp.DMRs > cebp.nrDMRs

grep 'E2F1(E2F)/Hela-E2F1-ChIP-Seq/Hoemr' mum.find.txt > e2f1.sites
python motifDMRs.py e2f1.sites MUMid.bed e2f1.DMRs
intersectBed -u -a MUMid.bed -b e2f1.DMRs > e2f1.nrDMRs

grep 'E2F4(E2F)/K562-E2F4-ChIP-Seq(GSE31477)/Homer' mum.find.txt > e2f4.sites
python motifDMRs.py e2f4.sites MUMid.bed e2f4.DMRs
intersectBed -u -a MUMid.bed -b e2f4.DMRs > e2f4.nrDMRs

grep 'Egr2/Thymocytes-Egr2-ChIP-Seq(GSE34254)/Homer' mum.find.txt > egr2.sites
python motifDMRs.py egr2.sites MUMid.bed egr2.DMRs
intersectBed -u -a MUMid.bed -b egr2.DMRs > egr2.nrDMRs

grep 'EKLF(Zf)/Erythrocyte-Klf1-ChIP-Seq(GSE20478)/Homer' mum.find.txt > eklf.sites
python motifDMRs.py eklf.sites MUMid.bed eklf.DMRs
intersectBed -u -a MUMid.bed -b eklf.DMRs > eklf.nrDMRs

grep 'ELF1(ETS)/Jurkat-ELF1-ChIP-Seq/Homer' mum.find.txt > elf1.sites
python motifDMRs.py elf1.sites MUMid.bed elf1.DMRs
intersectBed -u -a MUMid.bed -b elf1.DMRs > elf1.nrDMRs

grep 'ERE(NR/IR3)/MCF7-ERa-ChIP-Seq/Homer' mum.find.txt > ere.sites
python motifDMRs.py ere.sites MUMid.bed ere.DMRs
intersectBed -u -a MUMid.bed -b ere.DMRs > ere.nrDMRs

grep 'Fli1(ETS)/CD8-FLI-ChIP-Seq(GSE20898)/Homer' mum.find.txt > fli1.sites
python motifDMRs.py fli1.sites MUMid.bed fli1.DMRs
intersectBed -u -a MUMid.bed -b fli1.DMRs > fli1.nrDMRs

grep 'Gata2(Zf)/K562-GATA2-ChIP-Seq/Homer' mum.find.txt > gata2.sites
python motifDMRs.py gata2.sites MUMid.bed gata2.DMRs
intersectBed -u -a MUMid.bed -b gata2.DMRs > gata2.nrDMRs

grep 'GATA3(Zf)/iTreg-Gata3-ChIP-Seq(GSE20898)/Homer' mum.find.txt > gata3.sites
python motifDMRs.py gata3.sites MUMid.bed gata3.DMRs
intersectBed -u -a MUMid.bed -b gata3.DMRs > gata3.nrDMRs

grep 'Gata4(Zf)/Heart-Gata4-ChIP-Seq(GSE35151)/Homer' mum.find.txt > gata4.sites
python motifDMRs.py gata4.sites MUMid.bed gata4.DMRs
intersectBed -u -a MUMid.bed -b gata4.DMRs > gata4.nrDMRs

grep 'HEB?/mES-Nanog-ChIP-Seq/Homer' mum.find.txt > heb.sites
python motifDMRs.py heb.sites MUMid.bed heb.DMRs
intersectBed -u -a MUMid.bed -b heb.DMRs > heb.nrDMRs

grep 'HIF-1a(HLH)/MCF7-HIF1a-ChIP-Seq/Homer' mum.find.txt > hif1a.sites
python motifDMRs.py hif1a.sites MUMid.bed hif1a.DMRs
intersectBed -u -a MUMid.bed -b hif1a.DMRs > hif1a.nrDMRs

grep 'HIF1b(HLH)/O785-HIF1b-ChIP-Seq(GSE34871)/Homer' mum.find.txt > hif1b.sites
python motifDMRs.py hif1b.sites MUMid.bed hif1b.DMRs
intersectBed -u -a MUMid.bed -b hif1b.DMRs > hif1b.nrDMRs

grep 'HIF2a(HLH)/O785-HIF2a-ChIP-Seq(GSE34871)/Homer' mum.find.txt > hif2a.sites
python motifDMRs.py hif2a.sites MUMid.bed hif2a.DMRs
intersectBed -u -a MUMid.bed -b hif2a.DMRs > hif2a.nrDMRs

grep 'ISRE(IRF)/ThioMac-LPS-exp/HOMER' mum.find.txt > isre.sites
python motifDMRs.py isre.sites MUMid.bed isre.DMRs
intersectBed -u -a MUMid.bed -b isre.DMRs > isre.nrDMRs

grep 'Jun-AP1(bZIP)/K562-cJun-ChIP-Seq/Homer' mum.find.txt > junAp1.sites
python motifDMRs.py junAp1.sites MUMid.bed junAp1.DMRs
intersectBed -u -a MUMid.bed -b junAp1.DMRs > junAp1.nrDMRs

grep 'JunD(bZIP)/K562-JunD-ChIP-Seq/Homer' mum.find.txt > junD.sites
python motifDMRs.py junD.sites MUMid.bed junD.DMRs
intersectBed -u -a MUMid.bed -b junD.DMRs > junD.nrDMRs

grep 'Klf4(Zf)/mES-Klf4-ChIP-Seq/Homer' mum.find.txt > klf4.sites
python motifDMRs.py klf4.sites MUMid.bed klf4.DMRs
intersectBed -u -a MUMid.bed -b klf4.DMRs > klf4.nrDMRs

grep 'MafK(bZIP)/C2C12-MafK-ChIP-Seq(GSE36030)/Homer' mum.find.txt > mafk.sites
python motifDMRs.py mafk.sites MUMid.bed mafk.DMRs
intersectBed -u -a MUMid.bed -b mafk.DMRs > mafk.nrDMRs

grep 'Maz(Zf)/HepG2-Maz-ChIP-Seq(GSE31477)/Homer' mum.find.txt > maz.sites
python motifDMRs.py maz.sites MUMid.bed maz.DMRs
intersectBed -u -a MUMid.bed -b maz.DMRs > maz.nrDMRs

grep 'n-Myc(HLH)/mES-nMyc-ChIP-Seq/Homer' mum.find.txt > nmyc.sites
python motifDMRs.py nmyc.sites MUMid.bed nmyc.DMRs
intersectBed -u -a MUMid.bed -b nmyc.DMRs > nmyc.nrDMRs

grep 'Nanog(Homeobox)/mES-Nanog-ChIP-Seq/Homer' mum.find.txt > nanog.sites
python motifDMRs.py nanog.sites MUMid.bed nanog.DMRs
intersectBed -u -a MUMid.bed -b nanog.DMRs > nanog.nrDMRs

grep 'NF1(CTF)/LNCAP-NF1-ChIP-Seq/Homer' mum.find.txt > nf1.sites
python motifDMRs.py nf1.sites MUMid.bed nf1.DMRs
intersectBed -u -a MUMid.bed -b nf1.DMRs > nf1.nrDMRs

grep 'NFkB-p50,p52(RHD)/p50-ChIP-Chip/Homer' mum.find.txt > nfkb-p50.sites
python motifDMRs.py nfkb-p50.sites MUMid.bed nfkb-p50.DMRs
intersectBed -u -a MUMid.bed -b nfkb-p50.DMRs > nfkb-p50.nrDMRs

grep 'NFkB-p65(RHD)/GM12787-p65-ChIP-Seq/Homer' mum.find.txt > nfkb-p65.sites
python motifDMRs.py nfkb-p65.sites MUMid.bed nfkb-p65.DMRs
intersectBed -u -a MUMid.bed -b nfkb-p65.DMRs > nfkb-p65.nrDMRs

grep 'Nrf2(bZIP)/Lymphoblast-Nrf2-ChIP-Seq(GSE37589)/Homer' mum.find.txt > nrf2.sites
python motifDMRs.py nrf2.sites MUMid.bed nrf2.DMRs
intersectBed -u -a MUMid.bed -b nrf2.DMRs > nrf2.nrDMRs

grep 'Oct2(POU/Homeobox)/Bcell-Oct2-ChIP-Seq/Homer' mum.find.txt > oct2.sites
python motifDMRs.py oct2.sites MUMid.bed oct2.DMRs
intersectBed -u -a MUMid.bed -b oct2.DMRs > oct2.nrDMRs

grep 'Oct4(POU/Homeobox)/mES-Oct4-ChIP-Seq/Homer' mum.find.txt > oct4.sites
python motifDMRs.py oct4.sites MUMid.bed oct4.DMRs
intersectBed -u -a MUMid.bed -b oct4.DMRs > oct4.nrDMRs

grep 'OCT4-SOX2-TCF-NANOG((POU/Homeobox/HMG)/mES-ChIP-Seq/Homer' mum.find.txt > oct4Sox2TcfNanog.sites
python motifDMRs.py oct4Sox2TcfNanog.sites MUMid.bed oct4Sox2TcfNanog.DMRs
intersectBed -u -a MUMid.bed -b oct4Sox2TcfNanog.DMRs > oct4Sox2TcfNanog.nrDMRs

grep 'p53(p53)/Saos-p53-ChIP-Seq/Homer' mum.find.txt > p53.sites
python motifDMRs.py p53.sites MUMid.bed p53.DMRs
intersectBed -u -a MUMid.bed -b p53.DMRs > p53.nrDMRs

grep 'p63(p53)/Keratinocyte-p63-ChIP-Seq/Homer' mum.find.txt > p63.sites
python motifDMRs.py p63.sites MUMid.bed p63.DMRs
intersectBed -u -a MUMid.bed -b p63.DMRs > p63.nrDMRs

grep 'PPARE(NR/DR1)/3T3L1-Pparg-ChIP-Seq/Homer' mum.find.txt > ppare.sites
python motifDMRs.py ppare.sites MUMid.bed ppare.DMRs
intersectBed -u -a MUMid.bed -b ppare.DMRs > ppare.nrDMRs

grep 'PRDM14(Zf)/H1-PRDM14-ChIP-Seq/Homer' mum.find.txt > prdm14.sites
python motifDMRs.py prdm14.sites MUMid.bed prdm14.DMRs
intersectBed -u -a MUMid.bed -b prdm14.DMRs > prdm14.nrDMRs

grep 'PU.1(ETS)/ThioMac-PU.1-ChIP-Seq/Homer' mum.find.txt > pu1.sites
python motifDMRs.py pu1.sites MUMid.bed pu1.DMRs
intersectBed -u -a MUMid.bed -b pu1.DMRs > pu1.nrDMRs

grep 'Reverb(NR/DR2)/BLRP(RAW)-Reverba-ChIP-Seq/Homer' mum.find.txt > reverb.sites
python motifDMRs.py reverb.sites MUMid.bed reverb.DMRs
intersectBed -u -a MUMid.bed -b reverb.DMRs > reverb.nrDMRs

grep 'Sox2(HMG)/mES-Sox2-ChIP-Seq/Homer' mum.find.txt > sox2.sites
python motifDMRs.py sox2.sites MUMid.bed sox2.DMRs
intersectBed -u -a MUMid.bed -b sox2.DMRs > sox2.nrDMRs

grep 'Sox3(HMG)/NPC-Sox3-ChIP-Seq(GSE33059)/Homer' mum.find.txt > sox3.sites
python motifDMRs.py sox3.sites MUMid.bed sox3.DMRs
intersectBed -u -a MUMid.bed -b sox3.DMRs > sox3.nrDMRs

grep 'Stat3(Stat)/mES-Stat3-ChIP-Seq/Homer' mum.find.txt > stat3.sites
python motifDMRs.py stat3.sites MUMid.bed stat3.DMRs
intersectBed -u -a MUMid.bed -b stat3.DMRs > stat3.nrDMRs

grep 'TATA-Box(TBP)/Promoter/Homer' mum.find.txt > tbp.sites
python motifDMRs.py tbp.sites MUMid.bed tbp.DMRs
intersectBed -u -a MUMid.bed -b tbp.DMRs > tbp.nrDMRs

grep 'Tcfcp2l1(CP2)/mES-Tcfcp2l1-ChIP-Seq/Homer' mum.find.txt > tcfcp2l1.sites
python motifDMRs.py tcfcp2l1.sites MUMid.bed tcfcp2l1.DMRs
intersectBed -u -a MUMid.bed -b tcfcp2l1.DMRs > tcfcp2l1.nrDMRs

grep 'TEAD4(TEA)/Tropoblast-Tead4-ChIP-Seq(GSE37350)/Homer' mum.find.txt > tead4.sites
python motifDMRs.py tead4.sites MUMid.bed tead4.DMRs
intersectBed -u -a MUMid.bed -b tead4.DMRs > tead4.nrDMRs

grep 'Usf2(HLH)/C2C12-Usf2-ChIP-Seq(GSE36030)/Homer' mum.find.txt > usf2.sites
python motifDMRs.py usf2.sites MUMid.bed usf2.DMRs
intersectBed -u -a MUMid.bed -b usf2.DMRs > usf2.nrDMRs

grep 'Znf263(Zf)/K562-Znf263-ChIP-Seq/Homer' mum.find.txt > znf263.sites
python motifDMRs.py znf263.sites MUMid.bed znf263.DMRs
intersectBed -u -a MUMid.bed -b znf263.DMRs > znf263.nrDMRs

grep 'ZNF711(Zf)/SH-SY5Y-ZNF711-ChIP-Seq/Homer' mum.find.txt > znf711.sites
python motifDMRs.py znf711.sites MUMid.bed znf711.DMRs
intersectBed -u -a MUMid.bed -b znf711.DMRs > znf711.nrDMRs
