library(shiny)
library(datasets)

data(iris)

shinyUI(fluidPage(
      titlePanel("Developing Data Products - Final Project"),
      sidebarLayout(
            sidebarPanel(
                  h3("Input parameters here:"),
                  h4("Select variable to plot on x-axis:"),
                  selectInput("x", label = "X variable", choices = names(iris), multiple = FALSE),
                  h4("Select variable to plot on y-axis:"),
                  selectInput("y", label = "Y variable", choices = names(iris), multiple = FALSE),
                  h4("Filter by Specific Species (select multiple if you like!):"),
                  selectInput("species", label = "Species Filter", choices = levels(iris$Species), 
                              selected = NULL, multiple = TRUE),
                  submitButton("Produce Plot")
                  ),
            mainPanel(
                  tabsetPanel(type = "tabs",
                              tabPanel("Plot", br(), 
                                       h3("Plot of X by Y (Iris Dataset)"),
                                       plotOutput("plot"),
                                       h3("Additional Documentation"),
                                       p(strong("Purpose: "), "To analyze the relationships 
                                         of different variables within the 'iris' dataset.
                                         This dataset contains measurements (in centimeters) 
                                         of flowers with the following variables: sepal length, 
                                         sepal width, petal length, and petal width. 
                                         Along with each observation is the species that each 
                                         flower belongs to."), 
                                       p(strong("Instructions: "), "To use the interactive 
                                         plotting functionality in the above plot, select the 
                                         variables 'x' and 'y' you wish to analyze from the dataset 
                                         and choose the species of flowers you'd like to include 
                                         in the analysis by indicating this in the input box."),
                                       p("Once you are satisfied with your selections, click 
                                         'Produce Plot' to generate a scatterplot and begin your analysis!")
                                       ),
                              tabPanel("Info", br(),
                                       h3("Additional Info"),
                                       p(strong("Author: "),"Patrick de Guzman"),
                                       p(strong("Date: "),"July 31, 2019"),
                                       p(strong("Data source: "), code("{datasets::iris}")))
                              )
            )
            )
      )
)

