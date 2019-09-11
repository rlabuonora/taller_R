# Fuente:
# https://github.com/rstudio/webinars/blob/master/54-row-oriented-work/ex03_row-wise-iteration-are-you-sure.R

## Evitar iterar sobre filas
library(tibble)

new_df <- function() {
  tribble(
    ~ name, ~ age,
    "Reed", 14,
    "Wesley", 12,
    "Eli", 12,
    "Toby", 1
  )
}

df <- new_df()
paste(df$name[1], "is", df$age[1], "years old")

# loop
n <- nrow(df)
s <- vector(mode = "character", length = n)
for (i in 1:nrow(df)) {
  s[i] <- paste(df$name[i], "is", df$age[i], "years old")
}

# paste ya esta vectorizada!

paste(df$name, "is", df$age, "years old")

# El estilo r-base es proclive a los vectores, 
# en el tidyverse usaría un dataframe
library(tidyverse)
str_glue_data(df, "{name} is {age} years old")

df %>%
  mutate(sentence = str_glue("{name} is {age} years old"))

# una lista de dfs
df_list <- list(
  iris = head(iris, 2),
  mtcars = head(mtcars, 3)
)


# otro ejemplo

nrow(df_list)




f_for_loop <- function(df) {
  out <- vector(mode = "list", length = nrow(df))
  for (i in seq_along(out)) {
    out[[i]] <- as.list(df[i, , drop = FALSE])
  }
  out
}



## Map aplica una funcion a todos los elementos de una lista
## Y devuelve una lista con los resultados


## ¿Cuáles son los nombres de esa lista?
library(purrr)
purrr::map(df_list, nrow)


# Hay formas mas complicadas de llamarla

# runif
n <- 100
runif(n, min = 0, max = 1)

# quiero hacerlo con distintos valores de n, min y max para comparar las distribuciones
library(tidyverse)

df <- tribble(
  ~ n, ~ min, ~ max,
  1L,     0,     1,
  2L,    10,   100,
  3L,   100,  1000
)
set.seed(123)

x <- df[1, ]
runif(x$n, x$min, x$max)

x <- df[2, ]
runif(x$n, x$min, x$max)

x <- df[3, ]
runif(x$n, x$min, x$max)

pmap(df, runif)

# que pasa si los argumentos no coinciden: renombre


# que pasa si me sobran argumentos?
df_oops <- tibble(
  n = 1:3,
  min = c(0, 10, 100),
  max = c(1, 100, 1000),
  oops = c("please", "ignore", "me")
)
pmap(df_oops, runif) # error unused arguments

df_oops %>% 
  select(n, min, max) %>% 
  pmap(runif)
