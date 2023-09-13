library(leaflet)
library(maps)

names = c("Windsor", "Nottingham", "Aberystwyth", "Bristol", "Newcastle", "Innsbruck")
reason = c("I was born in Windsor and lived there till I was 4 - I don't remember very much of this, other than incredibly loud concordes flying over!",
           "I lived in Nottingham from the age of 4 to 18, when I moved to go to University",
           "I studied astrophysics at Aberystwyth University for 4 years. Going to Uni at the beach was amazing!",
           "After my masters, I worked for a year in cyber security in Bristol. This was interesting, but I decided it wasn't for me. I do miss Bristol though!",
           "I moved up to Newcastle to do a PhD in Quantum Physics. This took about 5 years & and a pandemic, and I moved countries towards the end, but I got there",
           "I now live in Innsbruck in Austria. Thanks to Jumping Rivers being a remote company, I can do data science in the week and ski at the weekend!")
lat = c(51.4803, 52.9540, 52.4153, 51.4545, 54.9783, 47.2692)
lng = c(-0.6157, -1.1550, -4.0829, -2.5879, -1.6178, 11.4041)

df = data.frame(names, reason, lat, lng)

location_icons = iconList(
  Windsor = makeIcon("graphics/windsor.jpg", "graphics/windsor@2x.jpg", 40, 40),
  Nottingham = makeIcon("graphics/nottingham.jpg", "graphics/nottingham@2x.jpg", 40, 40),
  Aberystwyth = makeIcon("graphics/aberystwyth.jpg", "graphics/aberystwyth@2x.jpg", 40, 40),
  Bristol = makeIcon("graphics/bristol.jpg", "graphics/bristol@2x.jpg", 40, 40),
  Newcastle = makeIcon("graphics/newcastle.jpg", "graphics/newcastle@2x.jpg", 40, 40),
  Innsbruck = makeIcon("graphics/innsbruck.jpg", "graphics/innsbruck@2x.jpg", 40, 40)
)

leaflet(df) %>%
  addProviderTiles(providers$Esri.WorldImagery) %>%
  addProviderTiles(providers$Stamen.TonerLines) %>%
  addMarkers(~lng, ~lat,
             icon = location_icons[df$names],
             popup = ~as.character(reason),
             label = ~as.character(names)) %>%
  addPopupImages(Windsor, )





