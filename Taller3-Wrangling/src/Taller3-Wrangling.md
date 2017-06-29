Taller3-Wrangling
========================================================
author: 
date: 
autosize: false

Dplyr
========================================================

Funciones para las tareas mÃ¡s comunes

- filter
- select
- arrange
- mutate
- summarise
- group_by

Muchas formas de hacer lo mismo
========================================================

Dplyr es un estÃ¡ndar que simplifica


Select
========================================================
Selecciona columnas

```r
library(dplyr)
msleep <- read.csv("../data/msleep_ggplot2.csv")
names(msleep)
```

```
 [1] "name"         "genus"        "vore"         "order"       
 [5] "conservation" "sleep_total"  "sleep_rem"    "sleep_cycle" 
 [9] "awake"        "brainwt"      "bodywt"      
```

```r
select(msleep, name, sleep_total)
```

```
                             name sleep_total
1                         Cheetah        12.1
2                      Owl monkey        17.0
3                 Mountain beaver        14.4
4      Greater short-tailed shrew        14.9
5                             Cow         4.0
6                Three-toed sloth        14.4
7               Northern fur seal         8.7
8                    Vesper mouse         7.0
9                             Dog        10.1
10                       Roe deer         3.0
11                           Goat         5.3
12                     Guinea pig         9.4
13                         Grivet        10.0
14                     Chinchilla        12.5
15                Star-nosed mole        10.3
16      African giant pouched rat         8.3
17      Lesser short-tailed shrew         9.1
18           Long-nosed armadillo        17.4
19                     Tree hyrax         5.3
20         North American Opossum        18.0
21                 Asian elephant         3.9
22                  Big brown bat        19.7
23                          Horse         2.9
24                         Donkey         3.1
25              European hedgehog        10.1
26                   Patas monkey        10.9
27      Western american chipmunk        14.9
28                   Domestic cat        12.5
29                         Galago         9.8
30                        Giraffe         1.9
31                    Pilot whale         2.7
32                      Gray seal         6.2
33                     Gray hyrax         6.3
34                          Human         8.0
35                 Mongoose lemur         9.5
36               African elephant         3.3
37           Thick-tailed opposum        19.4
38                        Macaque        10.1
39               Mongolian gerbil        14.2
40                 Golden hamster        14.3
41                          Vole         12.8
42                    House mouse        12.5
43               Little brown bat        19.9
44           Round-tailed muskrat        14.6
45                     Slow loris        11.0
46                           Degu         7.7
47     Northern grasshopper mouse        14.5
48                         Rabbit         8.4
49                          Sheep         3.8
50                     Chimpanzee         9.7
51                          Tiger        15.8
52                         Jaguar        10.4
53                           Lion        13.5
54                         Baboon         9.4
55                Desert hedgehog        10.3
56                          Potto        11.0
57                     Deer mouse        11.5
58                      Phalanger        13.7
59                   Caspian seal         3.5
60                Common porpoise         5.6
61                        Potoroo        11.1
62                Giant armadillo        18.1
63                     Rock hyrax         5.4
64                 Laboratory rat        13.0
65          African striped mouse         8.7
66                Squirrel monkey         9.6
67          Eastern american mole         8.4
68                     Cotton rat        11.3
69                       Mole rat        10.6
70         Arctic ground squirrel        16.6
71 Thirteen-lined ground squirrel        13.8
72 Golden-mantled ground squirrel        15.9
73                     Musk shrew        12.8
74                            Pig         9.1
75            Short-nosed echidna         8.6
76      Eastern american chipmunk        15.8
77                Brazilian tapir         4.4
78                         Tenrec        15.6
79                     Tree shrew         8.9
80           Bottle-nosed dolphin         5.2
81                          Genet         6.3
82                     Arctic fox        12.5
83                        Red fox         9.8
```

Select (2)
========================================================
Muchas variaciones

```r
library(dplyr)
head(select(msleep, -name))
```

