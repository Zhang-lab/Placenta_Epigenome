#!/usr/bin/python
# programmer : Bo
# usage: Count_Reads_bin.py file_list RPKM/Reads 

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

def Read_data():
    X = main('M1kb_num500bin.bed')
    name = []
    reads = []
    site = {}
    tt = 'V1\tV2\tV3\tV4\n'
    for n in range(len(X)):
        te = X[n][:-1].split('\t')
        if te[0] not in site.keys():
            print 'adding',te[0]
            site[te[0]] = {}
        w = int(len(te[1])/2)
        tag = te[1][:w+1]
        #if tag not in site[te[0]].keys():
        #    site[te[0]][tag] = {}
        try:
            site[te[0]][tag][te[1]] = n-1
        except:
            site[te[0]][tag] = {}
            site[te[0]][tag][te[1]] = n-1
        name.append(X[n][:-1])
        reads.append(0)
    return site, name, reads,tt

def Read_blacklist():
    bl = main('hg19_blacklist.bed')
    BL = {}
    for each in bl:
        te = each[:-1].split('\t')
        if te[0] not in BL.keys():
            BL[te[0]]= [] 
            BL[te[0]].append([int(te[1]),int(te[2])])
    return BL

if __name__=="__main__":
    tS = time.time()
    
    bin = 1000
    
    BL = Read_blacklist()
    #(B_site,B_name,C_reads,tt) = Read_data(sys.argv[1])
    OP = main(sys.argv[1])
    for each in OP:
        (B_site,B_name,B_reads,tt) = Read_data()
        data = main(each[:-1])
        n = 0
        m = 0
        
        out = file('M1K'+'_'+each[:-1],'w')
        #out.write(tt)
        for each in data:
            n += 1
            if n == 1000000:
                m += 1
                n = 0
                print m,'million reads' 
            te = each.split('\t')
            start = int(te[1])
            end = int(te[2])
            if te[0] not in B_site.keys():
                continue
            if te[0] in BL.keys():
                for ebi in range(len(BL[te[0]])):
                    if start < BL[te[0]][ebi][1] and end > BL[te[0]][ebi][0]:
                        continue
            ss = int(0.5+(start/1000))*1000
            s = str(ss)
            w =int( len(s)/2)
            tag = s[:w+1]
            try :
                y = B_site[te[0]][tag][s]
            except:
                continue
            B_reads[y] += 1
            if end-ss >1000:
                try:
                    B_reads[y+1] += 1
                except:
                    continue
        for i in range(len(B_name)):
            out.write(B_name[i]+'\t'+str(B_reads[i])+'\t'+str(B_reads[i]*2000000.0/len(data))+'\n')
    tE = time.time()
    print 'Cost ',(tE-tS),' sec'
