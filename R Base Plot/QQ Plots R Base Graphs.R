#################################################################################################################
#
# QQ-Plots : R Base Graphs
#
#################################################################################################################

## Memuat dataset
head(iris) # mengecek 6 observasi pertama
str(iris) # mengecek struktur dataset
attach(iris) # menyisipkan dataset pada fungsi selanjutnya

## Membuat QQ Plots: qqnorm() dan qqline()
qqnorm(Sepal.Length, pch = 1) # membuat normal qq plot
qqline(Sepal.Length, col="red", lwd = 2) # menambahkan garis referensi

## Membuat QQ Plots : car::qqPlot()
library(car)
qqPlot(Sepal.Length)
