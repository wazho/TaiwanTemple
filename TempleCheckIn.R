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
  tem_addr[i]  <- xml_data[[i]]$地址
  tem_relig[i] <- xml_data[[i]]$教別
  #tem_build[i] <- xml_data[[i]]$建別
  #tem_orgin[i] <- xml_data[[i]]$組織型態
  #tem_tel[i]   <- xml_data[[i]]$電話
  #tem_prin[i]  <- xml_data[[i]]$負責人
}

templeOfficalDatasets <- data.frame(tem_name, tem_local, tem_relig, tem_addr)
print(templeOfficalDatasets)



if (!require(shiny)) install.packages("shiny")
library(shiny)
runApp("/Users/Salmon/Academia Sinica/TaiwanTemple/shinyApp")



# Set the work directory.
setwd("/Users/Salmon/Academia Sinica/TaiwanTemple")
# Read the checkins data and clean it.
FB_checkins <- read.csv("20130904.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
FB_checkins <- FB_checkins[1:5]
# Sorting by id.
FB_checkins <- FB_checkins[order(FB_checkins[,1]),]
# Save a sorted data.
write.csv(FB_checkins, "sorted.csv", row.names = FALSE)


# The function of checking the same IDs.
checkSameID = function(id) {
  for (k in 1:nrow(FB_stored_checkins))
    if (FB_stored_checkins$id[k] == id)
      return (TRUE)
  return (FALSE)
}

# Adding the new row that is non-repetitive ID.
addNewID = function(var1, var2, var3, var4, var5) {
  # here
  newFrame <- rbind(FB_stored_checkins, c(var1, var2, var3, var4, var5))
  return (newFrame)
}

# Stored Facebook checkins, first declaration.
FB_stored_checkins <- FB_checkins[1,]

# Delete / Skip the 
for (i in 1:nrow(FB_checkins)) {
  if (!checkSameID(as.character(FB_checkins$id[i]))) {
    FB_stored_checkins <- addNewID(as.character(FB_checkins$id[i]), as.character(FB_checkins$name[i]), FB_checkins$latitude[i], FB_checkins$longitude[i], FB_checkins$checkins[i])
    # row.names(FB_stored_checkins) <- c(1:nrow(FB_stored_checkins))
  }
  if (i %% 100 == 0)
    print(paste("Still filtering... ", i))
} # for
row.names(FB_stored_checkins) <- c(1:nrow(FB_stored_checkins))




