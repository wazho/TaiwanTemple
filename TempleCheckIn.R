setwd("/Users/Salmon/Academia Sinica/TaiwanTemple")
if (!require(XML)) install.packages("XML")
library(XML)

# original file name : "temple.xml" or "temple_shorter.xml"
templeOfficial <- xmlParse("temple_shorter.xml")
xml_data <- xmlToList(templeOfficial)

tem_name <- NULL
tem_god <- NULL
tem_local <- NULL
tem_addr <- NULL
tem_relig <- NULL
tem_build <- NULL
tem_orgin <- NULL
tem_tel <- NULL
tem_prin <- NULL

for (i in 1:length(xml_data)) {
  tem_name[i]  <- xml_data[[i]]$寺廟名稱
  #tem_god[i]   <- xml_data[[i]]$主祀神祇
  tem_local[i] <- xml_data[[i]]$行政區
  #tem_addr[i]  <- xml_data[[i]]$地址
  tem_relig[i] <- xml_data[[i]]$教別
  #tem_build[i] <- xml_data[[i]]$建別
  #tem_orgin[i] <- xml_data[[i]]$組織型態
  #tem_tel[i]   <- xml_data[[i]]$電話
  #tem_prin[i]  <- xml_data[[i]]$負責人
}

templeOfficalDatasets <- data.frame(tem_name, tem_local, tem_relig)
print(templeOfficalDatasets)


if (!require(ggplot2)) install.packages("ggplot2")
if (!require(ggmap)) install.packages("ggmap")
library(ggplot2)
library(ggmap)

# source = c("google", "osm", "stamen", "cloudmade")
# maptype = c("terrain", "satellite", "roadmap", "hybrid", "toner", "watercolor")
Taiwan_Map <- get_map(location = c(lon = 121.083179, lat = 23.723355), color = "color", source = "google", maptype = "roadmap", zoom = 7, scale = 2)
Taiwan_Map <- ggmap(Taiwan_Map, extent = "panel", ylab = "Latitude", xlab = "Longitude")



FB_checkins <- read.csv("20130904.csv", header = TRUE, sep = ",")

Taiwan_Map + geom_point(aes(x=FB_checkins$longitude, y=FB_checkins$latitude))


if (!require(shiny)) install.packages("shiny")
library(shiny)

runApp("/Users/Salmon/Academia Sinica/TaiwanTemple/shinyApp")






