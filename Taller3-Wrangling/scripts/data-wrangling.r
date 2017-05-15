library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- "msleep_ggplot2.csv"
if (!file.exists(filename)) download(url,filename)

########

msleep <- read.csv("../data/msleep_ggplot2.csv")

## Datos de mamiferos ()



library(dplyr)
library("nycflights13")
flights2 <- flights %>% select(year:day, hour, origin, dest, tailnum, carrier)

# la tabla airlines tiene el codigo y el nombre de cada aerolinea
flights2 <- flights2 %>% left_join(airlines)


# la tabla weather tiene el clima para cada fecha
flights2 %>% left_join(weather)

# year tiene un significado distinto en planes que en flights
flights2 %>% left_join(planes, by="tailnum")
