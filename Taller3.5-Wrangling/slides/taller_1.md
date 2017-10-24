Taller 1
============================================
autosize: true


Select
========================================================
Selecciona columnas
chau

```r
library(dplyr)
msleep <- read.csv("../../Taller3-Wrangling/data/msleep_ggplot2.csv")
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
Helpers to use with select


```r
# starts_with(): starts with a prefix
head(select(msleep, starts_with("sl"))) #seleccina las que empiezan con "sl"
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
    #ends_with(): ends with a prefix
    #contains(): contains a literal string

#matches(): matches a regular expression

#one_of(): select columns whose names are in a group of names

data3<-msleep
head(select(data3, one_of(c("name", "sleep_total" ))))
```

```
                        name sleep_total
1                    Cheetah        12.1
2                 Owl monkey        17.0
3            Mountain beaver        14.4
4 Greater short-tailed shrew        14.9
5                        Cow         4.0
6           Three-toed sloth        14.4
```

```r
head(select(msleep, genus:order)) #select columns from "genus" to "order" (inclusive)
```

```
       genus  vore        order
1   Acinonyx carni    Carnivora
2      Aotus  omni     Primates
3 Aplodontia herbi     Rodentia
4    Blarina  omni Soricomorpha
5        Bos herbi Artiodactyla
6   Bradypus herbi       Pilosa
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


Arrange
========================================================
Ordena las filas por el valor de una columna

```r
msleep %>% arrange(-sleep_total) %>% head   #signo de menos indica descendente
```

```
                    name      genus    vore           order conservation
1       Little brown bat     Myotis insecti      Chiroptera         <NA>
2          Big brown bat  Eptesicus insecti      Chiroptera           lc
3   Thick-tailed opposum Lutreolina   carni Didelphimorphia           lc
4        Giant armadillo Priodontes insecti       Cingulata           en
5 North American Opossum  Didelphis    omni Didelphimorphia           lc
6   Long-nosed armadillo    Dasypus   carni       Cingulata           lc
  sleep_total sleep_rem sleep_cycle awake brainwt bodywt
1        19.9       2.0   0.2000000   4.1 0.00025  0.010
2        19.7       3.9   0.1166667   4.3 0.00030  0.023
3        19.4       6.6          NA   4.6      NA  0.370
4        18.1       6.1          NA   5.9 0.08100 60.000
5        18.0       4.9   0.3333333   6.0 0.00630  1.700
6        17.4       3.1   0.3833333   6.6 0.01080  3.500
```


%>%
========================================================
Sirve para combinar funciones y poder leerlas de izquierda a derecha

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

Mutate & family
========================================================

Mutate: Compute new column(s)

```r
msleep %>%
mutate(sleep_new=sleep_total + sleep_rem) %>%
head()
```

```
                        name      genus  vore        order conservation
1                    Cheetah   Acinonyx carni    Carnivora           lc
2                 Owl monkey      Aotus  omni     Primates         <NA>
3            Mountain beaver Aplodontia herbi     Rodentia           nt
4 Greater short-tailed shrew    Blarina  omni Soricomorpha           lc
5                        Cow        Bos herbi Artiodactyla domesticated
6           Three-toed sloth   Bradypus herbi       Pilosa         <NA>
  sleep_total sleep_rem sleep_cycle awake brainwt  bodywt sleep_new
1        12.1        NA          NA  11.9      NA  50.000        NA
2        17.0       1.8          NA   7.0 0.01550   0.480      18.8
3        14.4       2.4          NA   9.6      NA   1.350      16.8
4        14.9       2.3   0.1333333   9.1 0.00029   0.019      17.2
5         4.0       0.7   0.6666667  20.0 0.42300 600.000       4.7
6        14.4       2.2   0.7666667   9.6      NA   3.850      16.6
```

Transmute: Compute new column(s), drop others.

```r
head(transmute(msleep,sleep_new=sleep_rem+sleep_total))
```

```
  sleep_new
1        NA
2      18.8
3      16.8
4      17.2
5       4.7
6      16.6
```

Mutate_if: Apply funs to all columns of one type. Reemplaza los datos antiguos con los nuevos.

```r
msleep %>% 
mutate_if(is.numeric, log2)%>% 
head()
```

```
                        name      genus  vore        order conservation
1                    Cheetah   Acinonyx carni    Carnivora           lc
2                 Owl monkey      Aotus  omni     Primates         <NA>
3            Mountain beaver Aplodontia herbi     Rodentia           nt
4 Greater short-tailed shrew    Blarina  omni Soricomorpha           lc
5                        Cow        Bos herbi Artiodactyla domesticated
6           Three-toed sloth   Bradypus herbi       Pilosa         <NA>
  sleep_total  sleep_rem sleep_cycle    awake    brainwt     bodywt
1    3.596935         NA          NA 3.572890         NA  5.6438562
2    4.087463  0.8479969          NA 2.807355  -6.011588 -1.0588937
3    3.847997  1.2630344          NA 3.263034         NA  0.4329594
4    3.897240  1.2016339  -2.9068906 3.185867 -11.751659 -5.7178568
5    2.000000 -0.5145732  -0.5849625 4.321928  -1.241270  9.2288187
6    3.847997  1.1375035  -0.3833286 3.263034         NA  1.9448584
```

Mutate_all: Apply funs to every column. 

```r
msleep %>% 
  select(sleep_total, sleep_rem) %>%
  mutate_all(funs(log(.),log2(.))) %>%  
  names()
```

```
[1] "sleep_total"      "sleep_rem"        "sleep_total_log" 
[4] "sleep_rem_log"    "sleep_total_log2" "sleep_rem_log2"  
```

Mutate_at: Apply funs to specific columns. 

```r
msleep %>%
mutate_at(vars(sleep_total),funs(log(.),log2(.))) %>%
  names()
```

```
 [1] "name"         "genus"        "vore"         "order"       
 [5] "conservation" "sleep_total"  "sleep_rem"    "sleep_cycle" 
 [9] "awake"        "brainwt"      "bodywt"       "log"         
[13] "log2"        
```


Joins: Especificar las columnas que usaremos para hacer el join
=======================================================
"x" está en los dos data frames


```r
df1 <- data_frame(x = c(1, 2), y = 2:1)
df2 <- data_frame(x = c(1, 3), a = 10, b = "a")
df1
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 x 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3    10     a
```

Left join: left_join(x, y)
=======================================================
Returns all rows from "x", and all columns from "x" and "y" for the matching values.

Por default, toma todas las columnas que tienen los mismos nombres en ambas matrices. En este caso, solamente la variable "x".


```r
df1
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 x 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3    10     a
```

```r
left_join(df1, df2)
```

```
# A tibble: 2 x 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
2     2     1    NA  <NA>
```


Right join: right_join (x,y)
=======================================================
Returns all rows from y, and all columns from x and y.

```r
df1
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 x 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3    10     a
```

```r
right_join(df1, df2)
```

```
# A tibble: 2 x 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
2     3    NA    10     a
```

¿Qué pasa con los casos límite? (no match, multiple matches)
=======================================================
No matches

```r
df10 <- data_frame(x = c(1, 2), y = 2:1)
df11 <- data_frame(x = c(4, 3), a = 10, b = "a")
df10
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df11
```

```
# A tibble: 2 x 3
      x     a     b
  <dbl> <dbl> <chr>
1     4    10     a
2     3    10     a
```

```r
left_join(df10, df11)
```

```
# A tibble: 2 x 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    NA  <NA>
2     2     1    NA  <NA>
```

***

Multiple matches (duplica observaciones)

```r
df13 <- data_frame(x = c(1, 2), y = 2:1)
df9 <- data_frame(x = c(1, 3,1), a = c(10,9,8), b = "a")
df13
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df9
```

```
# A tibble: 3 x 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3     9     a
3     1     8     a
```

```r
left_join(df13, df9)
```

```
# A tibble: 3 x 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
2     1     2     8     a
3     2     1    NA  <NA>
```


El orden no importa
=======================================================
El orden de las filas no importa, solo el nombre:


```r
df3 <- data_frame(y = 2:1,x = c(1, 2))
df4 <- data_frame(a = 10, b = "a", x = c(1, 3))
df3
```

```
# A tibble: 2 x 2
      y     x
  <int> <dbl>
1     2     1
2     1     2
```

```r
df4
```

```
# A tibble: 2 x 3
      a     b     x
  <dbl> <chr> <dbl>
1    10     a     1
2    10     a     3
```

```r
left_join(df3,df4)
```

```
# A tibble: 2 x 4
      y     x     a     b
  <int> <dbl> <dbl> <chr>
1     2     1    10     a
2     1     2    NA  <NA>
```

¿Y si la variable a usar para el merge no tiene el mismo nombre?
=======================================================
Si los nombres de las filas que se quieren usar como referencia no coinciden, hay que usar "by"


```r
df5 <- data_frame(z = c(1, 2), y = 2:1)
df4 <- data_frame(a = 10, b = "a", x = c(1, 3))
df5
```

```
# A tibble: 2 x 2
      z     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df4
```

```
# A tibble: 2 x 3
      a     b     x
  <dbl> <chr> <dbl>
1    10     a     1
2    10     a     3
```

```r
left_join(df5,df4, by = c("z"="x")) #busca "z" en df5 y "x" en df4
```

```
# A tibble: 2 x 4
      z     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
2     2     1    NA  <NA>
```

¿Y si hay más de una variable para hacer el merge?
=======================================================
En este caso, los match se hacen para aquellas observaciones que coincidan, a la vez, con los valores de la variable en la matriz original.

Por ejemplo, en la matriz "x" tenemos los pares (1,14) y (2,13). En la matrix "y" solamente existe el par (1,14), por lo que esa fila tendrá el match.


```r
df6 <- data_frame(x = c(1, 2), y = 2:1, o=c(14,13))
df7 <- data_frame(a = 10, b = "a", x = c(1, 3), o=c(14,14))
df6
```

```
# A tibble: 2 x 3
      x     y     o
  <dbl> <int> <dbl>
1     1     2    14
2     2     1    13
```

```r
df7
```

```
# A tibble: 2 x 4
      a     b     x     o
  <dbl> <chr> <dbl> <dbl>
1    10     a     1    14
2    10     a     3    14
```

```r
left_join(df6,df7)
```

```
# A tibble: 2 x 5
      x     y     o     a     b
  <dbl> <int> <dbl> <dbl> <chr>
1     1     2    14    10     a
2     2     1    13    NA  <NA>
```


Inner join
=======================================================
>Retains only rows with matches.

Es decir, hace matches como los anteriores pero solo retiene las filas donde hubo matches, las otras las descarta.


```r
df1
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 x 3
      x     a     b
  <dbl> <dbl> <chr>
1     1    10     a
2     3    10     a
```

```r
inner_join(df1, df2)
```

```
# A tibble: 1 x 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
```

Full join
=======================================================
>Retain all values, all rows. 

Es decir, muestra las filas que tienen match pero también las que no tuvieron match. 

En este caso, la fila 1 de la matrix "x" y la fila 1 de la matriz "y" hacen match, por lo que aparecen como una sola fila. 

Luego, la fila 2 de la matrix "x" y la fila 2 de la matriz "y" aparecen también en la matriz final, aún cuando no había matches para ellas. 


```r
df1 <- data_frame(x = c(1, 2), y = 2:1)
df2 <- data_frame(x = c(4, 3), a = 10, b = "a")
df1
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 x 3
      x     a     b
  <dbl> <dbl> <chr>
1     4    10     a
2     3    10     a
```

```r
full_join(df1, df2)
```

```
# A tibble: 4 x 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    NA  <NA>
2     2     1    NA  <NA>
3     4    NA    10     a
4     3    NA    10     a
```

Semi join
=======================================================
>Returns all rows from "x" where there are matching values in "y", keeping just columns from "x". 

A semi join differs from an inner join because an inner join will return one row of "x" for each matching row of "y", where a semi join will never duplicate rows of "x".



```r
df8 <- data_frame(x = c(1, 2), y = 2:1)
df7 <- data_frame(a = 10, b = "a", x = c(1, 2))

df8
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df7
```

```
# A tibble: 2 x 3
      a     b     x
  <dbl> <chr> <dbl>
1    10     a     1
2    10     a     2
```

```r
semi_join(df8, df7)
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```


Anti join
=======================================================
>Returns all rows from "x" where there are not matching values in "y", keeping just columns from "x".



```r
df1
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     1     2
2     2     1
```

```r
df2
```

```
# A tibble: 2 x 3
      x     a     b
  <dbl> <dbl> <chr>
1     4    10     a
2     3    10     a
```

```r
anti_join(df1, df2)
```

```
# A tibble: 2 x 2
      x     y
  <dbl> <int>
1     2     1
2     1     2
```

Ejercicio
==========================================================

Con datos del Zonas Francas:
+ agregar ciiu3
+ agregar seccion

Datos
==========================================================


```r
zzff.10 <- readstata13::read.dta13('~/bases/zzff/2010/zf_2010.dta')
zzff.10 %>% select(A1, G1) %>% head
```

```
                              A1   G1
1                         UPM SA 1701
2       PRESSUR CORPORATION S.A. 1811
3                 TINGELSUR S.A. 1610
4 PEPSI COLA MFG. OF URUGUAY SRL 1079
5           Andritz Uruguay S.A. 3312
6            Kemira Uruguay S.A. 2011
```



CIIUS (1)
==================================================



CIIUS (1)
===========================================


```r
library(stringr)
library(dplyr)
df <- abrir("ciius.txt") %>% 
      mutate(ciiu_3 = ciiu_3(lineas),
             ciiu_4 = ciiu_4(lineas),
             rubro  = rubro(lineas))
```

Pregunta
=======================================================
¿Qué hacemos cuando un CIIU4 se corresponde con muchos CIIU3 (iguales/distintos)?

```r
df %>% 
  group_by(ciiu_4) %>% 
  summarize(ciiu3s=n_distinct(ciiu_3)) %>%
  filter(ciiu3s > 3)
```

```
# A tibble: 3 x 2
  ciiu_4 ciiu3s
   <chr>  <int>
1   4390      4
2   5229      4
3   8620      4
```


```r
df %>% 
  filter(ciiu_4 ==  4390)
```

```
# A tibble: 5 x 4
                                                                       lineas
                                                                        <chr>
1                4390,0 Otras actividades especializadas de construcción 4500
2                   4390,3 Construcción de pilotajes para la edificación 4521
3                  4390,1 Actividades de impermeabilización de edificios 4540
4 4390,2 Armado y desarmado de estructuras auxiliares (plataformas y andamios
5                4390,9 Otras actividades especializadas de construcción 4550
# ... with 3 more variables: ciiu_3 <chr>, ciiu_4 <chr>, rubro <chr>
```

Nos quedamos con el primero
===================================================

```r
tabla_nueva <- df %>% 
  group_by(ciiu_4) %>%
  summarize(ciiu_3 = first(ciiu_3))
```


```r
tabla_nueva %>% 
  group_by(ciiu_4) %>%
  summarize(ciiu3s=n_distinct(ciiu_3)) %>%
  group_by(ciiu3s) %>%
  summarize(n=n())
```

```
# A tibble: 1 x 2
  ciiu3s     n
   <int> <int>
1      1   427
```
Y hacemos el left_join tranquilos
======================================================



```r
names(zzff.10)
```

