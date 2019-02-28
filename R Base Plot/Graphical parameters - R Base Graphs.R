###########################################################################################
#
# Graphical Parameters
#
###########################################################################################

###########################################################################################
# Kustomisasi Judul Grafik
###########################################################################################

# Menambahkan judul dan label axis
barplot(c(2,5,7),
        # menambahkan judul
        main = "Judul",
        # menambahkan label axis
        xlab = "x-axis",
        ylab = "y-axis",
        # menambahkan sub judul
        sub = "sub judul")

# Mengubah warna font
barplot(c(2,5,7),
        # menambahkan judul
        main = "Judul",
        # menambahkan label axis
        xlab = "x-axis",
        ylab = "y-axis",
        # menambahkan sub judul
        sub = "sub judul",
        # mengubah warna font
        col.main="red", col.lab="blue", col.sub="black")

# Mengubah font
barplot(c(2,5,7),
        # menambahkan judul
        main = "Judul",
        # menambahkan label axis
        xlab = "x-axis",
        ylab = "y-axis",
        # menambahkan sub judul
        sub = "sub judul",
        # mengubah font
        font.main=4, font.lab=3, font.sub=2)

# Mengubah ukuran font
barplot(c(2,5,7),
        # menambahkan judul
        main = "Judul",
        # menambahkan label axis
        xlab = "x-axis",
        ylab = "y-axis",
        # menambahkan sub judul
        sub = "sub judul",
        # mengubah ukuran font
        cex.main=2, cex.lab=1.7, cex.sub=1)

# Menambahkan keterangan dan setting font menggunakan title()
x<-1:10; y<-x*x
plot(x,y, main = "", xlab="", ylab="",
     col.axis="blue") 
title(main = "Judul", sub = "Sub-judul",
      xlab = "X-axis", ylab = "Y-axis",
      cex.main = 2,   font.main= 4, col.main= "red",
      cex.sub = 0.75, font.sub = 3, col.sub = "green",
      col.lab ="darkblue"
)

# Kustomisasi keterangan grafik menggunakan par()
par(
  # Mengubah warna 
  col.main="red", col.lab="blue", col.sub="black",
  # mengubah font
  font.main=4, font.lab=4, font.sub=4,
  # mengubah ukuran font
  cex.main=2, cex.lab=1.7, cex.sub=1.2
)
barplot(c(2,5), main="Judul",
        xlab="X-axis",
        ylab="Y-axis",
        sub="Sub Judul")

###########################################################################################
# Menambahkan Legend
###########################################################################################

# Membuat data
x<-1:20; y1=x*x; y2=2*y1

# mengeplotkan data
plot(x, y1, type="b", pch=19, col="red", xlab="x", ylab="y")
# menambahkan plot kedua
lines(x, y2, pch=18, col="blue", type="b", lty=2)
# menambahkan legend
legend(1, 400, # kustomisasi posisi legend
       legend=c("Line 1", "Line 2"), # Kustomisasi keterangan legend
       # Kustomisasi tampilan legend
       col=c("red", "blue"), lty=1:2, cex=0.8)

# kKustomisasij Judulff, fontf huruf dan wakrna bacground legend

