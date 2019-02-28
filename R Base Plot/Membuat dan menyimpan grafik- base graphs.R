#################################################################################################
#
# Membuat dan Menyimpan Grafik
#
#################################################################################################

# Membuat Data
x <- 1:25
y <- x^2
x
y

#################################################################################################
# Generic Plot
#################################################################################################

par(mfrow=c(4,2))

## Scatter plot (point)-default
plot(x,y, type="p", main="type p")

# Atau
plot(x,y)

# Atau
plot(y~x)

## Line plot
plot(x,y, type="l", main="type l")

## Scatter plot dengan titik saling terhubung
plot(x,y, type="b", main="type b")

## Scatter plot dengan titik saling terhubung 
plot(x,y, type="o", main="type o")

## Histogram seperti garis vertikal
plot(x,y, type='h', main="type h")

## Stair steps
plot(x,y, type='s', main="type s")

## no plotting
plot(x,y, type='n', main="type n")

#################################################################################################
# Menyimpan Grafik
#################################################################################################

## 1. Buat file pdf
pdf('plot( ).pdf')

## 2. Membuat Grafik

par(mfrow=c(4,2))

# Scatter plot (point)-default
plot(x,y, type="p", main="type p")

# Line plot
plot(x,y, type="l", main="type l")

# Scatter plot dengan titik saling terhubung
plot(x,y, type="b", main="type b")

# Scatter plot dengan titik saling terhubung 
plot(x,y, type="o", main="type o")

# Histogram seperti garis vertikal
plot(x,y, type='h', main="type h")

# Stair steps
plot(x,y, type='s', main="type s")

# no plotting
plot(x,y, type='n', main="type n")


## 3. Tutup file pdf
dev.off()
