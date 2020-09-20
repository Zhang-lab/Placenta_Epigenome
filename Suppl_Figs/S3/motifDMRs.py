#!/usr/bin/python
# Programmer: Rebecca
# Date: Feb 2014

import os
import sys

if len(sys.argv) != 4:
    print '''usage: {0} <find ouptut> <bedfile> <outfile name> \n\n'''.format(sys.argv[0])

findf,bedf,outf = sys.argv[1:]
tmpf = "tmp.txt"
store={}
search=[]

def main():
    with open( bedf,"r" ) as BED:
        for line in BED:
            l = line.split("\t")
            v = l[0]+":"+l[1]+"-"+l[2]
            k = l[3]
            store[k] = v
    BED.close()


def match():
    with open( findf,"r" ) as FIND:
#        next( FIND )
        for line in FIND:
            l = line.split( "\t" )
            s = l[0]	
            search.append( s )
    FIND.close()
    with open( tmpf,"w" ) as tmp:
        for i in search:
            tmp.write( store[i]+'\n' )
    tmp.close()


def parse():
    with open( tmpf,"r" ) as tmp, open( outf,"w" ) as out:
        for line in tmp:
            line = line.rstrip('\n')
            a = line.split( ":" )
            chr = a[0]
            b = a[1].split( "-" ) 
            ( st,end)  = ( b[0],b[1] )
            out.write( chr+'\t'+st+'\t'+end+'\n' )
    out.close()


if __name__=="__main__":
    main()
    match()
    parse()