```
   [1] "V1546"                 "Ano"                  
   [3] "A1"                    "A2"                   
   [5] "A3"                    "A4"                   
   [7] "A5"                    "A6"                   
   [9] "A7"                    "A8"                   
  [11] "A9_0"                  "A9_1"                 
  [13] "A9_2"                  "A10"                  
  [15] "B1"                    "B2"                   
  [17] "B3"                    "B4"                   
  [19] "B5_1"                  "B5_2"                 
  [21] "B5_3"                  "B5_4"                 
  [23] "B5_5"                  "B5_6"                 
  [25] "B6"                    "B7"                   
  [27] "B8"                    "B9"                   
  [29] "B10"                   "B11"                  
  [31] "D1"                    "D2"                   
  [33] "D3"                    "D4"                   
  [35] "D5"                    "E1"                   
  [37] "E2"                    "E3"                   
  [39] "E4"                    "E5"                   
  [41] "F1"                    "F1_1"                 
  [43] "F2"                    "F2_1"                 
  [45] "F3"                    "F3_1"                 
  [47] "F4"                    "F4_1"                 
  [49] "G1"                    "G1_1"                 
  [51] "G1_2"                  "G2"                   
  [53] "G2_1"                  "G2_2"                 
  [55] "G3"                    "G3_1"                 
  [57] "G3_2"                  "G4"                   
  [59] "H1_1"                  "H1_2"                 
  [61] "H1_2_A"                "H1_3"                 
  [63] "H1_4"                  "H1_5"                 
  [65] "H1_6"                  "H1_7"                 
  [67] "H1_8"                  "H1_9"                 
  [69] "H1_10"                 "H1_11"                
  [71] "H1_12"                 "H1_13"                
  [73] "H1_14"                 "H1_15"                
  [75] "H1_16"                 "H1_17"                
  [77] "H1_18"                 "H1_19"                
  [79] "H1_20"                 "H1_21"                
  [81] "H2_1"                  "H2_2"                 
  [83] "H2_3"                  "H2_4"                 
  [85] "H2_5"                  "H2_6"                 
  [87] "H2_7"                  "H2_8"                 
  [89] "H2_9"                  "H2_10"                
  [91] "H2_11"                 "H2_12"                
  [93] "H2_13"                 "H2_14"                
  [95] "H2_15"                 "H2_16"                
  [97] "H2_17"                 "H2_18"                
  [99] "H2_19"                 "H2_20"                
 [101] "H2_21"                 "H3_1"                 
 [103] "H3_2"                  "H3_3"                 
 [105] "H3_4"                  "H3_5"                 
 [107] "H3_6"                  "H3_7"                 
 [109] "H3_8"                  "H3_9"                 
 [111] "H3_10"                 "H3_11"                
 [113] "H3_12"                 "H3_13"                
 [115] "H3_14"                 "H3_15"                
 [117] "H3_16"                 "H3_17"                
 [119] "H3_18"                 "H3_19"                
 [121] "H3_20"                 "H3_21"                
 [123] "__2H1_1"               "__2H1_2"              
 [125] "__2H1_3"               "__2H1_4"              
 [127] "__2H1_5"               "__2H1_6"              
 [129] "__2H1_7"               "__2H1_8"              
 [131] "__2H1_9"               "__2H1_10"             
 [133] "__2H1_11"              "__2H1_12"             
 [135] "__2H1_13"              "__2H1_14"             
 [137] "__2H1_15"              "__2H2_1"              
 [139] "__2H2_2"               "__2H2_3"              
 [141] "__2H2_4"               "__2H2_5"              
 [143] "__2H2_6"               "__2H2_7"              
 [145] "__2H2_8"               "__2H2_9"              
 [147] "__2H2_10"              "__2H2_11"             
 [149] "__2H2_12"              "__2H2_13"             
 [151] "__2H2_14"              "__2H2_15"             
 [153] "__2H3_1"               "__2H3_2"              
 [155] "__2H3_3"               "__2H3_4"              
 [157] "__2H3_5"               "__2H3_6"              
 [159] "__2H3_7"               "__2H3_8"              
 [161] "__2H3_9"               "__2H3_10"             
 [163] "__2H3_11"              "__2H3_12"             
 [165] "__2H3_13"              "__2H3_14"             
 [167] "__2H3_15"              "__2H4_1"              
 [169] "__2H4_2"               "__2H4_3"              
 [171] "__2H4_4"               "__2H4_5"              
 [173] "__2H4_6"               "__2H4_7"              
 [175] "__2H4_8"               "__2H4_9"              
 [177] "__2H4_10"              "__2H4_11"             
 [179] "__2H4_12"              "__2H4_13"             
 [181] "__2H4_14"              "__2H4_15"             
 [183] "I1_1"                  "I1_2"                 
 [185] "I1_3"                  "I2_1"                 
 [187] "I2_2"                  "I2_3"                 
 [189] "I3_1"                  "I3_2"                 
 [191] "I3_3"                  "I4_1"                 
 [193] "I4_2"                  "I4_3"                 
 [195] "I5_1"                  "I5_2"                 
 [197] "I5_3"                  "I6_1"                 
 [199] "I6_2"                  "I6_3"                 
 [201] "I7_1"                  "I7_2"                 
 [203] "I7_3"                  "J1_1"                 
 [205] "J1_2"                  "J2_1"                 
 [207] "J2_2"                  "J3_1"                 
 [209] "J3_2"                  "J4_1"                 
 [211] "J4_2"                  "J5_1"                 
 [213] "J5_2"                  "J6_1"                 
 [215] "J6_2"                  "J7_1"                 
 [217] "J7_2"                  "K1_1"                 
 [219] "K1_2"                  "K1_3"                 
 [221] "K1_4"                  "K1_5"                 
 [223] "K1_6"                  "K2_1"                 
 [225] "K2_2"                  "K2_3"                 
 [227] "K2_4"                  "K2_5"                 
 [229] "K2_6"                  "K3_1"                 
 [231] "K3_2"                  "K3_3"                 
 [233] "K3_4"                  "K3_5"                 
 [235] "K3_6"                  "K4_1"                 
 [237] "K4_2"                  "K4_3"                 
 [239] "K4_4"                  "K4_5"                 
 [241] "K4_6"                  "K5_1"                 
 [243] "K5_2"                  "K5_3"                 
 [245] "K5_4"                  "K5_5"                 
 [247] "K5_6"                  "K6_1"                 
 [249] "K6_2"                  "K6_3"                 
 [251] "K6_4"                  "K6_5"                 
 [253] "K6_6"                  "K7_1"                 
 [255] "K7_2"                  "K7_3"                 
 [257] "K7_4"                  "K7_5"                 
 [259] "K7_6"                  "K8_1"                 
 [261] "K8_2"                  "K8_3"                 
 [263] "K8_4"                  "K8_5"                 
 [265] "K8_6"                  "K9_1"                 
 [267] "K9_2"                  "K9_3"                 
 [269] "K9_4"                  "K9_5"                 
 [271] "K9_6"                  "L1"                   
 [273] "L2"                    "L3"                   
 [275] "L4_1"                  "L4_2"                 
 [277] "L5"                    "L6"                   
 [279] "L7"                    "L8"                   
 [281] "L9"                    "L10"                  
 [283] "L10_1"                 "L10_2"                
 [285] "M1_1"                  "M1_2"                 
 [287] "M1_3"                  "M1_4"                 
 [289] "M1_5"                  "M1_6"                 
 [291] "M2_1"                  "M2_2"                 
 [293] "M2_3"                  "M2_4"                 
 [295] "M2_5"                  "M2_6"                 
 [297] "M3_1"                  "M3_2"                 
 [299] "M3_3"                  "M3_4"                 
 [301] "M3_5"                  "M3_6"                 
 [303] "M4_1"                  "M4_2"                 
 [305] "M4_3"                  "M4_4"                 
 [307] "M4_5"                  "M4_6"                 
 [309] "M5_1"                  "M5_2"                 
 [311] "M5_3"                  "M5_4"                 
 [313] "M5_5"                  "M5_6"                 
 [315] "M6_1"                  "M6_2"                 
 [317] "M6_3"                  "M6_4"                 
 [319] "M6_5"                  "M6_6"                 
 [321] "M7_1"                  "M7_2"                 
 [323] "M7_3"                  "M7_4"                 
 [325] "M7_5"                  "M7_6"                 
 [327] "M8_1_A"                "M8_2"                 
 [329] "M8_3"                  "M8_4"                 
 [331] "M8_5"                  "M8_6"                 
 [333] "M9_1"                  "M9_2"                 
 [335] "M9_3"                  "M9_4"                 
 [337] "M9_5"                  "M9_6"                 
 [339] "MP1"                   "MP2"                  
 [341] "MP3"                   "MP4"                  
 [343] "MP5"                   "MP6"                  
 [345] "M10_1"                 "M10_2"                
 [347] "M10_3"                 "M10_4"                
 [349] "M10_5"                 "M10_6"                
 [351] "M11_1"                 "M11_2"                
 [353] "M11_3"                 "M11_4"                
 [355] "M11_5"                 "M11_6"                
 [357] "M12_1"                 "M12_2"                
 [359] "M12_3"                 "M12_4"                
 [361] "M12_5"                 "M12_6"                
 [363] "M8_1"                  "M13_2"                
 [365] "M13_3"                 "M13_4"                
 [367] "M13_5"                 "M13_6"                
 [369] "M14_1"                 "M14_2"                
 [371] "M14_3"                 "M14_4"                
 [373] "M14_5"                 "M14_6"                
 [375] "M15_1"                 "M15_2"                
 [377] "M15_3"                 "M15_4"                
 [379] "M15_5"                 "M15_6"                
 [381] "M16_1"                 "M16_2"                
 [383] "M16_3"                 "M16_4"                
 [385] "M16_5"                 "M16_6"                
 [387] "M17_1"                 "M17_2"                
 [389] "M17_3"                 "M17_4"                
 [391] "M17_5"                 "M17_6"                
 [393] "M18_1"                 "M18_2"                
 [395] "M18_3"                 "M18_4"                
 [397] "M18_5"                 "M18_6"                
 [399] "M19_1"                 "M19_2"                
 [401] "M19_3"                 "M19_4"                
 [403] "M19_5"                 "M19_6"                
 [405] "M20_1"                 "M20_2"                
 [407] "M20_3"                 "M20_4"                
 [409] "M20_5"                 "M20_6"                
 [411] "M21_1"                 "M21_2"                
 [413] "M21_3"                 "M21_4"                
 [415] "M21_5"                 "M21_6"                
 [417] "M22_1"                 "M22_2"                
 [419] "M22_3"                 "M22_4"                
 [421] "M22_5"                 "M22_6"                
 [423] "M23_1"                 "M23_2"                
 [425] "M23_3"                 "M23_4"                
 [427] "M23_5"                 "M23_6"                
 [429] "M24_1"                 "M24_2"                
 [431] "M24_3"                 "M24_4"                
 [433] "M24_5"                 "M24_6"                
 [435] "M25_1"                 "M25_2"                
 [437] "M25_3"                 "M25_4"                
 [439] "M25_5"                 "M25_6"                
 [441] "M26_1"                 "M26_2"                
 [443] "M26_3"                 "M26_4"                
 [445] "M26_5"                 "M26_6"                
 [447] "M27_1"                 "M27_2"                
 [449] "M27_3"                 "M27_4"                
 [451] "M27_5"                 "M27_6"                
 [453] "M28_1"                 "M28_2"                
 [455] "M28_3"                 "M28_4"                
 [457] "M28_5"                 "M28_6"                
 [459] "M29_1"                 "M29_2"                
 [461] "M29_3"                 "M29_4"                
 [463] "M29_5"                 "M29_6"                
 [465] "M30_1"                 "M30_2"                
 [467] "M30_3"                 "M30_4"                
 [469] "M30_5"                 "M30_6"                
 [471] "M31_1"                 "M31_2"                
 [473] "M31_3"                 "M31_4"                
 [475] "M31_5"                 "M31_6"                
 [477] "M32_1"                 "M32_2"                
 [479] "M32_3"                 "M32_4"                
 [481] "M32_5"                 "M32_6"                
 [483] "M33_1"                 "M33_2"                
 [485] "M33_3"                 "M33_4"                
 [487] "M33_5"                 "M33_6"                
 [489] "M34_1"                 "M34_2"                
 [491] "M34_3"                 "M34_4"                
 [493] "M34_5"                 "M34_6"                
 [495] "MSF35_1"               "MSF35_2"              
 [497] "M37_1"                 "M37_2"                
 [499] "M37_3"                 "M37_4"                
 [501] "M37_5"                 "M37_6"                
 [503] "M38_1"                 "M38_2"                
 [505] "M38_3"                 "M38_4"                
 [507] "M38_5"                 "M38_6"                
 [509] "M39_1"                 "M39_2"                
 [511] "M39_3"                 "M39_4"                
 [513] "M39_5"                 "M39_6"                
 [515] "M40_1"                 "M40_2"                
 [517] "M40_3"                 "M40_4"                
 [519] "M40_5"                 "M40_6"                
 [521] "M41_1"                 "M41_2"                
 [523] "M41_3"                 "M41_4"                
 [525] "M41_5"                 "M41_6"                
 [527] "M42_1"                 "M42_2"                
 [529] "M42_3"                 "M42_4"                
 [531] "M42_5"                 "M42_6"                
 [533] "M43_1"                 "M43_2"                
 [535] "M43_3"                 "M43_4"                
 [537] "M43_5"                 "M43_6"                
 [539] "M44_1"                 "M44_2"                
 [541] "M44_3"                 "M44_4"                
 [543] "M44_5"                 "M44_6"                
 [545] "M45_1"                 "M45_2"                
 [547] "M45_3"                 "M45_4"                
 [549] "M45_5"                 "M45_6"                
 [551] "M46_1"                 "M46_2"                
 [553] "M46_3"                 "M46_4"                
 [555] "M46_5"                 "M46_6"                
 [557] "M47_1"                 "M47_2"                
 [559] "M47_3"                 "M47_4"                
 [561] "M47_5"                 "M47_6"                
 [563] "M48_1"                 "M48_2"                
 [565] "M48_3"                 "M48_4"                
 [567] "M48_5"                 "M48_6"                
 [569] "M49_1"                 "M49_2"                
 [571] "M49_3"                 "M49_4"                
 [573] "M49_5"                 "M49_6"                
 [575] "M50_1"                 "M50_2"                
 [577] "M50_3"                 "M50_4"                
 [579] "M50_5"                 "M50_6"                
 [581] "M51_1"                 "M51_2"                
 [583] "M51_3"                 "M51_4"                
 [585] "M51_5"                 "M51_6"                
 [587] "M52_1"                 "M52_2"                
 [589] "M52_3"                 "M52_4"                
 [591] "M52_5"                 "M52_6"                
 [593] "N1"                    "N2"                   
 [595] "N3"                    "N4"                   
 [597] "N5"                    "N1_1"                 
 [599] "NP1_1"                 "N1_2"                 
 [601] "NP2_1"                 "N1_3"                 
 [603] "NP3_1"                 "N1_4"                 
 [605] "NP4_1"                 "N1_5"                 
 [607] "NP5_1"                 "N1_6"                 
 [609] "NP6_1"                 "N1_7"                 
 [611] "NP7_1"                 "N1_8"                 
 [613] "NP8_1"                 "N2_1"                 
 [615] "NP1_2"                 "N2_2"                 
 [617] "NP2_2"                 "N2_3"                 
 [619] "NP3_2"                 "N2_4"                 
 [621] "NP4_2"                 "N2_5"                 
 [623] "NP5_2"                 "N2_6"                 
 [625] "NP6_2"                 "N2_7"                 
 [627] "NP7_2"                 "N2_8"                 
 [629] "NP8_2"                 "N3_1"                 
 [631] "NP1_3"                 "N3_2"                 
 [633] "NP2_3"                 "N3_3"                 
 [635] "NP3_3"                 "N3_4"                 
 [637] "NP4_3"                 "N3_5"                 
 [639] "NP5_3"                 "N3_6"                 
 [641] "NP6_3"                 "N3_7"                 
 [643] "NP7_3"                 "N3_8"                 
 [645] "NP8_3"                 "N4_1"                 
 [647] "NP1_4"                 "N4_2"                 
 [649] "NP2_4"                 "N4_3"                 
 [651] "NP3_4"                 "N4_4"                 
 [653] "NP4_4"                 "N4_5"                 
 [655] "NP5_4"                 "N4_6"                 
 [657] "NP6_4"                 "N4_7"                 
 [659] "NP7_4"                 "N4_8"                 
 [661] "NP8_4"                 "N5_1"                 
 [663] "NP1_5"                 "N5_2"                 
 [665] "NP2_5"                 "N5_3"                 
 [667] "NP3_5"                 "N5_4"                 
 [669] "NP4_5"                 "N5_5"                 
 [671] "NP5_5"                 "N5_6"                 
 [673] "NP6_5"                 "N5_7"                 
 [675] "NP7_5"                 "N5_8"                 
 [677] "NP8_5"                 "O1_1"                 
 [679] "O1_2"                  "O1_3"                 
 [681] "O1_4"                  "O1_5"                 
 [683] "O1_6"                  "O2_1"                 
 [685] "O2_2"                  "O2_3"                 
 [687] "O2_4"                  "O2_5"                 
 [689] "O2_6"                  "O3_1"                 
 [691] "O3_2"                  "O3_3"                 
 [693] "O3_4"                  "O3_5"                 
 [695] "O3_6"                  "O4_1"                 
 [697] "O4_2"                  "O4_3"                 
 [699] "O4_4"                  "O4_5"                 
 [701] "O4_6"                  "O5_1"                 
 [703] "O5_2"                  "O5_3"                 
 [705] "O5_4"                  "O5_5"                 
 [707] "O5_6"                  "O6_1"                 
 [709] "O6_2"                  "O6_3"                 
 [711] "O6_4"                  "O6_5"                 
 [713] "O6_6"                  "O7_1"                 
 [715] "O7_2"                  "O7_3"                 
 [717] "O7_4"                  "O7_5"                 
 [719] "O7_6"                  "__0_E"                
 [721] "__0_D"                 "__0_C"                
 [723] "__0_B"                 "__0_A"                
 [725] "__0"                   "O8_1"                 
 [727] "O8_2"                  "O8_3"                 
 [729] "O8_4"                  "O8_5"                 
 [731] "O8_6"                  "O9_1"                 
 [733] "O9_2"                  "O9_3"                 
 [735] "O9_4"                  "O9_5"                 
 [737] "O9_6"                  "O10_1"                
 [739] "O10_2"                 "O10_3"                
 [741] "O10_4"                 "O10_5"                
 [743] "O10_6"                 "O11_1"                
 [745] "O11_2"                 "O11_3"                
 [747] "O11_4"                 "O11_5"                
 [749] "O11_6"                 "O12_1"                
 [751] "O12_2"                 "O12_3"                
 [753] "O12_4"                 "O12_5"                
 [755] "O12_6"                 "O13_1"                
 [757] "O13_2"                 "O13_3"                
 [759] "O13_4"                 "O13_5"                
 [761] "O13_6"                 "O14_1"                
 [763] "O14_2"                 "O14_3"                
 [765] "O14_4"                 "O14_5"                
 [767] "O14_6"                 "O15_1"                
 [769] "O15_2"                 "O15_3"                
 [771] "O15_4"                 "O15_5"                
 [773] "O15_6"                 "O16_1"                
 [775] "O16_2"                 "O16_3"                
 [777] "O16_4"                 "O16_5"                
 [779] "O16_6"                 "O17_1"                
 [781] "O17_2"                 "O17_3"                
 [783] "O17_4"                 "O17_5"                
 [785] "O17_6"                 "O18_1"                
 [787] "O18_2"                 "O18_3"                
 [789] "O18_4"                 "O18_5"                
 [791] "O18_6"                 "O19_1"                
 [793] "O19_2"                 "O19_3"                
 [795] "O19_4"                 "O19_5"                
 [797] "O19_6"                 "O20_1"                
 [799] "O20_2"                 "O20_3"                
 [801] "O20_4"                 "O20_5"                
 [803] "O20_6"                 "O21_1"                
 [805] "O21_2"                 "O21_3"                
 [807] "O21_4"                 "O21_5"                
 [809] "O21_6"                 "O22_1"                
 [811] "O22_2"                 "O22_3"                
 [813] "O22_4"                 "O22_5"                
 [815] "O22_6"                 "O23_1"                
 [817] "O23_2"                 "O23_3"                
 [819] "O23_4"                 "O23_5"                
 [821] "O23_6"                 "O24_1"                
 [823] "O24_2"                 "O24_3"                
 [825] "O24_4"                 "O24_5"                
 [827] "O24_6"                 "O25_1"                
 [829] "O25_2"                 "O25_3"                
 [831] "O25_4"                 "O25_5"                
 [833] "O25_6"                 "O26_1"                
 [835] "O26_2"                 "O26_3"                
 [837] "O26_4"                 "O26_5"                
 [839] "O26_6"                 "O27_1"                
 [841] "O27_2"                 "O27_3"                
 [843] "O27_4"                 "O27_5"                
 [845] "O27_6"                 "O28_1"                
 [847] "O28_2"                 "O28_3"                
 [849] "O28_4"                 "O28_5"                
 [851] "O28_6"                 "O29_1"                
 [853] "O29_2"                 "O29_3"                
 [855] "O29_4"                 "O29_5"                
 [857] "O29_6"                 "O30_1"                
 [859] "O30_2"                 "O30_3"                
 [861] "O30_4"                 "O30_5"                
 [863] "O30_6"                 "O31_1"                
 [865] "O31_2"                 "O31_3"                
 [867] "O31_4"                 "O31_5"                
 [869] "O31_6"                 "O32_1"                
 [871] "O32_2"                 "O32_3"                
 [873] "O32_4"                 "O32_5"                
 [875] "O32_6"                 "O33_1"                
 [877] "O33_2"                 "O33_3"                
 [879] "O33_4"                 "O33_5"                
 [881] "O33_6"                 "O34_1"                
 [883] "O34_2"                 "O34_3"                
 [885] "O34_4"                 "O34_5"                
 [887] "O34_6"                 "O35_1"                
 [889] "O35_2"                 "O35_3"                
 [891] "O35_4"                 "O35_5"                
 [893] "O35_6"                 "O36_1"                
 [895] "O36_2"                 "O36_3"                
 [897] "O36_4"                 "O36_5"                
 [899] "O36_6"                 "P1"                   
 [901] "P2"                    "P3"                   
 [903] "P4"                    "P5"                   
 [905] "P1_1"                  "PP1_1"                
 [907] "P1_2"                  "PP2_1"                
 [909] "P1_3"                  "PP3_1"                
 [911] "P1_4"                  "PP4_1"                
 [913] "P1_5"                  "PP5_1"                
 [915] "P1_6"                  "PP6_1"                
 [917] "P1_7"                  "PP7_1"                
 [919] "P1_8"                  "PP8_1"                
 [921] "P2_1"                  "PP1_2"                
 [923] "P2_2"                  "PP2_2"                
 [925] "P2_3"                  "PP3_2"                
 [927] "P2_4"                  "PP4_2"                
 [929] "P2_5"                  "PP5_2"                
 [931] "P2_6"                  "PP6_2"                
 [933] "P2_7"                  "PP7_2"                
 [935] "P2_8"                  "PP8_2"                
 [937] "P3_1"                  "PP1_3"                
 [939] "P3_2"                  "PP2_3"                
 [941] "P3_3"                  "PP3_3"                
 [943] "P3_4"                  "PP4_3"                
 [945] "P3_5"                  "PP5_3"                
 [947] "P3_6"                  "PP6_3"                
 [949] "P3_7"                  "PP7_3"                
 [951] "P3_8"                  "PP8_3"                
 [953] "P4_1"                  "PP1_4"                
 [955] "P4_2"                  "PP2_4"                
 [957] "P4_3"                  "PP3_4"                
 [959] "P4_4"                  "PP4_4"                
 [961] "P4_5"                  "PP5_4"                
 [963] "P4_6"                  "PP6_4"                
 [965] "P4_7"                  "PP7_4"                
 [967] "P4_8"                  "PP8_4"                
 [969] "P5_1"                  "PP1_5"                
 [971] "P5_2"                  "PP2_5"                
 [973] "P5_3"                  "PP3_5"                
 [975] "P5_4"                  "PP4_5"                
 [977] "P5_5"                  "PP5_5"                
 [979] "P5_6"                  "PP6_5"                
 [981] "P5_7"                  "PP7_5"                
 [983] "P5_8"                  "PP8_5"                
 [985] "Q1_1"                  "Q1_2"                 
 [987] "Q1_3"                  "Q1_4"                 
 [989] "Q1_5"                  "Q1_6"                 
 [991] "Q1_7"                  "Q1_8"                 
 [993] "Q1_9"                  "Q1_10"                
 [995] "Q1_11"                 "Q1_12"                
 [997] "Q1_13"                 "Q1_14"                
 [999] "Q1_15"                 "Q2_1"                 
[1001] "Q2_2"                  "Q2_3"                 
[1003] "Q2_4"                  "Q2_5"                 
[1005] "Q2_6"                  "Q2_7"                 
[1007] "Q2_8"                  "Q2_9"                 
[1009] "Q2_10"                 "Q2_11"                
[1011] "Q2_12"                 "Q2_13"                
[1013] "Q2_14"                 "Q2_15"                
[1015] "Q3_1"                  "Q3_2"                 
[1017] "Q3_3"                  "Q3_4"                 
[1019] "Q3_5"                  "Q3_6"                 
[1021] "Q3_7"                  "Q3_8"                 
[1023] "Q3_9"                  "Q3_10"                
[1025] "Q3_11"                 "Q3_12"                
[1027] "Q3_13"                 "Q3_14"                
[1029] "Q3_15"                 "Q4_1"                 
[1031] "Q4_2"                  "Q4_3"                 
[1033] "Q4_4"                  "Q4_5"                 
[1035] "Q4_6"                  "Q4_7"                 
[1037] "Q4_8"                  "Q4_9"                 
[1039] "Q4_10"                 "Q4_11"                
[1041] "Q4_12"                 "Q4_13"                
[1043] "Q4_14"                 "Q4_15"                
[1045] "Q5_1"                  "Q5_2"                 
[1047] "Q5_3"                  "Q5_4"                 
[1049] "Q5_5"                  "Q5_6"                 
[1051] "Q5_7"                  "Q5_8"                 
[1053] "Q5_9"                  "Q5_10"                
[1055] "Q5_11"                 "Q5_12"                
[1057] "Q5_13"                 "Q5_14"                
[1059] "Q5_15"                 "Q6_1"                 
[1061] "Q6_2"                  "Q6_3"                 
[1063] "Q6_4"                  "Q6_5"                 
[1065] "Q6_6"                  "Q6_7"                 
[1067] "Q6_8"                  "Q6_9"                 
[1069] "Q6_10"                 "Q6_11"                
[1071] "Q6_12"                 "Q6_13"                
[1073] "Q6_14"                 "Q6_15"                
[1075] "Q7_1"                  "Q7_2"                 
[1077] "Q7_3"                  "Q7_4"                 
[1079] "Q7_5"                  "Q7_6"                 
[1081] "Q7_7"                  "Q7_8"                 
[1083] "Q7_9"                  "Q7_10"                
[1085] "Q7_11"                 "Q7_12"                
[1087] "Q7_13"                 "Q7_14"                
[1089] "Q7_15"                 "Q8_1"                 
[1091] "Q8_2"                  "Q8_3"                 
[1093] "Q8_4"                  "Q8_5"                 
[1095] "Q8_6"                  "Q8_7"                 
[1097] "Q8_8"                  "Q8_9"                 
[1099] "Q8_10"                 "Q8_11"                
[1101] "Q8_12"                 "Q8_13"                
[1103] "Q8_14"                 "Q8_15"                
[1105] "Q9_1"                  "Q9_2"                 
[1107] "Q9_3"                  "Q9_4"                 
[1109] "Q9_5"                  "Q9_6"                 
[1111] "Q9_7"                  "Q9_8"                 
[1113] "Q9_9"                  "Q9_10"                
[1115] "Q9_11"                 "Q9_12"                
[1117] "Q9_13"                 "Q9_14"                
[1119] "Q9_15"                 "Q10_1"                
[1121] "Q10_2"                 "Q10_3"                
[1123] "Q10_4"                 "Q10_5"                
[1125] "Q10_6"                 "Q10_7"                
[1127] "Q10_8"                 "Q10_9"                
[1129] "Q10_10"                "Q10_11"               
[1131] "Q10_12"                "Q10_13"               
[1133] "Q10_14"                "Q10_15"               
[1135] "Q11_1"                 "Q11_2"                
[1137] "Q11_3"                 "Q11_4"                
[1139] "Q11_5"                 "Q11_6"                
[1141] "Q11_7"                 "Q11_8"                
[1143] "Q11_9"                 "Q11_10"               
[1145] "Q11_11"                "Q11_12"               
[1147] "Q11_13"                "Q11_14"               
[1149] "Q11_15"                "Q12_1"                
[1151] "Q12_2"                 "Q12_3"                
[1153] "Q12_4"                 "Q12_5"                
[1155] "Q12_6"                 "Q12_7"                
[1157] "Q12_8"                 "Q12_9"                
[1159] "Q12_10"                "Q12_11"               
[1161] "Q12_12"                "Q12_13"               
[1163] "Q12_14"                "Q12_15"               
[1165] "Q13_1"                 "Q13_2"                
[1167] "Q13_3"                 "Q13_4"                
[1169] "Q13_5"                 "Q13_6"                
[1171] "Q13_7"                 "Q13_8"                
[1173] "Q13_9"                 "Q13_10"               
[1175] "Q13_11"                "Q13_12"               
[1177] "Q13_13"                "Q13_14"               
[1179] "Q13_15"                "Q14_1"                
[1181] "Q14_2"                 "Q14_3"                
[1183] "Q14_4"                 "Q14_5"                
[1185] "Q14_6"                 "Q14_7"                
[1187] "Q14_8"                 "Q14_9"                
[1189] "Q14_10"                "Q14_11"               
[1191] "Q14_12"                "Q14_13"               
[1193] "Q14_14"                "Q14_15"               
[1195] "Q15_1"                 "Q15_2"                
[1197] "Q15_3"                 "Q15_4"                
[1199] "Q15_5"                 "Q15_6"                
[1201] "Q15_7"                 "Q15_8"                
[1203] "Q15_9"                 "Q15_10"               
[1205] "Q15_11"                "Q15_12"               
[1207] "Q15_13"                "Q15_14"               
[1209] "Q15_15"                "Q16_1"                
[1211] "Q16_2"                 "Q16_3"                
[1213] "Q16_4"                 "Q16_5"                
[1215] "Q16_6"                 "Q16_7"                
[1217] "Q16_8"                 "Q16_9"                
[1219] "Q16_10"                "Q16_11"               
[1221] "Q16_12"                "Q16_13"               
[1223] "Q16_14"                "Q16_15"               
[1225] "Q17_1"                 "Q17_2"                
[1227] "Q17_3"                 "Q17_4"                
[1229] "Q17_5"                 "Q17_6"                
[1231] "Q17_7"                 "Q17_8"                
[1233] "Q17_9"                 "Q17_10"               
[1235] "Q17_11"                "Q17_15"               
[1237] "Q18_1"                 "Q18_2"                
[1239] "Q18_3"                 "Q18_4"                
[1241] "Q18_5"                 "Q18_6"                
[1243] "Q18_7"                 "Q18_8"                
[1245] "Q18_9"                 "Q18_10"               
[1247] "Q18_11"                "Q18_12"               
[1249] "Q18_13"                "Q18_14"               
[1251] "Q18_15"                "QM1"                  
[1253] "QM2"                   "RP1_1"                
[1255] "RP1_2"                 "RP1_3"                
[1257] "RP2_1"                 "RP2_2"                
[1259] "RP2_3"                 "RP3_1"                
[1261] "RP3_2"                 "RP3_3"                
[1263] "RP4_1"                 "RP4_2"                
[1265] "RP4_3"                 "RP5_1"                
[1267] "RP5_2"                 "RP5_3"                
[1269] "RP6_1"                 "RP6_2"                
[1271] "RP6_3"                 "RP7_1"                
[1273] "RP7_2"                 "RP7_3"                
[1275] "RP8_1"                 "RP8_2"                
[1277] "RP8_3"                 "rpt"                  
[1279] "RI1_1"                 "RI1_2"                
[1281] "RI1_3"                 "RI2_1"                
[1283] "RI2_2"                 "RI2_3"                
[1285] "RI3_1"                 "RI3_2"                
[1287] "RI3_3"                 "RI4_1"                
[1289] "RI4_2"                 "RI4_3"                
[1291] "RI5_1"                 "RI5_2"                
[1293] "RI5_3"                 "RI6_1"                
[1295] "RI6_2"                 "RI6_3"                
[1297] "RI7_1"                 "RI7_2"                
[1299] "RI7_3"                 "RI8_1"                
[1301] "RI8_2"                 "RI8_3"                
[1303] "rit"                   "T1_1"                 
[1305] "T1_2"                  "T2_1"                 
[1307] "T2_2"                  "T3_1"                 
[1309] "T3_2"                  "T4_1"                 
[1311] "T4_2"                  "T5_1"                 
[1313] "T5_2"                  "T6_1"                 
[1315] "T6_2"                  "T7_1"                 
[1317] "T7_2"                  "U1_1"                 
[1319] "U1_2"                  "U1_3"                 
[1321] "U1_4"                  "U1_5"                 
[1323] "U1_6"                  "U2_1"                 
[1325] "U2_2"                  "U2_3"                 
[1327] "U2_4"                  "U2_5"                 
[1329] "U2_6"                  "U3_1"                 
[1331] "U3_2"                  "U3_3"                 
[1333] "U3_4"                  "U3_5"                 
[1335] "U3_6"                  "U4_1"                 
[1337] "U4_2"                  "U4_3"                 
[1339] "U4_4"                  "U4_5"                 
[1341] "U4_6"                  "U5_1"                 
[1343] "U5_2"                  "U5_3"                 
[1345] "U5_4"                  "U5_5"                 
[1347] "U5_6"                  "U6_1"                 
[1349] "U6_2"                  "U6_3"                 
[1351] "U6_4"                  "U6_5"                 
[1353] "U6_6"                  "U7_1"                 
[1355] "U7_2"                  "U7_3"                 
[1357] "U7_4"                  "U7_5"                 
[1359] "U7_6"                  "U8_1"                 
[1361] "U8_2"                  "U8_3"                 
[1363] "U8_4"                  "U8_5"                 
[1365] "U8_6"                  "U9_1"                 
[1367] "U9_2"                  "U9_3"                 
[1369] "U9_4"                  "U9_5"                 
[1371] "U9_6"                  "U10_1"                
[1373] "U10_2"                 "U10_3"                
[1375] "U10_4"                 "U10_5"                
[1377] "U10_6"                 "U11_1"                
[1379] "U11_2"                 "U11_3"                
[1381] "U11_4"                 "U11_5"                
[1383] "U11_6"                 "U12_1"                
[1385] "U12_2"                 "U12_3"                
[1387] "U12_4"                 "U12_5"                
[1389] "U12_6"                 "U13_1"                
[1391] "U13_2"                 "U13_3"                
[1393] "U13_4"                 "U13_5"                
[1395] "U13_6"                 "U14_1"                
[1397] "U14_2"                 "U14_3"                
[1399] "U14_4"                 "U14_5"                
[1401] "U14_6"                 "U15_1"                
[1403] "U15_2"                 "U15_3"                
[1405] "U15_4"                 "U15_5"                
[1407] "U15_6"                 "U16_1"                
[1409] "U16_2"                 "U16_3"                
[1411] "U16_4"                 "U16_5"                
[1413] "U16_6"                 "U17_1"                
[1415] "U17_2"                 "U17_3"                
[1417] "U17_4"                 "U17_5"                
[1419] "U17_6"                 "U18_1"                
[1421] "U18_2"                 "U18_3"                
[1423] "U18_4"                 "U18_5"                
[1425] "U18_6"                 "U19_1"                
[1427] "U19_2"                 "U19_3"                
[1429] "U19_4"                 "U19_5"                
[1431] "U19_6"                 "V1_1"                 
[1433] "V1_2"                  "V1_3"                 
[1435] "V1_4"                  "V1_5"                 
[1437] "V1_6"                  "V2_1"                 
[1439] "V2_2"                  "V2_3"                 
[1441] "V2_4"                  "V2_5"                 
[1443] "V2_6"                  "V3_1"                 
[1445] "V3_2"                  "V3_3"                 
[1447] "V3_4"                  "V3_5"                 
[1449] "V3_6"                  "V4_1"                 
[1451] "V4_2"                  "V4_3"                 
[1453] "V4_4"                  "V4_5"                 
[1455] "V4_6"                  "V5_1"                 
[1457] "V5_2"                  "V5_3"                 
[1459] "V5_4"                  "V5_5"                 
[1461] "V5_6"                  "V6_1"                 
[1463] "V6_2"                  "V6_3"                 
[1465] "V6_4"                  "V6_5"                 
[1467] "V6_6"                  "V7_1"                 
[1469] "V7_2"                  "V7_3"                 
[1471] "V7_4"                  "V7_5"                 
[1473] "V7_6"                  "V8_1"                 
[1475] "V8_2"                  "V8_3"                 
[1477] "V8_4"                  "V8_5"                 
[1479] "V8_6"                  "V9_1"                 
[1481] "V9_2"                  "V9_3"                 
[1483] "V9_4"                  "V9_5"                 
[1485] "V9_6"                  "V10_1"                
[1487] "V10_2"                 "V10_3"                
[1489] "V10_4"                 "V10_5"                
[1491] "V10_6"                 "V11_1"                
[1493] "V11_2"                 "V11_3"                
[1495] "V11_4"                 "V11_5"                
[1497] "V11_6"                 "V12_1"                
[1499] "V12_2"                 "V12_3"                
[1501] "V12_4"                 "V12_5"                
[1503] "V12_6"                 "V13_1"                
[1505] "V13_2"                 "V13_3"                
[1507] "V13_4"                 "V13_5"                
[1509] "V13_6"                 "V14_1"                
[1511] "V14_2"                 "V14_3"                
[1513] "V14_4"                 "V14_5"                
[1515] "V14_6"                 "V15_1"                
[1517] "V15_2"                 "V15_3"                
[1519] "V15_4"                 "V15_5"                
[1521] "V15_6"                 "W1_1"                 
[1523] "W1_2"                  "W2_1"                 
[1525] "W2_2"                  "W3_1"                 
[1527] "W3_2"                  "W4_1"                 
[1529] "W4_2"                  "W5_1"                 
[1531] "W5_2"                  "W6_1"                 
[1533] "W6_2"                  "W7_1"                 
[1535] "W7_2"                  "W8_1"                 
[1537] "W8_2"                  "W9_1"                 
[1539] "W9_2"                  "W10_1"                
[1541] "W10_2"                 "X1"                   
[1543] "X2"                    "X3"                   
[1545] "X4"                    "Y1"                   
[1547] "D1NUMERO"              "D2NUMERO"             
[1549] "D3NUMERO"              "CONTROL_TUSU"         
[1551] "ZonaFranca"            "RazonSocial"          
[1553] "Tipodeusuario"         "Indirectode"          
[1555] "A6RazonSocial"         "A9Depto"              
[1557] "A10Telefono"           "A11Fax"               
[1559] "A12mail"               "A12_0mail2"           
[1561] "A12_1mail3"            "A12_2mail4"           
[1563] "A12_3mail5"            "A13Informante"        
[1565] "A14ZonaFranca"         "A15CodigoAZZF"        
[1567] "OBS_1"                 "letra"                
[1569] "REM_TOT"               "APORTE_TOT"           
[1571] "GAS_NO_DEP"            "PO_TOT"               
[1573] "ING_IND"               "ING_COMERCIO"         
[1575] "ING_SERV_NO_FIN"       "ING_SERV_PROF"        
[1577] "ING_SERV_INFORMATICOS" "ING_SERV_SEGUROS"     
[1579] "ING_SERV_FIN"          "ING_OTROS"            
[1581] "ING_TOT"               "ING_OTROS_EXTRA"      
[1583] "GAS_IND"               "GAS_COM"              
[1585] "GAS_OPER"              "GAS_SEGUROS"          
[1587] "GAS_SERV_FIN"          "GAS_FIN"              
[1589] "GAS_OTROS"             "GAS_OTROS_EXTRA"      
[1591] "GAS_TOT"               "AMORT_TOT"            
[1593] "re"                    "PROD_CTA_PROPIA"      
[1595] "TOT_FBK"               "POR_TR"               
[1597] "VBP_INDUSTRIA"         "VBP_COMERCIO"         
[1599] "VBP_SERVICIOS"         "VBP_FINANCIERO"       
[1601] "VBP_OT_FUENTES"        "VBP_CONSTR_CP"        
[1603] "vbp"                   "ci"                   
[1605] "vab"                   "ee"                   
[1607] "GAS_MAT"               "MP_CI"                
[1609] "CI_VBP"                "VAB_VBP"              
[1611] "REM_VAB"               "tramo"                
[1613] "VBP_TR"                "VBP_STR"              
[1615] "VAB_TR"                "VAB_STR"              
[1617] "EE_TR"                 "EE_STR"               
[1619] "VBP_10"                "VAB_10"               
[1621] "EE_10"                 "prodpercap"           
[1623] "outlier"               "VBP_N"                
[1625] "EE_N"                  "CI_ZF"                
[1627] "CI_ZNF"                "CI_EXT"               
[1629] "CI_OT"                 "OUTLIER_C"            
[1631] "CI_N"                  "cipercap"             
[1633] "AMORT2"                "VBP_N2"               
[1635] "ver"                   "sector"               
[1637] "inactivas"             "expoind"              
[1639] "expocom"               "exposerv"             
[1641] "expofin"               "EXPO2"                
[1643] "DEST_IND1"             "DEST_IND2"            
[1645] "DEST_IND3"             "DEST_IND4"            
[1647] "DEST_IND5"             "DEST_IND6"            
[1649] "DEST_IND7"             "DEST_IND8"            
[1651] "DEST_COM1"             "DEST_COM2"            
[1653] "DEST_COM3"             "DEST_COM4"            
[1655] "DEST_COM5"             "DEST_COM6"            
[1657] "DEST_COM7"             "DEST_COM8"            
[1659] "DEST_SERV1"            "DEST_SERV2"           
[1661] "DEST_SERV3"            "DEST_SERV4"           
[1663] "DEST_SERV5"            "DEST_SERV6"           
[1665] "DEST_SERV7"            "DEST_SERV8"           
[1667] "DEST_FINAN1"           "DEST_FINAN2"          
[1669] "DEST_FINAN3"           "DEST_FINAN4"          
[1671] "DEST_FINAN5"           "DEST_FINAN6"          
[1673] "DEST_FINAN7"           "DEST_FINAN8"          
[1675] "ventaslog"             "PO_PYS"               
[1677] "PO_D"                  "PO_E"                 
[1679] "PO_O"                  "PO_PYT"               
[1681] "PO_PRIM"               "PO_SEC"               
[1683] "PO_TER"                "PO_POST"              
```