```
       genus  vore        order conservation sleep_total sleep_rem
1   Acinonyx carni    Carnivora           lc        12.1        NA
2      Aotus  omni     Primates         <NA>        17.0       1.8
3 Aplodontia herbi     Rodentia           nt        14.4       2.4
4    Blarina  omni Soricomorpha           lc        14.9       2.3
5        Bos herbi Artiodactyla domesticated         4.0       0.7
6   Bradypus herbi       Pilosa         <NA>        14.4       2.2
  sleep_cycle awake brainwt  bodywt
1          NA  11.9      NA  50.000
2          NA   7.0 0.01550   0.480
3          NA   9.6      NA   1.350
4   0.1333333   9.1 0.00029   0.019
5   0.6666667  20.0 0.42300 600.000
6   0.7666667   9.6      NA   3.850
```

```r
head(select(msleep, starts_with("sl")))
```

```
  sleep_total sleep_rem sleep_cycle
1        12.1        NA          NA
2        17.0       1.8          NA
3        14.4       2.4          NA
4        14.9       2.3   0.1333333
5         4.0       0.7   0.6666667
6        14.4       2.2   0.7666667
```

```r
# ends_with, contains, matches, one_ofS
```
Filter
========================================================
Selecciona filas

```r
filter(msleep, sleep_total >= 16)
```

```
                    name        genus    vore           order conservation
1             Owl monkey        Aotus    omni        Primates         <NA>
2   Long-nosed armadillo      Dasypus   carni       Cingulata           lc
3 North American Opossum    Didelphis    omni Didelphimorphia           lc
4          Big brown bat    Eptesicus insecti      Chiroptera           lc
5   Thick-tailed opposum   Lutreolina   carni Didelphimorphia           lc
6       Little brown bat       Myotis insecti      Chiroptera         <NA>
7        Giant armadillo   Priodontes insecti       Cingulata           en
8 Arctic ground squirrel Spermophilus   herbi        Rodentia           lc
  sleep_total sleep_rem sleep_cycle awake brainwt bodywt
1        17.0       1.8          NA   7.0 0.01550  0.480
2        17.4       3.1   0.3833333   6.6 0.01080  3.500
3        18.0       4.9   0.3333333   6.0 0.00630  1.700
4        19.7       3.9   0.1166667   4.3 0.00030  0.023
5        19.4       6.6          NA   4.6      NA  0.370
6        19.9       2.0   0.2000000   4.1 0.00025  0.010
7        18.1       6.1          NA   5.9 0.08100 60.000
8        16.6        NA          NA   7.4 0.00570  0.920
```

```r
filter(msleep, sleep_total >= 16, bodywt >= 1)
```

```
                    name      genus    vore           order conservation
1   Long-nosed armadillo    Dasypus   carni       Cingulata           lc
2 North American Opossum  Didelphis    omni Didelphimorphia           lc
3        Giant armadillo Priodontes insecti       Cingulata           en
  sleep_total sleep_rem sleep_cycle awake brainwt bodywt
1        17.4       3.1   0.3833333   6.6  0.0108    3.5
2        18.0       4.9   0.3333333   6.0  0.0063    1.7
3        18.1       6.1          NA   5.9  0.0810   60.0
```

```r
filter(msleep, order %in% c("Perissodactyla", "Primates"))
```

