Introducción a R
========================================================
author: 
date: 
autosize: true

¿Qué es R? 
========================================================

- Paquete estadístico (SPSS, STATA, Excel(?))
- Open Source
- Ecosistema de herramientas (RStudio, dplyr)


Introducción
========================================================

- Código: 

<https://github.com/rlabuonora/taller_R>

- Para clonarlo desde GIT: 

$ git clone https://github.com/rlabuonora/taller_R.git


Interfaz (1)
========================================================


![optional caption text](consola.png)

- Escribo comandos para evaluarlos directamente


Interfaz (2)
========================================================


![optional caption text](editor.png)

- Archivos de texto salvados con código fuente


Consola
========================================================
Es la forma más básica de interactuar con R


```r
6*8
```

```
[1] 48
```

```r
2^6
```

```
[1] 64
```
  
- Arriba y abajo para scrollear los comandos

Funciones predefinidas
========================================================


```r
sqrt(2)
```

```
[1] 1.414214
```
 - Para ver la ayuda de la funcion sqrt:

?sqrt

Variables
========================================================
Sirven para almacenar resultados intermedios y organizar los programas

```r
RaizDeDos <- sqrt(2)
HorasPorAnio = 365 * 60
```

En Excel y Stata no existen (!)


Ambiente (environment)
========================================================
Es el conjunto de objetos disponibles a través de variables

```r
ls()
```

```
[1] "HorasPorAnio" "RaizDeDos"   
```
Funciones definidas por usuarios
========================================================
Es el conjunto de objetos disponibles a través de variables

```r
MyAbs <- function(x) {
    if ( x < 0 ) -x
    else x
}
MyAbs(-1)
```

```
[1] 1
```

```r
MyAbs(2)
```

```
[1] 2
```

Importar archivo de datos
========================================================
Se pueden importar archivos de text, SPSS, Stata, etc.

```r
who <- read.csv("WHO.csv")
```
Estructura
========================================================
- Un data frame es una lista de vectores

```r
who <- str(who)
```

```
'data.frame':	194 obs. of  13 variables:
 $ Country                      : Factor w/ 194 levels "Afghanistan",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ Region                       : Factor w/ 6 levels "Africa","Americas",..: 3 4 1 4 1 2 2 4 6 4 ...
 $ Population                   : int  29825 3162 38482 78 20821 89 41087 2969 23050 8464 ...
 $ Under15                      : num  47.4 21.3 27.4 15.2 47.6 ...
 $ Over60                       : num  3.82 14.93 7.17 22.86 3.84 ...
 $ FertilityRate                : num  5.4 1.75 2.83 NA 6.1 2.12 2.2 1.74 1.89 1.44 ...
 $ LifeExpectancy               : int  60 74 73 82 51 75 76 71 82 81 ...
 $ ChildMortality               : num  98.5 16.7 20 3.2 163.5 ...
 $ CellularSubscribers          : num  54.3 96.4 99 75.5 48.4 ...
 $ LiteracyRate                 : num  NA NA NA NA 70.1 99 97.8 99.6 NA NA ...
 $ GNI                          : num  1140 8820 8310 NA 5230 ...
 $ PrimarySchoolEnrollmentMale  : num  NA NA 98.2 78.4 93.1 91.1 NA NA 96.9 NA ...
 $ PrimarySchoolEnrollmentFemale: num  NA NA 96.4 79.4 78.2 84.5 NA NA 97.5 NA ...
```
Data frames
======================================================
- Para acceder a uno usamos el operador __$__

```r
who <- read.csv("WHO.csv")
head(who$Country) # head es una funcion que me muestra los primeros valores de un vector
```

```
[1] Afghanistan         Albania             Algeria            
[4] Andorra             Angola              Antigua and Barbuda
194 Levels: Afghanistan Albania Algeria Andorra ... Zimbabwe
```
Manejo de archivos
=========================================================

```r
who <- read.csv("WHO.csv")
# subset
who_euro <- subset(who, Region=="Europe")
# salvar como csv
write.csv(who_euro, file="euro.csv")
```
Info sobre el data frame
======================================================

```r
nrow(who)
```

```
[1] 194
```

```r
nrow(who_euro)
```

```
[1] 53
```

```r
ncol(who)
```

```
[1] 13
```

```r
names(who)
```

```
 [1] "Country"                       "Region"                       
 [3] "Population"                    "Under15"                      
 [5] "Over60"                        "FertilityRate"                
 [7] "LifeExpectancy"                "ChildMortality"               
 [9] "CellularSubscribers"           "LiteracyRate"                 
[11] "GNI"                           "PrimarySchoolEnrollmentMale"  
[13] "PrimarySchoolEnrollmentFemale"
```

Estadísticas descriptivas
======================================================

```r
summary(who)
```

