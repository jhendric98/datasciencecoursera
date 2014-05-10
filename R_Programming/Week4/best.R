# Week 4 programming assignment
#  

best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  df.outcome <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
  
  
  
  if(!state %in% df.outcome$State) stop("invalid state")
  
  x <- subset(df.outcome, df.outcome$State==state)
  
  if (outcome == "heart failure") {
    subset(x$Hospital.Name, x[,17]==min(as.numeric(x[,17]), na.rm=T))

  } else if (outcome == "pneumonia") {
    subset(x$Hospital.Name, x[,23]==min(as.numeric(x[,23]), na.rm=T))
    
  } else if (outcome == "heart attack") {
    subset(x$Hospital.Name, x[,11]==min(as.numeric(x[,11]), na.rm=T))
    
  } else {
    stop("invalid outcome")
  
  }
  
}