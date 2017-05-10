nations <- readRDS("../datos/nations.rds")
summary(nations)
modelo_gdp <- lm(life ~ school, data=nations)
summary(modelo_gdp)
library(GGally)
ggpairs(data=nations, 
        columns=3:6, 
        title="tips data", 
        colour = "sex") 

modelo <- lm(life ~ school + log(gdp) + adfert + chldmort, data=nations)
summary(modelo)