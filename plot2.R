# Load in libraries
library("dplyr")
library("ggplot2")

# Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Manipulate the data
totalBalt <- NEI %>% filter(fips == '24510') %>% group_by(year) %>% summarize(total = sum(Emissions))

# Create a plot
png("plot2.png", width=480, height=480)

# Plot the data
with(totalBalt, barplot(total, names.arg = year, main = "PM2.5 Totals for Baltimore City by Year", xlab = "Year", ylab = "Total Emissions"))

# Save the plot
dev.off()
