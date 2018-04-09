# Script para knitear y mandar las diapos a RPUBS
# La primera vez que mandamos a RPUBS lo
# hacemos a mano para obtener el id
# después nos quedamos con el id de cada diapo y
# hacemos el deploy automático
# sabiendo el id, y la localización del Rmd

source("./data.R")

render_publish <- function(titulo, archivo, rpubs_id) {
  # Vectorizar!
  t <- rmarkdown::render(archivo)
  markdown::rpubsUpload(titulo, t,  id = rpubs_id, properties = list(), 
                        method = getOption("rpubs.upload.method", "auto"))
}


render_publish_taller <- function(n) {
  render_publish(diapos[n,]$titulo, diapos[n,]$file, diapos[n,]$id)
  
}
