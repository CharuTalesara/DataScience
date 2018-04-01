#Reading the files
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
#emissions from motor vehicle sources changed from 1999-2008 in Baltimore City
  neinew<-NEI[NEI$fips == "24510" & NEI$type=="ON-ROAD",]
  epy<-aggregate(Emissions~year,neinew,sum)
  barplot(height=epy$Emissions, names.arg=epy$year,xlab="years", ylab=expression('total PM'[2]*' emission'),
          main=expression('Total PM'[2]*' emissions from motor vehicle sources in various years'))
  dev.copy(png,file="plot5.png",width=480,height=480)
  dev.off()
