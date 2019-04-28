#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that predicts Iris species
shinyUI(fluidPage(
  
  titlePanel("speciesPredict : Predict Iris species from Sepal Length"),
  
  sidebarLayout(
    sidebarPanel(
        sliderInput("sliderSepalLen", "Please select a Sepal Length", 4.3, 7.9, value = 5.8),
        submitButton("Predict!")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plotlm"),
       h3("Predicted Iris Species using Linear Discriminant Analysis (lda):"),
       span(h3(textOutput("predict")),style="color:blue") 
    )
  )
))
