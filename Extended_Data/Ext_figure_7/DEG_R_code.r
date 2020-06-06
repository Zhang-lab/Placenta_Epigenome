

library('RUVSeq')
library(edgeR)
a=read.table('New_Placenta.RC.hg19.GENCODEV19.txt.filtered',header=T)
nd=a[,4:28]
row.names(nd)=a[,1]
hk=read.table('hk.txt')[,1]

y=DGEList(counts=nd)

keep=rowSums(cpm(y)>1)>=4
y=y[keep,]

keeped=y$counts
des=read.table('Des.txt.new')
x=as.factor(des$Batch)
set <- newSeqExpressionSet(as.matrix(keeped),phenoData = data.frame(x, row.names=colnames(keeped)))


set=betweenLaneNormalization(set, which="upper")







design <- model.matrix(~x, data=pData(set))
ny <- DGEList(counts=counts(set), group=des$batch)
ny <- calcNormFactors(ny, method="upperquartile")
ny <- estimateGLMCommonDisp(ny, design)
ny <- estimateGLMTagwiseDisp(ny, design)
fit <- glmFit(ny, design)
res <- residuals(fit, type="deviance")


genes=rownames(keeped)
dim(keeped)

set4 <- RUVr(set, genes, k=1, res)
pData(set4)



design <- model.matrix(~x+W_1, data=pData(set4))
wy <- DGEList(counts=counts(set4), group=des$Trimester)
wy <- calcNormFactors(wy, method="upperquartile")
wy <- estimateGLMCommonDisp(wy, design)
wy <- estimateGLMTagwiseDisp(wy, design)
fit <- glmFit(wy, design)
lrt <- glmLRT(fit, coef=2)
topTags(lrt)




###############Amnion

y=DGEList(counts=nd,group=des$Aminon)

keep=rowSums(cpm(y)>1)>=4
y=y[keep,]
y$samples$lib.size=colSums(y$counts)
y=calcNormFactors(y)

plotMDS(y)
y=estimateCommonDisp(y, verbose=TRUE)
y=estimateTagwiseDisp(y)

pse=y$pseudo.counts

cpm=pse
for(i in 1:24) {cpm[,i]=pse[,i]*1e6/sum(pse[,i])}


et=exactTest(y)
ntop=topTags(et,n=dim(y)[1])
stop=ntop$table[order(rownames(ntop$table)),]
#sexp=pse[order(rownames(y$pseudo.counts)),]
sexp=cpm[order(rownames(cpm)),]
nftab=cbind(stop,sexp)
ftab=nftab[order(nftab[,4]),]
write.table(ftab,'DEGs_Amnion_To_Other.txt',sep='\t',quote=F)

############### Basal plate, Villi

y=DGEList(counts=nd,group=des$Basal_plate_Villi)

keep=rowSums(cpm(y)>1)>=4
y=y[keep,]
y$samples$lib.size=colSums(y$counts)
y=calcNormFactors(y)

plotMDS(y)
y=estimateCommonDisp(y, verbose=TRUE)
y=estimateTagwiseDisp(y)

pse=y$pseudo.counts
ncpm=pse
dim(pse)
for(i in 1:24) {ncpm[,i]=pse[,i]*1e6/sum(pse[,i])}

et=exactTest(y)
ntop=topTags(et,n=dim(y)[1])
stop=ntop$table[order(rownames(ntop$table)),]
#sexp=pse[order(rownames(y$pseudo.counts)),]
sexp=cpm[order(rownames(ncpm)),]
nftab=cbind(stop,sexp)
ftab=nftab[order(nftab[,4]),]
write.table(ftab,'DEGs_BP_Villi_To_Other.txt',sep='\t',quote=F)




############### Chorion

y=DGEList(counts=nd,group=des$Chorion)

keep=rowSums(cpm(y)>1)>=4
y=y[keep,]
y$samples$lib.size=colSums(y$counts)
y=calcNormFactors(y)

plotMDS(y)
y=estimateCommonDisp(y, verbose=TRUE)
y=estimateTagwiseDisp(y)

pse=y$pseudo.counts
ncpm=pse
dim(pse)
for(i in 1:24) {ncpm[,i]=pse[,i]*1e6/sum(pse[,i])}

et=exactTest(y)
ntop=topTags(et,n=dim(y)[1])
stop=ntop$table[order(rownames(ntop$table)),]
#sexp=pse[order(rownames(y$pseudo.counts)),]
sexp=ncpm[order(rownames(ncpm)),]
nftab=cbind(stop,sexp)
ftab=nftab[order(nftab[,4]),]
write.table(ftab,'DEGs_Chorion_To_Other.txt',sep='\t',quote=F)



############### CTB

y=DGEList(counts=nd,group=des$CTB)

keep=rowSums(cpm(y)>1)>=4
y=y[keep,]
y$samples$lib.size=colSums(y$counts)
y=calcNormFactors(y)

plotMDS(y)
y=estimateCommonDisp(y, verbose=TRUE)
y=estimateTagwiseDisp(y)

pse=y$pseudo.counts
ncpm=pse
dim(pse)
for(i in 1:24) {ncpm[,i]=pse[,i]*1e6/sum(pse[,i])}



