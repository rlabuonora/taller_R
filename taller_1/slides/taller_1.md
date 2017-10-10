Taller 1
============================================
autosize: true


Select
========================================================
Selecciona columnas

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
  head()
```

```
  sleep_total sleep_rem sleep_total_log sleep_rem_log sleep_total_log2
1        12.1        NA        2.493205            NA         3.596935
2        17.0       1.8        2.833213     0.5877867         4.087463
3        14.4       2.4        2.667228     0.8754687         3.847997
4        14.9       2.3        2.701361     0.8329091         3.897240
5         4.0       0.7        1.386294    -0.3566749         2.000000
6        14.4       2.2        2.667228     0.7884574         3.847997
  sleep_rem_log2
1             NA
2      0.8479969
3      1.2630344
4      1.2016339
5     -0.5145732
6      1.1375035
```

Mutate_at: Apply funs to specific columns. 

```r
msleep %>%
mutate_at(vars(sleep_total),funs(log(.),log2(.))) %>%
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
  sleep_total sleep_rem sleep_cycle awake brainwt  bodywt      log
1        12.1        NA          NA  11.9      NA  50.000 2.493205
2        17.0       1.8          NA   7.0 0.01550   0.480 2.833213
3        14.4       2.4          NA   9.6      NA   1.350 2.667228
4        14.9       2.3   0.1333333   9.1 0.00029   0.019 2.701361
5         4.0       0.7   0.6666667  20.0 0.42300 600.000 1.386294
6        14.4       2.2   0.7666667   9.6      NA   3.850 2.667228
      log2
1 3.596935
2 4.087463
3 3.847997
4 3.897240
5 2.000000
6 3.847997
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
left_join(df1, df2)
```

```
# A tibble: 2 x 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
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
left_join(df1, df2)
```

```
# A tibble: 2 x 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
2     2     1    NA  <NA>
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
Retains only rows with matches.

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
Retain all values, all rows. 

Es decir, muestra las filas que tienen match pero también las que no tuvieron match. 

En este caso, la fila 1 de la matrix "x" y la fila 1 de la matriz "y" hacen match, por lo que aparecen como una sola fila. 

Luego, la fila 2 de la matrix "x" y la fila 2 de la matriz "y" aparecen también en la matriz final, aún cuando no había matches para ellas. 


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
full_join(df1, df2)
```

```
# A tibble: 3 x 4
      x     y     a     b
  <dbl> <int> <dbl> <chr>
1     1     2    10     a
2     2     1    NA  <NA>
3     3    NA    10     a
```

Semi join
=======================================================
Returns all rows from "x" where there are matching values in "y", keeping just columns from "x". 

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
Returns all rows from "x" where there are not matching values in "y", keeping just columns from "x".



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
anti_join(df1, df2)
```

```
# A tibble: 1 x 2
      x     y
  <dbl> <int>
1     2     1
```


Spread
=======================================================








```
Error in eval(expr, envir, enclos) : object 'table2' not found
```
