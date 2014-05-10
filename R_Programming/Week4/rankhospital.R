# Week 4 Programming Assignment
#

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data

  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate

  df.outcome <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
  
  if(!state %in% df.outcome$State) stop("invalid state")
  x <- df.outcome[,c(2,7,11,17,23)]
  x <- subset(x, x$State==state)
  x <- x[,c(1,3,4,5)]
  colnames(x) <- c("Name","HeartAttack","HeartFailure","Pneumonia")
  
  if (outcome == "heart failure") {
    x <- x[,c(1,3)]
    x <- subset(x, x[,2] != "Not Available" )
    x <- x[order(x[,2],x[,1]),]
    if (num=="best") {
      x[1,1]
    } else if (num=="worst") {
      x[nrow(x),1]
    } else if (num > nrow(x)) {
      NA
    } else {
      x[num,1]
    }
  } else if (outcome == "pneumonia") {
    x <- x[,c(1,4)]
    x <- subset(x, x[,2] != "Not Available" )
    x <- x[order(x[,2],x[,1]),]
    if (num=="best") {
      x[1,1]
    } else if (num=="worst") {
      x[nrow(x),1]
    } else if (num > nrow(x)) {
      NA
    } else {
      x[num,1]
    }
  } else if (outcome == "heart attack") {
    x <- x[,c(1,2)]
    x <- subset(x, x[,2] != "Not Available" )
    x <- x[order(x[,2],x[,1]),]
    if (num=="best") {
      x[1,1]
    } else if (num=="worst") {
      x[nrow(x),1]
    } else if (num > nrow(x)) {
      NA
    } else {
      x[num,1]
    }
  } else {
    stop("invalid outcome")
    
  }

}