et=exactTest(y)
ntop=topTags(et,n=dim(y)[1])
stop=ntop$table[order(rownames(ntop$table)),]
#sexp=pse[order(rownames(y$pseudo.counts)),]
sexp=ncpm[order(rownames(ncpm)),]
nftab=cbind(stop,sexp)
ftab=nftab[order(nftab[,4]),]
write.table(ftab,'DEGs_CTB_To_Other.txt',sep='\t',quote=F)






############### 2nd Vs 3rd

y=DGEList(counts=nd,group=des$Trimester)

keep=rowSums(cpm(y)>1)>=4
y=y[keep,]
y$samples$lib.size=colSums(y$counts)
y=calcNormFactors(y)

plotMDS(y)
y=estimateCommonDisp(y, verbose=TRUE)
y=estimateTagwiseDisp(y)

pse=y$pseudo.counts
ncpm=pse
dim(pse)
for(i in 1:24) {ncpm[,i]=pse[,i]*1e6/sum(pse[,i])}

et=exactTest(y)
ntop=topTags(et,n=dim(y)[1])
stop=ntop$table[order(rownames(ntop$table)),]
#sexp=pse[order(rownames(y$pseudo.counts)),]
sexp=ncpm[order(rownames(ncpm)),]
nftab=cbind(stop,sexp)
ftab=nftab[order(nftab[,4]),]
write.table(ftab,'DEGs_Trimester_2nd_To_3rd.txt',sep='\t',quote=F)





############### 2nd Vs 3rd: CTB
nnd=read.table('CTB.RC')
ndes=des[des[,6]=="Yes",]
y=DGEList(counts=nnd,group=ndes$Trimester)

keep=rowSums(cpm(y)>1)>=4
y=y[keep,]
y$samples$lib.size=colSums(y$counts)
y=calcNormFactors(y)

plotMDS(y)
y=estimateCommonDisp(y, verbose=TRUE)
y=estimateTagwiseDisp(y)

pse=y$pseudo.counts
cpm=pse
dim(pse)
for(i in 1:11) {cpm[,i]=pse[,i]*1e6/sum(pse[,i])}


et=exactTest(y)
ntop=topTags(et,n=dim(y)[1])
stop=ntop$table[order(rownames(ntop$table)),]
#sexp=pse[order(rownames(y$pseudo.counts)),]
sexp=cpm[order(rownames(cpm)),]
nftab=cbind(stop,sexp)
ftab=nftab[order(nftab[,4]),]
write.table(ftab,'DEGs_CTB_2nd_To_3rd.txt',sep='\t',quote=F)





############### 2nd Vs 3rd: Chorion
data=cbind(e[,4:22],e[,23:28])
nnd=cbind(data[,13],data[,18],data[,9],data[,21])
colnames(nnd)=c('CTL02_Chorion_Smooth','CTL03_Chorion_Smooth','CTL01_Chorion_Smooth','CTL04_Chorion_Smooth')
row.names(nnd)=e[,1]
ndes=des[des[,5]=="Yes",]
y=DGEList(counts=nnd,group=ndes$Trimester)

keep=rowSums(cpm(y)>1)>=2
y=y[keep,]
y$samples$lib.size=colSums(y$counts)
y=calcNormFactors(y)

plotMDS(y)
y=estimateCommonDisp(y, verbose=TRUE)
y=estimateTagwiseDisp(y)

pse=y$pseudo.counts
cpm=pse
dim(pse)
for(i in 1:4) {cpm[,i]=pse[,i]*1e6/sum(pse[,i])}


et=exactTest(y)
ntop=topTags(et,n=dim(y)[1])
stop=ntop$table[order(rownames(ntop$table)),]
#sexp=pse[order(rownames(y$pseudo.counts)),]
sexp=cpm[order(rownames(cpm)),]
nftab=cbind(stop,sexp)
ftab=nftab[order(nftab[,4]),]
write.table(ftab,'DEGs_Chorion_2nd_To_3rd.txt',sep='\t',quote=F)


############### 2nd Vs 3rd: Villi_bp
des=read.table('Des.txt.new')
ndd=cbind(e[,15],e[,18],e[,20],e[,22],e[,11],e[,13],e[,26])
colnames(ndd)=c('CTL02_Basal_Plate','CTL02_Villi','CTL03_Basal_Plate','CTL03_Villi','CTL01_Basal_Plate','CTL01_Villi','CTL04_Villi')
row.names(ndd)=e[,1]
ndes=des[des[,4]=="Yes",]
y=DGEList(counts=ndd,group=ndes$Trimester)

keep=rowSums(cpm(y)>1)>=2
y=y[keep,]
y$samples$lib.size=colSums(y$counts)
y=calcNormFactors(y)

plotMDS(y)
y=estimateCommonDisp(y, verbose=TRUE)
y=estimateTagwiseDisp(y)

pse=y$pseudo.counts
cpm=pse
dim(pse)
for(i in 1:7) {cpm[,i]=pse[,i]*1e6/sum(pse[,i])}


et=exactTest(y)
ntop=topTags(et,n=dim(y)[1])
stop=ntop$table[order(rownames(ntop$table)),]
#sexp=pse[order(rownames(y$pseudo.counts)),]
sexp=cpm[order(rownames(cpm)),]
nftab=cbind(stop,sexp)
ftab=nftab[order(nftab[,4]),]
write.table(ftab,'DEGs_BP_Villi_2nd_To_3rd.txt',sep='\t',quote=F)

