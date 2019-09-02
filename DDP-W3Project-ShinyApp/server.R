library(shiny)
library(ggplot2)
library(dplyr)

shinyServer(function(input,output){
      
      output$plot <- renderPlot({
            x <- input$x
            y <- input$y
            
            irissub <- filter(iris, Species %in% input$species)
            
            qplot(irissub[,x], irissub[,y], data = irissub, col = irissub$Species)
      })
})



