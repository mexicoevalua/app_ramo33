library(shiny)

data  <- read.csv("data/data_table.csv", encoding="utf8")
#data$long_name  <- as.character(data$long_name)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$table <- renderDataTable({
    
    if (input$estado != "Todos"){
      data <- data[data$Estado == input$estado,]
    }
    if (input$year != "Todos"){
      data <- data[data$Año == input$year,]
    }
    if (input$fondo != "Todos"){
      data <- data[data$Fondo == input$fondo,]
    }
    data
  })
  
})