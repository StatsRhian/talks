compute_gale_shap <- function(n){

  m_pref <- replicate(n, sample(seq(1, n, by = 1)))
  w_pref <- replicate(n, sample(seq(1, n, by = 1)))
  
  m_single <- rep(1, n) # Binary. One if man is single.
  w_engaged <- rep(0, n) # Which male the women are engaged to. 0 if single
  m_hist <- rep(0, n) # A count of the number of proposals a man has made
  
  while(sum(m_single != 0)){
    offers <- rep(NA, n) # The current proposals on offer from the men  
    # Proposals from single men
    for (i in which(m_single == 1)){
      
      m_hist[i] <- m_hist[i] + 1 # Increase number of proposals made
      offers[i] <- m_pref[m_hist[i], i]
      print(sprintf("Man %i proposes to Woman %i", i, offers[i]))
    }
    approached   <- sort(unique(offers))	# index of women who received offers
    # Acceptances from women  
    for(i in approached){
      proposers <- which(offers == i) # Men who have proposed this round
      best_offer <- proposers[which.min(w_pref[proposers, 1])]
      if(w_engaged[i] == 0){w_engaged[i] <- best_offer}
      else{ 
        choices = c(w_engaged[i], best_offer)
        w_engaged[i] <- choices[which.min(w_pref[choices, 1])]
      }
      print(sprintf("Woman %i accepts Man %i", i, w_engaged[i]))
    }
    m_single <- as.numeric(!(1:n %in% w_engaged))
  }
  
  
}