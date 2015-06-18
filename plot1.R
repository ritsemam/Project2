#Read Data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate data by emissions

emissions <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

#plot using base plot

png('plot1.png', width=480, height=480)
plot(emissions$year, emissions$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in the US",
     xlab = "Year", ylab = "Emissions")

dev.off()
