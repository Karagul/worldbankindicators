#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
    dat <- read.csv("World_Bank_indicators.csv", header = T, sep=";", na.strings = ".." )
    dat <- na.omit(dat)
    dat$population = as.numeric(gsub(",", "",dat$population, fixed = TRUE))
    dat$GDP_per_person = as.numeric(gsub(",", "",dat$GDP_per_person, fixed = TRUE))
    
    
    output$plot <- renderPlotly({
        #plot_ly(mtcars, x = ~mpg, y = ~wt)
        minX <- input$slider1[1]
        maxX <- input$slider1[2]
        #filter min and max life expectancy
        datshown <- dat[(dat$life_expectancy_at_bird >=minX & dat$life_expectancy_at_bird <=maxX),]
        text = ""
        
        #filter continents
        datshown = datshown[datshown$continent %in% input$continent,]
        
        for (i in unique(datshown$continent)) {
            text <- paste(text, i, sum(datshown$continent == i))
        }
        text <- paste(text, "TOTAL:", nrow(datshown))
        
       
        output$totals <- renderText(text)
        plot_ly(datshown, x = ~log(GDP_per_person), y = ~(life_expectancy_at_bird), type="scatter",
                mode="markers", color = as.factor(datshown$continent),  hoverinfo = "text",
                text = ~paste(datshown$country,"<br>GDP per person: ", datshown$GDP_per_person, 
                              '<br>Life exp:', datshown$life_expectancy_at_bird,
                              '<br>Population:', format(datshown$population, big.mark = ",")))
    })
    
    output$event <- renderPrint({
        d <- event_data("plotly_hover")
        if (is.null(d)) "Hover on a point!" else d$pointNumber
    })
  
})
