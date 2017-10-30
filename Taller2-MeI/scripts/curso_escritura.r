

## install.packages("readstata13")
library(readstata13)
writing <- readstata13::read.dta13("../datos/writing.dta")
writing
summary(writing[c("preS", "postS")])
boxplot(writing$preS, writing$postS)
dPre <- density(writing$preS)
plot(dPre)
dPost <- density(writing$postS)
plot(dPost)
t.test(writing$postS, writing$preS )