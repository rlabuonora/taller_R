zzff.09 <- readstata13::read.dta13("Z:/ZZFF/2009/zf_2009.dta") %>% 
  select(rut, razon_social=RazonSocial, empleados=PO_TOT) %>% 
  mutate(rut=as.character(rut),
         chars_rut=nchar(rut)) %>%
  arrange(razon_social)

## como es la distribucion de cantidad de caracteres?
zzff.09 %>% group_by(chars_rut) %>% summarise(n=n())

## si queremos datos para testear
## sub %>% filter(chars_rut > 11) %>% group_by(chars_rut) %>% sample_n(2)

extrae_rut <- function(ruts) {
  ifelse(nchar(ruts) == 13,
    substr(ruts,2,13),
    ruts)
}

extrae_local <- function(ruts) {
  ifelse(nchar(ruts) == 13,
         substr(ruts,1,1),
         1)
}

test <- zzff.09 %>% mutate(rut_nuevo=extrae_rut(rut), extrae_local=bar(rut))


## Datos para testing
ruts <- c("214203290014", "212152060010","1215917590016", "2215917590016")


