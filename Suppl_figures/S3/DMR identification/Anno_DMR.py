#!/usr/bin/python
# programmer : Bo
# usage:  Anno_DMR.py filename 

import sys
import re
import random
import string
import time

def main(X):
    try:
        print 'opening file :',X
        infile = open(X,"r+").readlines()
        print 'Total ',len(infile),' lines.'
        return infile
    except IOError,message:
        print >> sys.stderr, "cannot open file",message
        sys.exit(1)

def Read_DMR(X):
    per = 0
    po = 0
    FILE = main(X)
    DIC_per = {}
    DIC_po = {}
    for i in range(1,len(FILE)):
        temp = FILE[i][:-1].split(',')
        if float(temp[-1]) < 0 :
            if temp[0] not in DIC_po.keys():
                DIC_po[temp[0]] = {}
            DIC_po[temp[0]][temp[1]+','+temp[2]] = [FILE[i][:-1]]
            po += 1
        else:
            if temp[0] not in DIC_per.keys():
                DIC_per[temp[0]] = {}
            DIC_per[temp[0]][temp[1]+','+temp[2]] = [FILE[i][:-1]]
            per += 1
    print '\n***Found Hyper DMR',per
    print '***Found Hypo DMR',po,'\n'
    print 40*'*'
    return DIC_per,DIC_po

def Generate_Dic(X):
    FILE = main(X)
    DIC = {}
    for each in FILE:
        temp = each[:-1].split('\t')
        if temp[0] not in DIC.keys():
            DIC[temp[0]] = {}
        DIC[temp[0]][temp[-1]] = [int(temp[1]),int(temp[2])]
    return DIC

def Over_lap(A,B): #A is list containing two items. eg  A =[12,34]; B is DIC item, 
                   #A is the DMR region, B is the anno region DIC
    As = A[0]
    Ae = A[1]
    for every in B.keys():
        Bs = B[every][0]
        Be = B[every][1]
        re = 1
        if As+100 < Be or  Ae-100 > Bs:
            if As < Be and  Ae > Bs:
                re = 0
                break
            else:
                continue
            
        else:
            re = 1
    if re == 1:
        return '-'
    else:
        return every

def Write_file(X,name): #X is a idc item; name is the saved file name
    print 'writing file : ',name
    FILE = file(name,'w')
    FILE.write('#annotation content:  Whole_gene    CpGI    Promoter_UniLong    Promoter_ingene    5UTR    CCDs    3UTR    Repeats\n')
    for each in X.keys():
        for every in X[each].keys():
            for M in X[each][every]:
                M = M.replace(',','\t')
                FILE.write(M+'\t')
            FILE.write('\n')
    FILE.close()

def Anno_Single(DMR,AN_DIC,TYPE,H):
    print 'annotate in ',TYPE
    aS = 0
    nS = 0 
    for CHR in DMR.keys():
        #print 'reading ',CHR
        for each in DMR[CHR].keys():
            temp = each.split(',')
            site = [int(temp[0]),int(temp[1])]
            Tag = Over_lap(site,AN_DIC[CHR])
            DMR[CHR][each].append(Tag)
            if Tag == '-':
                nS += 1
            else:
                aS += 1                
    print 'NONE hit is  ',nS 
    print TYPE,' hit ',aS,'\n'
    Get_statis(DMR,TYPE,H)
    return DMR

def Anno_all(DMR,H):
    print 40*'*'
    DMR = Anno_Single(DMR,Whole_g,'Whole_gene',H)
    DMR = Anno_Single(DMR,CG,'CpG_islands',H)
    DMR = Anno_Single(DMR,ProU,'Promoter_UniLong',H)
    #DMR = Anno_Single(DMR,ProI,'Promoter_ingene',H)
    DMR = Anno_Single(DMR,UTR5,'5_end_UTR',H)
    DMR = Anno_Single(DMR,Exon,'Exon',H)
    DMR = Anno_Single(DMR,UTR3,'3_end_UTR',H)
    #DMR = Anno_Single(DMR,Rep,'Repeat_maskes',H)
    #DMR = Anno_Single(DMR,TFBS,'Encode_TFBS',H)
    return DMR

def Get_statis(X,TYPE,H): #X is dic item.
    Out = file(sys.argv[1]+'_'+H+'_'+TYPE+'_Report','w')
    ADIC = {}
    for CHR in X.keys():
        for loc in X[CHR].keys():
            TAG = X[CHR][loc][-1]
            if TAG == '-':
                continue
            if TAG not in ADIC.keys():
                ADIC[TAG] = [0]
                #ADIC[TAG][0] = 1
            ADIC[TAG][0] += 1
            site = loc.replace(',','-')
            ADIC[TAG].append(CHR+':'+site)
    for _each in ADIC.keys():
        Out.write(_each+'\t')
        for ea in ADIC[_each]:
            Out.write(str(ea)+'\t')
        Out.write('\n')
    Out.close()



if __name__=="__main__":
    tS = time.time()
    (DMR_per,DMR_po) = Read_DMR(sys.argv[1])
    CG = Generate_Dic('/home/bzhang/Genome_related/human/Ref_gene/MM_anno/CpG_island_hg19_Gs.bed')
    Whole_g = Generate_Dic('/home/bzhang/Genome_related/human/Ref_gene/MM_anno/Whole_gene_Ref_hg19_Gs.bed')
    ProU = Generate_Dic('/home/bzhang/Genome_related/human/Ref_gene/MM_anno/Ref_all_pro_out')
    #ProI = Generate_Dic('/home/bzhang/Genome_related/human/Ref_gene/MM_anno/Promoter_1k_hg19_Gs.bed_ingene')
    UTR5 = Generate_Dic('/home/bzhang/Genome_related/human/Ref_gene/MM_anno/5UTR_Ref_hg19_Gs.bed')
    Exon = Generate_Dic('/home/bzhang/Genome_related/human/Ref_gene/MM_anno/Exon_Gs.bed')
    UTR3 = Generate_Dic('/home/bzhang/Genome_related/human/Ref_gene/MM_anno/3UTR_hg19_Gs.bed')
    Rep = Generate_Dic('/home/bzhang/Genome_related/human/Ref_gene/MM_anno/RepMasked_Gs.bed')
    #TFBS = Generate_Dic('/home/bzhang/Genome_related/human/EncodeTFBS/EncodeTFBSMore100.bed')
    
    print '\n!!!annotate hyper DMR...'
    DMR_per = Anno_all(DMR_per,'Hyper')
    print 40*'*'
    print '\n!!!annotate hypo DMR...'
    DMR_po = Anno_all(DMR_po,'Hypo')

    Write_file(DMR_per,sys.argv[1]+'_Hyper')
    Write_file(DMR_po,sys.argv[1]+'_Hypo')
    

    tE = time.time()
    print 'Cost ',(tE-tS),' sec'