```r
names(tabla_nueva)
```

```
[1] "ciiu_4" "ciiu_3"
```

```r
#zzff.10 %>% left_join(tabla_nueva, by=c("G1"="ciiu_4"))
```


```r
zzff.10 <- zzff.10 %>% 
  mutate(ciiu_4 = as.character(.$G1)) %>% 
  left_join(tabla_nueva)

zzff.10 %>% head
```

```
  V1546  Ano                             A1           A2
1   583 2010                         UPM SA 214743780011
2   571 2010       PRESSUR CORPORATION S.A. 214703970014
3   781 2010                 TINGELSUR S.A. 215136600019
4   145 2010 PEPSI COLA MFG. OF URUGUAY SRL 212466600018
5   710 2010           Andritz Uruguay S.A. 215067910018
6   835 2010            Kemira Uruguay S.A. 215241240019
                                           A3                     A4
1                Ruta acceso al Puente Km 307            Fray Bentos
2                            RUTA 53 KM 120,5         NUEVA HELVECIA
3                               RUTA 5 KM.495                 RIVERA
4 AVDA. GRAL FLORES S/N - ZONA FRANCA COLONIA COLONIA DEL SACRAMENTO
5 Ruta puente puerto Km 307 - Zona Franca UPM            Fray Bentos
6 Ruta Puente Puerto Km 307 - Zona Franca UPM            Fray Bentos
            A5       A6       A7                                 A8 A9_0
1    Rio Negro 45620100       NA           santiago.cardozo@upm.com   31
2      COLONIA 45547670 45547670              mmartinez@pressur.com   31
3       RIVERA       NA       NA         administracion@valepal.com   28
4      COLONIA 45224979       NA         ANDREA.GARRONE@PEPSICO.COM   31
5 R<ed>o Negro 45620100       NA       joaquin.masalles@andritz.com   31
6 R<ed>o Negro       NA       NA jose.varela@kemira.com  - silvana.   31
  A9_1 A9_2           A10                   B1       B2
1   12 2010           UPM     Santiago Cardozo 45620100
2   12 2010 COLONIA SUIZA MAXIMILIANO MARTINEZ       NA
3    2 2011        RIVERA Jorge Cortelles Roig       NA
4   12 2010       COLONIA       ANDREA GARRONE 45224979
5   12 2010           UPM     Joaquin Masalles 98670271
6   12 2010           UPM      Silvana Mengual       NA
                     B3                           B4 B5_1 B5_2 B5_3 B5_4
1  Auxiliar de Fonanzas     santiago.cardozo@upm.com    5    8 2005   13
2      CONTADOR GENERAL        mmartinez@pressur.com   24    9 2010   NA
3                 SOCIO   administracion@valepal.com   NA   NA   NA   NA
4 ANALISTA TESORER<cd>A   andrea.garrone@pepsico.com   14    5    9   NA
5            Controller joaquin.masalles@andritz.com   NA   NA   NA   NA
6 Jefe de Contadur<ed>a   silvana.mengual@kemira.com   26   12 2007    7
  B5_5 B5_6 B6 B7 B8 B9 B10 B11 D1 D2 D3       D4       D5 E1
1    4 2010 Si No Si No  No  No No Si No                   Si
2   NA   NA Si No Si Si  No  No No Si No                   No
3   NA   NA Si No Si No  No  No No Si No                   No
4   NA   NA Si No Si No  No  No No Si No                   No
5   NA   NA Si No Si No  No  No No No Si UPM S.A. UPM S.A. No
6   12 2010 Si No Si Si  No  No No Si No                   No
                      E2 E3                                        E4
1 UPM South America S.A. Si UPM Fray Bentos SA, Forestal Oriental S.A
2                   <NA> No                                      <NA>
3                   <NA> No                                      <NA>
4                   <NA> No                                      <NA>
5                   <NA> Si                             Andritz Group
6                   <NA> No                                      <NA>
           E5        F1 F1_1          F2 F2_1          F3 F3_1          F4
1    Vertical Finlandia   91     Uruguay    9 Seleccionar    0 Seleccionar
2 Seleccionar   Uruguay  100 Seleccionar    0 Seleccionar    0 Seleccionar
3 Seleccionar Espa<f1>a  100 Seleccionar    0 Seleccionar    0 Seleccionar
4 Seleccionar   Irlanda  100 Seleccionar    0 Seleccionar    0 Seleccionar
5    Vertical   Austria  100 Seleccionar    0 Seleccionar    0 Seleccionar
6 Seleccionar   Holanda  100 Seleccionar    0 Seleccionar    0 Seleccionar
  F4_1   G1                                                 G1_1 G1_2   G2
1    0 1701 Fabricaci<f3>n de pulpa de madera, papel y cart<f3>n   98 3510
2    0 1811                      IMPRENTA Y TALLERES GR<c1>FICOS  100    0
3    0 1610                                   ASERRADO DE MADERA  100    0
4    0 1079       Elaboraci<f3>n de otros productos alimenticios  100    0
5    0 3312  Servicios de mantenimiento a planta de celulosa UPM   90 4659
6    0 2011  Fabricaci<f3>n de Sustancias Qu<ed>micas B<e1>sicas   66 4669
                                                                       G2_1
1 Generaci<f3>n, captaci<f3>n y distribuci<f3>n de energ<ed>a el<e9>ctrica.
2                                                                      <NA>
3                                                                      <NA>
4                                                                      <NA>
5                         Venta de repuestos para la planta de celulosa UPM
6      Comercializaci<f3>n de Susancias Qu<ed>micas realizadas por terceros
  G2_2 G3 G3_1 G3_2 G4 H1_1 H1_2 H1_2_A H1_3 H1_4 H1_5 H1_6 H1_7 H1_8 H1_9
1    2  0 <NA>    0 No    0    0      0    0    0    0    0    0    0    0
2    0  0 <NA>    0 No    0    0      0    0    0    1    0    0    0    0
3    0  0 <NA>    0 No    0    0      0    0    0    0    0    0    0    0
4    0  0 <NA>    0 Si    0    0      0    0    0    0    0    0    0    0
5   10  0 <NA>    0 No    0    0      0    0    0    0    0    0    0    0
6   34  0 <NA>    0 No    0    0      0    0    0    0    0    0    0    0
  H1_10 H1_11 H1_12 H1_13 H1_14 H1_15 H1_16 H1_17 H1_18 H1_19 H1_20 H1_21
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     1     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  H2_1 H2_2   H2_3 H2_4 H2_5 H2_6 H2_7 H2_8 H2_9 H2_10 H2_11 H2_12 H2_13
1    0    0      0    0    0    0    0    0    0     0     0     0     0
2    0    0      0    0    1    0    0    0    0     0     0     0     0
3    1    0 997860    0    0    0    0    0    0     0     0     0     0
4    0    0      0    0    0    0    0    0    0     0     0     0     0
5    0    0      0    0    0    0    0    0    2     0     0     0     0
6    0    0      0    1    0    0    0    0    0     0     0     0     0
  H2_14 H2_15 H2_16 H2_17 H2_18 H2_19 H2_20 H2_21 H3_1 H3_2   H3_3 H3_4
1     0     0     0     0     0     0     0     0    0    0      0    0
2     0     0     0     0     0     1     0     0    0    0      0    0
3     0     0     0     0     0     0     0     0    1    0 997860    0
4     0     0     0     0     0     0     0     0    0    0      0    0
5     0     0     0     0     0     0     2     0    0    0      0    0
6     2     0     0     0     0     0     0     3    0    0      0    1
  H3_5 H3_6 H3_7 H3_8 H3_9 H3_10 H3_11 H3_12 H3_13 H3_14 H3_15 H3_16 H3_17
1    0    0    0    0    0     0     0     0     0     0     0     0     0
2    2    0    0    0    0     0     0     0     0     0     0     0     0
3    0    0    0    0    0     0     0     0     0     0     0     0     0
4    0    0    0    0    0     0     0     0     0     0     0     0     0
5    0    0    0    0    2     0     0     0     0     0     0     0     0
6    0    0    0    0    0     0     0     0     0     2     0     0     0
  H3_18 H3_19 H3_20 H3_21 __2H1_1  __2H1_2  __2H1_3 __2H1_4 __2H1_5
1     0     0     0     0      10  3466548  1589834       0       0
2     0     2     0     0      40 19670298        0       0       0
3     0     0     0     0       4  1419773        0       0       0
4     0     0     0     0      36 27479027 17793966       1 2873591
5     0     0     2     0      10  8441731        0       0       0
6     0     0     0     3       5  1598112   513707       0       0
  __2H1_6 __2H1_7 __2H1_8 __2H1_9 __2H1_10 __2H1_11 __2H1_12 __2H1_13
1       0       0       0       0        0        0        0        8
2       0       0       0       0        0        0        0       40
3       0       1 1432380       0        0        0        0        0
4 1601233       0       0       0        2  1900901        0        2
5       0       0       0       0        0        0        0        3
6       0       0       0       0        1    63081        0        2
  __2H1_14 __2H1_15 __2H2_1  __2H2_2  __2H2_3 __2H2_4 __2H2_5 __2H2_6
1        2        0       0        0        0       0       0       0
2        0        0     142 34740065        0       0       0       0
3        0        0      95 12763107        0       0       0       0
4       27        8      38 19271819 14854338       0       0       0
5        7        0       0        0        0       0       0       0
6        3        0      38 22118632  6181805       0       0       0
  __2H2_7 __2H2_8 __2H2_9 __2H2_10 __2H2_11 __2H2_12 __2H2_13 __2H2_14
1       0       0       0        0        0        0        0        0
2       0       0       0        0        0        0      142        0
3       0       0       0        0        0        0        0        0
4       0       0       0        1   366285        1       33        5
5       0       0       0        0        0        0        0        0
6       0       0       0        0        0        0       34        4
  __2H2_15 __2H3_1   __2H3_2  __2H3_3 __2H3_4 __2H3_5 __2H3_6 __2H3_7
1        0     161 139888131 53251757       4 9336588 2483696      10
2        0       0         0        0       0       0       0       0
3        0       2    734684        0       0       0       0       0
4        0      23  23550721 15433218       2 5297612 3558710       0
5        0      77  83362094        0       0       0       0       0
6        0      16  22213317  7570704       0       0       0       0
  __2H3_8 __2H3_9 __2H3_10 __2H3_11 __2H3_12 __2H3_13 __2H3_14 __2H3_15
1 1678324 2804181        1   279745        0       21      140       15
2       0       0        0        0        0        0        0        0
3       0       0        0        0        0        0        0        0
4       0       0        1   665382        0        3       19        3
5       0       0        0        0        0       68        6        3
6       0       0        0        0        0        0       14        2
  __2H4_1   __2H4_2  __2H4_3 __2H4_4 __2H4_5 __2H4_6 __2H4_7 __2H4_8
1     171 143354679 54841591       4 9336588 2483696      10 1678324
2     182  54410363        0       0       0       0       0       0
3     101  14917564        0       0       0       0       1 1432380
4      97  70301567 48081522       3 8171203 5159943       0       0
5      87  91803825        0       0       0       0       0       0
6      59  45930061 14266216       0       0       0       0       0
  __2H4_9 __2H4_10 __2H4_11 __2H4_12 __2H4_13 __2H4_14 __2H4_15     I1_1
1 2804181        1   279745        0       29      142       15  9870494
2       0        0        0        0      182        0        0  3716441
3       0        0        0        0        0        0        0  1849870
4       0        4  2932568        1       38       51       11 13456232
5       0        0        0        0       71       13        3  4607611
6       0        1    63081        0       36       21        2  2933356
  I1_2   I1_3    I2_1 I2_2 I2_3    I3_1   I3_2  I3_3     I4_1 I4_2 I4_3
1    0      0 8521388    0    0 7262242 208430 91734 237387.0    0    0
2    0      0 2307264    0    0  878608      0     0  62425.0    0    0
3    0 118621       0    0    0 1352528 110339     0      0.0    0    0
4    0      0 3769430    0    0 1420352 110587     0      0.0    0    0
5    0      0 3702167    0    0 4804866      0     0 100679.2    0    0
6    0      0 2524705    0    0 2668099      0     0  68072.0    0    0
  I5_1    I5_2 I5_3     I6_1 I6_2 I6_3     I7_1    I7_2   I7_3      J1_1
1    0       0    0      0.0    0    0 25891511  208430  91734 10.000000
2    0       0    0 472401.0    0    0  7437139       0      0 10.000000
3    0       0    0      0.0    0    0  3202398  110339 118621  0.000000
4    0       0    0      0.0    0    0 18646014  110587      0  1.971429
5    0       0    0 141753.1    0    0 13357076       0      0  3.000000
6    0 2266616    0      0.0    0    0  8194232 2266616      0  2.946429
  J1_2     J2_1 J2_2     J3_1 J3_2      J4_1 J4_2      J5_1 J5_2 J6_1 J6_2
1    3 80.00000   30 33.00000    9 14.000000    1 4.0000000    0    1    0
2    8 32.00000   40 38.00000   29 17.000000   10 0.0000000    0    0    0
3    0 87.00000    5  8.00000    3  0.000000    0 0.0000000    0    0    0
4    2 19.71429   18 35.48571    9 10.842857    2 0.9857143    0    0    0
5    0 44.00000    5 25.00000    0  9.000000    1 2.0000000    0    0    0
6    1 22.58929    5 15.71429    1  9.821429    0 3.9285714    0    0    0
  J7_1 J7_2 K1_1 K1_2 K1_3 K1_4 K1_5 K1_6 K2_1 K2_2 K2_3 K2_4 K2_5 K2_6
1  142   43    0    0    0    0    0    0    0    0    0    0    0    0
2   97   87    0    0    0    0    0    0    0    0    0    0    0    0
3   95    8    0    0    0    0    0    0    0    0    0    0    0    0
4   69   31    0    0    0    0    0    0    0    0    0    0    0    0
5   83    6    0    0    0    0    0    0    0    0    0    0    0    0
6   55    7    0    0    0    0    0    0    0    0    0    0    0    0
  K3_1 K3_2   K3_3 K3_4 K3_5      K3_6 K4_1 K4_2     K4_3 K4_4 K4_5 K4_6
1    0    0      0  345    0 116102345  128    0 19390059    0    0    0
2    0    0      0    0    0         0    0    0        0    0    0    0
3    0    0      0    0    0         0    0    0        0    0    0    0
4    0    0      0    0    0         0   15  713  5267819    0    0    0
5    0    0      0    0    0         0    0    0        0    0    0    0
6    2   88 876541    0    0         0    0    0        0    0    0    0
  K5_1 K5_2    K5_3 K5_4 K5_5   K5_6 K6_1 K6_2    K6_3 K6_4 K6_5    K6_6
1    0    0 2595195    1    0  24396    0    0       0    0    0 1121536
2    0    0       0    0    0      0    0    0       0    0    0       0
3    0    0       0    0    0      0    0    0       0    0    0       0
4    0    0       0    0    0      0    0    0       0    0    0       0
5    0    0       0    0    0      0    0    0       0    0    0       0
6    0    0       0    4   32 256767   14    0 1133308    0    0       0
  K7_1 K7_2 K7_3 K7_4 K7_5      K7_6 K8_1 K8_2 K8_3 K8_4 K8_5     K8_6
1    0    0    0    0    0 454664534    0    0    0   93    0 80466036
2    0    0    0    0    0         0    0    0    0    0    0        0
3    0    0    0    0    0         0    0    0    0    0    0        0
4    0    0    0    0    0         0    0    0    0    0    0        0
5    0    0    0    0    0         0    0    0    0    0    0        0
6    0    0    0    0    0         0    0    0    0    0    0        0
  K9_1 K9_2     K9_3 K9_4 K9_5      K9_6 L1 L2 L3 L4_1 L4_2 L5 L6 L7 L8 L9
1  128    0 21985254  439    0 652378847  0  0  0    0       0  0  0  0  0
2    0    0        0    0    0         0  2  3  1    4       7  6  5  4  3
3    0    0        0    0    0         0  0  0  0    0       0  0  0  0  0
4   15  713  5267819    0    0         0  4  2  1    0       1  3  4  2  5
5    0    0        0    0    0         0  2  1  3    0       0  0  1  2  3
6   16   88  2009849    4   32    256767  0  1  2    0       1  0  1  1  3
  L10 L10_1 L10_2       M1_1      M1_2 M1_3      M1_4       M1_5
1   0     0                0 131432277    0 130331493 9308788279
2   1     2                0 227372578    0         0          0
3   0     0                0         0    0    234833          0
4   6     0       1304428432         0    0 989428218 1225012264
5   4     0                0         0    0         0          0
6   4     0                0 322489895    0  14757638  100067419
        M1_6 M2_1 M2_2 M2_3 M2_4 M2_5 M2_6 M3_1 M3_2 M3_3 M3_4 M3_5 M3_6
1 6122304106    0    0    0    0    0    0    0    0    0    0    0    0
2          0    0    0    0    0    0    0    0    0    0    0    0    0
3   91022184    0    0    0    0    0    0    0    0    0    0    0    0
4 4829825055    0    0    0    0    0    0    0    0    0    0    0    0
5          0    0    0    0    0    0    0    0    0    0    0    0    0
6  120126345    0    0    0    0    0    0    0    0    0    0    0    0
  M4_1      M4_2 M4_3      M4_4     M4_5   M4_6       M5_1      M5_2 M5_3
1    0         0    0 253406044        0      0          0 131432277    0
2    0         0    0         0        0      0          0 227372578    0
3    0         0    0         0        0      0          0         0    0
4    0         0    0         0        0      0 1304428432         0    0
5    0 609255125    0    240450 11199065 618943          0 609255125    0
6    0         0    0         0        0      0          0 322489895    0
       M5_4       M5_5       M5_6 M6_1 M6_2 M6_3 M6_4 M6_5    M6_6 M7_1
1 383737537 9308788279 6122304106    0    0    0    0    0       0    0
2         0          0          0    0    0    0    0    0       0    0
3    234833          0   91022184    0    0    0    0    0       0    0
4 989428218 1225012264 4829825055    0    0    0    0    0 4328887    0
5    240450   11199065     618943    0    0    0    0    0       0    0
6  14757638  100067419  120126345    0    0    0    0    0       0    0
       M7_2 M7_3 M7_4    M7_5    M7_6 M8_1_A M8_2 M8_3 M8_4 M8_5 M8_6 M9_1
1         0    0    0       0       0      0    0    0    0    0    0    0
2         0    0    0       0       0      0    0    0    0    0    0    0
3         0    0    0       0       0      0    0    0    0    0    0    0
4         0    0    0       0       0      0    0    0    0    0    0    0
5  63559210    0    0 4100461       0      0    0    0    0    0    0    0
6 168481211    0    0       0 1296504      0    0    0    0    0    0    0
       M9_2 M9_3 M9_4    M9_5    M9_6 MP1 MP2 MP3 MP4 MP5 MP6 M10_1 M10_2
1         0    0    0       0       0   0   0   0   0   0   0     0     0
2         0    0    0       0       0   0   0   0   0   0 100     0     0
3         0    0    0       0       0   0   0   0   0   0   0     0     0
4         0    0    0       0 4328887   0   0   0   0   0   0     0     0
5  63559210    0    0 4100461       0   0   0   0   0   0   0     0     0
6 168481211    0    0       0 1296504   0   0   0   0   0   0     0     0
  M10_3 M10_4 M10_5 M10_6 M11_1 M11_2 M11_3 M11_4 M11_5 M11_6 M12_1 M12_2
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M12_3 M12_4 M12_5 M12_6 M8_1 M13_2 M13_3 M13_4 M13_5 M13_6 M14_1 M14_2
1     0     0     0     0    0     0     0     0     0     0     0     0
2     0     0     0     0    0     0     0     0     0     0     0     0
3     0     0     0     0    0     0     0     0     0     0     0     0
4     0     0     0     0    0     0     0     0     0     0     0     0
5     0     0     0     0    0     0     0     0     0     0     0     0
6     0     0     0     0    0     0     0     0     0     0     0     0
  M14_3 M14_4 M14_5 M14_6 M15_1 M15_2 M15_3 M15_4 M15_5 M15_6 M16_1
1     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0
      M16_2 M16_3 M16_4 M16_5 M16_6 M17_1 M17_2 M17_3 M17_4 M17_5 M17_6
1         0     0     0     0     0     0     0     0     0     0     0
2         0     0     0     0     0     0     0     0     0     0     0
3         0     0     0     0     0     0     0     0     0     0     0
4         0     0     0     0     0     0     0     0     0     0     0
5         0     0     0     0     0     0     0     0     0     0     0
6 114092352     0     0     0     0     0     0     0     0     0     0
  M18_1     M18_2 M18_3 M18_4 M18_5 M18_6 M19_1 M19_2 M19_3 M19_4 M19_5
1     0         0     0     0     0     0     0     0     0     0     0
2     0         0     0     0     0     0     0     0     0     0     0
3     0         0     0     0     0     0     0     0     0     0     0
4     0         0     0     0     0     0     0     0     0     0     0
5     0         0     0     0     0     0     0     0     0     0     0
6     0 114092352     0     0     0     0     0     0     0     0     0
  M19_6 M20_1 M20_2 M20_3 M20_4 M20_5 M20_6 M21_1 M21_2 M21_3 M21_4 M21_5
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M21_6 M22_1 M22_2 M22_3 M22_4 M22_5 M22_6 M23_1 M23_2 M23_3 M23_4 M23_5
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M23_6 M24_1 M24_2 M24_3 M24_4 M24_5 M24_6 M25_1 M25_2 M25_3 M25_4 M25_5
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M25_6 M26_1 M26_2 M26_3 M26_4 M26_5 M26_6 M27_1 M27_2 M27_3 M27_4 M27_5
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M27_6 M28_1 M28_2 M28_3 M28_4 M28_5 M28_6 M29_1 M29_2 M29_3 M29_4 M29_5
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M29_6 M30_1 M30_2 M30_3 M30_4 M30_5 M30_6 M31_1 M31_2 M31_3 M31_4 M31_5
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M31_6 M32_1 M32_2 M32_3 M32_4 M32_5 M32_6 M33_1 M33_2 M33_3 M33_4 M33_5
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M33_6 M34_1 M34_2 M34_3 M34_4 M34_5 M34_6 MSF35_1 MSF35_2 M37_1 M37_2
1     0     0     0     0     0     0     0       0       0     0     0
2     0     0     0     0     0     0     0       0       0     0     0
3     0     0     0     0     0     0     0       0       0     0     0
4     0     0     0     0     0     0     0       0       0     0     0
5     0     0     0     0     0     0     0       0       0     0     0
6     0     0     0     0     0     0     0       0       0     0     0
  M37_3 M37_4 M37_5 M37_6 M38_1 M38_2 M38_3 M38_4 M38_5 M38_6 M39_1 M39_2
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M39_3 M39_4 M39_5 M39_6 M40_1 M40_2 M40_3 M40_4 M40_5 M40_6 M41_1 M41_2
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M41_3 M41_4 M41_5 M41_6 M42_1 M42_2 M42_3 M42_4 M42_5 M42_6 M43_1 M43_2
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M43_3 M43_4 M43_5 M43_6 M44_1 M44_2 M44_3 M44_4 M44_5 M44_6 M45_1 M45_2
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M45_3 M45_4 M45_5 M45_6 M46_1 M46_2 M46_3 M46_4 M46_5 M46_6 M47_1 M47_2
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  M47_3   M47_4 M47_5 M47_6 M48_1    M48_2 M48_3    M48_4 M48_5  M48_6
1     0 7968133     0     0     0        0     0        0     0      0
2     0       0     0     0     0        0     0        0     0 929086
3     0       3     0     0     0        0     0   769199     0      0
4     0  159413     0     0     0        0     0 28338289     0      0
5     0 3916421     0     0     0 17576275     0        0     0      0
6     0       0  1376     0     0        0     0   313800 22983      0
  M49_1 M49_2 M49_3 M49_4 M49_5 M49_6 M50_1    M50_2 M50_3   M50_4 M50_5
1     0     0     0     0     0     0     0 11315612     0  211335     0
2     0     0     0     0     0     0     0        0     0       0     0
3     0     0     0     0     0     0     0        0     0  218428     0
4     0     0     0     0     0     0     0        0     0 4219945     0
5     0     0     0     0     0     0     0        0     0       0     0
6     0     0     0 76616     0     0     0        0     0 5875248     0
    M50_6 M51_1    M51_2 M51_3    M51_4 M51_5   M51_6      M52_1     M52_2
1 2467711     0 11315612     0  8179468     0 2467711          0 142747889
2       0     0        0     0        0     0  929086          0 227372578
3       0     0        0     0   987630     0       0          0         0
4       0     0        0     0 32717647     0       0 1304428432         0
5       0     0 17576275     0  3916421     0       0          0 690390610
6       0     0        0     0  6265664 24359       0          0 605063458
  M52_3      M52_4      M52_5      M52_6          N1      N2 N3 N4      N5
1     0  391917005 9308788279 6124771817 15431092385       0  0  0 2467711
2     0          0          0     929086           0       0  0  0  929086
3     0    1222463          0   91022184    91022184       0  0  0       0
4     0 1022145865 1225012264 4834153942  6054837319 4328887  0  0       0
5     0    4156871   15299526     618943    11818008 4100461  0  0       0
6     0   21023302  100091778  121422849   220193764 1296504  0  0   24359
         N1_1 NP1_1        N1_2 NP2_1        N1_3 NP3_1        N1_4 NP4_1
1       China    36    Alemania    34     Francia    14      Italia     3
2 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
3   Espa<f1>a    72   Marruecos    23       China     5 Seleccionar     0
4       Japon    23   Guatemala    11    Honduras    13    Colombia     6
5   Finlandia    83     Austria    17 Seleccionar     0 Seleccionar     0
6   Argentina    26      Brasil    62    Colombia    12 Seleccionar     0
         N1_5 NP5_1        N1_6 NP6_1        N1_7 NP7_1        N1_8 NP8_1
1   Finlandia     3 Union Europ     3        Otro     7 Seleccionar     0
2 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
3 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
4   Argentina     5      Brasil     5      Panama     5        Otro    32
5 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
6 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
            N2_1 NP1_2        N2_2 NP2_2        N2_3 NP3_2        N2_4
1    Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2    Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3    Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4 Republica Domi    50     Jamaica    11   Guatemala     5        Otro
5      Finlandia    69     Austria    31 Seleccionar     0 Seleccionar
6         Panama   100 Seleccionar     0 Seleccionar     0 Seleccionar
  NP4_2        N2_5 NP5_2        N2_6 NP6_2        N2_7 NP7_2        N2_8
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4    34 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
  NP8_2        N3_1 NP1_3        N3_2 NP2_3        N3_3 NP3_3        N3_4
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
  NP4_3        N3_5 NP5_3        N3_6 NP6_3        N3_7 NP7_3        N3_8
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
  NP8_3        N4_1 NP1_4        N4_2 NP2_4        N4_3 NP3_4        N4_4
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
  NP4_4        N4_5 NP5_4        N4_6 NP6_4        N4_7 NP7_4        N4_8
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
  NP8_4        N5_1 NP1_5        N5_2 NP2_5        N5_3 NP3_5        N5_4
1     0   Finlandia   100 Seleccionar     0 Seleccionar     0 Seleccionar
2     0    Alemania   100 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0     Holanda    38   Finlandia    62 Seleccionar     0 Seleccionar
  NP4_5        N5_5 NP5_5        N5_6 NP6_5        N5_7 NP7_5        N5_8
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
  NP8_5      O1_1      O1_2       O1_3      O1_4      O1_5      O1_6 O2_1
1     0         0 596865577 2980310135 771117149  52259863 357627421    0
2     0         0 134346842          0         0         0         0    0
3     0         0         0          0  35183862         0         0    0
4     0 171226346         0          0  12674472 458662667 282404301    0
5     0         0         0          0         0         0         0    0
6     0         0 192151952          0   8432063  62555518  78614843    0
  O2_2 O2_3 O2_4 O2_5 O2_6 O3_1 O3_2 O3_3 O3_4 O3_5 O3_6 O4_1      O4_2
1    0    0    0    0    0    0    0    0    0    0    0    0         0
2    0    0    0    0    0    0    0    0    0    0    0    0         0
3    0    0    0    0    0    0    0    0    0    0    0    0         0
4    0    0    0    0    0    0    0    0    0    0    0    0         0
5    0    0    0    0    0    0    0    0    0    0    0    0 101977844
6    0    0    0    0    0    0    0    0    0    0    0    0         0
  O4_3 O4_4     O4_5   O4_6      O5_1      O5_2       O5_3      O5_4
1    0    0        0      0         0 596865577 2980310135 771117149
2    0    0        0      0         0 134346842          0         0
3    0    0        0      0         0         0          0  35183862
4    0    0        0      0 171226346         0          0  12674472
5    0    0 10191149 310063         0 101977844          0         0
6    0    0        0      0         0 192151952          0   8432063
       O5_5      O5_6 O6_1 O6_2 O6_3 O6_4 O6_5    O6_6 O7_1     O7_2 O7_3
1  52259863 357627421    0    0    0    0    0       0    0        0    0
2         0         0    0    0    0    0    0       0    0        0    0
3         0         0    0    0    0    0    0       0    0        0    0
4 458662667 282404301    0    0    0    0    0 1216024    0        0    0
5  10191149    310063    0    0    0    0    0       0    0 20543794    0
6  62555518  78614843    0    0    0    0    0       0    0        0    0
  O7_4    O7_5      O7_6 __0_E    __0_D __0_C __0_B   __0_A       __0
1    0       0         0     0        0     0     0       0         0
2    0       0         0     0        0     0     0       0         0
3    0       0         0     0        0     0     0       0         0
4    0       0         0     0        0     0     0       0   1216024
5    0 3731419         0     0 20543794     0     0 3731419         0
6    0       0 190864681     0        0     0     0       0 190864681
      O8_1    O8_2 O8_3   O8_4 O8_5 O8_6 O9_1 O9_2   O9_3     O9_4 O9_5
1 88677737       0    0      0    0    0    0    0 125064 55749544    0
2        0 1962971    0      0    0    0    0    0      0        0    0
3        0       0    0 252917    0    0    0    0      0  2422055    0
4        0 3991902    0      0    0    0    0    0      0 12372543    0
5        0 1440775    0      0    0    0    0    0      0        0    0
6        0 3284986    0      0    0    0    0    0      0    26617    0
     O9_6 O10_1     O10_2 O10_3    O10_4 O10_5      O10_6 O11_1   O11_2
1 5504907     0 318878274     0    72196     0 1043762883     0       0
2       0     0         0     0        0     0          0     0       0
3       0     0         0     0 14693044     0          0     0       0
4       0     0         0     0        0     0          0     0       0
5       0     0   2564290     0        0     0          0     0   62910
6       0     0         0     0        0     0          0     0 1435191
     O11_3   O11_4 O11_5 O11_6 O12_1   O12_2 O12_3   O12_4  O12_5 O12_6
1 93592637 1077979     0     0     0       0     0 5321249      0     0
2        0       0     0     0     0       0     0       0      0     0
3        0       0     0     0     0       0     0       0      0     0
4        0       0     0     0     0       0     0       0      0     0
5        0       0     0     0     0 2048341     0       0      0     0
6        0 3780744     0     0     0       0     0 2079857 848943     0
  O13_1     O13_2 O13_3    O13_4 O13_5 O13_6 O14_1   O14_2 O14_3    O14_4
1     0 407703552     0        0     0     0     0       0     0 11639612
2     0   6209265     0        0     0     0     0  675235     0        0
3     0         0     0  5001973     0     0     0       0     0   191851
4     0         0     0 11565788     0     0     0       0     0   522691
5     0   1359732     0        0     0     0     0 1206318     0        0
6     0         0     0  1470419     0     0     0       0     0  1104687
  O14_5 O14_6 O15_1     O15_2 O15_3  O15_4 O15_5 O15_6 O16_1     O16_2
1     0     0     0    392986     0      0     0     0     0  12291618
2     0     0     0   5499795     0      0     0     0     0         0
3     0     0     0         0     0      0     0     0     0         0
4     0     0     0         0     0      0     0     0     0         0
5     0     0     0 202184520     0      0     0     0     0 127154472
6     0     0     0         0     0 263485     0     0     0   1218493
   O16_3    O16_4 O16_5   O16_6 O17_1 O17_2 O17_3  O17_4 O17_5 O17_6 O18_1
1 737455 10579520     0 8059957     0     0     0      0     0     0     0
2      0        0     0       0     0     0     0      0     0     0     0
3      0  2853373     0       0     0     0     0 931907     0     0     0
4      0 15108444     0       0     0     0     0      0     0     0     0
5      0        0     0       0     0     0     0      0     0     0     0
6      0  5136146     0       0     0     0     0      0     0     0     0
   O18_2 O18_3     O18_4 O18_5 O18_6 O19_1 O19_2 O19_3    O19_4     O19_5
1      0     0   1841346     0     0     0     0     0 11333424         0
2      0     0         0     0     0     0     0     0        0         0
3      0     0    386557     0     0     0     0     0    50290         0
4      0     0 701826441     0     0     0     0     0        0 132753482
5 223931     0         0     0     0     0     0     0        0         0
6      0     0    768097     0     0     0     0     0   153961         0
      O19_6 O20_1 O20_2 O20_3 O20_4    O20_5 O20_6 O21_1 O21_2 O21_3 O21_4
1    697961     0     0     0     0        0     0     0     0     0     0
2         0     0     0     0     0        0     0     0 36649     0     0
3         0     0     0     0     0        0     0     0     0     0     0
4 919918930     0     0     0     0        0     0     0     0     0     0
5         0     0     0     0     0        0     0     0     0     0     0
6         0     0     0     0     0 21747780     0     0     0     0     0
  O21_5    O21_6 O22_1  O22_2 O22_3   O22_4   O22_5 O22_6 O23_1   O23_2
1     0        0     0      0     0 5056950 4763952 12517     0       0
2     0        0     0 671958     0       0       0     0     0       0
3     0        0     0      0     0  371145       0     0     0       0
4     0 23382113     0      0     0 1786618       0     0     0       0
5     0        0     0 557114     0       0       0     0     0 1097529
6     0        0     0      0     0       0       0     0     0       0
  O23_3 O23_4   O23_5  O23_6    O24_1     O24_2    O24_3     O24_4
1     0     0 9509483 715222 88677737 739266430 94455156 102671820
2     0     0       0      0        0  15055873        0         0
3     0     0       0      0        0         0        0  27155112
4     0     0       0      0        0   3991902        0 743182525
5     0     0       0      0        0 339899932        0         0
6     0     0 6622110      0        0   5938670        0  14784013
      O24_5      O24_6 O25_1 O25_2 O25_3 O25_4 O25_5 O25_6 O26_1 O26_2
1  14273435 1058753447     0     0     0     0     0     0     0     0
2         0          0     0     0     0     0     0     0     0     0
3         0          0     0     0     0     0     0     0     0     0
4 132753482  943301043     0     0     0     0     0     0     0     0
5         0          0     0     0     0     0     0     0     0     0
6  29218833          0     0     0     0     0     0     0     0     0
  O26_3 O26_4 O26_5 O26_6 O27_1 O27_2 O27_3 O27_4 O27_5 O27_6 O28_1 O28_2
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  O28_3 O28_4 O28_5 O28_6 O29_1 O29_2 O29_3 O29_4 O29_5 O29_6 O30_1 O30_2
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  O30_3   O30_4   O30_5   O30_6 O31_1    O31_2 O31_3   O31_4 O31_5  O31_6
1     0       0       0       0     0        0     0       0     0      0
2     0       0       0       0     0        0     0       0     0 259992
3     0       0       0       0     0        0     0 1268426     0      0
4     0       0       0       0     0        0     0       0     0      0
5     0 1518607 3191431 1561861     0 16877079     0       0     0      0
6     0       0       0       0     0        0     0 2148728     0      0
  O32_1  O32_2 O32_3  O32_4 O32_5   O32_6 O33_1 O33_2 O33_3  O33_4
1     0      0     0  81622     0 2621003     0     0     0      0
2     0      0     0 566560     0       0     0     0     0      0
3     0      0     0 414524     0       0     0     0     0      0
4     0      0     0      0     0       0     0     0     0 964093
5     0 487052     0      0     0       0     0     0     0      0
6     0      0     0 547288     0       0     0     0     0      0
     O33_5     O33_6 O34_1  O34_2 O34_3   O34_4  O34_5 O34_6 O35_1
1  1765434 356570599     0      0     0 3044673      0     0     0
2        0  13799257     0      0     0 3488275      0     0     0
3        0         0     0      0     0       0      0     0     0
4        0         0     0      0     0       0      0     0     0
5        0         0     0      0     0       0      0     0     0
6 55019954         0     0 238144     0       0 863119     0     0
     O35_2 O35_3   O35_4    O35_5     O35_6     O36_1      O36_2
1        0     0 3126295  1765434 359191602  88677737 1336132007
2        0     0 4054835        0  14059249         0  149402715
3        0     0 1682950        0         0         0          0
4        0     0  964093        0         0 171226346    3991902
5 17364131     0 1518607  3191431   1561861         0  479785701
6   238144     0 2696016 55883073         0         0  198328766
       O36_3     O36_4     O36_5      O36_6        P1        P2 P3 P4
1 3074765291 876915264  68298732 1775572470 409887284         0  0  0
2          0   4054835         0   14059249         0         0  0  0
3          0  64021924         0          0         0         0  0  0
4          0 756821090 591416149 1226921368 741066968   1216024  0  0
5          0   1518607  17113999    1871924  10501212   3731419  0  0
6          0  25912092 147657424  269479524 141170361 190864681  0  0
          P5        P1_1 PP1_1        P1_2 PP2_1        P1_3 PP3_1
1 1433983918   Finlandia    25     Belgica    46      Canada    12
2   14059249 Seleccionar     0 Seleccionar     0 Seleccionar     0
3          0 Seleccionar     0 Seleccionar     0 Seleccionar     0
4 1076054525      Mexico    23       Japon    18   Argentina    15
5    4753292   Finlandia    83     Austria    17 Seleccionar     0
6   85101906   Argentina    33      Brasil    61    Colombia     6
         P1_4 PP4_1        P1_5 PP5_1        P1_6 PP6_1        P1_7 PP7_1
1    Alemania     5      Brasil     4        Otro     8 Seleccionar     0
2 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
3 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
4    Colombia     6   Guatemala     4    Honduras     6        Peru     4
5 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
6 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
         P1_8 PP8_1           P2_1 PP1_2        P2_2 PP2_2        P2_3
1 Seleccionar     0    Seleccionar     0 Seleccionar     0 Seleccionar
2 Seleccionar     0    Seleccionar     0 Seleccionar     0 Seleccionar
3 Seleccionar     0    Seleccionar     0 Seleccionar     0 Seleccionar
4        Otro    24           Otro   100 Seleccionar     0 Seleccionar
5 Seleccionar     0      Finlandia    69     Austria    31 Seleccionar
6 Seleccionar     0 Estados Unidos    42    Alemania    24   Finlandia
  PP3_2        P2_4 PP4_2        P2_5 PP5_2        P2_6 PP6_2        P2_7
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6    18   Espa<f1>a     8   Argentina     6      Brasil     2 Seleccionar
  PP7_2        P2_8 PP8_2        P3_1 PP1_3        P3_2 PP2_3        P3_3
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
  PP3_3        P3_4 PP4_3        P3_5 PP5_3        P3_6 PP6_3        P3_7
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
  PP7_3        P3_8 PP8_3        P4_1 PP1_4        P4_2 PP2_4        P4_3
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
  PP3_4        P4_4 PP4_4        P4_5 PP5_4        P4_6 PP6_4        P4_7
1     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
2     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
3     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
4     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
5     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
6     0 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar
  PP7_4        P4_8 PP8_4           P5_1 PP1_5          P5_2 PP2_5
1     0 Seleccionar     0      Finlandia     5 Union Europea    95
2     0 Seleccionar     0       Alemania   100   Seleccionar     0
3     0 Seleccionar     0    Seleccionar     0   Seleccionar     0
4     0 Seleccionar     0 Estados Unidos    11       Irlanda     1
5     0 Seleccionar     0    Seleccionar     0   Seleccionar     0
6     0 Seleccionar     0        Holanda    65     Finlandia    35
         P5_3 PP3_5        P5_4 PP4_5        P5_5 PP5_5        P5_6 PP6_5
1 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
2 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
3 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
4        Otro    88 Seleccionar     0 Seleccionar     0 Seleccionar     0
5 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
6 Seleccionar     0 Seleccionar     0 Seleccionar     0 Seleccionar     0
         P5_7 PP7_5        P5_8 PP8_5 Q1_1 Q1_2 Q1_3 Q1_4        Q1_5 Q1_6
1 Seleccionar     0 Seleccionar     0    0    0    0    0 Seleccionar    0
2 Seleccionar     0 Seleccionar     0    0    0    0    0 Seleccionar    0
3 Seleccionar     0 Seleccionar     0    0    0    0    0 Seleccionar    0
4 Seleccionar     0 Seleccionar     0    0    0    0    0 Seleccionar    0
5 Seleccionar     0 Seleccionar     0    0    0    0    0 Seleccionar    0
6 Seleccionar     0 Seleccionar     0    0    0    0    0 Seleccionar    0
  Q1_7 Q1_8 Q1_9 Q1_10 Q1_11 Q1_12 Q1_13 Q1_14 Q1_15 Q2_1 Q2_2 Q2_3 Q2_4
1    0    0    0     0     0     0     0     0     0    0    0    0    0
2    0    0    0     0     0     0     0     0     0    0    0    0    0
3    0    0    0     0     0     0     0     0     0    0    0    0    0
4    0    0    0     0     0     0     0     0     0    0    0    0    0
5    0    0    0     0     0     0     0     0     0    0    0    0    0
6    0    0    0     0     0     0     0     0     0    0    0    0    0
         Q2_5 Q2_6 Q2_7 Q2_8 Q2_9 Q2_10 Q2_11 Q2_12 Q2_13 Q2_14 Q2_15 Q3_1
1 Seleccionar    0    0    0    0     0     0     0     0     0     0    0
2 Seleccionar    0    0    0    0     0     0     0     0     0     0    0
3 Seleccionar    0    0    0    0     0     0     0     0     0     0    0
4 Seleccionar    0    0    0    0     0     0     0     0     0     0    0
5 Seleccionar    0    0    0    0     0     0     0     0     0     0    0
6 Seleccionar    0    0    0    0     0     0     0     0     0     0    0
  Q3_2 Q3_3 Q3_4        Q3_5 Q3_6 Q3_7 Q3_8 Q3_9 Q3_10 Q3_11 Q3_12 Q3_13
1    0    0    0 Seleccionar    0    0    0    0     0     0     0     0
2    0    0    0 Seleccionar    0    0    0    0     0     0     0     0
3    0    0    0 Seleccionar    0    0    0    0     0     0     0     0
4    0    0    0 Seleccionar    0    0    0    0     0     0     0     0
5    0    0    0 Seleccionar    0    0    0    0     0     0     0     0
6    0    0    0 Seleccionar    0    0    0    0     0     0     0     0
  Q3_14 Q3_15    Q4_1 Q4_2    Q4_3 Q4_4        Q4_5 Q4_6    Q4_7 Q4_8 Q4_9
1     0     0       0    0       0    0 Seleccionar    0       0    0    0
2     0     0  523631    0  191917    0     Uruguay    0  191917    0    0
3     0     0  159599    0   33240    0 Seleccionar    0   33240    0    0
4     0     0 3747764    0 1060732    0 Seleccionar    0 1060732    0    0
5     0     0  464394    0  838648    0 Seleccionar    0  838648    0    0
6     0     0  450835    0  587591    0 Seleccionar    0  587591    0    0
  Q4_10 Q4_11  Q4_12   Q4_13 Q4_14   Q4_15     Q5_1 Q5_2    Q5_3   Q5_4
1     0     0      0       0     0       0 54153994    0 1522554      0
2   100     0      0  250531 14007  479024        0    0  140721      0
3     0     0      0   63871     0  128968  4895942    0       0 210000
4     0     0      0 1454670 74671 3428497  4178832    0 2444842      0
5     1     0      0  477489     0  825553   326641    0       0      0
6   100     0 145798  723443  6723  175908  2022680    0 1776544      0
         Q5_5 Q5_6    Q5_7 Q5_8 Q5_9 Q5_10 Q5_11   Q5_12   Q5_13 Q5_14
1 Seleccionar    0 1522554    0    0   100     0 1317942  446045     0
2     Uruguay  138  140583    0    0   100     0       0   28006     0
3   Espa<f1>a    0  210000    0    0     0     0       0  711695     0
4 Seleccionar    0 2444842    0    0     0     0       0 1680951 82095
5 Seleccionar    0       0    0    0     0     0       0  102032     0
6 Seleccionar    0 1776544    0    0   100     0  206773  416588 49559
     Q5_15        Q6_1 Q6_2      Q6_3     Q6_4        Q6_5 Q6_6      Q6_7
1 53912561 12183529362    0 353932302        0 Seleccionar    0 353932302
2   112577   255675252    0         0  3825373    Alemania    0   3825373
3  4394247    19279367    0    938977        0 Seleccionar    0    938977
4  5024818   126375318    0  36033667        0 Seleccionar    0  36033667
5   224609           0    0         0        0 Seleccionar    0         0
6  3225422  1325609604    0   8020205 28435268 Union Europ    0  36455473
  Q6_8 Q6_9 Q6_10 Q6_11   Q6_12     Q6_13     Q6_14       Q6_15    Q7_1
1    0    0   100     0 2196470 914838487 290102081 11910528788 5667474
2    0  100     0     0  302202   8624941   5447359   256020841 1076931
3    0    0     0     0       0   2900006         0    17318338  384579
4    0    0     0     0       0  19946683   2306708   144769010  674801
5    0    0     0     0       0         0         0           0   62179
6    0    0   100     0       0 103919719  25871863  1284017221 1205540
  Q7_2    Q7_3 Q7_4        Q7_5 Q7_6    Q7_7 Q7_8 Q7_9 Q7_10 Q7_11 Q7_12
1    0 1766424    0 Seleccionar    0 1766424    0    0   100     0  1404
2    0   56461    0     Uruguay    0   56461    0    0   100     0     0
3    0       0    0 Seleccionar    0       0    0    0     0     0     0
4    0       0    0 Seleccionar    0       0    0    0     0     0     0
5    0       0    0 Seleccionar    0       0    0    0     0     0     0
6    0       0    0 Seleccionar    0       0    0    0     0     0     0
   Q7_13  Q7_14   Q7_15     Q8_1 Q8_2   Q8_3    Q8_4        Q8_5 Q8_6
1   9074 138809 7562229        0    0      0       0 Seleccionar    0
2 186237  70817 1017972        0    0      0       0 Seleccionar    0
3  92566      0  292013        0    0      0       0 Seleccionar    0
4 118890  12778  568689        0    0      0       0 Seleccionar    0
5  38101      0   24078  6453179    0 679958 4514018   Finlandia    0
6 229191  22180  998529 57728674    0      0       0 Seleccionar    0
     Q8_7 Q8_8 Q8_9 Q8_10 Q8_11 Q8_12   Q8_13   Q8_14    Q8_15      Q9_1
1       0    0    0     0     0     0       0       0        0         0
2       0    0    0     0     0     0       0       0        0  23980216
3       0    0    0     0     0     0       0       0        0  36863152
4       0    0    0     0     0     0       0       0        0 128565746
5 5193976    0    0     1     0     0 2517236       0  9129919         0
6       0    0    0     0     0     0 4484894 1114271 54358051 831754815
  Q9_2    Q9_3 Q9_4        Q9_5 Q9_6    Q9_7 Q9_8 Q9_9 Q9_10 Q9_11 Q9_12
1    0       0    0 Seleccionar    0       0    0    0     0     0     0
2    0       0    0 Seleccionar    0       0    0    0     0     0     0
3    0 2536583    0 Seleccionar    0 2536583    0    0     0     0     0
4    0       0    0 Seleccionar    0       0    0    0     0     0     0
5    0       0    0 Seleccionar    0       0    0    0     0     0     0
6    0  332612    0 Seleccionar    0  332612    0    0   100     0     0
     Q9_13    Q9_14     Q9_15      Q10_1 Q10_2   Q10_3 Q10_4       Q10_5
1        0        0         0 4686474853     0 6629629     0 Seleccionar
2  1063262   515457  23432411          0     0       0     0 Seleccionar
3  1285118        0  38114617     425051     0       0     0 Seleccionar
4  4840063  2338668 126064351          0     0       0     0 Seleccionar
5        0        0         0          0     0       0     0 Seleccionar
6 36686446 16281291 811682272          0     0       0     0 Seleccionar
  Q10_6   Q10_7 Q10_8 Q10_9 Q10_10 Q10_11 Q10_12    Q10_13    Q10_14
1     0 6629629     0     0    100      0      0 357620488 110706729
2     0       0     0     0      0      0      0         0         0
3     0       0     0     0      0      0      0      8794         0
4     0       0     0     0      0      0      0         0         0
5     0       0     0     0      0      0      0         0         0
6     0       0     0     0      0      0      0         0         0
      Q10_15 Q11_1 Q11_2 Q11_3 Q11_4       Q11_5 Q11_6 Q11_7 Q11_8 Q11_9
1 4446190723     0     0     0     0 Seleccionar     0     0     0     0
2          0     0     0     0     0 Seleccionar     0     0     0     0
3     416257     0     0     0     0 Seleccionar     0     0     0     0
4          0     0     0     0     0 Seleccionar     0     0     0     0
5          0     0     0     0     0 Seleccionar     0     0     0     0
6          0     0     0     0     0 Seleccionar     0     0     0     0
  Q11_10 Q11_11 Q11_12 Q11_13 Q11_14 Q11_15 Q12_1 Q12_2 Q12_3 Q12_4
1      0      0      0      0      0      0     0     0     0     0
2      0      0      0      0      0      0     0     0     0     0
3      0      0      0      0      0      0     0     0     0     0
4      0      0      0      0      0      0     0     0     0     0
5      0      0      0      0      0      0     0     0     0     0
6      0      0      0      0      0      0     0     0     0     0
        Q12_5 Q12_6 Q12_7 Q12_8 Q12_9 Q12_10 Q12_11 Q12_12 Q12_13 Q12_14
1 Seleccionar     0     0     0     0      0      0      0      0      0
2 Seleccionar     0     0     0     0      0      0      0      0      0
3 Seleccionar     0     0     0     0      0      0      0      0      0
4 Seleccionar     0     0     0     0      0      0      0      0      0
5 Seleccionar     0     0     0     0      0      0      0      0      0
6 Seleccionar     0     0     0     0      0      0      0      0      0
  Q12_15    Q13_1 Q13_2    Q13_3 Q13_4       Q13_5 Q13_6    Q13_7 Q13_8
1      0 41431223     0 18469182     0 Seleccionar     0 18469182     0
2      0        0     0        0     0 Seleccionar     0        0     0
3      0   749744     0        0     0 Seleccionar     0        0     0
4      0        0     0        0     0 Seleccionar     0        0     0
5      0        0     0        0     0 Seleccionar     0        0     0
6      0        0     0        0     0 Seleccionar     0        0     0
  Q13_9 Q13_10 Q13_11   Q13_12 Q13_13 Q13_14   Q13_15     Q14_1 Q14_2
1     0    100      0 36859870      0 943771 23984306 127604655     0
2     0      0      0        0      0      0        0   1917283     0
3     0      0      0        0  22503      0   727241     39196     0
4     0      0      0        0      0      0        0         0     0
5     0      0      0        0      0      0        0    999909     0
6     0      0      0        0      0      0        0    425088     0
    Q14_3 Q14_4       Q14_5 Q14_6   Q14_7 Q14_8 Q14_9 Q14_10 Q14_11 Q14_12
1 1655472     0 Seleccionar     0 1655472     0     0    100      0      0
2  108621     0     Uruguay     0  108621     0     0    100      0      0
3   32900     0 Seleccionar     0   32900     0     0      0      0      0
4       0     0 Seleccionar     0       0     0     0      0      0      0
5       0     0 Seleccionar     0       0     0     0      0      0      0
6   73885 46042   Argentina     0  119927     0     0    100      0      0
   Q14_13  Q14_14    Q14_15 Q15_1 Q15_2 Q15_3 Q15_4       Q15_5 Q15_6
1 1070108 2938117 131128136     0     0     0     0 Seleccionar     0
2  663418   44610   1407096     0     0     0     0 Seleccionar     0
3   19153       0     52943     0     0     0     0 Seleccionar     0
4       0       0         0     0     0     0     0 Seleccionar     0
5  518313       0    481596     0     0     0     0 Seleccionar     0
6  123011    8444    430448     0     0     0     0 Seleccionar     0
  Q15_7 Q15_8 Q15_9 Q15_10 Q15_11 Q15_12 Q15_13 Q15_14 Q15_15 Q16_1 Q16_2
1     0     0     0      0      0      0      0      0      0     0     0
2     0     0     0      0      0      0      0      0      0     0     0
3     0     0     0      0      0      0      0      0      0     0     0
4     0     0     0      0      0      0      0      0      0     0     0
5     0     0     0      0      0      0      0      0      0     0     0
6     0     0     0      0      0      0      0      0      0     0     0
  Q16_3 Q16_4       Q16_5 Q16_6 Q16_7 Q16_8 Q16_9 Q16_10 Q16_11 Q16_12
1     0     0 Seleccionar     0     0     0     0      0      0      0
2     0     0 Seleccionar     0     0     0     0      0      0      0
3     0     0 Seleccionar     0     0     0     0      0      0      0
4     0     0 Seleccionar     0     0     0     0      0      0      0
5     0     0 Seleccionar     0     0     0     0      0      0      0
6     0     0 Seleccionar     0     0     0     0      0      0      0
  Q16_13 Q16_14 Q16_15   Q17_1 Q17_2 Q17_3 Q17_4       Q17_5 Q17_6 Q17_7
1      0      0      0       0     0     0     0 Seleccionar     0     0
2      0      0      0       0     0     0     0 Seleccionar     0     0
3      0      0      0 7115400     0     0     0 Seleccionar     0     0
4      0      0      0       0     0     0     0 Seleccionar     0     0
5      0      0      0       0     0     0     0 Seleccionar     0     0
6      0      0      0       0     0     0     0 Seleccionar     0     0
  Q17_8 Q17_9 Q17_10 Q17_11  Q17_15    Q18_1 Q18_2    Q18_3 Q18_4
1     0     0      0      0       0        0     0        0     0
2     0     0      0      0       0        0     0        0     0
3     0     0      0      0 7115400        0     0        0     0
4     0     0      0      0       0 12221186     0 29393864     0
5     0     0      0      0       0        0     0        0     0
6     0     0      0      0       0        0     0        0     0
        Q18_5 Q18_6    Q18_7 Q18_8 Q18_9 Q18_10 Q18_11   Q18_12 Q18_13
1 Seleccionar     0        0     0     0      0      0        0      0
2 Seleccionar     0        0     0     0      0      0        0      0
3 Seleccionar     0        0     0     0      0      0        0      0
4 Seleccionar     0 29393864     0     0      0      0 39539240      0
5 Seleccionar     0        0     0     0      0      0        0      0
6 Seleccionar     0        0     0     0      0      0        0      0
  Q18_14  Q18_15 QM1 QM2 RP1_1
1      0       0   0   0    NA
2      0       0   0   0    NA
3      0       0   0   0    NA
4 200131 2275941   0   0    NA
5      0       0   0   0    NA
6      0       0   0   0    NA
                                              RP1_2       RP1_3 RP2_1
1 Fabricacion de pulpa de madera, papel y cart<f3>n 13353684658    NA
2                                LIBRO DE TAPA DURA   134149821    NA
3                                       CUADRADILLO    63357860    NA
4            Concentrados artificiales para bebidas  8441409809    NA
5                        Servicio mantenimiento UPM   393514316    NA
6                                  Clorato de Sodio   305766329    NA
                                                       RP2_2     RP2_3
1 Generacion, captacion, y distribucion de energia electrica 253406044
2                                      LIBRO DE TAPA RUSTICA  79580402
3                                                     TABLAS  27664323
4                                                       <NA>         0
5                              Servicio mantenimiento Kemira  18994007
6                                   Per<f3>xido de Hidrogeno 113053895
  RP3_1                   RP3_2     RP3_3 RP4_1 RP4_2 RP4_3 RP5_1 RP5_2
1    NA                                 0    NA           0    NA      
2    NA OTROS PRODUCTOS GR<c1>F  13642354    NA           0    NA      
3    NA                    CHIP    234833    NA           0    NA      
4    NA                                 0    NA           0    NA      
5    NA                                 0    NA           0    NA      
6    NA     Di<f3>xido de Cloro 138621073    NA           0    NA      
  RP5_3 RP6_1 RP6_2 RP6_3 RP7_1 RP7_2 RP7_3 RP8_1 RP8_2 RP8_3         rpt
1     0    NA           0    NA           0    NA           0 13607090702
2     0    NA           0    NA           0    NA           0   227372577
3     0    NA           0    NA           0    NA           0    91257016
4     0    NA           0    NA           0    NA           0  8441409809
5     0    NA           0    NA           0    NA           0   412508323
6     0    NA           0    NA           0    NA           0   557441297
  RI1_1 RI1_2      RI1_3 RI2_1 RI2_2    RI2_3 RI3_1 RI3_2     RI3_3 RI4_1
1    NA    NA 4348594002    NA    NA 26438579    NA    NA 643236758    NA
2    NA    NA  131348259    NA    NA 15452736    NA    NA   7726368    NA
3    NA    NA   32934926    NA    NA        0    NA    NA         0    NA
4    NA    NA    5441299    NA    NA  3852717    NA    NA 258176959    NA
5    NA    NA          0    NA    NA        0    NA    NA         0    NA
6    NA    NA    4298500    NA    NA 37093156    NA    NA  68487470    NA
  RI4_2     RI4_3 RI5_1 RI5_2     RI5_3 RI6_1 RI6_2    RI6_3 RI7_1 RI7_2
1    NA 383308065    NA    NA  77014553    NA    NA        0    NA    NA
2    NA         0    NA    NA         0    NA    NA        0    NA    NA
3    NA         0    NA    NA         0    NA    NA        0    NA    NA
4    NA  64668416    NA    NA 381726223    NA    NA 74707606    NA    NA
5    NA         0    NA    NA         0    NA    NA        0    NA    NA
6    NA 124289277    NA    NA  47080480    NA    NA 17910200    NA    NA
     RI7_3 RI8_1 RI8_2     RI8_3        rit    T1_1    T1_2      T2_1
1        0    NA    NA         0 5478591957       0       0 290331951
2        0    NA    NA         0  154527364       0       0  30694373
3        0    NA    NA         0   32934926       0       0    237262
4 73215419    NA    NA 131218919  993007558       0       0 551801849
5        0    NA    NA         0          0       0       0   9450466
6 11143157    NA    NA   7158844  317461084 3086183 2066436  54167507
       T2_2     T3_1     T3_2       T4_1       T4_2     T5_1     T5_2
1 449424506        0        0 1407890700 1720669063 24613174 16363787
2  46520980 11693461 14104003          0    2368776        0        0
3    429509  3639915  1831025          0    2051088        0        0
4 612314093        0        0   52138467   58449969        0        0
5   9279607        0        0          0          0        0        0
6  38581410        0        0   23152840   21995306  1979250  2405132
       T6_1      T6_2       T7_1       T7_2     U1_1     U1_2   U1_3
1 430371181 449988794 2153207006 2636446151        0        0      0
2    505406     20002   42893240   63013761        0        0      0
3         0         0    3877177    4311622        0        0      0
4         0         0  603940316  670764062 16561261 16859279 298018
5         0         0    9450466    9279607        0        0      0
6   7210513  17988974   89596293   83037258        0        0      0
    U1_4 U1_5 U1_6 U2_1 U2_2 U2_3 U2_4 U2_5 U2_6 U3_1 U3_2 U3_3 U3_4 U3_5
1      0    0    0    0    0    0    0    0    0    0    0    0    0    0
2      0    0    0    0    0    0    0    0    0    0    0    0    0    0
3      0    0    0    0    0    0    0    0    0    0    0    0    0    0
4 298018    0    0    0    0    0    0    0    0    0    0    0    0    0
5      0    0    0    0    0    0    0    0    0    0    0    0    0    0
6      0    0    0    0    0    0    0    0    0    0    0    0    0    0
  U3_6 U4_1 U4_2 U4_3 U4_4 U4_5 U4_6 U5_1 U5_2 U5_3 U5_4 U5_5 U5_6
1    0    0    0    0    0    0    0    0    0    0    0    0    0
2    0    0    0    0    0    0    0    0    0    0    0    0    0
3    0    0    0    0    0    0    0    0    0    0    0    0    0
4    0    0    0    0    0    0    0    0    0    0    0    0    0
5    0    0    0    0    0    0    0    0    0    0    0    0    0
6    0    0    0    0    0    0    0    0    0    0    0    0    0
       U6_1      U6_2      U6_3      U6_4 U6_5 U6_6      U7_1      U7_2
1 837912538 962354995 124442457         0    0    0 516279568 745194891
2         0         0         0         0    0    0         0         0
3         0         0         0         0    0    0         0         0
4 146218689 140562345  -5656344  -5656344    0    0 870900340 870601849
5   4166918   7399646   3232728   3232728    0    0         0         0
6  26832790  14955575 -11877215 -11877215    0    0  18753463  26530918
       U7_3    U7_4 U7_5 U7_6       U8_1    U8_2        U8_3     U8_4 U8_5
1 228915323       0    0    0 1629871000       0 -1629871000        0    0
2         0       0    0    0          0       0           0        0    0
3         0       0    0    0          0       0           0        0    0
4   -298491 -298491    0    0          0       0           0        0    0
5         0       0    0    0          0       0           0        0    0
6   7777455 7777455    0    0   11485741 8080986    -3404755 -3404755    0
  U8_6      U9_1       U9_2      U9_3    U9_4 U9_5 U9_6      U10_1
1    0 917510627 1197131439 279620812       0    0    0 3901573733
2    0         0          0         0       0    0    0          0
3    0         0          0         0       0    0    0          0
4    0         0          0         0       0    0    0 1033680290
5    0         0          0         0       0    0    0    4166918
6    0   3453139    5604278   2151139 2151139    0    0   60525133
       U10_2      U10_3    U10_4 U10_5 U10_6 U11_1 U11_2 U11_3 U11_4 U11_5
1 2904681325 -996892408        0     0     0     0     0     0     0     0
2          0          0        0     0     0     0     0     0     0     0
3          0          0        0     0     0     0     0     0     0     0
4 1028023473   -5656817 -5656817     0     0     0     0     0     0     0
5    7399646    3232728  3232728     0     0     0     0     0     0     0
6   55171757   -5353376 -5353376     0     0     0     0     0     0     0
  U11_6 U12_1 U12_2 U12_3 U12_4 U12_5 U12_6 U13_1 U13_2 U13_3 U13_4 U13_5
1     0     0     0     0     0     0     0     0     0     0     0     0
2     0     0     0     0     0     0     0     0     0     0     0     0
3     0     0     0     0     0     0     0     0     0     0     0     0
4     0     0     0     0     0     0     0     0     0     0     0     0
5     0     0     0     0     0     0     0     0     0     0     0     0
6     0     0     0     0     0     0     0     0     0     0     0     0
  U13_6    U14_1     U14_2     U14_3     U14_4 U14_5 U14_6    U15_1
1     0        0    156039    156039         0     0     0 60030917
2     0        0         0         0         0     0     0  1094231
3     0        0         0         0         0     0     0        0
4     0 45072704 192997832 147925128 147925128     0     0        0
5     0        0         0         0         0     0     0 59921203
6     0        0         0         0         0     0     0 52175504
     U15_2    U15_3    U15_4 U15_5 U15_6    U16_1     U16_2     U16_3
1 89535545 29504628        0     0     0 71024201 115490006  44465805
2  9088056  7993825  7993825     0     0        0         0         0
3        0        0        0     0     0        0         0         0
4        0        0        0     0     0 13409143  26851223  13442080
5 84857452 24936249 24936249     0     0 49008040 190912029 141903989
6 60332278  8156774  8156774     0     0  1442460   1030846   -411614
      U16_4 U16_5 U16_6       U17_1       U17_2      U17_3     U17_4 U17_5
1         0     0     0 18338569197 18140293953 -198275244         0     0
2         0     0     0     2979413     2572700    -406713   -406713     0
3         0     0     0           0           0          0         0     0
4  13442080     0     0    15575404    -8898446  -24473850 -24473850     0
5 141903989     0     0    74818741    39979880  -34838861 -34838861     0
6   -411614     0     0     5765590     1122107   -4643483  -4643483     0
  U17_6       U18_1       U18_2      U18_3     U18_4 U18_5 U18_6
1     0 18469624315 18345475543 -124148772         0     0     0
2     0     4073644    11660756    7587112   7587112     0     0
3     0           0           0          0         0     0     0
4     0    74057251   210950609  136893358 136893358     0     0
5     0   183747984   315749361  132001377 132001377     0     0
6     0    59383554    62485231    3101677   3101677     0     0
        U19_1       U19_2       U19_3     U19_4 U19_5 U19_6 V1_1 V1_2 V1_3
1 22371198048 21250156868 -1121041180         0     0     0    0    0    0
2     4073644    11660756     7587112   7587112     0     0    0    0    0
3           0           0           0         0     0     0    0    0    0
4  1107737541  1238974082   131236541 131236541     0     0    0    0    0
5   187914902   323149007   135234105 135234105     0     0    0    0    0
6   119908687   117656988    -2251699  -2251699     0     0    0    0    0
  V1_4 V1_5 V1_6 V2_1       V2_2       V2_3 V2_4 V2_5 V2_6       V3_1
1    0    0    0    0 2051620752 2051620752    0    0    0          0
2    0    0    0    0          0          0    0    0    0          0
3    0    0    0    0          0          0    0    0    0          0
4    0    0    0    0          0          0    0    0    0          0
5    0    0    0    0          0          0    0    0    0          0
6    0    0    0    0          0          0    0    0    0 2314402286
        V3_2      V3_3      V3_4 V3_5 V3_6       V4_1     V4_2        V4_3
1          0         0         0    0    0 7747646369        0 -7747646369
2          0         0         0    0    0          0        0           0
3          0         0         0    0    0   64830791 59143798    -5686993
4          0         0         0    0    0          0        0           0
5          0         0         0    0    0          0        0           0
6 2223895658 -90506628 -90506628    0    0          0        0           0
  V4_4 V4_5 V4_6     V5_1     V5_2     V5_3     V5_4 V5_5 V5_6      V6_1
1    0    0    0  1777660        0 -1777660        0    0    0 405176445
2    0    0    0        0        0        0        0    0    0   9760273
3    0    0    0        0        0        0        0    0    0         0
4    0    0    0 30927457 28014466 -2912991 -2912991    0    0         0
5    0    0    0 21791146 86192869 64401723 64401723    0    0         0
6    0    0    0  5040498 15069567 10029069 10029069    0    0  26861405
      V6_2       V6_3    V6_4 V6_5 V6_6      V7_1      V7_2      V7_3
1 86743782 -318432663       0    0    0         0         0         0
2 12130719    2370446 2370446    0    0 199980721 236247169  36266448
3        0          0       0    0    0  13998469         0 -13998469
4        0          0       0    0    0 258849845 167387762 -91462083
5        0          0       0    0    0         0         0         0
6 27560463     699058  699058    0    0         0         0         0
       V7_4 V7_5 V7_6       V8_1       V8_2        V8_3      V8_4 V8_5
1         0    0    0 8154600474 2138364534 -6016235940         0    0
2  36266448    0    0  209740994  248377888    38636894  38636894    0
3         0    0    0   78829260   59143798   -19685462         0    0
4 -91462083    0    0  289777302  195402228   -94375074 -94375074    0
5         0    0    0   21791146   86192869    64401723  64401723    0
6         0    0    0 2346304189 2266525688   -79778501 -79778501    0
  V8_6 V9_1 V9_2 V9_3 V9_4 V9_5 V9_6 V10_1 V10_2 V10_3 V10_4 V10_5 V10_6
1    0    0    0    0    0    0    0     0     0     0     0     0     0
2    0    0    0    0    0    0    0     0     0     0     0     0     0
3    0    0    0    0    0    0    0     0     0     0     0     0     0
4    0    0    0    0    0    0    0     0     0     0     0     0     0
5    0    0    0    0    0    0    0     0     0     0     0     0     0
6    0    0    0    0    0    0    0     0     0     0     0     0     0
    V11_1 V11_2    V11_3 V11_4 V11_5 V11_6     V12_1     V12_2    V12_3
1 9499222  4161 -9495061     0     0     0 211649530 243508282 31858752
2       0     0        0     0     0     0         0         0        0
3       0     0        0     0     0     0         0         0        0
4       0     0        0     0     0     0 111220670 139536892 28316222
5       0     0        0     0     0     0  68883387  67552158 -1331229
6       0     0        0     0     0     0  42422539  45619382  3196843
     V12_4 V12_5 V12_6    V13_1    V13_2    V13_3    V13_4 V13_5 V13_6
1        0     0     0 30537716 44427751 13890035        0     0     0
2        0     0     0 38859982 37733778 -1126204 -1126204     0     0
3        0     0     0        0        0        0        0     0     0
4 28316222     0     0 49213147 66826324 17613177 17613177     0     0
5 -1331229     0     0 36446603 27228831 -9217772 -9217772     0     0
6  3196843     0     0 13405560 26124072 12718512 12718512     0     0
      V14_1     V14_2     V14_3     V14_4 V14_5 V14_6      V15_1
1 251686468 287940194  36253726         0     0     0 8406286942
2  38859982  37733778  -1126204  -1126204     0     0  248600976
3         0         0         0         0     0     0   78829260
4 160433817 206363216  45929399  45929399     0     0  450211119
5 105329990  94780989 -10549001 -10549001     0     0  127121136
6  55828099  71743454  15915355  15915355     0     0 2402132288
       V15_2       V15_3     V15_4 V15_5 V15_6        W1_1        W1_2
1 2426304728 -5979982214         0     0     0 13031286487 12032946333
2  286111666    37510690  37510690     0     0   181069811   181069811
3   59143798   -19685462         0     0     0     3000000    17000000
4  401765444   -48445675 -48445675     0     0      515000      515000
5  180973858    53852722  53852722     0     0      360000      360000
6 2338269142   -63863146 -63863146     0     0    56361721    56361721
      W2_1     W2_2        W3_1        W3_2      W4_1      W4_2
1 -7911487 -7911487 -2250808492 -1860206806 141169885 192268397
2        0        0   -24977821   -23605238         0         0
3  -157525  -159056           0           0         0         0
4        0        0  -627730497  -608424907    103000    103000
5        0        0           0           0     72000     72000
6        0        0    -1879139    -1427647         0   2043274
         W5_1        W5_2        W6_1        W6_2       W7_1       W7_2
1 13964911106 18823852140  2029204480  1908213808 1021970233 6558541895
2    81539221    71032772   -78040092   -74552769    3487323  -11879032
3    -4479428    11037394   -11370766    -7321904    4048863    1518354
4  1537230391  1790104006 -3985396152 -3078781512 6149739040 5476692425
5    60793765   142175148    15930905    34682807   44430860  107060341
6    26569928    17312956   -68778144   -29955928   40865490   -9708464
  W8_1 W8_2       W9_1       W9_2 W10_1    W10_2 X1         X2         X3
1    0    0 3051174713 8466755703     0        0 Si         No Seleccione
2    0    0  -74552769  -86431801     0        0 Si         No Seleccione
3    0    0   -7321903   -5803550     0        0 No Seleccione Seleccione
4    0    0 2164342888 2397910913     0        0 No         No Seleccione
5    0    0   60361765  141743148     0 25679229 Si         No Seleccione
6    0    0  -27912654  -39664392     0        0 Si         No Seleccione
                            X4
1                   Seleccione
2 La competencia no lo utiliza
3      Falta de informaci<f3>n
4                   Seleccione
5      Costo excede beneficios
6                   Seleccione
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Y1
1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         <NA>
2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         <NA>
3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         <NA>
4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           1 - Dentro de Activos con residentes hemos incluido el saldo correspondiente a la previsi<f3>n para desvalorizaci<f3>in de biens de cambio cuyos montos ascienden a: $ -33.049.263 y -37.271.550 para 2010 y 2009 respectivamente.
5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         <NA>
6 El formulario se completo con la informaci<f3>n del Balance Auditado en pesos uruguayos al 31/12/2010. El tipo de cambio utilizado para Activos y Pasivos fue de 19.802 Los ingresos y gastos estan a tipo 19,644. En hoja gastos tener en cuenta que el costo de los bienes vendidos no tienen incluida la parte que corresponde a remuneraciones y amortizaciones del ejercicio ya que los mismos se contemplan en una hoja aparte. En la hoja gastos tener en cuenta que dentro de alquiler de inmuebles se incluy<f3> el alquiler de contenedores y dentro de alquiler de vehiculos otras empresas se incluy<f3> el alquiler de Isotanques. En el Cuadro de Bienes de Uso tener en cuenta que donde dice Revaluaciones se incluyo el ajuste por conversi
  D1NUMERO D2NUMERO D3NUMERO CONTROL_TUSU    ZonaFranca
1        0        1        0            1           UPM
2        0        1        0            1 COLONIA SUIZA
3        0        1        0            1        RIVERA
4        0        1        0            1       COLONIA
5        0        0        1            1              
6        1        1        0            2           UPM
               RazonSocial Tipodeusuario Indirectode
1                 UPM S.A.       DIRECTO        <NA>
2 PRESSUR CORPORATION S.A.       DIRECTO        <NA>
3            TINGELSUR S.A       DIRECTO        <NA>
4 PEPSI COLA INT. CO. S.A.       DIRECTO        <NA>
5                     <NA>                      <NA>
6       KEMIRA URUGUAY S.A       DIRECTO        <NA>
                       A6RazonSocial   A9Depto     A10Telefono
1                        Botnia S.A. Rio Negro       056 20100
2           PRESSUR CORPORATION S.A.   Colonia 055 47670 / 215
3                      TINGELSUR S.A    RIVERA        62 33567
4 PEPSI COLA MFG. CO. OF URUGUAY SRL   COLONIA       052 24979
5                               <NA>                          
6                Kemira Uruguay S.A. Rio Negro      056-20-100
          A11Fax                    A12mail               A12_0mail2
1                  santiago.cardozo@upm.com                     <NA>
2 56 47670 / 220      mmartinez@pressur.com                     <NA>
3       62 33567 administracion@valepal.com cmerladett@tingelsur.com
4      052 24450 pablo.cal@intl.pepsico.com                     <NA>
5                                      <NA>                     <NA>
6    02-916-9487 silvana.mengual@kemira.com                     <NA>
                             A12_1mail3                A12_2mail4
1                                  <NA>                      <NA>
2                                  <NA>                      <NA>
3                                  <NA>                      <NA>
4 juanandres.rodriguez@intl.pepsico.com                      <NA>
5                                  <NA>                      <NA>
6          andrea.bettinelli@kemira.com dario.fiorelli@kemira.com
              A12_3mail5           A13Informante         A14ZonaFranca
1                               Santiago Cardozo                Botnia
2                        Maximiliano Mart<ed>nez Seleccionar opci<f3>n
3                                Jorge Cortelles                Rivera
4                                      Pablo Cal               Colonia
5                                           <NA>                  <NA>
6 jose.varela@kemira.com         Silvana Mengual                Botnia
  A15CodigoAZZF
1          <NA>
2        ZFH-10
3        ZFR-26
4        ZFC-53
5          <NA>
6        ZFB-10
                                                                                                    OBS_1
1    En la hoja de INSUMOS que solicitan Gasota por compra de materia prima, se informa los los insumos U
2                                                                                                    <NA>
3                                                                                                    <NA>
4                                                                                                    <NA>
5                                                                                                    <NA>
6 KBKF: Los valores al inicio imcluyen los valores netos a diciembre de 2007 m<e1>s/menos las reclasifica
  letra   REM_TOT APORTE_TOT GAS_NO_DEP PO_TOT     ING_IND ING_COMERCIO
1     C 214499059   26191675  674364101    185 15946262199            0
2     C  54410363    7437139          0    184   227372578            0
3     C  17347804    3431358          0    103    91257017            0
4     C 131714235   18756601    5267819    100  8348693969      4328887
5     C  91803825   13357076          0     89   621313583     67659671
6     C  60196277   10460848    2266616     62   557441297    169777715
  ING_SERV_NO_FIN ING_SERV_PROF ING_SERV_INFORMATICOS ING_SERV_SEGUROS
1               0             0                     0                0
2               0             0                     0                0
3               0             0                     0                0
4               0             0                     0                0
5               0             0                     0                0
6       114092352             0                     0                0
  ING_SERV_FIN ING_OTROS     ING_TOT ING_OTROS_EXTRA    GAS_IND   GAS_COM
1            0  21962791 15968224990        13994658 4758180145         0
2            0    929086   228301664               0  134346842         0
3            0    987630    92244647          218428   35183862         0
4            0  32717647  8385740503         4219945  924967786   1216024
5            0  21492696   710465950               0  112479056  24275213
6            0   6290023   847601387         5875248  341754376 190864681
    GAS_OPER GAS_SEGUROS GAS_SERV_FIN   GAS_FIN GAS_OTROS GAS_OTROS_EXTRA
1 2098098025           0            0 361038658 364083331         3044673
2   15055873           0            0  14625809  18114084         3488275
3   27155112           0            0   1682950   1682950               0
4 1823228952           0            0    964093    964093               0
5  339899932           0            0  17364131  23636030               0
6   49941516           0            0  57715970  58817233         1101263
     GAS_TOT  AMORT_TOT         re PROD_CTA_PROPIA   TOT_FBK   POR_TR
1 7220361501 1273984202 6075305562               0 383975563 0.000000
2  167516799   10816395  -31999553               0   4322955 0.000000
3   64021924    5103706    1905410               0   3751700 0.000000
4 2750376855   28041257 5381827422               0  68933105 0.051622
5  500290231    3653171  101532506               0   6032624 0.000000
6  641377806  146583292   -6787498               0  39272147 0.000000
  VBP_INDUSTRIA VBP_COMERCIO VBP_SERVICIOS VBP_FINANCIERO VBP_OT_FUENTES
1   16259040562            0             0              0       21962791
2     232151896            0             0              0         929086
3      91499215            0             0              0         987630
4    8355005471      3112863             0              0       32717647
5     621313583     43384458             0              0       21492696
6     556283763    -21086966     114092352              0        6290023
  VBP_CONSTR_CP         vbp         ci        vab         ee    GAS_MAT
1             0 16259040562 7519553789 8739486773 7224811837 4758180145
2             0   232151896  149888119   82263777    9599880  134346842
3             0    91499215   62338974   29160241    3277373   35183862
4             0  8358118334 2756397125 5601721209 5423209116  924967786
5             0   664698041  452378988  212319053  103504981          0
6             0   649289149  382821246  266467903   49227486  341754376
      MP_CI    CI_VBP   VAB_VBP    REM_VAB tramo  VBP_TR     VBP_STR
1 0.6327743 0.4624845 0.5375155 0.02454367     4       0 16259040562
2 0.8963142 0.6456468 0.3543532 0.66141338     4       0   232151896
3 0.5643959 0.6813061 0.3186939 0.59491292     4       0    91499215
4 0.3355713 0.3297868 0.6702132 0.02351317     2 1515059  8353803706
5 0.0000000 0.6805782 0.3194218 0.43238618     4       0   664698041
6 0.8927257 0.5896006 0.4103994 0.22590442     4       0   649289149
    VAB_TR    VAB_STR        EE_TR     EE_STR      VBP_10     VAB_10
1     0.00 8739486773 0.000000e+00 7224811837 16259040562 8739486773
2     0.00   82263777 0.000000e+00    9599880   232151896   82263777
3     0.00   29160241 0.000000e+00    3277373    91499215   29160241
4 92151.51 5598829488 1.455192e-11 5420409547  8355318765 5598921640
5     0.00  212319053 0.000000e+00  103504981   664698041  212319053
6     0.00  266467903 0.000000e+00   49227486   649289149  266467903
       EE_10 prodpercap outlier       VBP_N       EE_N      CI_ZF
1 7224811837 21621064.6       0 16259040562 7224811837 1424809744
2    9599880  1261695.1       0   232151896    9599880  149402715
3    3277373   888341.9       0    91499215    3277373          0
4 5420409547 72654945.8       0  8355318765 5420409547  175218248
5  103504981  7468517.3       0   664698041  103504981  441877776
6   49227486  7918160.4       0   649289149   49227486  198090622
      CI_ZNF     CI_EXT     CI_OT OUTLIER_C       CI_N   cipercap
1 3948554261 1482914166 663275619         0 7519553789  9999406.6
2          0          0    485404         0  149888119   814609.3
3   62338974          0         0         0   62338974   605232.8
4  755856997 1817121493   8200387         0 2756397125 23968670.7
5    1518607   15254504  -6271899         0  452378988  5082910.0
6   23216076  170389194  -8874646         0  382821246  4668551.8
      AMORT2      VBP_N2 ver sector inactivas     expoind   expocom
1 1273984202 16259040562   0                0 15733765937       0.0
2   10816395   232151896   0                0           0       0.0
3    5103706    91499215   0                0    91263759       0.0
4   28041257  8355318765   0                0  6057385082 3111820.3
5    3653171   664698041   0                0    11818008 2629280.9
6  146583292   649289149   0                0   219736529 -161030.2
  exposerv expofin       EXPO2  DEST_IND1  DEST_IND2  DEST_IND3 DEST_IND4
1        0       0 15733765937 5664155737 5349480418 2202727231 472012978
2        0       0           0          0          0          0         0
3        0       0    91263759   65709906   20990665    4563188         0
4        0       0  6060496903 1393198569  666312359  787460061 363443105
5        0       0    14447289    9808947    2009061          0         0
6        0       0   219575499   57131497  136236648   26368383         0
  DEST_IND5 DEST_IND6  DEST_IND7  DEST_IND8 DEST_COM1 DEST_COM2 DEST_COM3
1 472012978 472012978 1101363616          0       0.0       0.0         0
2         0         0          0          0       0.0       0.0         0
3         0         0          0          0       0.0       0.0         0
4 302869254 302869254  302869254 1938363226 1555910.2  342300.2    155591
5         0         0          0          0 1814203.8  815077.1         0
6         0         0          0          0 -161030.2       0.0         0
  DEST_COM4 DEST_COM5 DEST_COM6 DEST_COM7 DEST_COM8 DEST_SERV1 DEST_SERV2
1         0         0         0         0         0          0          0
2         0         0         0         0         0          0          0
3         0         0         0         0         0          0          0
4   1058019         0         0         0         0          0          0
5         0         0         0         0         0          0          0
6         0         0         0         0         0          0          0
  DEST_SERV3 DEST_SERV4 DEST_SERV5 DEST_SERV6 DEST_SERV7 DEST_SERV8
1          0          0          0          0          0          0
2          0          0          0          0          0          0
3          0          0          0          0          0          0
4          0          0          0          0          0          0
5          0          0          0          0          0          0
6          0          0          0          0          0          0
  DEST_FINAN1 DEST_FINAN2 DEST_FINAN3 DEST_FINAN4 DEST_FINAN5 DEST_FINAN6
1           0           0           0           0           0           0
2           0           0           0           0           0           0
3           0           0           0           0           0           0
4           0           0           0           0           0           0
5           0           0           0           0           0           0
6           0           0           0           0           0           0
  DEST_FINAN7 DEST_FINAN8 ventaslog PO_PYS PO_D PO_E PO_O PO_PYT PO_PRIM
1           0           0         0      0    0   10    0    175       0
2           0           0         0      1    1   40  142      0       0
3           0           0         0      0    1    5   95      2       0
4           0           0         0      0    0   37   38     25       1
5           0           0         0      0    2   10    0     77       0
6           0           0 114092352      0    3    5   38     16       0
  PO_SEC PO_TER PO_POST ciiu_4 ciiu_3
1     29    142      15   1701   2101
2    184      0       0   1811   2210
3      0      0       0   1610   2010
4     38     51      11   1079   1549
5     71     15       3   3312   2920
6     36     21       5   2011   2411
```

