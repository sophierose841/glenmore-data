# Glenmore Map
# Sophie Rose
# University of Edinburgh

# installing packages
install.packages("dplyr")
install.packages("tidyr")
install.packages("leaflet")
library(dplyr)
library(tidyr)
library(leaflet)


# working directory check
getwd()

# reading initial data
gmore <- read.csv("Data/GlenmoreData.csv")

# checking variables
str(gmore)


# changing name of first column with error
names(gmore)
names(gmore)[1] <- "No."


## creating poop map
# subset poop from offence column
gmorepoop <- gmore %>%
  filter(Offence %in% 'Poop')

# making poop icon
poop_icon <- makeIcon(iconUrl = "https://img.icons8.com/small/32/000000/full-of-shit.png")


poopmap <- leaflet(options = leafletOptions(minZoom = 0, maxZoom = 18)) %>%
  addTiles() %>%
  addMarkers(lng=gmorepoop$Longitude, lat=gmorepoop$Latitiude, clusterOptions = markerClusterOptions(), icon = poop_icon)
  


print(poopmap)
