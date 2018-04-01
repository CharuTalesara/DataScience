# Reading the data files
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008
  emissionperyear<-aggregate(Emissions~year,NEI,sum)
  barplot(height=emissionperyear$Emissions, names.arg=emissionperyear$year,xlab="years", ylab=expression('total PM'[2]*' emission'),
          main=expression('Total PM'[2]*' emissions at various years'))
  dev.copy(png,file="plot1.png",width=480,height=480)
  dev.off()


