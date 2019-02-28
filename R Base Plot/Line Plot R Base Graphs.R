#################################################################################################
#
# Line Plot-R Base Graphs
#
#################################################################################################

## Memuat dataset
df<-Orange
head(df)
str(df)

## line graph menggunakan plot()

# membuat plot tunggal
plot(df$age[df$Tree==1], df$circumference[df$Tree==1],
     # membuat plot type = "b"
     type="b",
     xlab='Age (day)',ylab="Circumference (mm)")


# membuat beberapa line graphs type = c("p","l","o","b","c","s")
par(mfrow=c(2,3)) # membagi jendela plot menjadi 2 baris 3 kolom
# menentukan jenis plot
type=c("p","l","o","b","c","s")
# membuat loop plot
for(i in 1:length(type)){
  # membuat judul grafik
  judul = paste("type=",type[i]) 
  plot(df$age[df$Tree==1], df$circumference[df$Tree==1], 
       type="n",# membuat plot tanpa titik observasi 
       main=judul,
       # membuat keterangan axis
       xlab='Age',ylab="Circumference")
  # menambahkan line plot pada plot
  lines(df$age[df$Tree==1], df$circumference[df$Tree==1], 
        # menentukan jenis plot
        type=type[i]) 
}

## Line graph multiple group

# mengubah factor menjadi numeric
Orange$Tree <- as.numeric(Orange$Tree) 
ntrees<-max(Orange$Tree)

# menghitung range sumbu x dan y
xrange <- range(Orange$age) 
yrange <- range(Orange$circumference) 

# Set up plot
plot(xrange, yrange, type="n", xlab="Age (days)",
     ylab="Circumference (mm)" ) 
# menentukan warna line tiap grup
colors <- rainbow(ntrees) 
# menentukan jenisline tiap grup
linetype <- c(1:ntrees) 
# menentukan jenis point line tiap grup
plotchar <- seq(18,18+ntrees,1)

# menambahkan line pada plot yang telah dibuat
for (i in 1:ntrees) { 
  # membuat subset data berdasarkan grup
  tree <- subset(Orange, Tree==i) 
  # menambahkan line graph type= "b"
  lines(tree$age, tree$circumference, type="b", lwd=1.5,
        lty=linetype[i], col=colors[i], pch=plotchar[i]) 
} 

# Menambahkan judul dan subjudul
title("Tree Growth","Contoh line plot")

# menambahkan legend
legend(xrange[1], yrange[2], # koordinat legend
       1:ntrees, cex=0.8, col=colors,
       pch=plotchar, lty=linetype, title="Tree")
