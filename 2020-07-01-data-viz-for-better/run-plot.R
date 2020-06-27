df = readRDS("all_activies.RDS")

library(lubridate)
# Run activity count
run_rose = 
  df %>%
  mutate(month = month(start_date, label = TRUE),
         year = year(start_date))  %>%
  filter(type == "Run") %>%
  group_by(month, year) %>%
  summarise(total_runs = n()) %>%
  mutate(label = if_else((month == "Dec" & year == 2015)  | (month == "Jul" & year == 2015) | (month == "Sep" & year == 2015) | (month == "Jan" & year == 2020) | (month == "Apr" & year == 2020)| (month == "Jun" & year == 2020),
                         glue::glue("{month} {year}"),
                         ""))

run_rose$hjust = 0
run_rose$vjust = 0

run_rose$hjust[run_rose$month == "Jul"] = 0.7
run_rose$vjust[run_rose$month == "Jul"] = 2

run_rose$hjust[run_rose$month == "Sep"] = 1.1
run_rose$vjust[run_rose$month == "Sep"] = 0

run_rose$hjust[run_rose$month == "Dec"] = 0.7
run_rose$vjust[run_rose$month == "Dec"] = -1

run_rose$hjust[run_rose$month == "Jan"] = 0.6
run_rose$vjust[run_rose$month == "Jan"] = -1

run_rose$hjust[run_rose$month == "Apr"] = -0.1
run_rose$vjust[run_rose$month == "Apr"] = 0

run_rose$hjust[run_rose$month == "Jun"] = 0.2
run_rose$vjust[run_rose$month == "Jun"] = 4.2

run_rose %>%
  ggplot(aes(x = month, y = total_runs)) + 
  geom_col(fill = "skyblue", width = 1, col = "black") +
  facet_wrap(vars(year), nrow = 1) +
  coord_polar()  +
  scale_y_sqrt() + 
  theme_void() +
  theme(panel.spacing = unit(-10, "lines"),
        strip.text.x = element_blank()) + 
  geom_text(aes(label = label, y = total_runs,
                hjust = hjust, vjust = vjust),
            family =  "Roboto Condensed",
            size = 5,
            position = "identity")



