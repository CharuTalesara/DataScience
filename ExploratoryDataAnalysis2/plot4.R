
# Read data files
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
reqSCC<-SCC[grep("*Coal",SCC$EI.Sector),]$SCC
nnei<-NEI[NEI$SCC %in% reqSCC,]
aa<-aggregate(Emissions~year,nnei,sum)
barplot(height=aa$Emissions,names.arg=aa$year,xlab="years",ylab=expression('total PM'[2]*' emission '),
        main=expression('Total PM'[2]*' emissions from coal at various years'))
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()