# Instalar paquetes para publicar el app
install.packages("shiny")
devtools::install_github('rstudio/shinyapps')
library(shinyapps)
library(shiny)
runApp("app_ramo33")
setwd("app_ramo33")
deployApp()
# Para eliminar la aplicacion
#shinyapps::terminateApp("app_ramo33")