```
                Country                      Region     Population     
 Afghanistan        :  1   Africa               :46   Min.   :      1  
 Albania            :  1   Americas             :35   1st Qu.:   1696  
 Algeria            :  1   Eastern Mediterranean:22   Median :   7790  
 Andorra            :  1   Europe               :53   Mean   :  36360  
 Angola             :  1   South-East Asia      :11   3rd Qu.:  24535  
 Antigua and Barbuda:  1   Western Pacific      :27   Max.   :1390000  
 (Other)            :188                                               
    Under15          Over60      FertilityRate   LifeExpectancy 
 Min.   :13.12   Min.   : 0.81   Min.   :1.260   Min.   :47.00  
 1st Qu.:18.72   1st Qu.: 5.20   1st Qu.:1.835   1st Qu.:64.00  
 Median :28.65   Median : 8.53   Median :2.400   Median :72.50  
 Mean   :28.73   Mean   :11.16   Mean   :2.941   Mean   :70.01  
 3rd Qu.:37.75   3rd Qu.:16.69   3rd Qu.:3.905   3rd Qu.:76.00  
 Max.   :49.99   Max.   :31.92   Max.   :7.580   Max.   :83.00  
                                 NA's   :11                     
 ChildMortality    CellularSubscribers  LiteracyRate        GNI       
 Min.   :  2.200   Min.   :  2.57      Min.   :31.10   Min.   :  340  
 1st Qu.:  8.425   1st Qu.: 63.57      1st Qu.:71.60   1st Qu.: 2335  
 Median : 18.600   Median : 97.75      Median :91.80   Median : 7870  
 Mean   : 36.149   Mean   : 93.64      Mean   :83.71   Mean   :13321  
 3rd Qu.: 55.975   3rd Qu.:120.81      3rd Qu.:97.85   3rd Qu.:17558  
 Max.   :181.600   Max.   :196.41      Max.   :99.80   Max.   :86440  
                   NA's   :10          NA's   :91      NA's   :32     
 PrimarySchoolEnrollmentMale PrimarySchoolEnrollmentFemale
 Min.   : 37.20              Min.   : 32.50               
 1st Qu.: 87.70              1st Qu.: 87.30               
 Median : 94.70              Median : 95.10               
 Mean   : 90.85              Mean   : 89.63               
 3rd Qu.: 98.10              3rd Qu.: 97.90               
 Max.   :100.00              Max.   :100.00               
 NA's   :93                  NA's   :93                   
```
Vectores
======================================================
- Son la base de los data frames (un data frame es una lista de vectores (?))
- Muchas funciones trabajan con vectores
- Para crear un vector de números uso la función *c*:

```r
vec <- c(2, 3, 5, 8, 13)
vec
```

```
[1]  2  3  5  8 13
```
- Accedo por el índice a cada componente

```r
vec[3]
```

```
[1] 5
```

Vectores(2)
======================================================
- Pueden ser de texto

```r
counts <- c("Brazil", "China", "India", "Switzerland", "USA")
life_exp<- c(74, 76, 65, 83, 79)
```
- Para crear un data frame a partir de vectores:

```r
country_data <- data.frame(counts, life_exp)
str(country_data)
```

```
'data.frame':	5 obs. of  2 variables:
 $ counts  : Factor w/ 5 levels "Brazil","China",..: 1 2 3 4 5
 $ life_exp: num  74 76 65 83 79
```

Vectores(3) Operador $
======================================================
- El operador *$* me permite acceder a un item de una lista

```r
country_data$pop <- c(199000, 1390000, 1240000, 7997, 318000)
str(country_data)
```

```
'data.frame':	5 obs. of  3 variables:
 $ counts  : Factor w/ 5 levels "Brazil","China",..: 1 2 3 4 5
 $ life_exp: num  74 76 65 83 79
 $ pop     : num  199000 1390000 1240000 7997 318000
```
- Cuidado con el orden!


Preguntas más específicas sobre los datos
======================================================
- País con menor proporcion de menores de 15

```r
which.min(who$Under15)
```

```
[1] 86
```

```r
who$Country[which.min(who$Under15)]
```

```
[1] Japan
194 Levels: Afghanistan Albania Algeria Andorra ... Zimbabwe
```
Visualización
======================================================
- ¿Cuál es la relación entre el PIB y la tasa de fertilidad?

```r
plot(who$GNI, who$FertilityRate)
```

![plot of chunk unnamed-chunk-18](taller1-figure/unnamed-chunk-18-1.png)

Subset
======================================================
## Hay dos paises que no siguen la relacion negativa

```r
outliers <- subset(who, GNI > 80000 | (FertilityRate > 5 & GNI > 20000))
outliers[c("Country", "GNI", "FertilityRate")]
```

```
              Country   GNI FertilityRate
56  Equatorial Guinea 25620          5.04
138             Qatar 86440          2.06
```
Histogramas
=========================================================

```r
hist(who$CellularSubscribers)
```

![plot of chunk unnamed-chunk-20](taller1-figure/unnamed-chunk-20-1.png)
Boxplots
==========================================================

```r
boxplot(who$LifeExpectancy ~ who$Region)
```

![plot of chunk unnamed-chunk-21](taller1-figure/unnamed-chunk-21-1.png)

```r
boxplot(who$LifeExpectancy ~ who$Region, xlab="", ylab="Life Expectancy", main="Life Expectancy by Region")
```

![plot of chunk unnamed-chunk-21](taller1-figure/unnamed-chunk-21-2.png)
Tables
===========================================================
- Si le doy un vector categórico, calcula los totales

```r
table(who$Region)
```

```

               Africa              Americas Eastern Mediterranean 
                   46                    35                    22 
               Europe       South-East Asia       Western Pacific 
                   53                    11                    27 
```
Tapply
==============================================================
- Le doy un vector continuo, un vector categórico y una función
- Aplica la función a cada grupo del vector categórico

```r
tapply(who$Over60, who$Region, mean)
```

```
               Africa              Americas Eastern Mediterranean 
             5.220652             10.943714              5.620000 
               Europe       South-East Asia       Western Pacific 
            19.774906              8.769091             10.162963 
```

```r
tapply(who$LiteracyRate, who$Region, min, na.rm=TRUE)
```

```
               Africa              Americas Eastern Mediterranean 
                 31.1                  75.2                  63.9 
               Europe       South-East Asia       Western Pacific 
                 95.2                  56.8                  60.6 
```


Deberes
======================================================
- La propuesta esta en la carpeta demo (demo_ej.r)

- La solución es (demo_sol.r)


- Requiere usar varias funciones:
  + str 
  + is.na 
  + sort 
  + names
  + length
  + table
  + tapply
  

