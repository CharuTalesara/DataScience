plot3 <- function() {
  #created a new txt file with requiured dates(from 2007-02-01 to 2007-02-02) and then replaced semi-colon with comma, readig that csv file
  #The file household_power_consumption_2007_1.txt is there in the repo.
  
  aa<-read.csv("household_power_consumption_2007_1.txt")
  
  aa$Timestamp <- strptime(paste(aa$Date, aa$Time), "%d/%m/%Y %H:%M:%S")
  plot(aa$Timestamp, aa$Sub_metering_1,xlab="", ylab="Enery sub metering", type='l')
  lines(aa$Timestamp,aa$Sub_metering_2,col='red')
  lines(aa$Timestamp,aa$Sub_metering_3,col='blue')
  legend("topright", col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1,
         cex = 0.75,inset = c(0,0))
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()
}