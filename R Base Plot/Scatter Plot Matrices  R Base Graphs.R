#################################################################################################
#
# Scatter Plot Matrices - R Base Graphs 
#
#################################################################################################

## Memuat dataset
head(mtcars)
str(mtcars)

#################################################################################################
# R base scatter plot matrices: pairs()
#################################################################################################

## Basic Scatterplot matrices
pairs(~mpg+disp+drat+wt,data=mtcars, 
      main="Simple Scatterplot Matrices")

## Menampilkan hanya panel atas
pairs(~mpg+disp+drat+wt,data=mtcars, 
      lower.panel = NULL,
      main="Simple Scatterplot Matrices")

## Warna berdasarkan grup
mtcars$cyl<-as.factor(mtcars$cyl) # menjadikan variabel cyl sebagai factor
my_cols <- c("#00AFBB", "#E7B800", "#FC4E07") # menentukan warna titik  
pairs(~mpg+disp+drat+wt,data=mtcars,
      col = my_cols[mtcars$cyl], # warna titik berdasarkan variabel cyl
      lower.panel=NULL) # hanya menampilkan panel atas

## Tambahkan koefisien korelasi pada panel bawah

# Panel koefisien korelasi Pearson
panel.cor <- function(x, y){
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- round(cor(x, y), digits=2)
  txt <- paste0("R = ", r)
  cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}

# kustomisasi panel atas
upper.panel<-function(x, y){
  points(x,y, col = my_cols[mtcars$cyl])
}

# correlation matrices plot
pairs(~mpg+disp+drat+wt,data=mtcars, 
      lower.panel = panel.cor,
      upper.panel = upper.panel)

## Menambahkan koefisien korelasi Pearson pada panel scatterplot

# Kustomisasi panel atas
upper.panel<-function(x, y){
  points(x,y, col=c("#00AFBB", "#E7B800", "#FC4E07")[mtcars$cyl])
  r <- round(cor(x, y), digits=2) 
  txt <- paste0("R = ", r)
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  text(0.5, 0.9, txt)
}
pairs(~mpg+disp+drat+wt,data=mtcars,
      lower.panel = NULL, 
      upper.panel = upper.panel)

#################################################################################################
# R base scatter plot matrices: psych::pairs.panels()
#################################################################################################

library(psych)
pairs.panels(mtcars[,c(1,3,5,6)], 
             method = "pearson", # correlation method
             hist.col = "grey",
             density = TRUE,  # show density plots
             ellipses = TRUE # show correlation ellipses
)

#################################################################################################
# R base scatter plot matrices: car::scatterplot.matrix()
#################################################################################################

library(car)
scatterplotMatrix(~mpg+disp+drat+wt, data=mtcars,
                  main="Matriks Korelasi",
                  smooth = FALSE)

#################################################################################################
# R base scatter plot matrices: gclus::cpairs()
#################################################################################################

install.packages('gclus')
library(gclus)
dta <- mtcars[c(1,3,5,6)] # menentukan variabel yang akan diplotkan
dta.r <- abs(cor(dta)) # Menghitung koefisien korelasi absolut
dta.col <- dmat.color(dta.r) # menentukan warna
# mengurutkan variabel berdasarkan nilai korelasi (semakin besar, semakin dekat diagonal)
dta.o <- order.single(dta.r) 
cpairs(dta, dta.o, panel.colors=dta.col, gap=.5,
       main="Matrix korelasi" )
