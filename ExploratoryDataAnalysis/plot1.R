plot1 <- function() {
  #created a new txt file with requiured dates(from 2007-02-01 to 2007-02-02) and then replaced semi-colon with comma, readig that csv file
  #The file household_power_consumption_2007_1.txt is there in the repo.
  
  aa<-read.csv("household_power_consumption_2007_1.txt")
  
  hist(aa$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
  dev.copy(png,file="plot1.png",width=480,height=480)
  dev.off()
}