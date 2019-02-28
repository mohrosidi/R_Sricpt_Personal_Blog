library(tidyverse)
library(grid)
library(png)

img <- png::readPNG("png.png")
g_pic <- rasterGrob(img, interpolate=TRUE)


### Populasi dan Angkatan Kerja

## Memuat dataset
dataset <- read.csv("Populasi.csv")
head(dataset)
glimpse(dataset)
unique(dataset$MEASURE)
unique(dataset$INDICATOR)
unique(dataset$SUBJECT)
unique(dataset$TIME)

## Visualisasi
ggplot(dataset, aes(x= TIME, y= Value, fill=INDICATOR))+
  geom_area(alpha=0.5) +
  labs(x="Tahun",y= "Populasi (juta orang)") +
  scale_fill_manual(values=c("#999999", "#E69F00"))+
  xlim(c(1960,2015))+
  ylim(c(0,10))+
  theme_bw() +
  annotation_custom(g_pic, xmin=1960, xmax=1968, ymin=8, ymax=10)


### Persen Peningkatan Angkatan Kerja

## Memuat dataset
dataset2 <- read.csv("Working.Age.csv")
head(dataset2)

## Filter
df <- dataset2 %>%
  filter(ï..LOCATION=="DNK",TIME>=1960, SUBJECT=="TOT")
head(df)

## Visualisasi
ggplot(df, aes(x= TIME, y= Value))+
  geom_area(alpha=0.7, fill="red") +
  labs(x="Tahun",y= "% Populasi") +
  xlim(c(1960,2015))+
  ylim(c(0,100))+
  theme_bw() +
  annotation_custom(g_pic, xmin=1960, xmax=1968, ymin=80, ymax=100)
  

### GDP Per Capita

## Memuat dataset
dataset3 <- read.csv("GPD.csv")
head(dataset3)

## Filter
df2 <- dataset3 %>%
  filter(ï..LOCATION=="DNK")
head(df2)

## Visualisasi
ggplot(df2, aes(x= TIME, y= Value))+
  geom_area(alpha=0.7, fill="red") +
  labs(x="Tahun",y= "US Dollar/Capita") +
  xlim(c(1966,2013))+
  theme_bw() +
  annotation_custom(g_pic, xmin=1966, xmax=1975, ymin=30000, ymax=50000)


## Membuat Scatterplot GDP vs Angkatan Kerja
r <- dataset %>%
  filter(INDICATOR=="WKGPOP",TIME>=1966)

x <- as.numeric(r$Value)
y <- as.numeric(df2$Value)

data <-data.frame("X"=x,"Y"=y)

library(car)
scatterplot(Y~X,data=data,
            xlab ="Populasi Produksi (juta orang)",
            ylab = "GDP per Capita",
            smooth = TRUE,
            regLine = FALSE,
            pch=1)

## Uji Korelasi
cor.test(x,y, method="spearman")
