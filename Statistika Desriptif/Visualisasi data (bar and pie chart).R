## Memuat Paket
# install.packages('ggplot2') # hilangkan dash untuk menginstall paket
library(ggplot2)
library(dplyr)

## Membuat dataframe
data <- data.frame(
  waktu.makan = factor(c("Pagi","Siang","Malam"),levels=c("Pagi","Siang","Malam")),
  pengeluaran = c(15,10,25)
)
data

## Bar plot

# Base plot
barplot(data$pengeluaran, main="Pengeluaran Makan",xlab ="Waktu Makan",
        ylab="Pengeluaran dalam ribuan",names.arg = data$waktu.makan,
        col=data$waktu.makan)

# ggplot geom_col
ggplot(data,aes(x=waktu.makan,y=pengeluaran,fill=waktu.makan))+
  geom_col() + # membuat bar graph menggunakan geom-col()
  labs(y="Pengeluaran Dalam Ribuan") # memberi label pada axis

# ggplot geom_bar
# Basic plot
ggplot(data,aes(x=waktu.makan,y=pengeluaran))+
  geom_bar(stat='identity')
# Menambahkan warna berdasarkan waktu makan
ggplot(data,aes(x=waktu.makan,y=pengeluaran,fill=waktu.makan))+
  geom_bar(stat='identity')
# menambahkan garis hitam pada bar
ggplot(data,aes(x=waktu.makan,y=pengeluaran,fill=waktu.makan))+
  geom_bar(colour='black',stat='identity')
# menghilangkan legend pada plot
ggplot(data,aes(x=waktu.makan,y=pengeluaran,fill=waktu.makan))+
  geom_bar(colour='black',stat='identity')+
  guides(fill=FALSE)
# merubah label pada axis
ggplot(data,aes(x=waktu.makan,y=pengeluaran,fill=waktu.makan))+
  geom_bar(colour='black',stat='identity')+
  guides(fill=FALSE) +
  labs(x="Waktu Makan",y="Pengeluaran Dalam Ribuan")


## Memuat dataset ToothGowth
tg <- ToothGrowth
?ToothGrowth

## cek dataset
head(tg) # cek 6 observasi pertama
tail(tg) # cek 6 observasi terakhir
str(tg) # cek struktur tg


## Base plot

# plot variabel supp dengan len
mean.tg<-tg %>%
      group_by(supp) %>%
      summarise(len = mean(len))
mean.tg
barplot(mean.tg$len,main="Panjang gigi berdasarkan suplemen",names.arg = mean.tg$supp,
        col=mean.tg$supp, xlab="Suplemen",ylab="Panjang gigi")

## plot seluruh variabel
mean.tg<-tg %>%
  mutate(dose=factor(dose)) %>%
  group_by(supp,dose) %>%
  summarise(len = mean(len))

mean.tg
mean.tg<-arrange(mean.tg,dose)
barplot(mean.tg$len,main="Panjang gigi berdasarkan suplemen dan dosis",names.arg = mean.tg$dose,
        col=mean.tg$supp, xlab="Dosis",ylab="Panjang gigi")



## ggplot
# stacked bar graph
ggplot(tg, aes(x=factor(dose),y=len,fill=supp))+
  geom_bar(stat="identity")

# bar graph dengan posisi dodge
ggplot(tg, aes(x=factor(dose),y=len,fill=supp))+
  geom_bar(stat="identity",position=position_dodge())

# rubah warna bar
ggplot(tg, aes(x=factor(dose),y=len,fill=supp))+
  geom_bar(stat="identity",position=position_dodge()) +
  scale_fill_manual(values=c("#999999", "#E69F00"))

# memasukkan error bar dalam bar
tgc <- tg %>%
  mutate(dose=factor(dose))%>%
  group_by(dose,supp) %>%
  summarise(N=n(),mean.len=mean(len),sd = sd(len)) %>%
  mutate(se=sd/sqrt(N))%>%
  mutate(ci.95=1.96*se) # CI 95% 
tgc

ggplot(tgc,aes(x=dose,y=mean.len,fill=supp))+
  geom_bar(position = position_dodge(),stat = "identity")+
  geom_errorbar(aes(ymin=mean.len-ci.95,ymax=mean.len+ci.95),
                width=0.3, # Lebar error bar
                position=position_dodge(.9))


## Pie Chart
tg.prop <- tg %>%
  group_by(supp,dose) %>%
  summarise(N=n()) %>%
  mutate(names=c(paste(supp,"Dose",dose,"mg/l")))
tg.prop

# Plot
pie(tg.prop$N,labels= tg.prop$names)
