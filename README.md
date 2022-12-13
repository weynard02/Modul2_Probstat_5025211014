# Modul2_Probstat_5025211014

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
Untuk nomor 2 ini kita perlu library BSDA
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
Soal ini juga memerlukan:
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