```
              name         genus  vore          order conservation
1       Owl monkey         Aotus  omni       Primates         <NA>
2           Grivet Cercopithecus  omni       Primates           lc
3            Horse         Equus herbi Perissodactyla domesticated
4           Donkey         Equus herbi Perissodactyla domesticated
5     Patas monkey  Erythrocebus  omni       Primates           lc
6           Galago        Galago  omni       Primates         <NA>
7            Human          Homo  omni       Primates         <NA>
8   Mongoose lemur         Lemur herbi       Primates           vu
9          Macaque        Macaca  omni       Primates         <NA>
10      Slow loris     Nyctibeus carni       Primates         <NA>
11      Chimpanzee           Pan  omni       Primates         <NA>
12          Baboon         Papio  omni       Primates         <NA>
13           Potto  Perodicticus  omni       Primates           lc
14 Squirrel monkey       Saimiri  omni       Primates         <NA>
15 Brazilian tapir       Tapirus herbi Perissodactyla           vu
   sleep_total sleep_rem sleep_cycle awake brainwt  bodywt
1         17.0       1.8          NA   7.0  0.0155   0.480
2         10.0       0.7          NA  14.0      NA   4.750
3          2.9       0.6   1.0000000  21.1  0.6550 521.000
4          3.1       0.4          NA  20.9  0.4190 187.000
5         10.9       1.1          NA  13.1  0.1150  10.000
6          9.8       1.1   0.5500000  14.2  0.0050   0.200
7          8.0       1.9   1.5000000  16.0  1.3200  62.000
8          9.5       0.9          NA  14.5      NA   1.670
9         10.1       1.2   0.7500000  13.9  0.1790   6.800
10        11.0        NA          NA  13.0  0.0125   1.400
11         9.7       1.4   1.4166667  14.3  0.4400  52.200
12         9.4       1.0   0.6666667  14.6  0.1800  25.235
13        11.0        NA          NA  13.0      NA   1.100
14         9.6       1.4          NA  14.4  0.0200   0.743
15         4.4       1.0   0.9000000  19.6  0.1690 207.501
```

El Ãºltimo usa el operador %in%

Arrange
========================================================
Ordena las filas

```r
msleep %>% arrange(sleep_total) %>% head
```

```
              name         genus  vore          order conservation
1          Giraffe       Giraffa herbi   Artiodactyla           cd
2      Pilot whale Globicephalus carni        Cetacea           cd
3            Horse         Equus herbi Perissodactyla domesticated
4         Roe deer     Capreolus herbi   Artiodactyla           lc
5           Donkey         Equus herbi Perissodactyla domesticated
6 African elephant     Loxodonta herbi    Proboscidea           vu
  sleep_total sleep_rem sleep_cycle awake brainwt   bodywt
1         1.9       0.4          NA 22.10      NA  899.995
2         2.7       0.1          NA 21.35      NA  800.000
3         2.9       0.6           1 21.10  0.6550  521.000
4         3.0        NA          NA 21.00  0.0982   14.800
5         3.1       0.4          NA 20.90  0.4190  187.000
6         3.3        NA          NA 20.70  5.7120 6654.000
```



%>%
========================================================
Sirve para combinar funciones y poder leerlas de izquierda a derecha


```r
x %>% f(y) 
#es equivalente a 
f(x,y)
```

%>% (2)
========================================================
El nombre de los omnivoros que duermen mas de 15 horas:


```r
select(filter(msleep, sleep_total > 15), name)
```

```
                             name
1                      Owl monkey
2            Long-nosed armadillo
3          North American Opossum
4                   Big brown bat
5            Thick-tailed opposum
6                Little brown bat
7                           Tiger
8                 Giant armadillo
9          Arctic ground squirrel
10 Golden-mantled ground squirrel
11      Eastern american chipmunk
12                         Tenrec
```

***

Es equivalente a:


```r
msleep %>%
  filter(sleep_total > 15) %>%
  select(name)
```

```
                             name
1                      Owl monkey
2            Long-nosed armadillo
3          North American Opossum
4                   Big brown bat
5            Thick-tailed opposum
6                Little brown bat
7                           Tiger
8                 Giant armadillo
9          Arctic ground squirrel
10 Golden-mantled ground squirrel
11      Eastern american chipmunk
12                         Tenrec
```

Demo
========================================================
Una tarea concreta: Datos de ZZFF


Problema con los ruts



|   |rut           |razon_social      | empleados|
|:--|:-------------|:-----------------|---------:|
|20 |213154420012  |AAAAA BBBBBBBBB   |         5|
|21 |215085700011  |CCCCCCCC S.A.     |         2|
|22 |214203290014  |DDDDDDD S.A.      |         1|
|23 |212152060010  |EEEEE FFFFFF S.A. |       185|
|24 |1215917590016 |HHHHHH S.A.       |         6|
|25 |2215917590016 |HHHHHH S.A.       |         1|



