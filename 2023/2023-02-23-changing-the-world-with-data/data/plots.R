source("data/clean.R")
source("data/function.R")


#####################
#### Word clouds ####
#####################

extra_stop_ff = c("fast", "food", "restaurant", "favourite")
extra_stop_s = c("snack", "snacks", "favourite")

create_wordcloud(categorised_answers$fast_food, extra_stop = extra_stop_ff, wc_scale = c(3.5, 0.25))
create_wordcloud(categorised_answers$snack, extra_stop_s)


#####################
###### Waffles ######
#####################

fast_food_cats = waffle_iron(categorised_answers, aes_d(group = fast_food_type))
snack_cats = waffle_iron(categorised_answers, aes_d(group = snack_type))

my_vec = c()
emoji_list = c("cake", "hamburger", "poultry_leg", "fries", "pizza", "bread")

fast_food_cats = fast_food_cats %>% mutate(emojis = case_when(
  endsWith(group, "Bakery") ~ emoji("cake"),
  endsWith(group, "Burgers") ~ emoji("hamburger"),
  endsWith(group, "Chicken") ~ emoji("poultry_leg"),
  endsWith(group, "Misc") ~ emoji("fries"),
  endsWith(group, "Pizza") ~ emoji("pizza"),
  endsWith(group, "Sandwiches") ~ emoji("bread")
))

snack_cats = snack_cats %>% mutate(emojis = case_when(
  endsWith(group, "Biscuits") ~ emoji("cookie"),
  endsWith(group, "Cake") ~ emoji("cake"),
  endsWith(group, "Chocolate") ~ emoji("chocolate_bar"),
  endsWith(group, "Crisps") ~ emoji("potato"),
  endsWith(group, "veg") ~ emoji("strawberry"),
  endsWith(group, "food") ~ emoji("spaghetti"),
  endsWith(group, "Misc") ~ emoji("ice_cream"),
  endsWith(group, "Sweets") ~ emoji("candy"),
  endsWith(group, "Yoghurt") ~ emoji("honey_pot")
))

fast_food_cats_plot = ggplot(fast_food_cats, aes(x, y, colour = group)) +
  geom_text(aes(label=emojis), family='EmojiOne', size=8) +
  coord_flip() +
  theme_void() +
  theme(legend.position = "none")
fast_food_cats_plot

snack_cats_plot = ggplot(snack_cats, aes(x, y, colour = group)) +
  geom_text(aes(label=emojis), family='EmojiOne', size=8) +
  coord_flip() +
  theme_void() +
  theme(legend.position = "none")
snack_cats_plot

#####################
######## Bar ########
#####################

font_add_google("Lato")

sweet_savoury_palette = list("Sweet" = "#d794f2",
                             "Savoury" = "#b6cc72")
st = glue("We asked for the favourite snacks of 39 14-19
           year olds  to determine if there <br> was a pattern in preferences for
           <span style='color:{sweet_savoury_palette$`Sweet`}'>sweet</span> vs
           <span style='color:{sweet_savoury_palette$`Savoury`}'>savoury
           </span> snacks.")


age_sweet_savoury = ggplot(categorised_answers, aes(x = age)) +
  geom_bar(aes(fill = snack_sw_sv)) +
  labs(title = "Do our tastes change as we get older?",
       subtitle = st,
       x = "Age [years]",
       y = "") +
  scale_fill_manual(values = sweet_savoury_palette) +
  theme_minimal() +
  theme(plot.subtitle = element_markdown(family = "Lato",
                                         size = 20,
                                         lineheight = 0.4,
                                         margin = unit(c(0, 0, 0.5, 0), "cm")),
        plot.title = element_markdown(family = "Lato",
                                      size = 30,
                                      margin = unit(c(1, 0, 0.5, 0), "cm")),
        axis.text = element_text(family = "Lato",
                                 size = 10),
        axis.title = element_text(family = "Lato",
                                  size = 15),
        legend.position = "none")
age_sweet_savoury
