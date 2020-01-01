setwd("E:/Dropbox/Mine/Outreach/FST_Summer_School")
source("gambler_ruin/gambler_ruin_FUNC.R")

startWealth <- 10
winWealth <- 20
p <- 0.5
runs <- 5

results <- simRuinFullMultiple(startWealth, winWealth, p, runs)
plotResultsList(results, winWealth)
getWinRate(results, winWealth)


