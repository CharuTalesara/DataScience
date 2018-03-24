plot2 <- function() {
  #created a new txt file with requiured dates(from 2007-02-01 to 2007-02-02) and then replaced semi-colon with comma, readig that csv file
  #The file household_power_consumption_2007_1.txt is there in the repo.
  
  aa<-read.csv("household_power_consumption_2007_1.txt")
  
  aa$Timestamp <- strptime(paste(aa$Date, aa$Time), "%d/%m/%Y %H:%M:%S")
  plot(aa$Timestamp, aa$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type='l')
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off()
}