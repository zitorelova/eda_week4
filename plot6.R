# Load in libraries
library("dplyr")
library("ggplot2")

# Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Manipulate the data
combined <- merge(NEI, SCC, by = 'SCC')
totalEm <- combined %>% filter((fips == '24510' | fips == '06037') & grepl("Vehicles$", EI.Sector)) %>% group_by(year, fips) %>% summarize(total = sum(Emissions))

# Create a plot
png("plot6.png", width=480, height=480)

# Plot the data 
with(totalEm, plot(year, total, main = 'PM2.5 Totals of Baltimore and Los Angelese', xlab="Year", ylab="Total Emissions", type='n'))
with(subset(totalEm, fips == '06037'), points(year, total, pch=19, col='red'))
with(subset(totalEm, fips == '06037'), lines(year, total, col='red'))
with(subset(totalEm, fips == '24510'), points(year, total, pch=19, col='blue'))
with(subset(totalEm, fips == '24510'), lines(year, total, col='blue'))
legend("right", pch=19, col=c("red", "blue"), legend=c("Los Angeles County", "Baltimore City"))

# Save the plot
dev.off()
