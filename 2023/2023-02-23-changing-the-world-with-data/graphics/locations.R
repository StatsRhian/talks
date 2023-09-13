library(leaflet)
library(maps)
library(dplyr)

data = readxl::read_xlsx("data/food_responses.xlsx")

names = unique(data$local_authority)
lat = c(51.5886, 54.5236, 54.3503, 51.3770, 52.4862, 51.2839, 54.9966, 51.4934, 51.4609, 53.6958, 52.5703, 52.9540, 51.4551, 53.1610, 51.5436, 53.5933, 51.8072, 54.6411, 51.6569, 52.7064, 51.5390, 53.0929, 51.5264, 52.4128, 51.2362, 51.5105, 51.8787, 53.7938, 52.5123, 51.4123)
lng = c(0.0824, -1.5595, -6.6528, -0.0957, -1.8904, -0.2099, -7.3086, 0.0098, -0.3731, -2.4683, -0.2408, -1.1550, -0.9787, -2.2186, -0.0554, -2.2966, -0.8128, -6.7523, -0.1949, -2.7418, -0.1426, -1.2697, -2.4728, -1.5090, -0.5704, -0.5950, -0.4200, -1.7564, -2.0811, -0.3007)

df = data.frame(names, lat, lng)

leaflet(df) %>%
  addProviderTiles(providers$Esri.WorldImagery) %>%
  addProviderTiles(providers$Stamen.TonerLines) %>%
  addMarkers(~lng, ~lat,
             label = ~as.character(names))

