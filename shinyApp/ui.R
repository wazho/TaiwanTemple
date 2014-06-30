if (!require(ggplot2)) install.packages("ggplot2")
if (!require(ggmap)) install.packages("ggmap")
library(ggplot2)
library(ggmap)
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Taiwan Facebook checkins."),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      dateRangeInput("date",
                     "Date range.",
                     start = "2014-01-01",
                     end = "2014-01-31",
                     min = "2012-03-01",
                     max = "2014-03-30",
                     separator = "~"),
      submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("TaiwanMap", height = "500px")
    )
  )
))