Tabla con secciones
=======================================================



Abrimos la tabla y la procesamos
================================================

```r
file <- "ISIC_Rev_4_spanish_structure.txt"
t <- tabla.ciiu4(file)
t
```

```
# A tibble: 766 x 3
   ciiu4
   <chr>
 1     A
 2    01
 3   011
 4  0111
 5  0112
 6  0113
 7  0114
 8  0115
 9  0116
10  0119
# ... with 756 more rows, and 2 more variables: desc.ciiu4 <chr>,
#   seccion <chr>
```


Hacer el join
=====================================================

De deberes
tabla.ciiu
=======================================================



Abrimos la tabla

```r
file <- "ISIC_Rev_4_spanish_structure.txt"
t <- tabla.ciiu4(file)
```

=====================================================

Tidyr
=======================================================
* Cambia la forma de un data frame (wide a long).
* Las librerías de tidyverse (ggplot) esperan los datos en un formato "canónico"


Formato Canónico
=======================================================
![title](tidy-1.png)


Spread
=======================================================
>Spread a key-value pair across multiple columns.<br>

Sirve para cuando tengo nombres de variables como valores.


```r
library(tidyverse)
head(table2)
```

```
# A tibble: 6 x 4
      country  year       type     count
        <chr> <int>      <chr>     <int>
1 Afghanistan  1999      cases       745
2 Afghanistan  1999 population  19987071
3 Afghanistan  2000      cases      2666
4 Afghanistan  2000 population  20595360
5      Brazil  1999      cases     37737
6      Brazil  1999 population 172006362
```


