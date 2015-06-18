#Read Data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate data by emissions
balt <- subset(NEI, fips == "24510")
emissions <- aggregate(balt[c("Emissions")], list(year = balt$year), sum)

#plot using base plot

png('plot2.png', width=480, height=480)
plot(emissions$year, emissions$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions")

dev.off()