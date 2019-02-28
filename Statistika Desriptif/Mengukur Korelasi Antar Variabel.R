##################################################################################################
##
## Mengukur Korelasi Antar Variabel
##
##################################################################################################

#-------------------------------------------------------------------------------------------------
## Memuat dataset
#-------------------------------------------------------------------------------------------------

## Memuat library
# install.packages('readxl)
library(readxl)

## Cek lokasi working directory
getwd()

## Set lokasi baru working directory
setwd("D:/R Training/Blog/Dataset")

## Muat file xls
help("read_excel") # menu bantuan perintah read.xls()
df<- read_excel("hhappc.xls",sheet='appc16')

## Cek dataset
head(df) # cek 6 observasi pertama
tail(df) # cek 6 observasi terakhir
str(df) # cek struktur dataset

## Membuang kolom terakhir dataset
df<- df[,-4]

## Cek dataset
head(df) # cek 6 observasi pertama
tail(df) # cek 6 observasi terakhir
str(df) # cek struktur dataset

## Mengubah strata menjadi factor
df$Bicarbonate <- as.factor(df$Bicarbonate)

## Cek dataset
str(df)

#------------------------------------------------------------------------------------------------
## TDS vs Uranium
#------------------------------------------------------------------------------------------------

## visualisasi TDS vs Uranium
# Scatterplot dengan loess lines
lo <- loess(df$Uranium~df$TDS)
plot(df$TDS,df$Uranium, xlab="TDS", ylab="Uranium")
xl <- seq(min(df$TDS),max(df$TDS),(max(df$TDS)-min(df$TDS))/1000)
lines(xl, predict(lo,xl),col="red",lwd=2)

# visualisasi menggunakan ggplot
library(ggplot2)
ggplot(df,aes(TDS,Uranium))+
  geom_point()+
  geom_smooth() # metode loess dengan standard error

ggplot(df,aes(TDS,Uranium))+
  geom_point()+
  geom_smooth(se=FALSE) # metode loess tanpa standard error

ggplot(df,aes(TDS,Uranium))+
  geom_point()+
  geom_smooth(method="lm") # metode lm dengan standard error

ggplot(df,aes(TDS,Uranium))+
  geom_point()+
  geom_smooth(method="lm",se=FALSE) # metode lm tanpa standard error

## Visualisasi menggunakan garis linier
lm<- lm(df$Uranium~df$TDS)
lm$coefficients
plot(df$TDS,df$Uranium, xlab="TDS", ylab="Uranium")
abline(2.765084074,0.002415538 ) # menambahkan garis linier berdasarkan koefisien lm

## Menghitung koefisien korelasi
# Pearson'r
cor(df$TDS,df$Uranium, method="pearson")
cor.test(df$TDS,df$Uranium, method="pearson")

# Spearman's rho
cor(df$TDS,df$Uranium, method="spearman")
cor.test(df$TDS,df$Uranium, method="spearman")

#-----------------------------------------------------------------------------------------------
## TDS vs Uranium Berdasarkan Konsentrasi Bicarbonat
#-----------------------------------------------------------------------------------------------

## Visualisasi TDS vs Uranium
plot(df$TDS[df$Bicarbonate==0],df$Uranium[df$Bicarbonate==0],xlab="TDS", ylab="Uranium",
     xlim=c(0,1400),ylim=c(0,15),pch=2,col="red")
points(df$TDS[df$Bicarbonate==1],df$Uranium[df$Bicarbonate==1],pch=1,col="blue")
lm<-lm(df$Uranium[df$Bicarbonate==0]~df$TDS[df$Bicarbonate==0])
lm$coefficients
abline(-3.574852020,0.008154797,col="red") # Garis linier bicarbonate = 0
lm<-lm(df$Uranium[df$Bicarbonate==1]~df$TDS[df$Bicarbonate==1])
lm$coefficients
abline(-5.78240080,0.03002439,col="blue") # Garis linier bicarbonate = 1

## Visualisasi dengan ggplot
ggplot(df,aes(TDS, Uranium, colour=Bicarbonate))+
  geom_point() + 
  geom_smooth(method="lm",se=FALSE)

## Koefisien korelasi
# Pearson'r
cor(df$TDS[df$Bicarbonate==0],df$Uranium[df$Bicarbonate==0],method='pearson')
cor.test(df$TDS[df$Bicarbonate==0],df$Uranium[df$Bicarbonate==0],method='pearson')
cor(df$TDS[df$Bicarbonate==1],df$Uranium[df$Bicarbonate==1],method='pearson')
cor.test(df$TDS[df$Bicarbonate==1],df$Uranium[df$Bicarbonate==1],method='pearson')

# Spearman rho
cor(df$TDS[df$Bicarbonate==0],df$Uranium[df$Bicarbonate==0],method='spearman')
cor.test(df$TDS[df$Bicarbonate==0],df$Uranium[df$Bicarbonate==0],method='spearman')
cor(df$TDS[df$Bicarbonate==1],df$Uranium[df$Bicarbonate==1],method='spearman')
cor.test(df$TDS[df$Bicarbonate==1],df$Uranium[df$Bicarbonate==1],method='spearman')

