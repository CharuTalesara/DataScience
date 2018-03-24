best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  ## Read outcome data
  outcomefile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  stateList<-unique(outcomefile$State)
  
  if(!(state %in% stateList)){
    stop("invalid state")
  }
  
  outcomeList <- as.character(c("Heart Attack","Heart Failure","Pneumonia"))
  
  if(!(outcome %in% outcomeList)){
    stop("invalid outcome")
  }
  
  # Removing "Not Available Rows"
  outcomefile<- outcomefile[outcomefile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack!="Not Available" , ]
  
  # Subsetting on the basis of state provided
  reqStatFile<-subset(outcomefile,State==state)
  
  if(outcome[1]=="Heart Attack"){
    
    # Removing NAs
    reqfile<-reqStatFile[!is.na(reqStatFile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
    
    #Setting character value to numeric
    reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(as.character( reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
    
    
    # Getting mimimum value 
    reqmin<-min(reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    
    
    #Getting hospital names corrosponding to minimum value of mortality rate
    reqfile<-reqfile[reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == reqmin, ] 
    print(reqmin)
    reqhos<-reqfile$Hospital.Name
    print(reqhos)
    
  }
  
  ########################### For Heart Failure ...
  ########"Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  
  else if(outcome[1]=="Heart Failure"){
    
    # Removing NAs
    reqfile<-reqStatFile[!is.na(reqStatFile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
    
    #Setting character value to numeric
    reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(as.character( reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
    
    
    # Getting mimimum value 
    reqmin<-min(reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    print(reqmin)
    
    #Getting hospital names corrosponding to minimum value of mortality rate
    reqfile<-reqfile[reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == reqmin, ] 
    reqhos<-reqfile$Hospital.Name
    print(reqhos)
    
  }
  
  
  ########################### Pneumonia..Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  else{
    
    
    # Removing NAs
    reqfile<-reqStatFile[!is.na(reqStatFile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
    
    #Setting character value to numeric
    reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(as.character( reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
    
    
    # Getting mimimum value 
    reqmin<-min(reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    
    print(reqmin)
    #Getting hospital names corrosponding to minimum value of mortality rate
    reqfile<-reqfile[reqfile$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == reqmin, ] 
    reqhos<-reqfile$Hospital.Name
    print(reqhos)
  }
  
  
  
  
}