Spread
=================================================

```r
spread(table2, key=type, value=count )
```

```
# A tibble: 6 x 4
      country  year  cases population
*       <chr> <int>  <int>      <int>
1 Afghanistan  1999    745   19987071
2 Afghanistan  2000   2666   20595360
3      Brazil  1999  37737  172006362
4      Brazil  2000  80488  174504898
5       China  1999 212258 1272915272
6       China  2000 213766 1280428583
```


Spread
================================================
![spread](tidy-8.png)

Gather
=======================================================
>Gather columns into key-value pairs. <br>


```r
head(table4a)
```

```
# A tibble: 3 x 3
      country `1999` `2000`
        <chr>  <int>  <int>
1 Afghanistan    745   2666
2      Brazil  37737  80488
3       China 212258 213766
```

```r
head(table4b)
```

```
# A tibble: 3 x 3
      country     `1999`     `2000`
        <chr>      <int>      <int>
1 Afghanistan   19987071   20595360
2      Brazil  172006362  174504898
3       China 1272915272 1280428583
```



```r
t4a <- gather(table4a, `1999`, `2000`, key="year", value="cases")
t4b <- gather(table4b, `1999`, `2000`, key="year", value="population")
left_join(t4a, t4b)
```

```
# A tibble: 6 x 4
      country  year  cases population
        <chr> <chr>  <int>      <int>
1 Afghanistan  1999    745   19987071
2      Brazil  1999  37737  172006362
3       China  1999 212258 1272915272
4 Afghanistan  2000   2666   20595360
5      Brazil  2000  80488  174504898
6       China  2000 213766 1280428583
```
¿Cómo interpretarían key y value?

