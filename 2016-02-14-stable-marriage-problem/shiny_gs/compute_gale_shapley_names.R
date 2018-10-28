compute_gale_shap <- function(n){
  library(knitr)
  library(tidyverse)
  
  male_names <- c("Mike", "Rupert", "Daniel", "Willam", "Jason", "Graham", "Patrick", "Alex", "Nigel", "Edward")
  female_names <- c("Jessica", "Monica", "Rachel", "Phoebe", "Catherine", "Jane", "Lucy", "Emma", "Beatrice", "Nadia")
  
  guys <- sample(male_names, n)
  gals <- sample(female_names, n)
  
  m_pref <- replicate(n, sample(seq(1, n, by = 1)))
  w_pref <- replicate(n, sample(seq(1, n, by = 1)))
  
  male <- as.data.frame(m_pref)
  colnames(male) <- guys
  rownames(male) <- gals
  print(kable(male))
  
  female <- as.data.frame(w_pref)
  colnames(female) <- gals
  rownames(female) <- guys
  print(kable(female))
  
  m_single <- rep(1, n) # Binary. One if man is single.
  w_engaged <- rep(0, n) # Which male the women are engaged to. 0 if single
  m_hist <- rep(0, n) # A count of the number of proposals a man has made
  day <- 1
  story <- "Let the proposals begin!"
  
  while(sum(m_single != 0)){
    story <- c(story, sprintf("\nDay %i. \n~~~~~~~~~~", day))
    offers <- rep(NA, n) # The current proposals on offer from the men  
   
     # Proposals from single men
    for (i in which(m_single == 1)){
      
      m_hist[i] <- m_hist[i] + 1 # Increase number of proposals made
      offers[i] <- m_pref[m_hist[i], i]
      story <- c(story, sprintf("\n %s proposes to %s.", guys[i], gals[offers[i]]))
    }
    approached   <- sort(unique(offers))	# index of women who received offers
   
    story <- c(story, "\n---")

      # Acceptances from women  
    for(i in approached){
      proposers <- which(offers == i) # Men who have proposed this round
      best_offer <- proposers[which.min(w_pref[proposers, 1])]
      if(w_engaged[i] == 0){
        w_engaged[i] <- best_offer
        story <- c(story, sprintf("\n %s accepts %s.", gals[i], guys[w_engaged[i]]))
      }
      else{ 
        choices <- c(w_engaged[i], best_offer)
        favourite <- choices[which.min(w_pref[choices, 1])]
        if(favourite == best_offer){
          story <- c(story, sprintf("\n %s breaks off with %s to accept %s.", gals[i], guys[w_engaged[i]], guys[best_offer]))
          w_engaged[i] <- favourite
        }
        else{
          story <- c(story, sprintf("\n %s turns down %s to stay with %s.", gals[i], guys[best_offer], guys[w_engaged[i]]))
        }
      }
    }
    m_single <- as.numeric(!(1:n %in% w_engaged))
    day <- day + 1
  }
  
cat(sprintf("\n Final pairings: \n "))  

matchings <- as.data.frame((cbind(guys[w_engaged], gals)))
matchings$manP <- NA

for (i in 1:n){
  matchings$manP[i] <- m_pref[i, w_engaged[i]]
  matchings$womP[i] <- w_pref[w_engaged[i], i]}

colnames(matchings) <- c("Men", "Women", "M Preference", "W Preference")
matchings <- select(matchings, "M Preference", "Men", "Women", "W Preference")

print(kable(matchings))

return(
  list(
    m_pref = male,
    w_pref = female,
    matchings = matchings,
    story = story
  )
)

}