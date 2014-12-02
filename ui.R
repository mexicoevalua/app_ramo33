library(shiny)

# Cargar datos
data  <- read.csv("data/data_table.csv", encoding="utf8")

# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("Gasto en el Ramo 33"),
    helpText("Cifras en millones de pesos (MdP) y pesos per cápita 1998 - 2014 (en valores de 2008).
             "),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4, 
             selectInput("estado", 
                         "Estado:", 
                         c("Todos", 
                           unique(as.character(data$Estado))))
      ),
      column(4, 
             selectInput("year", 
                         "Año:", 
                         c("Todos", 
                           unique(as.character(data$Año))))
      ),
     
      column(4, 
             selectInput("fondo", 
                         "Fondo:", 
                         c("Todos", 
                           unique(as.character(data$Fondo))))
      )
    ),
    # Create a new row for the table.
    fluidRow(
      dataTableOutput(outputId="table")
    ),
    helpText(
      "Desarrollado por ", a(href="http://www.mexicoevalua.org", "México Evalúa."),
      "Visita el proyecto en", a(href="https://github.com/mexicoevalua/app_ramo33", "GitHub.")),
    img(src="logo_72x92.png", height = 72, width = 92)
    
             
  )  
)