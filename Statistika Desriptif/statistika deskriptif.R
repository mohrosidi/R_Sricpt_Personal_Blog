## Memuat paket tidyverse
library(tidyverse)
?tidyverse

## Memuat dataset
data("mtcars")
?mtcars # info lebih lanjut terkait dataset
head(mtcars) # cek beberapa baris data
str(mtcars) # cek struktur dataset
unique(mtcars$cyl) # cek nilai unik pada variabel cylinder



## Statistika Deskriptif (Central Tendency)

## menentukan rata-rata bobot mobil
sum(mtcars$wt)/nrow(mtcars) # menghitung mean secara manual
mean(mtcars$wt) # menghitung mean menggunakan fungsi
?mean
# Berdasarkan hasil perhitungan bobot rata-rata mobil sebesar 3217 lbs

# input mean menggunakan trim method
mean(mtcars$wt, trim=0.05) # trim data sebesar 5% di kanan dan kiri mean

# input mean jika pada terdapat nilai observasi yang hilang
df <- c(3,4,5,9,10,NA)
df
mean(df) # jika terdapat observasi yang hilang (NA) maka akan menghasilkan error
mean(df,na.rm=TRUE) # Jika NA tidak disertakan dalam komputasi


## menentukan median bobot mobil
df=arrange(mtcars, wt) # mengurutkan data dari yang terkecil
nrow(df) # menentukan jumlah observasi
nrow(df)/2 # menentukan letak urutan median
## Berdasarkan hasil komputasi median terletak diantara observasi 16 dan 17
(df[16,6]+df[17,6])/2 # menentukan median secara manual
median(mtcars$wt) # menentukan median menggunakan fungsi


## menentukan modus silinder yang paling banyak digunakan
table(mtcars$cyl) # tabulasi jenis silinder yang digunakan
# Berdasarkan hasil tabulasi sebagian besar mobil memiliki 8 silinder



## Statistika Deskriptif (Spread)

## Menentukan range berat mobil
maksimum = max(mtcars$wt) # nilai maksimum berat mobil
maksimum

minimum = min(mtcars$wt) # nilai minimum berat mobil
minimum

c(minimum,maksimum) # range berat mobil (manual)

range = range(mtcars$wt) # menggunakan fungsi untuk menentukan range data
range

## Menentukan IQR
nrow(mtcars)/4 # menentukan baris Q1
Q1 = (df[8,6]+df[9,6])/2 # Q1 berada antara baris 8 dan 9
Q1
Q1 = quantile(mtcars$wt, 1/4) # Q1 menggunakan fungsi

Q2 = median(mtcars$wt) # Q2=median
Q2
Q2 = quantile(mtcars$wt, 1/2) # Q2 menggunakan fungsi quantile()

(nrow(mtcars)/4)*3 # menentukan baris Q3
Q3 = (df[24,6]+df[25,6])/2 # Q3 berada antara baris 24 dan 24
Q3
Q3 = quantile(mtcars$wt, 3/4) # Q3 menggunakan fungsi quantile()

IQR = Q3-Q1 # menghitung IQR secara manual
IQR

IQR = IQR(mtcars$wt)
IQR


## Varian berat mobil
jumlah.sq.deviasi = sum(mtcars$wt^2) # jumlah kuadrat deviasi
varian = jumlah.sq.deviasi/(nrow(mtcars)-1) #varian sampel manual
varian
Varian = var(mtcars$wt) # varian menggunakan fungsi

## standar deviasi
sd = sqrt(var(mtcars$wt)) # standar deviasi sampel manual
sd
sd = sd(mtcars$wt) # standar deviasi menggunakan fungsi


## Statistika Deskriptif menggunakan fungsi summary()
summary(mtcars) # menampilkan statistika deskriptif seluruh variabel numerik
summary(mtcars$wt) # menampilakn summary untuk variabel wt


## Statistika deskriptif menggunakan dplyr
# Ringkasan statistik berat mobil berdasarkan jumlah silinder
mtcars %>%
  group_by(cyl) %>%
  summarise(mean = mean(wt),median=median(wt),IQR=IQR(wt),min=min(wt),max=max(wt),
            variance=var(wt),sd=sd(wt))
# Berdasarkan hasil yang diperoleh semakin banyak silinder mobil semakin 
# berat mobil tersebut
# Tidak bisa ditentukan apakah perbedaan tersebut signifikan atau tidak
# perlu dianalisis menggunakan anova