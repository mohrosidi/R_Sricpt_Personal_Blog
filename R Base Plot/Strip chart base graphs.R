#################################################################################################
#
# Strip Chart : R Base Graphs
#
#################################################################################################

## Memuat dataset
head(ToothGrowth)
str(ToothGrowth)

#################################################################################################
# Strip Chart : stripchart()
#################################################################################################

## plot len vs dose
stripchart(len ~ dose, data = ToothGrowth,
           pch = 1)

## vertikal plot menggunakan method = jitter
stripchart(len ~ dose, data = ToothGrowth,
           pch = 1, vertical = TRUE,
           method = "jitter")

## Ubah shape dan warna berdasarkan grup
stripchart(len ~ dose, data = ToothGrowth,
           frame = FALSE, # tanpa frame 
           vertical = TRUE, # orientasi plot vertikal
           method = "jitter", # metode ploting titik jitter = nilai + noise
           pch = c(21, 18, 16), # bentuk titik berdasarkan grup
           col = c("#999999", "#E69F00", "#56B4E9"), # warna berdasarkan grup
           main = "Length by dose", xlab = "Dose", ylab = "Length")