# membuat fungsi plot
Plot<-function(){
  x<-1:20; y1=x*x; y2=2*y1
  plot(x, y1, type="b", pch=19, col="red", xlab="x", ylab="y")
  lines(x, y2, pch=18, col="blue", type="b", lty=2)

# menambahkan legend
Plot() # memunculkan plot
legend(1, 400, # Kustomisasi posisi legend
       # kustomisasi keterangan legend
       legend=c("Line 1", "Line 2"), 
       # kustomisasi tampilan legend
       col=c("red", "blue"), lty=1:2, cex=0.8, 
       title="Jenis garis", text.font=4, bg='lightblue') 

# kustomisasi border legend
Plot()
# menghilangkan border legend
legend(1, 400, # Kustomisasi posisi legend
       # kustomisasi keterangan legend
       legend=c("Line 1", "Line 2"), 
       # kustomisasi tampilan legend
       col=c("red", "blue"), lty=1:2, cex=0.8, 
       title="Jenis garis", text.font=4, 
       # mengatur tampilan border
       box.lty = 0) 
# mengubah tampilan border
legend(1, 400, # Kustomisasi posisi legend
       # kustomisasi keterangan legend
       legend=c("Line 1", "Line 2"), 
       # kustomisasi tampilan legend
       col=c("red", "blue"), lty=1:2, cex=0.8, 
       title="Jenis garis", text.font=4, 
       # mengatur tampilan border
       box.lty = 2, box.lwd = 2, box.col = "gray")

# spesifikasi posisi legend
X <- 1:10
Y <- 1:10
plot(X,Y, type="n")
# posisi kiri atas, inset =0.05
legend("topleft",
  legend = "(x,y)",
  title = "topleft, inset = .05",
  inset = 0.05)
# posisi atas
legend("top",
       legend = "(x,y)",
       title = "top")
# posisi kanan atas inset = .02
legend("topright",
       legend = "(x,y)",
       title = "topright, inset = .02",
       inset = 0.02)
# posisi kiri
legend("left",
       legend = "(x,y)",
       title = "left")
# posisi tengah
legend("center",
       legend = "(x,y)",
       title = "center")
# posisi kanan
legend("right",
       legend = "(x,y)",
       title = "right")
# posisi kiri bawah
legend("bottomleft",
       legend = "(x,y)",
       title = "bottomleft")
# posisi bawah
legend("bottom",
       legend = "(x,y)",
       title = "bottom")
# posisi kanan bawah
legend("bottomright",
       legend = "(x,y)",
       title = "bottomright")

###########################################################################################
# Menambahkan Teks
###########################################################################################

# menambahkan teks
plot(1:10, 1:10, 
     main="mtext(...) examples\n~~~~~~~~~~~")
mtext("Magic function", side=3)
# menambahkan formula matematika
text(4, 9, expression(hat(beta) == (X^t * X)^{-1} * X^t * y))
text(7, 4, expression(bar(x) == sum(frac(x[i], n), i==1, n)))

###########################################################################################
# Menambahkan abline
###########################################################################################

# menambahkan garis vertikal
# contoh pertama: menambahkan sebuah garis
plot(cars)
abline(v=15, col="blue")
# contoh kedua : menambahkan 2 garis
# merubah warna garis, ukuran dan jenis
plot(cars)
abline(v=c(15,20), col=c("blue", "red"), lty=c(1,2), lwd=c(1, 3))
# contoh ketiga
set.seed(1234); mydata<-rnorm(200)
hist(mydata, col="lightblue")
abline(v = mean(mydata), col="red", lwd=3, lty=2)

# menambhakan garis horizontal
plot(cars)
abline(h=40, col="blue")

# menambahkan garis regresi
par(mgp=c(2,1,0), mar=c(3,3,1,1))
# Fit regression line
require(stats)
reg<-lm(dist ~ speed, data = cars)
coeff=coefficients(reg)
# Persamaan garis regresi
eq = paste0("y = ", round(coeff[2],1), "*x ", round(coeff[1],1))
# plot
plot(cars, main=eq)
abline(reg, col="blue")

###########################################################################################
# Menambahkan axis
###########################################################################################

x<-1:4; y=x*x
# contoh 1
plot(x, y, axes = FALSE)
axis(side=1, at = 1:4, labels=LETTERS[1:4])
axis(2)
# contoh 2
plot(x, y, axes = FALSE)
axis(side=1, at=1:4, labels=LETTERS[1:4])
axis(2)
box() #- Untuk membuatnya seperti plot default
# contoh 3
plot(x, y, pch=18, col="red", type="b",
     frame=FALSE, xaxt="n") # menghilangkan x axis
axis(1, 1:4, LETTERS[1:4], col.axis="blue")
axis(3, col = "darkgreen", lty = 2, lwd = 0.5)
axis(4, col = "violet", col.axis = "dark violet", lwd = 2)

###########################################################################################
# Mengatur Skala axis
###########################################################################################

x<-1:10; y=x*x
# Simple graph
plot(x, y)
# Enlarge the scale
plot(x, y, xlim=c(1,15), ylim=c(1,150))
# Log scale
plot(x, y, log="y")

###########################################################################################
# Mengatur Jenis Point
###########################################################################################

x<-c(2.2, 3, 3.8, 4.5, 7, 8.5, 6.7, 5.5)
y<-c(4, 5.5, 4.5, 9, 11, 15.2, 13.3, 10.5)
# Plot points
plot(x, y)
# Merubah jenis point
plot(x, y, pch = 19)
# Mengubah warna dan ukuran 
plot(x, y, pch=19, col="darkgreen", cex=1.5)
# Color can be a vector
plot(x, y, pch=19, col=c("green", "red"))
# Merubah border, background color dan line width
plot(x, y, pch = 24, cex=2, col="blue", bg="red", lwd=2)

# Menampilkan seluruh jenis point dalam satu plot
generateRPointShapes<-function(){
  oldPar<-par()
  # mengatur parameter font dan margin
  par(font=2, mar=c(0.5,0,0,0))
  # membuat titik berdasarkan jumlah point type di r base
  y=rev(c(rep(1,6),rep(2,5), rep(3,5), rep(4,5), rep(5,5)))
  x=c(rep(1:5,5),6)
  # plot 
  plot(x, y, 
       # jenis titik berdasarkan seluruh point type di r
       pch = 0:25, 
       # mengatur ukuran titik
       cex=1.5, 
       # Spesifikasi rentang axis
       ylim=c(1,5.5), xlim=c(1,6.5), 
       # tidak menampilkan garis dan label axis
       axes=FALSE, xlab="", ylab="", 
       # mengubah bacground titik yang dapat diubah backgroundnya
       bg="blue")
  # menambahkan text berdasarkan kode point type
  text(x, y, labels=0:25, pos=3)
  # mengatur parameter grafik
  par(mar=oldPar$mar,font=oldPar$font )
}
generateRPointShapes()

###########################################################################################
# Mengatur Warna Pada Plot
###########################################################################################

# Generate a plot of color names which R knows about.
#++++++++++++++++++++++++++++++++++++++++++++
# cl : a vector of colors to plots
# bg: background of the plot
# rot: text rotation angle
#usage=showCols(bg="gray33")
showCols <- function(cl=colors(), bg = "grey",
                     cex = 0.75, rot = 30) {
  m <- ceiling(sqrt(n <-length(cl)))
  length(cl) <- m*m; cm <- matrix(cl, m)
  require("grid")
  grid.newpage(); vp <- viewport(w = .92, h = .92)
  grid.rect(gp=gpar(fill=bg))
  grid.text(cm, x = col(cm)/m, y = rev(row(cm))/m, rot = rot,
            vp=vp, gp=gpar(cex = cex, col = cm))
}

# 60 nama warna pertama
showCols(bg="gray20",cl=colors()[1:60], rot=30, cex=0.9)
# Barplot menggunakan nama warna
barplot(c(2,5), col=c("chartreuse", "blue4"))
# Barplot menggunakan hexadecimal color code
barplot(c(2,5), col=c("#009999", "#0000FF"))

# menggunakan RColorBrewer
library("RColorBrewer")
display.brewer.all()
# Barplot menggunakan RColorBrewer
barplot(c(2,5,7), col=brewer.pal(n = 3, name = "RdBu"))

# Menggunakan Wes Anderson Color Palettes
# Install
install.packages("wesanderson")
# Load
library(wesanderson)
# simple barplot
barplot(c(2,5,7), col=wes_palette(n=3, name="GrandBudapest1"))

