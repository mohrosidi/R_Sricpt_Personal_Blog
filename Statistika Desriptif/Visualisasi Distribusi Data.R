## Memuat Paket
library(tidyverse)

## Memuat dataset
df <- mtcars
?mtcars

## Cek dataset
head(df) # cek 6 observasi pertaman
tail(df) # cek 6 observasi terakhir
str(df) # cek struktur dataset
summary(df) # ringkasan deskriptif data
attach(df)
unique(cyl) # Cek unique number pada variabel
unique(vs) # Cek unique number pada variabel
unique(gear) # Cek unique number pada variabel
unique(am) # Cek unique number pada variabel



## Visualisasi data

## Steam and Leaf
stem(df$wt)



## Histogram

## Base plot
# 1. Distribusi berat
hist(df$wt, main="Distribusi Berat Kendaraan", xlab="Berat Kendaraan", 
     xlim=c(0,7),ylim=c(0,10)) # histogram variabel wt

# 2. Density plot
d<-density(df$wt)
plot(d,  xlab="Berat Kendaraan", main="Distribusi berat mobil")

# 3. Frequency Polygon dan Histogram
h = hist(df$wt, main="Distribusi Berat Kendaraan", xlab="Berat Kendaraan", 
     xlim=c(0,7),ylim=c(0,10)) # object histogram variabel wt
h

mp = c(min(h$mids) - (h$mids[2] - h$mids[1]), h$mids, max(h$mids) + 
         (h$mids[2] - h$mids[1])) # Buat koordinat x,y dari variabel counts dan mids
mp

freq = c(0, h$counts, 0) # Buat object frequency
freq

lines(mp, freq,type="b",pch=20,col="blue",lwd=2,xlim=c(0,7),
      ylim=c(0,10)) # menambahkan frequency polygon dengan line width 2

# 4. Density plot overlay histogram
hist(df$wt, main="Distribusi Berat Kendaraan", xlab="Berat Kendaraan", 
     xlim=c(0,7),ylim=c(0,1),prob=TRUE) # histogram variabel wt
lines(density(df$wt), col="red",lwd=2) # Menambahkan density

# 5. Menambahkan garis mean pada histogram
hist(df$wt, main="Distribusi Berat Kendaraan", xlab="Berat Kendaraan", 
     xlim=c(0,7),ylim=c(0,10)) # histogram variabel wt
mean=mean(df$wt)
abline(v=mean, col="red",lwd=2)

## Histogram dan Density plot dengan multiple group

# 1. Histogram wt vs cyl
par(mfrow=c(3,1))
hist(df$wt[df$cyl==4], xlim=c(1,10), col="blue", main="Silinder 4", 
     xlab="berat x 1000 lbs ") # silinder 4
hist(df$wt[df$cyl==6], xlim=c(1,10), col="red", main="Silinder 6", 
     xlab="berat x 1000 lbs ")  # silinder 6
hist(df$wt[df$cyl==8], xlim=c(1,10), col="green", main="Silinder 8", 
     xlab="berat x 1000 lbs ") # silinder 8


# 2. Density plot wt vs cyl
par(mfrow=c(3,1))
d<-density(df$wt[df$cyl==4])
plot(d, xlim=c(1,10), ylim=c(0,1.5), col="blue",main="Silinder 4", 
            xlab="berat x 1000 lbs ") # silinder 4
d<-density(df$wt[df$cyl==6])
plot(d, xlim=c(1,10), ylim=c(0,1.5), col="red",main="Silinder 6",  
            xlab="berat x 1000 lbs ") # silinder 6
d<-density(df$wt[df$cyl==8])
plot(d, xlim=c(1,10), ylim=c(0,1.5), col="green",main="Silinder 8",  
            xlab="berat x 1000 lbs ") # silinder 8


# ggplot
# 1. Basic Histogram
range(df$wt)
ggplot(df, aes(x=wt)) + geom_histogram() # Basic Histogram
ggplot(df, aes(x=wt)) + geom_histogram(binwidth = .5) # Basic Histogram dengan binwidth 0.5
qplot(df$wt, binwidth=.5) # Metode lain dengan hasil yang sama

# 2.plot dengan ouline hitam dengan warna bar putih
ggplot(df, aes(x=wt)) +
  geom_histogram(binwidth = .5, colour="black", fill="white")

# 3. Histogram dengan density plot
ggplot(df, aes(x=wt)) +
  geom_histogram(aes(y=..density..), # histogram dengan density pada sumbu y
                 binwidth = .5,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="red") # Overlay dengan density plot transparan

# 4. Density plot
ggplot(df, aes(x=wt)) + # Density plot
  geom_density(fill='red',alpha=.5)

# 5. Frequency Polygon
ggplot(df, aes(x=wt)) +
  geom_histogram(binwidth = .5, colour="black", fill="white") +
  geom_freqpoly(binwidth = .5, colour="red") # Overlay dengan frequency polygon

