library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- "msleep_ggplot2.csv"
if (!file.exists(filename)) download(url,filename)

########

msleep <- read.csv("../data/msleep_ggplot2.csv")

## Datos de mamiferos ()


## cargar la libreria dplyr
library(dplyr)
## cargar la libreria nycflights
library("nycflights13")

## quedarse con las variables 
## "year"    "month"   "day"     "hour"    "origin"  "dest"    "tailnum" "carrier"

flights2 <- flights %>% select(year:day, hour, origin, dest, tailnum, carrier)

# la tabla airlines tiene el codigo y el nombre de cada aerolinea
## que variables tiene la tabla airlines?
names(airlines)
## pegar el nombre de la aerolinea en la tabla flights
## por que campos se pega? sirven los valores por defecto?
flights2 <- flights2 %>% left_join(airlines)


# la tabla weather tiene el clima para cada fecha

## pegar las variables de la tabla weather
## por que campos se pega? sirven los valores por defecto?
flights2 %>% left_join(weather)

# year tiene un significado distinto en planes que en flights
flights2 %>% left_join(planes, by="tailnum")
