#################################################################################################################
#
# Plot Group Means dan Confidence Interval - R Base Graphs
#
#################################################################################################################

## Memuat dataset
head(ToothGrowth) # mengecek 6 observasi pertama
str(ToothGrowth) # mengecek struktur dataset
attach(ToothGrowth) # menyisipkan dataset pada fungsi selanjutnya

## Membuat plot group means menggunakan paket car 
# Membuat plot group means satu factor
library(car)
plotMeans(response = len, factor1 = factor(dose), # plot len vs dose
          error.bars = "conf.int", # error bar yang digunakan adalah confidence interval
          level=0.95) # Perlu ditentukan jika menggunakan confidence interval 

# Membuat plots group means dua factor
plotMeans(response=len, factor1=factor(dose), factor2=supp, 
          error.bars = "conf.int", # error bar yang digunakan adalah confidence interval
          level=0.95, # Perlu ditentukan jika menggunakan confidence interval 
          legend.pos = "topleft") # lokasi legend
