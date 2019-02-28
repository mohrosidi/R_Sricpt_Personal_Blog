#################################################################################################
#
# Box Plot - R Base Graphs
#
#################################################################################################

## Memuat dataset
head(ToothGrowth)
str(ToothGrowth)

#################################################################################################
# Box Plot : boxplot()
#################################################################################################

## Basic Box plot
# Box plot variabel tunggal
boxplot(ToothGrowth$len)
# Box plot berdasarkan grup (dose)
# remove frame
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE)
# Horizontal box plots
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        horizontal = TRUE)
# Notched box plots
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        notch = TRUE)

## Ubah nama grup pada axis
boxplot(len ~ dose, data = ToothGrowth,
        notch = TRUE,
        names = c("D0.5", "D1", "D2"))

## Ubah warna boxplot
# Ubah warna border menggunakan satu jenis warna
boxplot(len ~ dose, data = ToothGrowth,
        notch = TRUE,
        border = "steelblue")
# Ubah warna border berdasarkan grup
boxplot(len ~ dose, data = ToothGrowth,
        notch = TRUE,
        border = c("#999999", "#E69F00", "#56B4E9"))
# Ubah warna di dalam box plot 
boxplot(len ~ dose, data = ToothGrowth, 
        notch = TRUE,
        col = "steelblue")
# Ubah warna di dalam box plot berdasarkan grup
boxplot(len ~ dose, data = ToothGrowth,
        notch = TRUE,
        col = c("#999999", "#E69F00", "#56B4E9"))

## Box plot dengan multiple groups
boxplot(len ~ supp*dose, data = ToothGrowth,
        col = c("white", "steelblue"))

## Tambahkan error bar
rb <- boxplot(len ~ supp, data = ToothGrowth, col = "bisque")

mn.t <- tapply(ToothGrowth$len, ToothGrowth$supp, mean) # Menghitung rata-rata berdasarkan grup
sd.t <- tapply(ToothGrowth$len, ToothGrowth$supp, sd) # Menghitung standar deviasi
xi <- 0.3 + seq(rb$n)
points(xi, mn.t, col = "orange", pch = 18)
arrows(xi, mn.t-sd.t, xi, mn.t+sd.t,
       code = 3, col = "red", angle = 75, length = .1)

## Ubah judul dan keterangan axis
boxplot(len ~ dose, data = ToothGrowth,
        notch = TRUE,
        col = c("#999999", "#E69F00", "#56B4E9"),
        main = "Box plot berdasarkan grup dose",
        xlab = "Dose",
        ylab = "Length")

#################################################################################################
# Box Plot : gplot::boxplot2()
#################################################################################################
install.packages("gplots")
library(gplots)
boxplot2(len ~ dose, data = ToothGrowth,
         frame = TRUE, top = TRUE,
         notch = TRUE,
         col = c("#999999", "#E69F00", "#56B4E9"),
         main = "Box plot berdasarkan grup dose",
         xlab = "Dose",
         ylab = "Length")
