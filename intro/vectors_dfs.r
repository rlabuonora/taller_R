## un vector

vec <- c(2, 3, 5, 8, 13)


counts <- c("Brazil", "China", "India", "Switzerland", "USA")
life_exp<- c(74, 76, 65, 83, 79)

bra <- counts[1]

## para crear sequencias

sq <- seq(0, 100, 2)
sq <- 0:100

country_data <- data.frame(counts, life_exp)
country_data
str(country_data)

## agregamos otra var
country_data$pop <- c(199000, 1390000, 1240000, 7997, 318000)

## el orden importa!

## para agregar observaciones

counts <- c("Australia", "Greece")
life_exp <- c(82, 81)
pop <- c(23050, 11125)
new_country_data <- data.frame(counts, life_exp, pop)

## y los unimos por filas

df <- rbind(country_data, new_country_data)
