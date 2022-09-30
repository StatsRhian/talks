# Prediction

lemurs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-08-24/lemur_data.csv')
readr::write_csv(lemurs, "lemurs.csv")

#* Predict the weight of the lemur (kg) given it's age (months)
#* @get /

lemur_weight = function(age){
  lemurs <- readr::read_csv("lemurs.csv")
  fit <- lm(weight_g ~ age_at_wt_mo, data = lemurs)
  new <- data.frame(age_at_wt_mo = as.numeric(age))
  weight <- predict.lm(fit, newdata = new)/1000
  return(weight)
}




