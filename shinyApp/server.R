if (!require(ggplot2)) install.packages("ggplot2")
if (!require(ggmap)) install.packages("ggmap")
library(ggplot2)
library(ggmap)
library(shiny)

shinyServer(function(input, output) {
  
  TaiwanMap <- get_map(location = c(lon=121.083179, lat=23.723355), color = "color", source = "google", maptype = "roadmap", zoom = 7, scale = 2)
  TaiwanMap <- ggmap(TaiwanMap, extent="panel", ylab="Latitude", xlab="Longitude")
  # output$TaiwanMap <- TaiwanMap
})
