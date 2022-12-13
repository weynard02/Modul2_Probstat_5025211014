#Alexander Weynard Samsico
#5025211014

#1

x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
diff <- x - y
#a
sd(diff)

#b
t.test(y, x, paired = TRUE)

#c
print("p-value tersebut lebih kecil daripada a = 0.05, maka berarti berada pada area penolakan H0, sehingga ada pengaruh yang signifikan")

#2
library(BSDA)
#a
print("setuju, karena sangat memenuhi dengan sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer pada pencarian estimasi")

#b
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100, 
        alternative = "greater", mu = 20000, 
        var.equal = TRUE, conf.level = 0.95)
#c 
print("hipotesa null ditolak karena p value lebih kecil daripada level signifikan = 0.05, hipotesa alterative diambil bahwa rata-rata lebih dari 20.000 kilometer per tahun")

#3
#a
print("H0 : μ1 - μ2 = 0")
print("H1 : μ1 - μ2 ≠ 0")
library(BSDA)
#b
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, 
        mean.y = 2.79, s.y = 1.32, n.y = 27, 
        alternative = "two.sided", mu = 0,
        var.equal = TRUE, conf.level = 0.95)

#c
library(mosaic)
plotDist(dist = 't', df = 2, xmin = NULL, xmax = NULL, col = "#ff0000") # nolint
print("t = 1.9267")
#d
qt(p = 0.05 / 2, df = 44, lower.tail = TRUE)
qt(p = 0.05 / 2, df = 44, lower.tail = FALSE)
#e
print("Tidak menolak H0")

#f
print("tidak adanya bukti cukup bahwa tidak ada perbedaan pada rata-ratanya")

#4
#a
my_data <- read.table("~/ITS/Classroom/Tahun 2 (2022)/Semester Gasal/Probabilitas & Statistik/prak2/onewayanova.txt", h = TRUE)
attach(my_data)

my_data$Group <- as.factor(my_data$Group)
my_data$Group <- factor(my_data$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih")) # nolint


grup1 <- subset(my_data, Group == "Kucing Oren")
grup2 <- subset(my_data, Group == "Kucing Hitam")
grup3 <- subset(my_data, Group == "Kucing Putih")

qqnorm(grup1$Length)
qqline(grup1$Length)

qqnorm(grup2$Length)
qqline(grup2$Length)

qqnorm(grup3$Length)
qqline(grup3$Length)

#b
bartlett.test(Length ~ Group, data = my_data)
print("P-value = 0.8054")
print("H0 : σ1 = σ2 = σ3")
print("H1 : satupun yang tidak sama antara σ1, σ2, atau σ3")
print("Kesimpulan: p-value lebih dari 0.05, sehingga hipotesis 0 diterima bahwa varians seluruh grup sama ")

#c
model1 = lm(Length ~ Group, data = my_data)
anova(model1)

#d 
print("Berdasarkan C, nilai p = 0.0013")
print("karena p < 0.05, maka menolak H0, bahwa terbukti ada perbedaan rata-rata panjang antara ketiga spesies")

#e
TukeyHSD(aov(model1))
print("Jika kita lihat melalui p-value adj, bahwa ")
print("adanya perbedaan rata-rata panjang antar Kucing Hitam dan Kucing Oren karena di bawah 0.05 level significant")
print("adanya perbedaan rata-rata panjang antar Kucing Putih dan Kucing Hitam karena di bawah 0.05 level significant")
print("Jika dilihat dari diff, bahwa Kucing Oren lebih panjang daripada Kucing Hitam, ")
print("Kucing Putih lebih panjang daripada Kucing Hitam")
print("dan Kucing Oren lebih panjang daripada Kucing Putih namun tidak signifikan ")

#f
library(ggplot2)
ggplot(data = my_data, mapping = aes(x = Group, y = Length)) + geom_boxplot(fill = "grey", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length")

#5
library(multcompView)
library(ggplot2)
library(dplyr)
#a
GTL <- read.csv("~/ITS/Classroom/Tahun 2 (2022)/Semester Gasal/Probabilitas & Statistik/prak2/GTL.csv")

qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

#b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp <- as.factor(GTL$Temp)

anova <- aov(Light ~ Glass*Temp, data = GTL)
summary(anova)

#c
summaryData <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(summaryData)

#d
TukeyHSD(anova)

#e
cldTemp <- multcompLetters4(anova, tukey)
print(cldTemp)

cld <- as.data.frame.list(cldTemp$'Glass:Temp')
summaryData$CLD <- cld$Letters
print(summaryData)

