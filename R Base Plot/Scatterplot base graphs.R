#################################################################################################
#
# Visualisasi Data | Scatterplot Base Graphs
#
#################################################################################################

# install.packages('gapminder')
library(gapminder)
head(gapminder) # melihat 6 observasi awal
str(gapminder) # melihat struktur dataset
attach(gapminder) # menyisipkan dataset pada program


#################################################################################################
# R Base
#################################################################################################

# plot()
plot(lifeExp~gdpPercap, # menetukan variabel sumbu x dan ya
     main= "gdpPercap vs Life Expectacy", # Memberi judul grafik
     xlab = "gdpPercap", ylab="Life Expectacy", # memberi label axis
     pch = 1, # menentukan jenis point
     frame = FALSE # Grafik tidak memiliki frame
     )

# atau bisa juga ditulis
plot(gdpPercap,lifeExp, # menetukan variabel sumbu x dan ya
     main= "gdpPercap vs Life Expectacy", # Memberi judul grafik
     xlab = "gdpPercap", ylab="Life Expectacy", # memberi label axis
     pch = 1, # menentukan jenis point
     frame = FALSE # Grafik tidak memiliki frame
     )

# menambahkan garis regresi
abline(lm(lifeExp~gdpPercap), # menuliskan fungsi regresi linier
       col="red" # menentukan warna garis regresi
       )

# menambahkan garis loess
lines(lowess(lifeExp~gdpPercap), # menuliskan fungsi loess
      col="blue" # menentukan warna garis
      )

# Menambahkan warna berdasarkan grup
mycol <- c(Asia = "tomato", Europe = "chocolate4", Africa = "dodgerblue2", 
           Americas = "darkgoldenrod1", Oceania = "green4") # Menentukan warna tiap grup
plot(lifeExp ~ gdpPercap, # menentukan sumbu x dan sumbu y 
     col = mycol[continent], # Warna berdasarkan benua
     main= "gdpPercap vs Life Expectacy", # Memberi judul grafik
     xlab = "gdpPercap", ylab="Life Expectacy", # memberi label axis
     pch = 1 # menentukan jenis point
     )

# Mengubah ukuran point berdasarkan variabel kontinyu
mycex <- function(var, r, f = sqrt){
  x = f(var)
  x_scaled = (x - min(x))/(max(x) - min(x))
  r[1] + x_scaled * (r[2] - r[1])
} # membuat fungsi normalisasi terhadap populasi

plot(lifeExp ~ gdpPercap, # sumbu x dan sumbu y
     col = mycol[continent],
     cex = mycex(pop, r = c(0.2, 10))
)

# menambahkan garis regresi berdasarkan grup
install.packages('plyr') # install plyr
library(plyr) # memuat paket

plot(lifeExp ~ gdpPercap, # menentukan sumbu x dan sumbu y 
     col = mycol[continent], # Warna berdasarkan benua
     main= "gdpPercap vs Life Expectacy", # Memberi judul grafik
     xlab = "gdpPercap", ylab="Life Expectacy", # memberi label axis
     pch = 1 # menentukan jenis point
)

d_ply(gapminder, .(continent), function(d){
  trend <- lm(lifeExp ~ gdpPercap, data = d)
  abline(trend, col = mycol[d$continent[1]])
})

#################################################################################################
# Enhanced scatter plots
#################################################################################################

## car::scatterplot()
# memuat paket
install.packages('car') # install paket car
library(car)

# Plot dengan fungsi scatterplot()
scatterplot(lifeExp~gdpPercap)


# menghilangkan smoother
scatterplot(lifeExp~gdpPercap,
            smooth = FALSE) # menghilangkan smoother

# scatterplot berdasarkan grup
scatterplot(lifeExp~gdpPercap | continent, # menentukan fungsi dan grup 
            smooth = FALSE) # tanpa smoother


#################################################################################################
# Scatterplot 3D
#################################################################################################

## Scatterplot3D
# memuat dataset
head(iris)
str(iris)

# install.packages('scatterplot3d')
library(scatterplot3d)