Gather
==============================================================
![gather](tidy-9.png)

Votacion
======================================================
Un experimento de votación con varios "grupos" (hawthorne, civicduty, neighbors, self)

```r
gerber <- readRDS("gerber.rds")
str(gerber)
```

```
'data.frame':	344084 obs. of  8 variables:
 $ sex      : int  0 1 1 1 0 1 0 0 1 0 ...
 $ yob      : int  1941 1947 1982 1950 1951 1959 1956 1981 1968 1967 ...
 $ voting   : int  0 0 1 1 1 1 1 0 0 0 ...
 $ hawthorne: int  0 0 1 1 1 0 0 0 0 0 ...
 $ civicduty: int  1 1 0 0 0 0 0 0 0 0 ...
 $ neighbors: int  0 0 0 0 0 0 0 0 0 0 ...
 $ self     : int  0 0 0 0 0 0 0 0 0 0 ...
 $ control  : int  0 0 0 0 0 1 1 1 1 1 ...
```

Quiero sacar la proporción de cuántos votan por grupo.
Votacion
====================================================
¿Cuál sería la forma tidy de este juego de datos?


```r
gerber_tidy <- gerber %>% 
  gather(group, sacar, hawthorne, civicduty, neighbors, self) 
head(gerber_tidy)
```

