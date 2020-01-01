###############
#Functions for Shiny gambler's ruin
###############

###############
#startWealth - starting state
#winWealth - winning state
#p - probability of increase
#Runs random walk (+1 with probability p, -1 otherwise) 
# until either win (reach winning state) or lose (reach state 0)
#Returns a boolean value (1 if win).
###############
simRuin <- function(startWealth, winWealth, p){
  
  lose <- FALSE
  win <- FALSE
  position <- startWealth
  
  while ((lose==FALSE) && (win==FALSE)){
    
    nextStep <- rbinom(1,1,p)
    
    if (nextStep==1){
      position <- position + 1
    }
    else {      
      position <- position - 1      
    }
    
    #check if reached an absorbing state
    lose <- (position<=0)
    win <- (position>=winWealth)
  }
  return(win)
}

#################
#Run multiple iterations of the gambler's ruin.
#################
simRuinMultiple<-function(startWealth, winWealth, p, runs){
  
  wins <- rep(0, runs)
  
  for (i in 1 : runs){
    wins[i] <- simRuin(startWealth, winWealth, p)   
  }
  
  return(mean(wins))
}

###############
#startWealth - starting state
#winWealth - winning state
#p - probability of increase
#Runs random walk (+1 with probability p, -1 otherwise) 
# until either win (reach winning state) or lose (reach state 0).
#Returns full details of state history (as a list).
###############
simRuinFull <- function(startWealth, winWealth, p){
  lose <- FALSE
  win <- FALSE
  position <- startWealth
  n <- 0
  history <- c()
  while ((lose==FALSE) && (win==FALSE)){
    n <- n + 1
    history[n] <- position
    nextStep <- rbinom(1,1,p)
    
    if (nextStep==1){
      position <- position + 1
    }
    else {      
      position <- position - 1      
    }
    
    #check if reached an absorbing state
    lose <- (position<=0)
    win <- (position>=winWealth)
  }
  history[n + 1] <- position
  return(history)
}

#################
#Run multiple iterations of the gambler's ruin.
#################
simRuinFullMultiple <- function(startWealth, winWealth, p, runs){
  
  results <- vector('list', runs)
  
  for (i in 1 : runs){
    results[[i]] <- simRuinFull(startWealth, winWealth, p)   
  }
  
  return(results)
}

############
#Plots results. Input 'results' is a list of vectors.
############
plotResultsList <- function(results, winWealth){
  runs <- length(results)
  maxRun <- max(sapply(results, length))
  plot(y=results[[1]], x=1 : length(results[[1]]), type='l', ylim=c(0, winWealth),
       xlim=c(1, maxRun), ylab="Wealth", xlab="Bet Number")
  if (runs>=2){
    for (i in 2 : runs){
      lines(y=results[[i]], x=1 : length(results[[i]]), col=i, lty=1)
    }
  }
}

#############
#Returns proportion of runs for gambler's ruin that end in wins.
#############
getWinRate <- function(results, winWealth){
  runs <- length(results)#
  wins <- numeric(runs)
  for (i in 1 : runs){
    wins[i] <- ifelse (tail(results[[i]], n=1)==0, 0, 1)
  }
  return(mean(wins))
}