# Siapkan data
x <- iris$Sepal.Length
y <- iris$Sepal.Width
z <- iris$Petal.Length
grps <- as.factor(iris$Species)
scatterplot3d(x,y,z, # menentukan sumbu x,y, z
              pch=1)

# Ubah angle
scatterplot3d(x,y,z, # menentukan sumbu x,y, z
              pch=1, angle = 45)

# Ubah judul dan axis
scatterplot3d(x,y,z, # menentukan sumbu x,y, z
              pch=1,
              main= " Scatterplot 3D", # ubah judul
              xlab= 'Sepal lenght',
              ylab= "Sepal width",
              zlab= " Petal lenght")

# ubah shape berdasarkan grup
shapes = c(16,17,18)
shapes <- shapes[as.numeric(iris$Species)]
scatterplot3d(x,y,z, # menentukan sumbu x,y, z
              pch= shapes,
              main= " Scatterplot 3D", # ubah judul
              xlab= 'Sepal lenght',
              ylab= "Sepal width",
              zlab= " Petal lenght")

# Ubah warna berdasarkan grup
colors = c("#999999", "#E69F00", "#56B4E9")
colors <- colors[as.numeric(iris$Species)]
scatterplot3d(x,y,z, # menentukan sumbu x,y, z
              pch=1, # jenis point 
              color=colors # grup berdasarkan benua
              main= " Scatterplot 3D", # ubah judul
              xlab= 'Sepal lenght',
              ylab= "Sepal width",
              zlab= " Petal lenght")

# ubah shape dan warna berdasarkan grup
shapes = c(16,17,18)
shapes <- shapes[as.numeric(df$continent)]
colors = c('red','blue','grey','green','black')
colors <- colors[as.numeric(df$continent)]
scatterplot3d(pop, gdpPercap, lifeExp, # menentukan sumbu x,y, z
              pch=shapes, # jenis point 
              color=colors # grup berdasarkan benua
              )

# tambahkan bar 
colors = c("#999999","#E69F00","#56B4E9")
colors <- colors[as.numeric(iris$Species)]
scatterplot3d(iris[,1:3], pch = 16, type="h", 
              color=colors)

# tambah legend
s3d <- scatterplot3d(iris[,1:3], pch = 16, color=colors) # menjadikan plot sebagai object
legend(s3d$xyz.convert(7.5, 3, 4.5), legend = levels(iris$Species),
       col =  c("#999999", "#E69F00", "#56B4E9"), pch = 16)

# memindahkan legend di kiri
s3d <- scatterplot3d(iris[,1:3], pch = 16, color=colors)
legend("right", legend = levels(iris$Species),
       col =  c("#999999", "#E69F00", "#56B4E9"), pch = 16)

# memindahkan legend dibawah
s3d <- scatterplot3d(iris[,1:3], pch = 16, color=colors)
legend("bottom", legend = levels(iris$Species),
       col =  c("#999999", "#E69F00", "#56B4E9"), pch = 16)

# kustomisasi posisi legend
shapes = c(16,17,18)
shapes <- shapes[as.numeric(iris$Species)]
s3d <- scatterplot3d(iris[,1:3], pch = shapes)
legend("bottom", legend = levels(iris$Species),
       pch = c(16, 17, 18), 
       inset = -0.25, xpd = TRUE, horiz = TRUE)

# tambahkan point label
scatterplot3d(iris[,1:3], pch = 16, color=colors)
text(s3d$xyz.convert(iris[, 1:3]), labels = rownames(iris),
     cex= 0.7, col = "steelblue")

## menammbahkan regression plane
data(trees)
head(trees)
str(trees)

s3d <- scatterplot3d(trees, type = "h", color = "blue",
                     angle=55, pch = 16)
my.lm <- lm(trees$Volume ~ trees$Girth + trees$Height)
s3d$plane3d(my.lm)

# Tambahkan point tambahan pada regression plane
s3d$points3d(seq(10, 20, 2), seq(85, 60, -5), seq(60, 10, -10),
             col = "red", type = "h", pch = 8)


# Spinning 3d Scatterplot
library(rgl)
plot3d(trees, col="red", size=3) 
