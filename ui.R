#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("World Bank Data - 2015. Life Expectancy at birth vs Gross Domestic Product per person"),
    sidebarLayout(
        sidebarPanel(
            h3("Life expectancy"),
            sliderInput("slider1", "Choose min-max:", 45, 90, c(45,90)),
            checkboxGroupInput("continent","Filter continents:",
                               c("Africa" ="Africa",
                                 "America" = "America",
                                 "Asia" = "Asia",
                                 "Europe" = "Europe",
                                 "Oceania" = "Oceania"), 
                               selected=c("Africa","America","Asia", "Europe","Oceania")
            )
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Graphic",
                         fluidRow(
                                  plotlyOutput("plot"),
                                  verbatimTextOutput("totals")
                                  
                         )
                ),
                tabPanel("About",
                         fluidRow(
                             p("Data downloaded from"), tags$a(target = "_blank", 
                                                               href = "http://databank.worldbank.org/", 
                                                               "World Data Bank,2015 data."),
                             p("It's plotted the relation between Gross Domestic Product per person and life expectancy at birth."),
                             p("GDP per person in logarithm scale due to the concentration of data points in low values of GDP; this way the relation is clearly depicted."),
                             tags$ul(
                                 tags$li("You can choose a range of years with the slider"), 
                                 tags$li("You can exclude/include continents"),
                                 tags$li("Hovering over a point, the GDP per person,life expectancy and population of the country is shown"),
                                 tags$li("The number of countries per continent that meet the filter criteria is summ up below the graphic")
                                 
                             )
                         )
                )
            )
            
    
    )
)
)
)