Funciones varias
========================================================

Importantes:

- mutate, select, filter, arrange
- ifelse

***

Auxiliares:

- nchar
- as.character
- substr


Datos para testing
========================================================


```r
ruts <- c("214203290014", "212152060010","1215917590016", "2215917590016")
```

Necesitamos una funciÃ³n que nos de el RUT y el local por separado

Auxiliares
========================================================
Son vectoriales!

```r
ruts
```

```
[1] "214203290014"  "212152060010"  "1215917590016" "2215917590016"
```

```r
nchar(ruts)
```

```
[1] 12 12 13 13
```

```r
substr(ruts, 1, 2)
```

```
[1] "21" "21" "12" "22"
```


If Else
========================================================


```r
ruts
```

```
[1] "214203290014"  "212152060010"  "1215917590016" "2215917590016"
```

```r
ifelse(nchar(ruts)==13, "Trece", "Distinto de Trece")
```

```
[1] "Distinto de Trece" "Distinto de Trece" "Trece"            
[4] "Trece"            
```

Pregunta
========================================================
Â¿CÃ³mo definirÃ­an una funciÃ³n que toma un vector de nÃºmeros y devuelve
un vector de caracteres "Distinto de trece", "trece" ? 

```r
ruts
```

```
[1] "214203290014"  "212152060010"  "1215917590016" "2215917590016"
```

```r
trece <- function(vector) {
  ifelse(nchar(ruts)>13, "Trece", "Distinto de Trece")
}
trece(ruts)
```

```
[1] "Distinto de Trece" "Distinto de Trece" "Distinto de Trece"
[4] "Distinto de Trece"
```

SoluciÃ³n (1)
========================================================
Una funciÃ³n que recibe un vector de ruts y me da un vector con el nÃºmero de local


```r
extrae_local <- function(ruts) {
  ifelse(nchar(ruts) == 13,
         substr(ruts,1,1),
         1)
}
ruts
```

```
[1] "214203290014"  "212152060010"  "1215917590016" "2215917590016"
```

```r
extrae_local(ruts)
```

```
[1] "1" "1" "1" "2"
```
SoluciÃ³n (2)
========================================================
Una funciÃ³n que recibe un vector de ruts y me da un vector con el nÃºmero de rut


```r
extrae_rut <- function(ruts) {
  ifelse(nchar(ruts) == 13,
    substr(ruts,2,13),
    ruts)
}
ruts
```

```
[1] "214203290014"  "212152060010"  "1215917590016" "2215917590016"
```

```r
extrae_rut(ruts)
```

```
[1] "214203290014" "212152060010" "215917590016" "215917590016"
```

SoluciÃ³n (3)
=======================================================
Abro los datos

```r
library(readr)
test <-  read_csv('../data/ruts_ejemplo.csv', col_types= list(rut=col_character(), razon_social=col_character(), empleados=col_double(), ciiu=col_character()))
test
```

```
# A tibble: 6 × 4
            rut      razon_social empleados  ciiu
          <chr>             <chr>     <dbl> <chr>
1  213154420012   AAAAA BBBBBBBBB         5   111
2  215085700011     CCCCCCCC S.A.         2   112
3  214203290014      DDDDDDD S.A.         1  3311
4  212152060010 EEEEE FFFFFF S.A.       185   112
5 1215917590016       HHHHHH S.A.         6  3510
6 2215917590016       HHHHHH S.A.         1   111
```

SoluciÃ³n (3)
=======================================================


```r
final <- test %>% mutate(rut_nuevo=extrae_rut(rut), local=as.numeric(extrae_local(rut)))
final
```

