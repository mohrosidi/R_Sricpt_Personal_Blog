#################################################################################################
#
# DATA MANAGEMENT
#
#################################################################################################

## Daftar Isi:
"
1. Membuat variabel baru,
2. Operator,
3. Built in Functions,
4. Control Structures,
5. User Define Function,
6. Mengurutkan Data,
7. Menggabungkan Data,
8. Mengelompokkan Data,
9. Reshaping Data,
10.Subset Data,
11.Konversi Jenis Data."

#################################################################################################
## 1. Membuat variabel baru
#################################################################################################

### Memuat paket
# install.packages("gapminder")
library(gapminder)

### Memuat dataset
df<-gapminder
head(df)
help("gapminder")

### Membuat gdpPercap menjadi gdp
df$gdp <- df$gdpPercap*df$pop
head(df)

### Mengubah gdp menjadi /1000 US dollar
df$gdp <- df$gdp/1000
head(df)

### Recording variables
#### Mmebuat klasifikasi negara berdasarkan gdpPercap
#### 1. membuat 2 buah kategori
df$klasifikasi <- ifelse(df$gdpPercap>1000,
                         c("Tinggi"),c("Rendah"))
head(df)

#### 2. membuat 3 buah kategori
df$klasifikasi[df$gdpPercap<1000]<-"Rendah"
df$klasifikasi[df$gdpPercap>1000 & df$gdpPercap<=1500]<-"Sedang"
df$klasifikasi[df$gdpPercap>1500]<-"Tinggi"
head(df)

### Mengubah Nama variabel
#### 1. Secara langsung
fix(df) 

#### 2. Menggunakan program
# install.packages("reshape")
library(reshape)
df<-rename(df, c(klasifikasi="Kriteria"))
head(df)

#### 3. Mengubah seluruh nama kolom
names(df) <- c('Negara', 'Benua', 'Tahun', 'Harapan_Hidup', 'Populasi', 'GDPperOrg','GDP','Klasifikasi')
head(df)

#################################################################################################
## 2. Operator
#################################################################################################

### Contoh
x <- c(1:20) 
x[(x>15) | (x<10)] 

### Cara kerja operator
x
x>8
x<5
x>15 | x<10
x[c(T,T,T,T,F,F,F,F,T,T)]

#################################################################################################
## 3. Built in function
#################################################################################################

### fungsi matematis seperti sum(), abs(), dll dijelaskan dalam artikel

#################################################################################################
## 4. Control Structures
#################################################################################################

### if-else
x<-c('Nama','Saya','Ardi')
if('Ardi' %in% x) {
  print('Ardi ditemukan pertama')
} else if ('Iwan' %in% x){
  print('Ardi ditemukan kedua')
} else{
    print('')
}

### for
x <- LETTERS[1:5]
for(i in x){
  print(i)
}

### while
x <- c('COba','Contoh')
y <- 1
  while(y < 4){
  print(x)
  y <- y + 1
}

### switch
x <- switch(
  3,
  'satu',
  'dua',
  'tiga',
  'empat'
)
print(x)

### ifelse
x<-2
y<-3
ifelse(y < x,
       print(x),
       print(''))

### Contoh
mytrans <- function(x) { 
  if (!is.matrix(x)) {
    warning("argument is not a matrix: returning NA")
    return(NA_real_)
  }
  y <- matrix(1, nrow=ncol(x), ncol=nrow(x)) 
  for (i in 1:nrow(x)) {
    for (j in 1:ncol(x)) {
      y[j,i] <- x[i,j] 
    }
  }
  return(y)
}

z <- matrix(1:10, nrow=5, ncol=2)
tz <- mytrans(z)

