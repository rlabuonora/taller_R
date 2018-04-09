## Requiere: rut, N1, N2, ..., N5, N1_1, N2_1, ..., NP1_1, NP1_2, ...

library(stringr)
library(tidyverse)

porcentajes_por_destino_sector <- function(df) {
  tabla.1 <-function(df) {
    df %>%
      select(id, matches("NP\\d_\\d")) %>%
      gather(-id, key=idx, value=percent) %>%
      mutate(idx_pais=str_match(idx, "NP(\\d)_(\\d)")[,2],
             idx_sector=str_match(idx, "NP(\\d)_(\\d)")[,3])
  }
  # Otra tabla con los porcentajes de
  ## cada país
  tabla.2 <- function(df) {
    df %>%
      select(id, matches("N\\d_\\d")) %>%
      gather(-id, key=idx, value=pais) %>%
      mutate(idx_pais=str_extract(idx, "\\d$"),
             idx_sector=str_match(idx,"N(\\d)_\\d$")[,2])
  }
  # Otra tabla con las exportaciones por sector
  # todo junto
  juntar <- function(df)  {
    t1 <- tabla.1(df)
    t2 <- tabla.2(df)
    t1 %>%
      left_join(t2, by=c("rut", "idx_pais", "idx_sector")) %>%
      ##left_join(t3) %>%
      select(-idx.x, -idx_pais, -idx.y)
  }
  juntar(df)
}



for (i in 1:5) {
  fname <- paste("q", i, ".pdf", sep="")
  pdf(fname)
  hist(rnorm(100, sd=i))
  dev.off()
}
