library(readxl)
library(dplyr)
library(stringr)
library(ggplot2)
library(ggwaffle)
library(emojifont)
library(RColorBrewer)
library(wordcloud)
library(wordcloud2)
library(tm)
library(glue)

food_responses = read_excel("data/food_responses.xlsx")
remove_columns = c(-1, -5, -6, -8, -10, -11)

food_responses = food_responses[remove_columns]

fast_food_snacks = food_responses %>%
  rename(
    region = Region,
    fast_food = A1,
    snack = A2,
    age = `Age(Years)`
  )

summarised = read.csv("data/categories.csv")

categorised_answers = data.frame(fast_food_snacks, summarised)

rm(summarised, fast_food_snacks, food_responses)
