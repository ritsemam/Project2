#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

#Read Data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

install.packages("ggplot2")
library("ggplot2")

#Aggregate data by Baltimore and LA
balt <- subset(NEI, fips == "24510")
BaltMV<- subset(Balt, type == "ON-ROAD")
LA <- subset(NEI, fips == "06037")
LVMV <-subset(NEI, type == "ON-ROAD")

Balt.LA <- merge(BaltMV, LAMV, all=TRUE)
MV <- 
  #Aggregate data by Coal consumption
  #Subset Baltimore
  
emissions <- aggregate(Balt.LA[c("Emissions")], list(year = Balt.LA$year), sum)


#plot using ggplot2

png('plot5.png', width=480, height=480)
plot6 <- ggplot(emissions, aes(x=year, y=Emissions)) +
  geom_line()+
  
  ggtitle("Motor Vehicle Emissions LA County, CA vs Baltimore City, MD")

print(plot6)

dev.off()
