# IPI
cnbcu.completo <- read_excel('cuadro_36a.xls', range="A10:N97" ) %>%
  rename(cnbcu=X__1, desc.cnbcu=X__2,  `2015`=`2015*`, `2016`=`2016*`) %>%
  gather(year, indice, -cnbcu, -desc.cnbcu) %>%
  mutate(cnbcu=str_replace(cnbcu, "\\(1\\)", "") %>% trimws) %>%
  separate(cnbcu, " y ", into=c("primero", "segundo"), extra="drop") %>%
  gather(key=no.importa, value=cnbcu, primero, segundo) %>%
  select(-no.importa) %>%
  filter(!is.na(cnbcu))


cnbcu.seccion <- cnbcu.completo %>% 
  filter(str_length(cnbcu)==1) %>%
  rename(cnbcu.seccion=cnbcu,
         desc.cnbcu.seccion=desc.cnbcu,
         indice.seccion=indice)


cnbcu.subseccion <- cnbcu.completo %>% 
  filter(str_length(cnbcu)>1) %>%
  rename(cnbcu.subseccion=cnbcu,
         desc.cnbcu.subseccion=desc.cnbcu,
         indice.subseccion=indice)