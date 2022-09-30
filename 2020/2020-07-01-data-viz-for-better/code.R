HistData::Nightingale %>% 
  mutate(Month = str_to_upper(month((HistData::Nightingale$Date), label = TRUE, abbr = FALSE))) %>% 
  mutate(When = if_else(Year == 1854 | (Year == 1855 & Month %in% c("JANUARY", "FEBRUARY", "MARCH")),
                        "1. \n APRIL 1854 TO MARCH 1855",
                        "2. \n APRIL 1855 TO MARCH 1856"))  %>%
  mutate(angle = rep(90 - seq(15, 345, by = 30), times = 2)) %>%
  mutate(text_pos = if_else(Disease.rate > 120,
                            Disease.rate,
                            120)) %>%
  mutate(When = factor(When, levels = c("2. \n APRIL 1855 TO MARCH 1856",  "1. \n APRIL 1854 TO MARCH 1855"))) %>%
  pivot_longer(cols = ends_with("rate"),  names_to = "Cause", values_to = "Deaths")  %>%
  mutate(Label = if_else(Cause == "Disease.rate", as.character(Month), "")) %>%
  mutate(Month = factor(Month,  levels = c("APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER", "JANUARY", "FEBRUARY", "MARCH"))) -> 
  polar_data

ggplot(polar_data) +
  aes(x = Month) + 
  aes(y = Deaths) + 
  geom_col(width = 1, alpha = 0.2, position = "identity") + 
  facet_wrap(~When) + 
  aes(fill = Cause, col = Cause) + 
  scale_y_sqrt() +
  coord_polar(start = -pi/2, clip = "off") +
  geom_text(aes(label = Label, y = text_pos, angle = angle),
            position = "identity", color = "black",
            size = 2, vjust = -1.5) +
  labs(title = "DIAGRAM OF THE CAUSES OF MORTALITY",
       subtitle = "IN THE ARMY IN THE EAST") +
  xlab("") + 
  scale_fill_manual(values = c("Wounds.rate" = "red",#"#e7bebc",
                               "Other.rate" = "#322b2f",
                               "Disease.rate" = "lightblue")) + 
  scale_colour_manual(values = c("Wounds.rate" = "#e7bebc",
                                 "Other.rate" = "grey",
                                 "Disease.rate" = "lightblue")) +
  theme_void()  +
  theme(legend.position = "none", 
        plot.title = element_text(hjust = 0.5, family = "serif", size = 18), 
        plot.subtitle = element_text(hjust = 0.5, size = 14, family = "Times New Roman"),
        plot.caption = element_text(hjust = 0, size = 10, family = "serif", face = "italic")) + 
  theme(panel.spacing = unit(-10, "lines")) +
  labs(caption =  "The Areas of the blue, red, & black wedges are each measured from \n   the centre as the common vertex.
The blue wedges measured from the centre of the circle represent area \n   for area the deaths from Preventable or Mitigable Zymotic diseases, the \n   red wedges measured from the centre the deaths from wounds, & the \n   black wedges measured from the centre the deaths from all other causes.
The black line across the red triangle in Nov. 1854 marks the boundary \n   of the deaths from all other causes during the month.
In October 1854, & April 1855, the black area coincides with the red, \n   in January & February 1856, the blue coincides with the black.
The entire areas may be compared by following the blue, the red, & the \n   black lines enclosing them.")



