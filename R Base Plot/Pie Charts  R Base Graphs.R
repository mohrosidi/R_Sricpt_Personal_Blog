#################################################################################################
#
# Pie Charts - R Base Graphs
#
#################################################################################################

## Membuat vektor data
# nilai vektor slice
slices <- c(10, 12, 4, 16, 8)
slices
# Vektor label slice
lbls <- c("US", "UK", "Australia", "Germany", "France")
lbls
# menghitung persentase masing-masing nilai slice
pct <- round(slices/sum(slices)*100)
pct
# menambahkan persentase pada vektor lbls
lbls <- paste(lbls, pct, sep = " ")
lbls <- paste(lbls,"%", sep = "")
lbls

## Membuat pie chart
# membuat pie chart
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries") 

## Membuat 3D Exploded Pie Chart
library(plotrix)
pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Countries ")
