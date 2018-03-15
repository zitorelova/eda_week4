# Load in libraries
library("dplyr")
library("ggplot2")

# Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Manipulate the data
totalEm <- NEI %>% group_by(year) %>% summarize(total = sum(Emissions))

# Create a plot
png("plot1.png", width=480, height=480)

# Plot the data
with(totalEm, barplot(total, names.arg = year, main = "PM2.5 Totals per year", xlab = "Year", ylab = "Total Emissions"))

# Save the plot
dev.off()