```
  sex  yob voting control     group sacar
1   0 1941      0       0 hawthorne     0
2   1 1947      0       0 hawthorne     0
3   1 1982      1       0 hawthorne     1
4   1 1950      1       0 hawthorne     1
5   0 1951      1       0 hawthorne     1
6   1 1959      1       1 hawthorne     0
```

Votacion
===============================

```r
gerber_tidy %>%
  filter(sacar == 1) %>%
  select(-sacar) %>%
  group_by(group) %>%
  summarize(mean_voting = mean(voting))
```

```
# A tibble: 4 x 2
      group mean_voting
      <chr>       <dbl>
1 civicduty   0.3145377
2 hawthorne   0.3223746
3 neighbors   0.3779482
4      self   0.3451515
```
Tangente
=====================================

Notar la utilidad del pipe (%>%) en este caso.


RPAE
======================================================
Abrir archivo


```r
marco_rpae <- readRDS('/home/rlabuonora/bases/confidencial/marco_rpae.rds')
names(marco_rpae)
```

```
 [1] "RUT"              "INE"              "RSOCIAL"         
 [4] "CIIU4_2011"       "PO_2011"          "MIMP_2011"       
 [7] "VTAS_2011"        "Intervalo_Ventas" "DEPTO_2011"      
[10] "CIIU4_2012"       "PO_2012"          "MIMP_2012"       
[13] "VTAS_2012"        "DEPTO_2012"       "CIIU4_2013"      
[16] "PO_2013"          "MIMP_2013"        "VTAS_2013"       
[19] "DEPTO_2013"       "CIIU4_2014"       "PO_2014"         
[22] "MIMP_2014"        "VTAS_2014"        "DEPTO_2014"      
[25] "DEPTO_2015"       "PO_2015"          "MIMP_2015"       
[28] "CIIU4_2015"       "DEPTO_2016"       "PO_2016"         
[31] "MIMP_2016"        "CIIU4_2016"       "PrimarioÚltimo"  
[34] "NOMBRE"           "DEPTO_UTE"        "NUMDEP"          
[37] "DEPTO11"          "DEPTO12"          "DEPTO13"         
[40] "DEPTO14"          "DEPTO15"          "DEPTO16"         
[43] "DEPTOUTE"         "DEPTO"            "DEPTO_REV"       
[46] "filter_$"         "DIV_11"           "DIV_12"          
[49] "DIV_13"           "DIV_14"           "DIV_15"          
[52] "DIV_16"          
```

