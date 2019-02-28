#################################################################################################################
#
# Dot Chart - R Base Graphs
#
#################################################################################################################

## Memuat dataset
head(mtcars)
str(mtcars)
attach(mtcars)

## Dot Chart
dotchart(mtcars$mpg, labels = row.names(mtcars),
         cex = 0.6, xlab = "mpg")