# 6. Frequency Polygon  
ggplot(df, aes(x=wt)) +
  geom_freqpoly(binwidth = .5, colour="red")

# 7. Menambahkan garis mean dan median pada histogram
ggplot(df, aes(x=wt)) +
  geom_histogram(binwidth = .5, colour="black", fill="white") +
  geom_vline(aes(xintercept=mean(wt,na.rm=TRUE)), # Abaikan Na
             color="red",linetype="dashed", size=1)+
  geom_vline(aes(xintercept=median(wt)),
             color="blue",linetype="dashed", size=1)

## Histogram dan Density plot dengan multiple group

# 1. Overlaid Histogram
ggplot(df, aes(x=wt, fill=factor(cyl)))+
  geom_histogram(binwidth = .5, alpha=.4, position="identity")

# 2. Interleaved histogram
ggplot(df, aes(x=wt, fill=factor(cyl)))+
  geom_histogram(binwidth = .5, alpha=.4, position="dodge")

# 3. Density plots
ggplot(df,aes(x=wt,colour=factor(cyl)))+
  geom_density()

# 4. Density plot semi transparan
ggplot(df,aes(x=wt,fill=factor(cyl)))+
  geom_density(alpha=.3)

# 5. Menambahkan garis mean pada masing-masing density plot
wt.mean <- df %>%
  group_by(cyl) %>%
  summarise(mean=mean(wt))
wt.mean<-as.data.frame(wt.mean)
wt.mean

ggplot(df,aes(x=wt,fill=factor(cyl)))+
  geom_density(alpha=.3) +
  geom_vline(data=wt.mean, aes(xintercept=mean, colour=factor(cyl)),
             linetype="dashed",size=1)
                   
# 6. Menambahkan garis mean pada masing-masing histogram
wt.mean <- df %>%
  group_by(cyl) %>%
  summarise(mean=mean(wt))
wt.mean<-as.data.frame(wt.mean)
wt.mean

ggplot(df,aes(x=wt,fill=factor(cyl)))+
  geom_histogram(alpha=.3,binwidth=.5,position = "identity") +
  geom_vline(data=wt.mean, aes(xintercept=mean, colour=factor(cyl)),
             linetype="dashed",size=1)

# 7. Facet wrap histogram
ggplot(df, aes(x=wt, fill=factor(cyl)))+
  geom_histogram(binwidth = .5, alpha=.4, position="identity")+
  facet_grid(factor(cyl)~.)


## Boxplot

# Base plot
# 1. Standard boxplot
boxplot(df$wt, data=df,ylab="Berat Mobil",
        main="standard boxplot") # boxplot distribusi data wt

# 2. Simple boxplot
data<-t(data.frame(
  x=1,
  y0 = min(df$wt),
  y25 = quantile(df$wt,0.25),
  y50 = quantile(df$wt,0.5),
  y75 = quantile(df$wt,0.75),
  y100 = max(df$wt)
)) # membuat dataframe 
data

boxplot(data,ylab="Berat Mobil", main="Simple boxplot")

# 3. truncated boxplot
data<-t(data.frame(
  x=1,
  y0 = min(df$wt),
  y25 = quantile(df$wt,0.25),
  y50 = quantile(df$wt,0.5),
  y75 = quantile(df$wt,0.75),
  y100 = quantile(df$wt,0.9)
))

data
boxplot(data, ylab="Berat Mobil", main="Truncated boxplot")

# Menambahkan titik mean pada boxplot
mean<-mean(df$wt) # menghitung berat rata-rata
boxplot(df$wt,ylab="Berat Mobil") # membuat standard boxplot
points(y=mean,x=1,pch=5,col="red") # menambahkan titik nilai rata-rata


# Boxplot wt vs cyl
boxplot(wt~cyl,data=df, xlab="Jumlah Silinder",
        ylab="Berat Mobil") # Boxplot wt vs cyl

# Menambahkan titik mean dan CI
b<-boxplot(wt~cyl,data=df, xlab="Jumlah Silinder",
        ylab="Berat Mobil") # Boxplot wt vs cyl
sum<-df%>%
  group_by(cyl)%>%
  summarise(mean=mean(wt),sd=sd(wt),n=n()) %>%
  mutate(se=sd/sqrt(n)) # menghitung nilai mean dan CI berdasarkan grup data

sum <-as.data.frame(sum) # Mengubah tible menjadi data frame

mean <- t(sum[,2])
CI<-t(sum[,5]*1.96) # rentang keyakinan 95%
x <- 0.3+seq(b$n)
points(x,mean,pch=5) # Menambahkan titik nilai rata-rat
arrows(x,mean-CI,x,mean+CI,
       code=3,col="red",angle=90) # Menambahkan error bar

# Kelompokkan berdasarkan jenis transmisi
par(mfrow=c(1,2))

m<-df %>%
  filter(am==0)%>%
  group_by(cyl)%>%
  summarise(wt=mean(wt))