Seleccionar campos: 
==========================================================
+ rut, ine, razon_social, depto, ventas, personal_ocupado


```r
marco_rpae <- marco_rpae %>% 
  rename(rut=RUT, nro_ine = INE, razon_social=RSOCIAL, depto=DEPTO) %>%
  select(rut, nro_ine, razon_social, depto, matches("_20\\d{2}$"), -matches("DEPTO_"))
```

nombre de variables en minúscula

```r
names(marco_rpae) <- tolower(names(marco_rpae))
```

Tidy - Paso 1
===================================

Gather con todas las variables que terminan en cuatro dígitos.

```r
# tidy con los años
marco_rpae_tidy <- marco_rpae %>% 
  gather(var, val, matches("_\\d{4}$"))
```

Paso 2 - Separar
===========================================

```r
marco_rpae_tidy <- marco_rpae_tidy %>%
   separate(var, into=c("variable", "year"))
head(marco_rpae_tidy)
```

```
# A tibble: 6 x 7
      rut nro_ine                      razon_social depto variable  year
    <dbl>   <dbl>                             <chr> <dbl>    <chr> <chr>
1   67347     859        Colegio Liceo Beata Imelda    10    ciiu4  2011
2   70340  190505              Raffo Puppo Teresita   NaN    ciiu4  2011
3   73946  847387            Schandy Gabarda Thomas    10    ciiu4  2011
4 1004845  818971        Gerona Milans Beatriz Alba    10    ciiu4  2011
5 1007096       0     De Castro Morros Marta Teresa    10    ciiu4  2011
6 1007273  798452 Mosteiro Cousillas Maria Carolina    10    ciiu4  2011
# ... with 1 more variables: val <dbl>
```

Paso 3 - Spread 
======================================

```r
marco_rpae_tidy <- marco_rpae_tidy %>%
    spread(variable, val)
head(marco_rpae_tidy)
```

```
# A tibble: 6 x 9
      rut nro_ine                      razon_social depto  year ciiu4
    <dbl>   <dbl>                             <chr> <dbl> <chr> <dbl>
1   67347     859        Colegio Liceo Beata Imelda    10  2011  8510
2   70340  190505              Raffo Puppo Teresita   NaN  2011   NaN
3   73946  847387            Schandy Gabarda Thomas    10  2011   NaN
4 1004845  818971        Gerona Milans Beatriz Alba    10  2011   NaN
5 1007096       0     De Castro Morros Marta Teresa    10  2011   NaN
6 1007273  798452 Mosteiro Cousillas Maria Carolina    10  2011   NaN
# ... with 3 more variables: mimp <dbl>, po <dbl>, vtas <dbl>
```

Cambiar NaN por NA
============================

```r
sacarNans <- function(x) {
  if_else(is.nan((x)), NA_real_, x)
}

marco_rpae_tidy <- marco_rpae_tidy %>%
  mutate_if(is.numeric, funs(sacarNans(.)))

marco_rpae_tidy
```

```
# A tibble: 2,951,220 x 9
       rut nro_ine                      razon_social depto  year ciiu4
     <dbl>   <dbl>                             <chr> <dbl> <chr> <dbl>
 1   67347     859        Colegio Liceo Beata Imelda    10  2011  8510
 2   70340  190505              Raffo Puppo Teresita    NA  2011    NA
 3   73946  847387            Schandy Gabarda Thomas    10  2011    NA
 4 1004845  818971        Gerona Milans Beatriz Alba    10  2011    NA
 5 1007096       0     De Castro Morros Marta Teresa    10  2011    NA
 6 1007273  798452 Mosteiro Cousillas Maria Carolina    10  2011    NA
 7 1007528  709676  Sanjuan Martinez Alfredo Gabriel    NA  2011    NA
 8 1012417  709678        Maestro Irigaray Ana Maria    10  2011    NA
 9 1015555  709679            Cesar Cardoso Campomar    10  2011    NA
10 1032308  798453    Goldschmidt Treszczanska Elisa     9  2011    NA
# ... with 2,951,210 more rows, and 3 more variables: mimp <dbl>,
#   po <dbl>, vtas <dbl>
```


Exportaciones desde ZZFF
======================================================

Ver el código para sacar las exportaciones hacia Uruguay.


Ejercicio
====================================================
A partir de los datos del Deflactor del PIB (http://www.bcu.gub.uy/Estadisticas-e-Indicadores/Cuentas%20Nacionales/cuadro_36a.xls)
crear dos data frames, uno con los índices por seccion y otro con los índices por subsección.


```r
load("ipi.rdata")
head(cnbcu.seccion %>% arrange(desc.cnbcu.seccion, year))
```

```
# A tibble: 6 x 4
                                      desc.cnbcu.seccion  year
                                                   <chr> <chr>
1 ACTIVIDADES INMOBILIARIAS, EMPRESARIALES Y DE ALQUILER  2005
2 ACTIVIDADES INMOBILIARIAS, EMPRESARIALES Y DE ALQUILER  2006
3 ACTIVIDADES INMOBILIARIAS, EMPRESARIALES Y DE ALQUILER  2007
4 ACTIVIDADES INMOBILIARIAS, EMPRESARIALES Y DE ALQUILER  2008
5 ACTIVIDADES INMOBILIARIAS, EMPRESARIALES Y DE ALQUILER  2009
6 ACTIVIDADES INMOBILIARIAS, EMPRESARIALES Y DE ALQUILER  2010
# ... with 2 more variables: indice.seccion <dbl>, cnbcu.seccion <chr>
```

```r
head(cnbcu.subseccion %>% arrange(desc.cnbcu.subseccion, year))
```

```
# A tibble: 6 x 4
                                                desc.cnbcu.subseccion
                                                                <chr>
1 Actividades de edición e impresión y de reproducción de grabaciones
2 Actividades de edición e impresión y de reproducción de grabaciones
3 Actividades de edición e impresión y de reproducción de grabaciones
4 Actividades de edición e impresión y de reproducción de grabaciones
5 Actividades de edición e impresión y de reproducción de grabaciones
6 Actividades de edición e impresión y de reproducción de grabaciones
# ... with 3 more variables: year <chr>, indice.subseccion <dbl>,
#   cnbcu.subseccion <chr>
```




Deberes - Swirl
=======================================================

```r
# install.pacakges("swirl")
library(swirl)
install_course("Getting and Cleaning Data")
```