```
# A tibble: 6 × 6
            rut      razon_social empleados  ciiu    rut_nuevo local
          <chr>             <chr>     <dbl> <chr>        <chr> <dbl>
1  213154420012   AAAAA BBBBBBBBB         5   111 213154420012     1
2  215085700011     CCCCCCCC S.A.         2   112 215085700011     1
3  214203290014      DDDDDDD S.A.         1  3311 214203290014     1
4  212152060010 EEEEE FFFFFF S.A.       185   112 212152060010     1
5 1215917590016       HHHHHH S.A.         6  3510 215917590016     1
6 2215917590016       HHHHHH S.A.         1   111 215917590016     2
```


SoluciÃ³n (4)
=======================================================


```r
final <- test %>% 
  mutate(rut_nuevo=extrae_rut(rut), extrae_local=extrae_local(rut)) %>%
  group_by(rut_nuevo) %>%
  summarize(razon_social=first(razon_social),
            empleados=sum(empleados),
            locales=n())

final
```

```
# A tibble: 5 × 4
     rut_nuevo      razon_social empleados locales
         <chr>             <chr>     <dbl>   <int>
1 212152060010 EEEEE FFFFFF S.A.       185       1
2 213154420012   AAAAA BBBBBBBBB         5       1
3 214203290014      DDDDDDD S.A.         1       1
4 215085700011     CCCCCCCC S.A.         2       1
5 215917590016       HHHHHH S.A.         7       2
```


Otro Problema con datos de ZZFF
=======================================================
CorrecciÃ³n de las exportaciones a Uruguay



```r
ej <- readRDS('../data/ejemplo_expors.rds')
head(ej$N2) # N1 tiene las exportaciones
```

```
[1] 3382879166    4735149  161700000 1015457002          0  327324647
```

```r
head(ej$N2_1, 20) # N2_1, N2_2, ... tiene el destino
```

```
 [1] "Brasil"         "Republica Domi" "Brasil"         "Venezuela"     
 [5] "Seleccionar"    "Paraguay"       "Chile"          "Seleccionar"   
 [9] "Seleccionar"    "Seleccionar"    "Seleccionar"    "Brasil"        
[13] "Seleccionar"    "Venezuela"      "Seleccionar"    "Seleccionar"   
[17] "Seleccionar"    "Mexico"         "Brasil"         "Seleccionar"   
```

```r
head(ej$NP1_2, 20) # NP1_2, NP2_2, ... tiene el porcentaje a ese destino
```

```
 [1]  41  50  25  98   0  99  50   0   0   0   0  98   0  84   0   0   0
[18]  61 100   0
```

Agrego la tasa de exportaciones a UY
=======================================================
Correccion de las exportaciones a Uruguay



```r
library(dplyr)
tasa_expor_uy <- function(N2_1, N2_2, N2_3, N2_4, N2_5, N2_6, N2_7, N2_8,
                          NP1_2, NP2_2, NP3_2, NP4_2, NP5_2, NP6_2, NP7_2, NP8_2) {
    case_when(
        N2_1 == "Uruguay" ~ NP1_2,
        N2_2 == "Uruguay" ~ NP2_2,
        N2_3 == "Uruguay" ~ NP3_2,
        N2_4 == "Uruguay" ~ NP4_2,
        N2_5 == "Uruguay" ~ NP5_2,
        N2_6 == "Uruguay" ~ NP6_2,
        N2_7 == "Uruguay" ~ NP7_2,
        N2_8 == "Uruguay" ~ NP8_2,
        TRUE ~ 0L)
}

con_tasa <- ej %>% mutate(tasa_expor_uy = tasa_expor_uy(N2_1, N2_2, N2_3, N2_4, N2_5, N2_6, N2_7, N2_8, NP1_2, NP2_2, NP3_2, NP4_2, NP5_2, NP6_2, NP7_2, NP8_2),
                          export_corregidas=N2*(100-tasa_expor_uy)/100)

con_tasa[c(229, 695),c("N2", "export_corregidas", "tasa_expor_uy")]
```

```
          N2 export_corregidas tasa_expor_uy
229 76099922          71533927             6
695 95398121          62008779            35
```



