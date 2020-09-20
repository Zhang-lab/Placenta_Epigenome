#!/usr/bin/python
# programmer : Bo
# usage:

import sys
import re
import random
import string
import time

def main(X):
    try:
        
        infile = open(X,"r+").readlines()
        print X, 'has opened, total ',len(infile),' Lines'
        return infile
    except IOError,message:
        print >> sys.stderr, "cannot open file",message
        sys.exit(1)

if __name__=="__main__":
    tS = time.time()
    F = main(sys.argv[1])
    o = file('Uni_'+sys.argv[1],'w')
    o.write(F[0])
    x = []
    for i in range(1,len(F)):
        te = F[i].split('\t')
        if te[0] not in x:
            o.write(F[i])
            x.append(te[0])

    tE = time.time()
    print 'Cost ',(tE-tS),' sec'

