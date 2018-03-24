HospitalRankDemo1 <- function(state, outcome, num = "best") {
  
  outcomefile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
 # df1<-outcomefile[,c(2,7,13,19,25)]#c (2,7,11,17,23)
  df1<-outcomefile[,c(2,7,11,17,23)]
  df2<-df1[df1$State==state,]
  
  names(df2)[names(df2) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"] <- "HeartFailureRate"
  
  names(df2)[names(df2) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"]  <- "HeartAttackRate"
  
  names(df2)[names(df2) == "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"]   <- "PneumoniaRate"
  
  df2<-df2[df2$HeartFailureRate!="Not Available",]
  df2<-df2[df2$HeartAttackRate!="Not Available",]
  df2<-df2[df2$PneumoniaRate!="Not Available",]
  
 # print(df2)
  
  df2$HeartFailureRate <- as.numeric(as.character( df2$HeartFailureRate))
  df2$HeartAttackRate <- as.numeric(as.character( df2$HeartAttackRate))
  df2$PneumoniaRate <-as.numeric(as.character( df2$PneumoniaRate))
  
  if(outcome[1]=="Heart Failure"){
    df3<-df2[order(df2$HeartFailureRate,df2$Hospital.Name),]
    df3<-df3[,c(1,2,4)]
    print(df3)
  }
  
  if(outcome[1]=="Heart Attack"){
    df3<-df2[order(df2$HeartAttackRate,df2$Hospital.Name),]
    df3<-df3[,c(1,2,3)]
    print(df3)
  }
  
  if(outcome[1]=="Pneumonia"){
    df3<-df2[order(df2$PneumoniaRate,df2$Hospital.Name),]
    df3<-df3[,c(1,2,5)]
    print(df3)
  }
  
} 