Funciones personalizadas
=======================================================
Ademas de usar las funciones que nos da R, podemos crear las nuestras.



```r
sum.of.squares <- function(x,y) {
  x^2 + y^2
}
sum.of.squares(3, 4)
```

```
[1] 25
```

```r
sum.of.squares(c(3, 2), c(2, 9))
```

```
[1] 13 85
```
x e y son vectores!!

IteraciÃ³n(1)
=======================================================
Bucles - Permiten repetir una acciÃ³n:

```r
es_par <- function(num) {
  if (num %% 2 == 0) print("par")
  else print("impar")
}
```

??Cual es la diferencia con if-else?

IteraciÃ³n(1)
=======================================================


```r
my_list <- c(2, 3, 4, 5, 6, 7, 8)
n <- length(my_list)
for(i in 1:n) {
  es_par(my_list[[i]])
}
```

```
[1] "par"
[1] "impar"
[1] "par"
[1] "impar"
[1] "par"
[1] "impar"
[1] "par"
```

IteraciÃ³n(2)
=======================================================


```r
my_list <- c(2, 3, 4, 5, 6, 7, 8)

sapply(my_list, es_par)
```

```
[1] "par"
[1] "impar"
[1] "par"
[1] "impar"
[1] "par"
[1] "impar"
[1] "par"
```

```
[1] "par"   "impar" "par"   "impar" "par"   "impar" "par"  
```

Ejemplo con CIIUs
=======================================================
Tenemos un archivo con una tabla de correspondencias entre cÃ³digos CIIUs y clasificaciones

| ciiu|clasif    |
|----:|:---------|
|  111|Bienes    |
|  112|Comercial |
|  113|Bienes    |
|  114|Trading   |


Solucion 1
=======================================================



```r
buscar_clasificaciones <- function(vector) {
    buscar_clasificacion <- function(ciiu) {
        read_tsv("../data/ciius.csv", col_types = list(col_character(), col_character())) %>%
            filter(CIIU==ciiu) %>%
            select(Clasificacion) %>%
            as.character
    }
    sapply(vector, buscar_clasificacion)
}

buscar_clasificaciones(c("111", "112", "3311", "3510"))
```

```
                       111                        112 
                  "Bienes"                   "Bienes" 
                      3311                       3510 
"Instalacion y reparacion"         "Bienes Naturales" 
```

```r
test$clasif <- buscar_clasificaciones(test$ciiu)
test
```

```
# A tibble: 6 × 5
            rut      razon_social empleados  ciiu                   clasif
          <chr>             <chr>     <dbl> <chr>                    <chr>
1  213154420012   AAAAA BBBBBBBBB         5   111                   Bienes
2  215085700011     CCCCCCCC S.A.         2   112                   Bienes
3  214203290014      DDDDDDD S.A.         1  3311 Instalacion y reparacion
4  212152060010 EEEEE FFFFFF S.A.       185   112                   Bienes
5 1215917590016       HHHHHH S.A.         6  3510         Bienes Naturales
6 2215917590016       HHHHHH S.A.         1   111                   Bienes
```

Joins
=======================================================
Verbos para dos tablas

- Left join, right join, full join.
- Semi-join, anti-join
- Intersect, Union, setdiff

Especificar las columnas
=======================================================
x esta en los dos data frames


```r
df1 <- data_frame(x = c(1, 2), y = 2:1)
df2 <- data_frame(x = c(1, 3), a = 10, b = "a")
df1
```

```
# A tibble: 2 × 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 × 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3    10     a
```
La opciÃ³n by permite elegir los campos cuando tienen distinto nombre o hay varios que coinciden

Left join
=======================================================
Se queda con todas las filas del primer arg (right join lo opuesto)


```r
df1
```

```
# A tibble: 2 × 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 × 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3    10     a
```

```r
left_join(df1, df2)
```

```
# A tibble: 2 × 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
2     2     1    NA  <NA>
```

Pone NA en los que no aplican y todas las columnas

Inner join
=======================================================
Se queda con todas las filas que estan en los dos df


