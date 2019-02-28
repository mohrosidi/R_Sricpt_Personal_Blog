#################################################################################################
#
# Bar Plots - R Base Graphs
#
#################################################################################################

## memuat dataset
head(VADeaths)
str(VADeaths)
rownames(VADeaths)

## Subset
R_Male <- VADeaths[, # Seluruh baris
                   "Rural Male"] # hanya kolom 1
# atau
R_Male <- VADeaths[, # Seluruh baris
                   1] # hanya kolom 1

#################################################################################################
#
# Bar Plots - barplot()
#
#################################################################################################

## Basic Bar plot
barplot(R_Male)

# Orientasi Horizontal
barplot(R_Male,
        horiz = TRUE) # orientasi horizontal

## Ubah nama grup
barplot(R_Male,
        names.arg = c("A","B","C","D","E"))

## Ubah warna border dan bar
# Ubah warna border dan bar 
barplot(R_Male,
        col = "white", # warna bar
        border = "steelblue") # warna border
# Ubah warna border dan bar berdasarkan grup
barplot(R_Male, 
        col = "white",
        border = c("#999999", "#E69F00", "#56B4E9","#00008B","#00468B"))
# Ubah warna bar
barplot(R_Male, col = "steelblue")
# Ubah warna bar berdasarkan grup
barplot(R_Male, col = c("#999999", "#E69F00", "#56B4E9","#00008B","#00468B"))

## Ubah judul dan keterangan axis
barplot(R_Male,
        main = " Death Rates in Virginia",
        xlab = "Age",
        ylab = "Rate")

## Stacked bar plot
barplot(VADeaths,
        col = c("lightblue", "mistyrose", "lightcyan", 
                "lavender", "cornsilk"),
        legend = rownames(VADeaths))

## Grouped bar plot
barplot(VADeaths,
        col = c("lightblue", "mistyrose", "lightcyan", 
                "lavender", "cornsilk"),
        legend = rownames(VADeaths), beside = TRUE)

# ubah posisi legend
# menentukan set warna pada bar
my_colors <- c("lightblue", "mistyrose", "lightcyan", 
               "lavender", "cornsilk")
# Bar plot
barplot(VADeaths, col = my_colors, beside = TRUE)
# menambahkan legend
legend("topleft", legend = rownames(VADeaths), 
       fill = my_colors, 
       box.lty = 0, # remove box around the legend
       cex = 0.8) # legend text size
