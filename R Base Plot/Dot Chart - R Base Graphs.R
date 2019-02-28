#################################################################################################################
#
# Dot Chart - R Base Graphs
#
#################################################################################################################

## Memuat dataset
head(mtcars)
str(mtcars)
attach(mtcars)
mtcars <- mtcars[order(mtcars$mpg), ] # Mengurutkan data dari nilai mpg terbesar

## Dot Chart
dotchart(mtcars$mpg, labels = row.names(mtcars),
         cex = 0.6, xlab = "mpg")


## Dot Chart Multiple Group
grps <- as.factor(mtcars$cyl) # mengubah cyl menjadi factor
my_cols <- c("#999999", "#E69F00", "#56B4E9") # menentukan warna
dotchart(mtcars$mpg, labels = row.names(mtcars),
         groups = grps, gcolor = my_cols,
         color = my_cols[grps],
         cex = 0.6,  pch = 19, xlab = "mpg")