m<- as.data.frame(m)
b<-boxplot(df$wt[df$am==0]~df$cyl[df$am==0],data=df, xlab="Jumlah Silinder",
        ylab="Berat Mobil",main="transmisi otomatis",ylim=c(0,5.5)) # Boxplot wt vs cyl
mean<-t(m[,2])
x<-seq(b$n)
points(x,mean,pch=5,col="blue")

m<-df %>%
  filter(am==1)%>%
  group_by(cyl)%>%
  summarise(wt=mean(wt))
b<-boxplot(df$wt[df$am==1]~df$cyl[df$am==1],data=df, xlab="Jumlah Silinder",
        ylab="Berat Mobil",main="transmisi manual",ylim=c(0,5.5)) # Boxplot wt vs cyl
mean<-t(m[,2])
x<-seq(b$n)
points(x,mean,pch=5,col="red")

## ggplot
# Simple Boxplot
data<-data.frame(
  x=1,
  y0 = min(df$wt),
  y25 = quantile(df$wt,0.25),
  y50 = quantile(df$wt,0.5),
  y75 = quantile(df$wt,0.75),
  y100 = max(df$wt)
)

ggplot(data, aes(x)) +
  geom_boxplot(aes(ymin = y0, lower = y25, middle = y50, upper = y75, ymax = y100),
    stat = "identity") +
  labs(y="Berat Kendaraan",x="")

# Truncated Boxplot (0-90%)
data<-data.frame(
  x=1,
  y0 = min(df$wt),
  y25 = quantile(df$wt,0.25),
  y50 = quantile(df$wt,0.5),
  y75 = quantile(df$wt,0.75),
  y100 = quantile(df$wt,0.9)
)

ggplot(data, aes(x)) +
  geom_boxplot(aes(ymin = y0, lower = y25, middle = y50, upper = y75, ymax = y100),
               stat = "identity")+
  labs(y="Berat Kendaraan",x="")

# Standard Boxplot
# Basic boxplot
ggplot(df,aes(x=1,y=wt)) + 
  geom_boxplot( ) +
  labs(y="Berat Kendaraan",x="") # Boxplot wt
  
# 1. Basic boxplot
ggplot(df,aes(x=factor(cyl),y=wt))+
  geom_boxplot() # Boxplot wt vs cyl


# 2. Basic boxplot dengan warna berdasarkan grup
ggplot(df,aes(x=factor(cyl),y=wt, fill=factor(cyl)))+
  geom_boxplot() # Boxplot wt vs cyl

# 3. Boxplot tanpa legend
ggplot(df,aes(x=factor(cyl),y=wt, fill=factor(cyl)))+
  geom_boxplot() + # Boxplot wt vs cyl
  guides(fill=FALSE) # Legend tidak disertakan

# 4. Boxplot dengan axis dibalik
ggplot(df,aes(x=factor(cyl),y=wt, fill=factor(cyl)))+
  geom_boxplot() + # Boxplot wt vs cyl
  guides(fill=FALSE) + # Legend tidak disertakan
  coord_flip()

# 5. Tambahkan mean pada boxplot
ggplot(df,aes(x=factor(cyl),y=wt,fill=factor(cyl)))+
  geom_boxplot() + # Boxplot wt vs cyl
  stat_summary(fun.y='mean', geom="point", shape=5, size=2)

# 6. Tambahkan mean dan errorbar pada boxplot
ggplot(df,aes(x=factor(cyl),y=wt,fill=factor(cyl)))+
  geom_boxplot() + # Boxplot wt vs cyl
  stat_summary(fun.data='mean_cl_boot',size=0.5, colour="red")
              
# 7. Boxplot wt vs cyl vs am
ggplot(df,aes(x=factor(cyl),y=wt, fill=factor(cyl)))+
  geom_boxplot()+ # Boxplot wt vs cyl
  facet_wrap(am~.) # Kelompokkan berdasarkan jenis transmisi

## Dot plot
# 1. Basic dot plot
ggplot(df, aes(x=wt)) +
  geom_dotplot(binwidth = .5,dotsize = 0.5)


# 2. grup berdasarkan cyl
ggplot(df, aes(x=wt, fill=factor(cyl))) +
  geom_dotplot(binwidth = .5, position="identity", dotsize = 0.5)


## Bonus
# kita ingin mengetahui mobil ada yang palin hemat dari observasi tersebut
# plot menggunakan dotplot
df1 <- mtcars[order(mtcars$mpg),] # sort by mpg
df1$cyl <- factor(df1$cyl) # it must be a factor
df1$color[df1$cyl==4] <- "red"
df1$color[df1$cyl==6] <- "blue"
df1$color[df1$cyl==8] <- "darkgreen"

# Base packages
dotchart(df1$mpg,labels=row.names(df1),cex=.7,groups= df1$cyl,
         main="Gas Milage for Car Models\ngrouped by cylinder",
         xlab="Miles Per Gallon", gcolor="black", color=df1$color) 

