# Modul2_Probstat_5025211014
## Alexander Weynard Samsico
## 5025211014

```Catatan: Mungkin terdapat beberapa library yang harus diinstall terlebih dahulu```
## Nomor 1 
### a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas
Pertama-tama kita masukan data dari soal sebagai berikut
```R
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```
Kemudian mencari mengambil data selisih pasangan
```R
diff <- x - y
```
Mencari Standar Deviasi dengan fungsi berikut
```
sd(diff)
```
Sehingga didapatkan:\
![image](https://user-images.githubusercontent.com/90879937/207218518-36093834-9443-4b61-8c76-e7c3a6da9d65.png)

### b. carilah nilai t (p-value)
Kita dapat menggunakan fungsi `t.test()` untuk mencari nilai t(p-value) pada perbandingan pasangan tersebut
```R
t.test(y, x, paired = TRUE)
```
Sehingga ditemukan nilai t/p-value = 0,00006003\
![image](https://user-images.githubusercontent.com/90879937/207219043-aea777a5-b72f-4499-8133-b145f0a55367.png)

### c. tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”
p-value tersebut lebih kecil daripada a = 0.05, maka berarti berada pada area penolakan H0, sehingga ada pengaruh yang signifikan

## Nomor 2
Untuk nomor 2, ini kita perlu library BSDA
```R
library(BSDA)
```
### a. Apakah Anda setuju dengan klaim tersebut?
`setuju`, karena sangat memenuhi dengan sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer pada pencarian estimasi 

### b. Jelaskan maksud dari output yang dihasilkan! 
Mari kita melakukan pengujian t dengan `tsum.test()` dengan alternative sebagai greater (lebih dari)
```R
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100, 
        alternative = "greater", mu = 20000, 
        var.equal = TRUE, conf.level = 0.95)
```

![image](https://user-images.githubusercontent.com/90879937/207220198-69f7b147-6c66-4e3d-935d-b8b8efe3d8a1.png)
Dengan confidence interval 95 percent, bahwa rata-rata berada pada mu > 22852.45. Oleh karena itu, dengan interval itu, bahwa
mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun diterima.

### c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
```
Hipotesa null ditolak karena p value lebih kecil daripada level signifikan = 0.05, hipotesa alterative diambil bahwa rata-rata lebih dari 20.000 kilometer per tahun
```

## Nomor 3
Nomor 3 ini juga memerlukan:
```R
library(BSDA)
```
### a. H0 dan H1
```
H0 : μ1 - μ2 = 0
H1 : μ1 - μ2 ≠ 0
```
μ1 = rata-rata saham di Bandung
μ2 = rata-rata saham di Bali

### b. Hitung Sampel Statistik
Mencari sampel statistik dapat dilakukan sebagai berikut
```R
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, 
        mean.y = 2.79, s.y = 1.32, n.y = 27, 
        alternative = "two.sided", mu = 0,
        var.equal = TRUE, conf.level = 0.95)
```
![image](https://user-images.githubusercontent.com/90879937/207225111-317e2419-1ab4-4190-bf90-f9419928cc41.png)

### c. Lakukan Uji Statistik (df =2)
Untuk melakukan uji, kita perlu library mosiac untuk plot statistiknya
```R
library(mosaic)
```
Kemudian kita plotkan sebagai berikut dengan df yang diketahui:
```R
plotDist(dist = 't', df = 2, xmin = NULL, xmax = NULL, col = "#ff0000")
```
uji t didapatkan = 1.9267 (menurut 3b)
![image](https://user-images.githubusercontent.com/90879937/207225609-cb4587cc-4a35-4793-ae17-d67b29285cc9.png)


### d. Nilai Kritikal
Kita dapat mencari nilai kritikal dengan fungsi `qt()` dengan df = 44 
```
qt(p = 0.05 / 2, df = 44, lower.tail = TRUE)
qt(p = 0.05 / 2, df = 44, lower.tail = FALSE)
```
Ada dua karena two-tail\
![image](https://user-images.githubusercontent.com/90879937/207226626-3617a3e2-129b-4ea9-8428-3bf7c42a13f0.png)

### e. Keputusan
```
Tidak menolak H0
```
Karena nilai t berada di antara nilai kritikal
### f. Kesimpulan
```
Tidak adanya bukti cukup bahwa tidak ada perbedaan pada rata-rata saham Bandung dan Bali
```

## Nomor 4
### a. Buatlah masing masing jenis spesies menjadi  3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

Kita perlu menconvert data file dari link tersebut ke dalam program sebagai berikut
```R
my_data <- read.table("onewayanova.txt", h = TRUE)
attach(my_data)
```
Perlu diingat readtable berupa path.
Kemudian kita membagi-bagi setiap speies ke dalam masing-masing group, sebagai berikut
```R
my_data$Group <- as.factor(my_data$Group)
my_data$Group <- factor(my_data$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih")) # nolint

grup1 <- subset(my_data, Group == "Kucing Oren")
grup2 <- subset(my_data, Group == "Kucing Hitam")
grup3 <- subset(my_data, Group == "Kucing Putih")
```

Gambar plot menggunakan `qqnorm` dan `qqline` untuk setiap kelompok sebagai berikut
```R
qqnorm(grup1$Length)
qqline(grup1$Length)
```
![image](https://user-images.githubusercontent.com/90879937/207292492-3fa88cbb-2b8b-4144-bd16-771a58c12fc5.png)

```R
qqnorm(grup2$Length)
qqline(grup2$Length)
```
![image](https://user-images.githubusercontent.com/90879937/207292633-3f1a78d0-e407-4bdf-bc91-66c32391bf9c.png)

```R
qqnorm(grup3$Length)
qqline(grup3$Length)
```
![image](https://user-images.githubusercontent.com/90879937/207292714-4c930fb1-511f-42fb-b026-f54df56212dd.png)

### b. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
Untuk menguji Homogeneity of variances, kita dapat menggunakan `barlett.test`
```R
bartlett.test(Length ~ Group, data = my_data)
```
![image](https://user-images.githubusercontent.com/90879937/207293098-a7d502c9-abfe-477d-bdb7-65adefedba6d.png)

Didapatkan p-value sebesar `0.8054`\
Hipotesis:
```
H0 : σ1 = σ2 = σ3
H1 : satupun yang tidak sama antara σ1, σ2, atau σ3
```
σ1 mewakilkan varians group 1\
Kesimpulan 
```
p-value lebih dari 0.05, sehingga hipotesis 0 diterima bahwa varians seluruh grup sama 
```

### c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.
menggunakan fungsi `lm()` (model linier)
```R
model1 = lm(Length ~ Group, data = my_data)
anova(model1)
```
![image](https://user-images.githubusercontent.com/90879937/207296974-8e35f466-508f-4a77-876a-5a9468383fc4.png)

### d. Dari Hasil Poin C , Berapakah nilai-p ? ,  Apa yang dapat Anda simpulkan dari H0?
```
Berdasarkan C, nilai p = 0.0013
karena p < 0.05, maka menolak H0, bahwa terbukti ada perbedaan rata-rata panjang antara ketiga spesies
```

### e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD ,  dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.
Menggunakan fungsi `TukeyHSD()`
```R
TukeyHSD(aov(model1))
```
![image](https://user-images.githubusercontent.com/90879937/207300821-5eb0327a-ed16-4779-80ef-102d48a72a42.png)
```
Jika kita lihat melalui p-value adj, bahwa 
adanya perbedaan rata-rata panjang antar Kucing Hitam dan Kucing Oren karena di bawah 0.05 level significant
adanya perbedaan rata-rata panjang antar Kucing Putih dan Kucing Hitam karena di bawah 0.05 level significant
Jika dilihat dari diff, bahwa Kucing Oren lebih panjang daripada Kucing Hitam, 
Kucing Putih lebih panjang daripada Kucing Hitam
dan Kucing Oren lebih panjang daripada Kucing Putih namun tidak signifikan 
```

### f. Visualisasikan data dengan ggplot2
Kita perlu library ggplot2
```R
library(ggplot2)
```
Kemudian kita buat
```R
ggplot(data = my_data, mapping = aes(x = Group, y = Length)) + geom_boxplot(fill = "grey", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length")
```
![image](https://user-images.githubusercontent.com/90879937/207303217-39b8c6e8-5224-4292-92b2-da9b2a6db97a.png)


## Nomor 5
Untuk nomor 5 ini, diperlukan library berikut
```R
library(multcompView)
library(ggplot2)
library(dplyr)
```
### a. Buatlah plot sederhana untuk visualisasi data

Kita masukan file ke program
```R
GTL <- read.csv("GTL.csv")
```
Mengingat bahwa read path perlu disesuaikan
Kemudian gambar plot dengan qplot
```R
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
```
![image](https://user-images.githubusercontent.com/90879937/207305068-3642e727-1d1b-4bb2-b208-0dbf99598204.png)

### b. Lakukan uji ANOVA dua arah untuk 2 faktor
melakukan uji ANOVA antara 2 faktor dengan fungsi `aov()`
```R
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp <- as.factor(GTL$Temp)

anova <- aov(Light ~ Glass*Temp, data = GTL)
summary(anova)
```
![image](https://user-images.githubusercontent.com/90879937/207305518-30493fa7-075c-48e7-b9e9-0095c0f014f5.png)

### c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)
Tabel dibuat dengan menggunakan `summarise()` dan `arrange()` antara Glass dan Temp
```R
summaryData <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(summaryData)
```
![image](https://user-images.githubusercontent.com/90879937/207305896-591c20cf-8398-4e90-9c88-05e82e626b8b.png)

### d. Lakukan uji Tukey
Menggunakan `TukeyHSD()`
```R
TukeyHSD(anova)
```
![image](https://user-images.githubusercontent.com/90879937/207306794-42623305-6e67-4552-874d-2effdde3b96b.png)
![image](https://user-images.githubusercontent.com/90879937/207306835-1a420b43-74c4-4867-90ec-604b6190ce61.png)

### e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
Menggunakan fungsi `multicompLetters4()` untuk menunjukkan perbedaan
```R
multcompLetters4(anova, tukey)
```
![image](https://user-images.githubusercontent.com/90879937/207306994-a93950d7-6ba8-484f-9537-b7cdce994bcb.png)
