Taller6-Strings
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
# i <- 1:10
# sprintf("El cuadrado de %d es %d", i, i^2)
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
strsplit("6-16-2011", split="-")
```

```
[[1]]
[1] "6"    "16"   "2011"
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
str_match(x, "\\d\\d\\d\\d")
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
x <- c("colour", "color")
str_match(x, "colou?r")
```

```
     [,1]    
[1,] "colour"
[2,] "color" 
```

Repetición y captura
=========================================================
`+` es 1 o mas

```r
x <- c("colour", "color", "colouur", "colouuuur")
str_match(x, "colou+r")
```

```
     [,1]       
[1,] "colour"   
[2,] NA         
[3,] "colouur"  
[4,] "colouuuur"
```
Con captura

```r
str_match(x, "colo(u+)r") # uau: captura
```

```
     [,1]        [,2]  
[1,] "colour"    "u"   
[2,] NA          NA    
[3,] "colouur"   "uu"  
[4,] "colouuuur" "uuuu"
```


Repetición (2)
=========================================================
`*` es 0 o mas

```r
x
```

```
[1] "colour"    "color"     "colouur"   "colouuuur"
```

```r
str_match(x, "colou+r")
```

```
     [,1]       
[1,] "colour"   
[2,] NA         
[3,] "colouur"  
[4,] "colouuuur"
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

```r
sum(str_detect(words, "^t"))
```

```
[1] 65
```
¿Qué proporción terminan con una vocal?

```r
mean(str_detect(words, "[aeiou]$"))
```

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
Me quedo con las que terminan en x

```r
df %>% filter(str_detect(word, "x$"))
```

```
# A tibble: 4 x 2
   word     i
  <chr> <int>
1   box   108
2   sex   747
3   six   772
4   tax   841
```


=============================================================
words tiene un montón de palabras en inglés



Deberes
========================================================


```r
swirl::install_course_github("ifunam", "programacion-estadistica-r")
```

