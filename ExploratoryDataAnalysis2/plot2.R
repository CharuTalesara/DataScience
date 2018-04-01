#Reading the files
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
# subsetting for the Baltimore City
  neinew<-NEI[NEI$fips == "24510",]
  epy<-aggregate(Emissions~year,neinew,sum)
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
  barplot(height=epy$Emissions, names.arg=epy$year,xlab="years", ylab=expression('total PM'[2]*' emission'),
          main=expression('Total PM'[2]*' emissions at various years in Baltimore City'))
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off()


