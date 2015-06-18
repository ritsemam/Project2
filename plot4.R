#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#Read Data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
install.packages("grep")
install.packages("ggplot2")
library("ggplot2")

#Aggregate data by Coal consumption
coal <- grep("coal",SCC$EI.Sector,value=T,ignore.case=T)


SRCcoal <- subset(SCC, SCC$EI.Sector %in% coal, select=SCC)
NEIcoal <- subset(NEI, NEI$SCC %in%  SRCcoal$SCC)

emissions <- aggregate(NEIcoal[c("Emissions")], list(year = NEIcoal$year), sum)

#plot using ggplot2

png('plot4.png', width=480, height=480)
plot4 <- ggplot(data=emissions, aes(x=year, y=Emissions, color=type)) +
  geom_line()+
  ggtitle("Coal Consumption in US from 1999-2008")

print(plot4)

dev.off()