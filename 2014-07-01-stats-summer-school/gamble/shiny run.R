#library("shiny", lib.loc="E:/emacs/R/win-library/3.0")
library(shiny)
setwd("C:/Users/James/Dropbox/Mine/Outreach/FST_Summer_School")
setwd("E:/Dropbox/Mine/Outreach/FST_Summer_School")

#runApp("gambler_ruin", display.mode = "showcase")
runApp("gambler_ruin")

#There are 11 built in examples.
runExample("01_hello") # a histogram
runExample("02_text") # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg") # global variables
runExample("05_sliders") # slider bars
runExample("06_tabsets") # tabbed panels
runExample("07_widgets") # help text and submit buttons
runExample("08_html") # shiny app built from HTML
runExample("09_upload") # file upload wizard
runExample("10_download") # file download wizard
runExample("11_timer") # an automated timer


