#################################################################################################
#
# Historam dan Density Plot - R Base Graphs
#
#################################################################################################

## Memuat dataset
df<-mtcars
head(df)
str(df)

## Simple histogram
hist(df$mpg, # menentukan variabel
     xlab = "mpg",# menentukan keterangan sumbu x
     main = "Histogram")

## Simple histogram dengan warna dan bin custom
hist(df$mpg, # menentukan variabel
     xlab = "mpg",# menentukan keterangan sumbu x
     main = "Histogram", # menentukan judul grafik
     breaks = 12, # menentukan jumlah bin
     col="red")

## Histogram dengan kurva distribusi normal
x <- mtcars$mpg 
h<-hist(x, breaks=10, col="red", xlab="Miles Per Gallon", 
        main="Histogram dengan Kurva Normal") 
# menentukan parameter kurva normal
xfit<-seq(min(x),max(x),length=40) # parameter sumbu x
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) # parameter sumbu y
yfit <- yfit*diff(h$mids[1:2])*length(x) 
lines(xfit, yfit, col="blue", lwd=2) # menambahkan garis kurva normal 

## Density plot
d <- density(mtcars$mpg) # menghitung densitas data
plot(d) # plot hasil

## Density plot dengan fill custom
d <- density(mtcars$mpg)
plot(d, main="Density Plot MPG")
polygon(d, col="red", border="blue")

## Density plot berdasarkan grup
library(sm)
attach(mtcars)

# Membuat label pada factor
cyl.f <- factor(cyl, levels= c(4,6,8),
                labels = c("4 cylinder", "6 cylinder", "8 cylinder")) 

# plot densitas
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
title(main="Distribusi MPG Berdasarkan Cyl")

# Menambahkan legend via mouse click
colfill<-c(2:(2+length(levels(cyl.f)))) 
legend(locator(1), levels(cyl.f), fill=colfill) 
