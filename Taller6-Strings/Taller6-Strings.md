Taller 7 - Strings
========================================================
author: 
date: 
autosize: true

Texto
========================================================

La información textual es común para codificar categorías.


Grep
========================================================

Detecta un patrón en un vector de characters


```r
grep("Pole", c("Equator","North Pole","South Pole"))
```

```
[1] 2 3
```

```r
grep("pole", c("Equator","North Pole","South Pole"))
```

```
integer(0)
```


nchar
=================================================

Cuenta cuantos caracteres tiene cada uno de los elementos de un vector

```r
nchar(c("Equator","North Pole","South Pole"))
```

```
[1]  7 10 10
```

paste
========================================================
Pega varios elementos de un vector en uno


```r
paste("North", "Pole")
```

```
[1] "North Pole"
```

```r
paste("North", "Pole", sep="")
```

```
[1] "NorthPole"
```

```r
paste("North", "and", "South",  "Pole", sep="-")
```

```
[1] "North-and-South-Pole"
```
Es vectorial

```r
paste(c("a", "b", "c"), c("d", "e"), sep="-")
```

```
[1] "a-d" "b-e" "c-d"
```
Si quiero un solo elementos

```r
paste(c("a", "b", "c"), c("d", "e"), sep="-", collapse="*")
```

```
[1] "a-d*b-e*c-d"
```


sprintf
==============================================================
Sirve para imprimir texto "interpolado"


```r
i <- 1
sprintf("El cuadrado de %d es %d", i, i^2)
```

```
[1] "El cuadrado de 1 es 1"
```

```r
i <- 1:10
sprintf("El cuadrado de %d es %d", i, i^2)
```

```
 [1] "El cuadrado de 1 es 1"    "El cuadrado de 2 es 4"   
 [3] "El cuadrado de 3 es 9"    "El cuadrado de 4 es 16"  
 [5] "El cuadrado de 5 es 25"   "El cuadrado de 6 es 36"  
 [7] "El cuadrado de 7 es 49"   "El cuadrado de 8 es 64"  
 [9] "El cuadrado de 9 es 81"   "El cuadrado de 10 es 100"
```

Otras
========================================================
substring

```r
substring("Equator", 3, 5)
```

```
[1] "uat"
```
strsplit

```r
strsplit(c("06-16-2011", "4-16-2011"), split="-")
```

```
[[1]]
[1] "06"   "16"   "2011"

[[2]]
[1] "4"    "16"   "2011"
```
¿Qué devuelve?

Regexpr y 
======================================================
Encuentra la primer ocurrencia de un patrón en cada elemento


```r
regexpr("uat", "Equator")
```

```
[1] 3
attr(,"match.length")
[1] 3
attr(,"useBytes")
[1] TRUE
```

```r
regexpr("uat", c("Equator", "What", "Suat Equat"))
```

```
[1]  3 -1  2
attr(,"match.length")
[1]  3 -1  3
attr(,"useBytes")
[1] TRUE
```

Gregexpr
=================================================
Encuentra todas las ocurrencias de un patrón en cada elemento


```r
gregexpr("iss", "Mississippi")
```

```
[[1]]
[1] 2 5
attr(,"match.length")
[1] 3 3
attr(,"useBytes")
[1] TRUE
```

```r
gregexpr("iss", c("Mississippi", "Kiss", "Algo"))
```

```
[[1]]
[1] 2 5
attr(,"match.length")
[1] 3 3
attr(,"useBytes")
[1] TRUE

[[2]]
[1] 2
attr(,"match.length")
[1] 3
attr(,"useBytes")
[1] TRUE

[[3]]
[1] -1
attr(,"match.length")
[1] -1
attr(,"useBytes")
[1] TRUE
```

Expresiones Regulares
====================================================

Permiten especificar "comodines"


```r
library(stringr)
x <- c("apple", "banana", "pear")
str_match(x, ".a.")
```

```
     [,1] 
[1,] NA   
[2,] "ban"
[3,] "ear"
```

Metacaracteres
===================================================
¿Qué pasa si quiero encontrar un metacaracter literalmente?
 


```r
# encontrar los elementos con punto (f.g)
grep(".", c("abc", "de", "f.g"))
```

```
[1] 1 2 3
```

Está tomando el . como un metacaracter

"Escaping"
====================================================

Para que tome el punto literalemente, lo tengo que "escapar" con "\"

Pero "\" es otro metacaracter, así que lo tengo que escapar también:


```r
grep("\\.", c("abc", "de", "f.g"))
```

```
[1] 3
```

Anclas
==================================================
Texto al final o al principio de un string

```r
x
```

```
[1] "apple"  "banana" "pear"  
```

```r
str_match(x, "^a") # encontrar una a al principio
```

```
     [,1]
[1,] "a" 
[2,] NA  
[3,] NA  
```

```r
str_match(x, "a$") # al final
```

