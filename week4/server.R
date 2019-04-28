#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
require(dplyr)
require(caret)
require(e1071)

shinyServer(function(input, output) {
   
    set.seed(3456)
    fit  <- train(Species ~ Sepal.Length, data=iris,method="lda", ntree=100)

    pred <- reactive({
        SepalLenInput <- input$sliderSepalLen
        as.character(predict(fit, newdata = data.frame(Sepal.Length = SepalLenInput)))
    })

    output$plotlm <- renderPlot({
        SepalLenInput <- input$sliderSepalLen
        
            boxplot(Sepal.Length~Species,
                    data=iris,
                    main="Sepal Length for each species",
                    xlab="Species",
                    ylab="Sepal Length",
                    ylab = "Species", bty = "n", pch = 16,
                    ylim = c(4.2, 8.0),
                    col="orange",
                    border="brown")
            abline(h=SepalLenInput, col = "blue", lwd = 2)
            
        })
    
    output$predict <- renderText({
        pred()   
    })
    
})
