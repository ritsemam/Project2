#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#Read Data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#install and load ggplot package

install.packages("ggplot2")
library("ggplot2")

#Aggregate data by Coal consumption
#Subset coal as source
coal = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]

#merge Coal with NEI
Coal2 <- merge (NEI, coal, by= 'SCC')

emissions <- aggregate(Coal2[c("Emissions")], list(year = Coal2$year), sum)


#plot using ggplot2

png('plot4.png', width=480, height=480)
plot4 <- ggplot(emissions, aes(x=year, y=Emissions)) +
  geom_line()+
  
  ggtitle("Total Coal Consumption in PM2.5 in the US")

print(plot4)

dev.off()