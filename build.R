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
f <- "./Taller3-Wrangling/slides/Taller3-Wrangling.Rmd"
t <- rmarkdown::render(f)



id_3 <- "https://api.rpubs.com/api/v1/document/377511/7edb20926d1b416981904af7e0553d2d"

# Upload to RPUBS
markdown::rpubsUpload("Taller 3 - Wrangling", t,  id = id_3, properties = list(), 
                      method = getOption("rpubs.upload.method", "auto"))



# Taller 4

f <- "Taller4-Wrangling-2/slides/Taller4-Wrangling.Rmd"
t <- rmarkdown::render(f)

# Upload to RPUBS
markdown::rpubsUpload("Taller 4 - Wrangling (2)", t,  id = id_4, properties = list(), 
                      method = getOption("rpubs.upload.method", "auto"))

id_4 <- "https://api.rpubs.com/api/v1/document/377513/79ebe3d488f54b1c898848c8aedcb3df"


# Taller 5

f <- "Taller5-Factors-Dates/Taller5-Factors-Dates.Rmd"
t <- rmarkdown::render(f)

id_5 <- "https://api.rpubs.com/api/v1/document/378278/6cb1a9760b7a4333a61c1cc1fd3afe8c"
# Upload to RPUBS por vez primera

# Upload to RPUBS
markdown::rpubsUpload("Taller 5 - Factors & Dates", t,  id = id_5, properties = list(), 
                      method = getOption("rpubs.upload.method", "auto"))

# Taller 6
f <- "Taller6-Strings/Taller6-strings.Rmd"
t <- rmarkdown::render(f)

id_6 <- "https://api.rpubs.com/api/v1/document/378281/c69b7ceb31904516968330150ac08ffb"
markdown::rpubsUpload("Taller 6 - Strings", t,  id = id_6, properties = list(), 
                      method = getOption("rpubs.upload.method", "auto"))

# Taller 7 - Ggplot

f <- "Taller7-Ggplot/Taller7-Ggplot.Rmd"
t <- rmarkdown::render(f)

markdown::rpubsUpload("Taller 7 - Ggplot", t,  properties = list(), 
                      method = getOption("rpubs.upload.method", "auto"))

id_7 <- "https://api.rpubs.com/api/v1/document/378282/75179d6492b241468b999bb89e659614"


markdown::rpubsUpload("Taller 6 - Strings", t,  properties = list(), 
                      method = getOption("rpubs.upload.method", "auto"))
