WinOrLose<-function(k,N,p){

  Lose<-FALSE
  Win<-FALSE

  Position<-k

  while ((Lose==FALSE)&&(Win==FALSE)){

    NextStep<-rbinom(1,1,p)

    if (NextStep==1){

      Position<-Position+1

    }
    else {
    
      Position<-Position-1
      
    }

#check if reached an absorbing state

    Lose<-(Position==0)
    Win<-(Position==N)
  }
  return(Lose)
}

findProbLose<-function(k,N,p,NumReps){

  StoreLoses<-rep(0,NumReps)
  
  for (i in 1:NumReps){

    StoreLoses[i]<-WinOrLose(k,N,p)

  }

  return(mean(StoreLoses))

}
    

    
