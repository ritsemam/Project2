#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#Read Data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#install and load ggplot package

install.packages("ggplot2")
library("ggplot2")


#Subset Baltimore

Balt <- subset(NEI, fips == "24510")

BaltMV<- subset(Balt, type == "ON-ROAD")
#Aggregate data by Emissions (mmotor vehicle)

emissions <- aggregate(BaltMV[c("Emissions")], list(year = BaltMV$year) sum)


#plot using ggplot2

png('plot5.png', width=480, height=480)
plot5 <- ggplot(emissions, aes(x=year, y=Emissions)) +
  geom_line()+
  
  ggtitle("Motor Vehicle Emissions in PM2.5 in Baltimore City, MD")

print(plot5)

dev.off()