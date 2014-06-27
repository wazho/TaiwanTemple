if (!require(XML)) install.packages("XML")
setwd("/Users/wangze-hao/Desktop/TaiwanTemple")

# original file name : "temple.xml"
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

# install 'RODBC' package to read mdb
if (!require(RODBC)) install.packages("RODBC")






