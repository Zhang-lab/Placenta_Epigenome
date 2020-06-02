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
        infile = open(X,"r+").readlines()
        print 'Total ',len(infile),' lines.'
        return infile
    except IOError,message:
        print >> sys.stderr, "cannot open file",message
        sys.exit(1)

if __name__=="__main__":
    tS = time.time()
    GE = main('male.hg19.chrom.sizes')
    ge = {}
    gec = {}
    for ea in GE:
        te = ea[:-1].split('\t')
        x = int(te[1])/50000
        ge[te[0]] = [0]*x
        gec[te[0]] = [0]*x
        
    OP = main(sys.argv[1])
    for ea in OP:
        te = ea[:-1].split('\t')
        n = int(te[1])/50000
        m = float(te[-1])
        try:
            ge[te[0]][n] += m
            gec[te[0]][n] += 1
        except:
            continue
    o = file('Bin_50000bp_'+sys.argv[1]+'_Averaged','w')
    for ea in gec.keys():
        for i in range(len(gec[ea])):
            if gec[ea][i] >0 :
                o.write(ea+'\t'+str((i-1)*50000)+'\t'+str(i*50000)+'\t'+str(ge[ea][i]/gec[ea][i])+'\n')


    tE = time.time()
    print 'Cost ',(tE-tS),' sec'
