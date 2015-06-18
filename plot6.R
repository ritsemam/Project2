#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

#Read Data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

install.packages("ggplot2")
library("ggplot2")

install.packages("plyr")
library("plyr")


#Subset data by Baltimore and LA and ON-Road
Balt <- subset(NEI, fips == "24510")
BaltMV<- subset(Balt, type == "ON-ROAD") 

LA <- subset(NEI, fips == "06037")
LAMV <-subset(LA, type == "ON-ROAD")


#Merge Baltimore and LA
Balt.LA <- merge(BaltMV, LAMV, all=TRUE)
#Change column of fips to City

#change zip codes to city names

Balt.LA$fips[Balt.LA$fips == "06037"] <- "Los Angles County"
Balt.LA$fips[Balt.LA$fips == "24510"] <- "Baltimore City"

#Aggregate data by Baltimore, LA, and motor vehicle
emissions <- aggregate(Balt.LA[c("Emissions")], list(year = Balt.LA$year, city = Balt.LA$fips), sum)


#plot using ggplot2

png('plot6.png', width=480, height=480)
plot6 <- ggplot(emissions, aes(x=year, y=Emissions, color=city)) +
  geom_line()+
  
  ggtitle("Motor Vehicle Emissions LA County vs Baltimore City")

print(plot6)

dev.off()