## leer seed_root_herbivores.csv 
data <- read_csv('../data/seed_root_herbivores.csv')
## calcular la media de height con mean
mean(data$Height)
## calcular la varianza de height con var
var(data$Height)
## calcular la cantidad de observaciones
length(data$Height)
## calcular el error estandar (raiz de (varianza / n)) -> usar sqrt
sqrt(var(data$Height)/length(data$Height))

## hacer lo mismo para weight

mean(data$Weight)
var(data$Weight)
sqrt(var(data$Weight)/length(data$Weight))

## abstraer una funcion que calcula el desvio de un vector
## > desvio(data$Height)
## [1] 1.217822
desvio <- function(x) {
  sqrt(var(x)/length(x))
}


## crear una funcion que recibe un vector como argumento y devuelve 
## un vector de texto que dice para cada observacion esta por arriba 
## de la media o por abajo de la media

## > comparar_con_media(c(1, 2, 3))
## [1] "Menor a la media" "Igual a la media" "Mayor a la media"

comparar_con_media <- function(x) {
  media <- mean(x)
  
  case_when(x == media ~ "Igual a la media",
            x < media ~ "Menor a la media",
            x > media ~ "Mayor a la media")
      
}