```
     [,1]
[1,] NA  
[2,] "a" 
[3,] NA  
```

Anclas (2)
======================================================

```r
y <- c("apple pie", "apple", "apple cake")
str_match(y, "apple")
```

```
     [,1]   
[1,] "apple"
[2,] "apple"
[3,] "apple"
```

```r
str_match(y, "^apple$")
```

```
     [,1]   
[1,] NA     
[2,] "apple"
[3,] NA     
```

Classes
========================================================

\d matchea cualquier digito

```r
x <- c("vab_2015", "algo", "nada", "pib_2015")
str_match(x, "\\d\\d\\d\\d$")
```

```
     [,1]  
[1,] "2015"
[2,] NA    
[3,] NA    
[4,] "2015"
```

Opciones y captura
========================================================


```r
x <- c("grey", "gray")
str_match(x, "gr(a|e)y")
```

```
     [,1]   [,2]
[1,] "grey" "e" 
[2,] "gray" "a" 
```

Repetición
=========================================================
? es 0 o 1

```r
x <- c("colour", "colr")
str_match(x, "col(ou)?r")
```

```
     [,1]     [,2]
[1,] "colour" "ou"
[2,] "colr"   NA  
```

Repetición y captura
=========================================================
`+` es 1 o mas

```r
x <- c("colour", "color", "colouur", "colouuuuuuuuuuuuuur")
str_match(x, "colou*r")
```

```
     [,1]                 
[1,] "colour"             
[2,] "color"              
[3,] "colouur"            
[4,] "colouuuuuuuuuuuuuur"
```
Con captura

```r
str_match(x, "colo(u+)r") # uau: captura
```

```
     [,1]                  [,2]            
[1,] "colour"              "u"             
[2,] NA                    NA              
[3,] "colouur"             "uu"            
[4,] "colouuuuuuuuuuuuuur" "uuuuuuuuuuuuuu"
```


Repetición (2)
=========================================================
`*` es 0 o mas

```r
x
```

```
[1] "colour"              "color"               "colouur"            
[4] "colouuuuuuuuuuuuuur"
```

```r
str_match(x, "colou+r")
```

```
     [,1]                 
[1,] "colour"             
[2,] NA                   
[3,] "colouur"            
[4,] "colouuuuuuuuuuuuuur"
```


Captura (2)
==========================================================
uso \\1 para referirme al primer grupo capturado


```r
x <- c("banana", "coconut", "cucumber", "jujube", "papaya", "salal berry")
str_match(x, "(..)\\1")
```

```
     [,1]   [,2]
[1,] "anan" "an"
[2,] "coco" "co"
[3,] "cucu" "cu"
[4,] "juju" "ju"
[5,] "papa" "pa"
[6,] "alal" "al"
```

Stringr
============================================================
Es un paquete de funciones con utilidades para usar las regexpr
(extraer y reemplazar texto, etc. )


```r
x <- c("apple", "banana", "pear")
str_detect(x, "e")
```

```
[1]  TRUE FALSE  TRUE
```

Ejercicios
=============================================================
words tiene un montón de palabras en inglés:

```r
head(words)
```

```
[1] "a"        "able"     "about"    "absolute" "accept"   "account" 
```

¿Cuántas empiezan con t?

```
[1] 65
```
¿Qué proporción terminan con una vocal?

```
[1] 0.2765306
```

En un data frame
============================================================

```r
library(tidyverse)
df <- tibble(
  word=words,
  i=seq_along(word)
)
```
Combinan bien con dplyr
==============================================================
Quedarse solo con las que terminan en x

```
# A tibble: 4 x 2
   word     i
  <chr> <int>
1   box   108
2   sex   747
3   six   772
4   tax   841
```

Ejercicios
=============================================================
Crear una columna con la cantidad de vocales de cada palabra y la cantidad de 
consonantes

```
# A tibble: 980 x 4
       word     i vocales consonantes
      <chr> <int>   <int>       <int>
 1        a     1       1           0
 2     able     2       2           2
 3    about     3       3           2
 4 absolute     4       4           4
 5   accept     5       2           4
 6  account     6       3           4
 7  achieve     7       4           3
 8   across     8       2           4
 9      act     9       1           2
10   active    10       3           3
# ... with 970 more rows
```

Ejercicio
=============================================================
Este código crea un pdf con un histograma y lo guarda en el directorio de trabajo


```r
pdf(fname)
hist(rnorm(100, sd=4))
dev.off()
```

Usando un for loop y la función paste, crear 5 histogramas y salvarlos en 5 archivos distintos, llamados hist1.pdf, hist2.pdf, ...


Deberes
========================================================


```r
swirl::install_course_github("ifunam", "programacion-estadistica-r")
```

Deberes: Bob
=======================================================
str_detect, toupper, trimws


Deberes: Phone number
=======================================================
str_match_all


Deberes: Word count
=======================================================
tolower, str_split, for 
