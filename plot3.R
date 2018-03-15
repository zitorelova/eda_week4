# Load in libraries
library("dplyr")
library("ggplot2")

# Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Manipulate the data
totalEm <- NEI %>% filter(fips == '24510') %>% group_by(year, type) %>% summarize(total = sum(Emissions))

# Create a plot
png("plot3.png", width = 960, height = 480)

# Plot the data
qplot(year, total, data =totalEm, facets = .~type, main = "PM2.5 Totals for Baltimore City by Type and Year", xlab="Year", ylab = "Total Emissions") + geom_line()

# Save the plot 
dev.off()
