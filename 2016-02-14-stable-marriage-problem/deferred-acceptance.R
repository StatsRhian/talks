
  m.hist    <- rep(0,length=nMen)	# number of proposals made
  w.hist    <- rep(0,length=nWomen)	# current mate
  m.singles <- 1:nMen
  w.singles <- 1:nWomen
  m.mat <- matrix(data=1:nMen,nrow=nMen,ncol=nWomen,byrow=F)
  
  
  m_single <- rep(1, 3) # Binary. One if man is single.
  w_engaged <- rep(0, 3) # Which male the women are engaged to. 0 if single
  m_hist <- rep(0, 3) # A count of the number of proposals a man has made
    
  while(sum(m_single != 0)){

  offers <- rep(0, 3) # The current proposals on offer from the men  
  # Proposals frm single men
  for (i in which(m_single == 1)){

        m_hist[i] <- m_hist[i] + 1 # Increase number of proposals made
        offers[i] <- m_pref[m_hist[i], i]
        print(sprintf("Man %i proposes to Woman %i", i, offers[i]))
  }
      approached   <- unique(offers)	# index of women who received offers
      
  for(i in approached){
    proposers <- which(offers == i) # Men who have proposed this round
    best_offer <- proposers[which.min(w_pref[proposers, 1])]
    
    # If she is single - she accepts
    if(w_engaged[i] == 0){w_engaged[i] <- best_offer}
    
    # If she is engaged - she chooses
    if(w_engaged[i] != 0){ 
    choices = c(w_engaged[i], best_offer)
    w_engaged[i] <- choices[which.min(w_pref[choices, 1])]
    }
    print(sprintf("Woman %i accepts Man %i", i, w_engaged[i]))
  }
      
  m_single <- as.numeric(!(1:n %in% w_engaged))
  
  }
  
  
  
  
      
   # Update single men?
    # temp_singles <- m_singles
    #  m.singles    <- NULL	# reset singles
  #    for (j in approached){
  #      proposers   <- temp.singles[offers==j]
  #      stay.single <- temp.singles[offers==0]		# guys who prefer staying single at current history
        for (k in 1:length(proposers)){
          if (w.hist[j]==0&any(w.prefs[ ,j] == proposers[k])){	# if no history and proposer 
            w.hist[j] <- proposers[k]						# is somewhere on preference list, accept
            
          } else if (match(w.prefs[w.prefs[ ,j]==proposers[k],j],w.prefs[ ,j])<match(w.prefs[w.prefs[ ,j]==w.hist[j],j],w.prefs[ ,j])){
            m.singles <- c(m.singles,w.hist[j])		# if proposer better, fire current guy
            w.hist[j] <- proposers[k]	# and take proposer on
          } else {
            m.singles <- c(m.singles,proposers[k])	# otherwise k stays single
          }
        }	
  #    }
   #   m.singles <- sort(c(m.singles,stay.single))
      if (length(m.singles)==0){	# if no singles left: stop
        return(list(m.prefs=m.prefs,w.prefs=w.prefs,iterations=iter,matches=w.hist,singles=m.singles))
        break
      }
      current.match   <- (matrix(rep(w.hist,each=nMen),nrow=nMen,ncol=nWomen)==m.mat)
      current.singles <- matrix(m.mat %in% m.singles,nrow=nMen)*2