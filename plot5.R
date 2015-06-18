#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#Read Data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

install.packages("ggplot2")
library("ggplot2")

#Aggregate data by emissions
balt <- subset(NEI, fips == "24510")
MV <- 


SRC.CC <- subset(SRC, SRC$EI.Sector %in% CC, select=SCC)
NEI.CC <- subset(NEI, NEI$SCC %in%  SRC.CC$SCC)
pd <- aggregate(NEI.CC[c("Emissions")], list(year = NEI.CC$year), sum)
emissions <- aggregate(balt[c("Emissions")], list(type = balt$type, year = balt$year), sum)

#plot using ggplot2

png('plot5.png', width=480, height=480)
plot3 <- ggplot(data=emissions, aes(x=year, y=Emissions, color=type)) +
  geom_line()+
  ggtitle("Coal Consumption in US from 1999-2008")

print(plot5)

dev.off()