```r
df1
```

```
# A tibble: 2 × 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 × 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3    10     a
```

```r
inner_join(df1, df2)
```

```
# A tibble: 1 × 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
```

Full join
=======================================================
Se queda con todas las filas que estan en los dos df


```r
df1
```

```
# A tibble: 2 × 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 × 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3    10     a
```

```r
full_join(df1, df2)
```

```
# A tibble: 3 × 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
2     2     1    NA  <NA>
3     3    NA    10     a
```

Semi join
=======================================================
Se queda con todas las filas que estan en los dos df


```r
df1
```

```
# A tibble: 2 × 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 × 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3    10     a
```

```r
semi_join(df1, df2)
```

```
# A tibble: 1 × 2
      x     y
  <dbl> <int>
1     1     2
```


Anti join
=======================================================
Saca las filas de df1 que estan en y


```r
df1
```

```
# A tibble: 2 × 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 × 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3    10     a
```

```r
anti_join(df1, df2)
```

```
# A tibble: 1 × 2
      x     y
  <dbl> <int>
1     2     1
```


Otra soluciÃ³n al problema de los CIIUS
=======================================================

```r
tabla <- read_tsv("../data/ciius.csv", col_types = list(col_character(), col_character()))
test %>% left_join(tabla, c("ciiu"="CIIU"))
```

```
# A tibble: 6 × 6
            rut      razon_social empleados  ciiu                   clasif
          <chr>             <chr>     <dbl> <chr>                    <chr>
1  213154420012   AAAAA BBBBBBBBB         5   111                   Bienes
2  215085700011     CCCCCCCC S.A.         2   112                   Bienes
3  214203290014      DDDDDDD S.A.         1  3311 Instalacion y reparacion
4  212152060010 EEEEE FFFFFF S.A.       185   112                   Bienes
5 1215917590016       HHHHHH S.A.         6  3510         Bienes Naturales
6 2215917590016       HHHHHH S.A.         1   111                   Bienes
# ... with 1 more variables: Clasificacion <chr>
```

```r
test
```

```
# A tibble: 6 × 5
            rut      razon_social empleados  ciiu                   clasif
          <chr>             <chr>     <dbl> <chr>                    <chr>
1  213154420012   AAAAA BBBBBBBBB         5   111                   Bienes
2  215085700011     CCCCCCCC S.A.         2   112                   Bienes
3  214203290014      DDDDDDD S.A.         1  3311 Instalacion y reparacion
4  212152060010 EEEEE FFFFFF S.A.       185   112                   Bienes
5 1215917590016       HHHHHH S.A.         6  3510         Bienes Naturales
6 2215917590016       HHHHHH S.A.         1   111                   Bienes
```

```r
getwd()
```

```
[1] "C:/Users/rlabuonora/Desktop/taller_R/Taller3-Wrangling/src"
```


Tidy data
=======================================================
- Cada observacion tiene que ser una fila
- Cada variable tiene que ser una columna


"Happy families are all alike; every unhappy family is unhappy in its own way." Leo Tolstoy

"Tidy datasets are all alike, but every messy dataset is messy in its own way." Hadley Wickham


Tidy data (2) 
=======================================================

```r
library(tidyverse)
table1
```

```
# A tibble: 6 × 4
      country  year  cases population
        <chr> <int>  <int>      <int>
1 Afghanistan  1999    745   19987071
2 Afghanistan  2000   2666   20595360
3      Brazil  1999  37737  172006362
4      Brazil  2000  80488  174504898
5       China  1999 212258 1272915272
6       China  2000 213766 1280428583
```



Calcular la tasa de enfermos
=======================================================

```r
library(tidyverse)
table1 %>% 
  mutate(tasa=cases/population)
```

