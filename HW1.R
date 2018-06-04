knitr::opts_chunk$set(echo = TRUE)

r <- getOption("repos")
r["CRAN"] <- "http://cran.cnr.berkeley.edu/"
options(repos = r)

if(!require(tidyverse)){
  install.packages("tidyverse")
}
if(!require(readxl)){
  install.packages("readxl")
}

library("tidyverse")
library("readxl")

getwd()

list.files("data")

datadir=c("data")
fname=paste(datadir,"/GSM2776-sample-description.csv",sep="")
fname
data=read.csv(fname,header=T,row.names=1)
head(data,n=4)

data[c("GSM277628","GSM277622"),]
data[c(4:2),c("gene","replicate")]

table(data$gene,data$environ)
with(data,table(gene,environ))
rm(data)

fname=paste(datadir,"/GSM2776-sample-description.txt",sep="")
data=read.table(fname,header=T,row.names=1)
head(data)

fname=paste(datadir,"/GSM2776-sample-description.xls",sep="")
data=read_xls(fname,sheet="thisone")
head(data,n=4)
rm(data)

sessionInfo()
par(mfrow=c(1,2))
hist(rnorm(100))
hist(rnorm(100))