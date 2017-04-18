## csvs
who <- read.csv("WHO.csv")

## str
str(who)

## resumen
summary(who)

## subset
who_euro <- subset(who, Region=="Europe")
write.csv(who_euro, file="euro.csv")

summary(who$Under15)
## pais con menor proporcion de menores de 15
which.min(who$Under15)

who$Country[which.min(who$Under15)]
plot(who$GNI, who$FertilityRate)

## hay dos paises que no siguen la relacion negativa
outliers <- subset(who, GNI > 10000 & FertilityRate > 2.5)
outliers[c("Country", "GNI", "FertilityRate")]

## Histograms
hist(who$CellularSubscribers)
## Boxplots
boxplot(who$LifeExpectancy ~ who$Region)
boxplot(who$LifeExpectancy ~ who$Region, xlab="", ylab="Life Expectancy", main="Life Expectancy by Region")
## Tables
table(who$Region)

## Tapply
tapply(who$Over60, who$Region, mean)
tapply(who$LiteracyRate, who$Region, min, na.rm=TRUE)
