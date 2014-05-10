# Week 4 Programming Assignment
#

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  source("rankhospital.R")
  df.outcome <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
  
  #if(!state %in% df.outcome$State) stop("invalid state")
  
  x <- df.outcome$State
  x <- unique(x)
  
  y <-data.frame()
  
  if (outcome == "heart failure") {
    for (i in x) {
     
      y <- rbind(y,rankhospital(i,outcome,num))
    
    }
      
  } else if (outcome == "pneumonia") {
    for (i in x) {
      
      y <- rbind(y,rankhospital(i,outcome,num))
    
    }
  
  } else if (outcome == "heart attack") {
    for (i in x) {
    
      y <- rbind(y,rankhospital(i,outcome,num))
    
    }
    
  } else {
    stop("invalid outcome")
  } 
}