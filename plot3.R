#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

#Read Data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

install.packages("ggplot2")
library("ggplot2")

#Aggregate data by emissions
balt <- subset(NEI, fips == "24510")
emissions <- aggregate(balt[c("Emissions")], list(type = balt$type, year = balt$year), sum)

#plot using ggplot2

png('plot3.png', width=480, height=480)
plot3 <- ggplot(data=emissions, aes(x=year, y=Emissions, color=type)) +
  geom_line()+
  ggtitle("Total Emissions (PM 2.5) by Type in Baltimore City")

print(plot3)

dev.off()