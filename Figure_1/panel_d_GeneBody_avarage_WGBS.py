#!/usr/local/bin/python
# programmer : Bo
# usage:

import sys
import re
import random
import string
import time

def main(X):
    try:
        print 'opening file :',X
        infile = open(X,"r").readlines()
        print 'Total ',len(infile),' lines.'
        return infile
    except IOError,message:
        print >> sys.stderr, "cannot open file",message
        sys.exit(1)

def Read_genome(X):
    x = main(X)
    genome = {}
    for ea in x:
        te = ea[:-1].split('\t')
        genome[te[0]] = [-1]*int(te[1])
    return genome

def Read_Gene(X):
    gene = {}
    g = main(X)
    for ea in g:
        te = ea[:-1].split('\t')
        if 'M' in te[0] or 'X' in te[0] or 'Y' in te[0] or len(te[0])>5:
            continue
        gene[te[-1]] = [te[0],int(te[1]),int(te[2]),te[3]]
    return gene

if __name__=="__main__":
    tS = time.time()
    genome = Read_genome('male.hg19.chrom.sizes')
    #gene = Read_Gene('protein.coding')
    gene =Read_Gene('50Kb_Input_table.no_gene.10k')
    OP = main(sys.argv[1])
    for ea in OP:
        te = ea[:-1].split('\t')
        genome[te[0]][int(te[1])] = float(te[-1])
        genome[te[0]][int(te[2])] = float(te[-1])
    
    mD = [0]*200
    count = [1]*200
    total_gene = len(gene.keys())
    for x in gene.keys():
        ea = gene[x]
        #print ea
        strand = ea[3]
        CHR = ea[0]
        start = ea[1]
        end = ea[2]
        if strand == '+':
            up = genome[CHR][(start-15000):start]
            gb = genome[CHR][start:end]
            down = genome[CHR][end:(end+15000)]
        else:
            up = genome[CHR][end:(end+15000)]
            up.reverse()
            gb = genome[CHR][start:end]
            gb.reverse()
            down = genome[CHR][(start-15000):start]
            down.reverse()
        for i in range(0,50):
            s = 0.0
            c = 0
            for j in range(i*300,(i+1)*300):
                try:
                    if up[j] > (-0.5):
                        s += up[j]
                        c += 1
                except:
                    continue
            if c == 0:
                continue
            else:
                mD[i] += s/c
                count[i] += 1
        k = len(gb)/100
       # print k
        for i in range(50,150):
            s = 0.0
            c = 0
            tm = i-50
            for j in range(tm*k,(tm+1)*k):
                try:
                    if gb[j] > (-0.5):
                        s += gb[j]
                        c += 1
                except:
                    continue
            if c == 0:
                continue
            else:
                mD[i] += s/c
                count[i] += 1
        for i in range(150,200):
            s = 0.0
            c = 0
            tm = i-150
            for j in range(tm*300,(tm+1)*300):
                try:
                    if down[j] > (-0.5):
                        s += down[j]
                        c += 1
                except:
                    continue
            if c == 0:
                continue
            else:
                mD[i] += s/c
                count[i] += 1
        #print mD
    #o = file('Out_mean_GeneBody_'+sys.argv[1],'w')
    o = file('Out_mean_Intergenic_'+sys.argv[1],'w')
    for i in range(200):
        o.write('\n'+str(mD[i]/count[i]))
    o.close()