```
# A tibble: 6 × 5
      country  year  cases population         tasa
        <chr> <int>  <int>      <int>        <dbl>
1 Afghanistan  1999    745   19987071 0.0000372741
2 Afghanistan  2000   2666   20595360 0.0001294466
3      Brazil  1999  37737  172006362 0.0002193930
4      Brazil  2000  80488  174504898 0.0004612363
5       China  1999 212258 1272915272 0.0001667495
6       China  2000 213766 1280428583 0.0001669488
```

Casos por ano
=======================================================

```r
library(tidyverse)
table1 %>% 
  group_by(year) %>%
  summarize(n=sum(cases))
```

```
# A tibble: 2 × 2
   year      n
  <int>  <int>
1  1999 250740
2  2000 296920
```





Untidy data (3) 
=======================================================

```r
table2
```

```
# A tibble: 12 × 4
       country  year       type      count
         <chr> <int>      <chr>      <int>
1  Afghanistan  1999      cases        745
2  Afghanistan  1999 population   19987071
3  Afghanistan  2000      cases       2666
4  Afghanistan  2000 population   20595360
5       Brazil  1999      cases      37737
6       Brazil  1999 population  172006362
7       Brazil  2000      cases      80488
8       Brazil  2000 population  174504898
9        China  1999      cases     212258
10       China  1999 population 1272915272
11       China  2000      cases     213766
12       China  2000 population 1280428583
```

Untidy data (4) 
=======================================================

```r
table3
```

```
# A tibble: 6 × 3
      country  year              rate
*       <chr> <int>             <chr>
1 Afghanistan  1999      745/19987071
2 Afghanistan  2000     2666/20595360
3      Brazil  1999   37737/172006362
4      Brazil  2000   80488/174504898
5       China  1999 212258/1272915272
6       China  2000 213766/1280428583
```

Untidy data (5) 
=======================================================

```r
table4a
```

```
# A tibble: 3 × 3
      country `1999` `2000`
*       <chr>  <int>  <int>
1 Afghanistan    745   2666
2      Brazil  37737  80488
3       China 212258 213766
```

Untidy data (6) 
=======================================================

```r
table4b
```

```
# A tibble: 3 × 3
      country     `1999`     `2000`
*       <chr>      <int>      <int>
1 Afghanistan   19987071   20595360
2      Brazil  172006362  174504898
3       China 1272915272 1280428583
```

Untidy data
=======================================================
Se pueden lograr los mismos resultados a partir del resto de las tablas.
Pero si primero llevamos los datos a una forma "canonica", podemos usar 
las funciones de dplyr.

Spread
=======================================================

```r
table2
```

```
# A tibble: 12 × 4
       country  year       type      count
         <chr> <int>      <chr>      <int>
1  Afghanistan  1999      cases        745
2  Afghanistan  1999 population   19987071
3  Afghanistan  2000      cases       2666
4  Afghanistan  2000 population   20595360
5       Brazil  1999      cases      37737
6       Brazil  1999 population  172006362
7       Brazil  2000      cases      80488
8       Brazil  2000 population  174504898
9        China  1999      cases     212258
10       China  1999 population 1272915272
11       China  2000      cases     213766
12       China  2000 population 1280428583
```


```r
  spread(table2, key=type, value=count )
```

```
# A tibble: 6 × 4
      country  year  cases population
*       <chr> <int>  <int>      <int>
1 Afghanistan  1999    745   19987071
2 Afghanistan  2000   2666   20595360
3      Brazil  1999  37737  172006362
4      Brazil  2000  80488  174504898
5       China  1999 212258 1272915272
6       China  2000 213766 1280428583
```


Gather
=======================================================

```r
t4a <- gather(table4a, `1999`, `2000`, key="year", value="cases")
t4b <- gather(table4b, `1999`, `2000`, key="year", value="population")
left_join(t4a, t4b)
```

```
# A tibble: 6 × 4
      country  year  cases population
        <chr> <chr>  <int>      <int>
1 Afghanistan  1999    745   19987071
2      Brazil  1999  37737  172006362
3       China  1999 212258 1272915272
4 Afghanistan  2000   2666   20595360
5      Brazil  2000  80488  174504898
6       China  2000 213766 1280428583
```

