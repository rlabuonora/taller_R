## Taller 1

# Knit
t <- rmarkdown::render("./Taller1-Intro/slides/Taller1.Rmd")

id_1 <- "https://api.rpubs.com/api/v1/document/377478/0f21728e32714e159b73211e17fbd951"
# Upload to RPUBS
markdown::rpubsUpload("Taller 1 - Intro", t,  id = id_1, properties = list(), 
            method = getOption("rpubs.upload.method", "auto"))


# Taller 2

t <- rmarkdown::render("./Taller2-Rlang/slides/Taller2-RLang.Rmd")


id_2 <- "https://api.rpubs.com/api/v1/document/377497/24cfefa92e2e403bbb1d32958a293583"


# Upload to RPUBS
markdown::rpubsUpload("Taller 2 - RLang", t,  id = id_2, properties = list(), 
                      method = getOption("rpubs.upload.method", "auto"))


# Taller 3

t <- rmarkdown::render("./Taller3-Wrangling/slides/Taller3-Wrangling.Rmd")



id_3 <- "https://api.rpubs.com/api/v1/document/377511/7edb20926d1b416981904af7e0553d2d"

# Upload to RPUBS
markdown::rpubsUpload("Taller 2 - RLang", t,  id = id_3, properties = list(), 
                      method = getOption("rpubs.upload.method", "auto"))

# Upload to RPUBS por vez primera
markdown::rpubsUpload("Taller 3 - Wrangling", t,  properties = list(), 
                      method = getOption("rpubs.upload.method", "auto"))