# Load in libraries
library("dplyr")
library("ggplot2")

# Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Manipulate the data
combined <- merge(NEI, SCC, by = 'SCC')
totalEm <- combined  %>% filter(grepl("Coal$", EI.Sector)) %>% group_by(year) %>% summarize(total = sum(Emissions))

# Create a plot
png("plot4.png", width=480, height=480)

# Plot the data
with(totalEm, barplot(total, names.arg=year, main="PM2.5 Totals by Year (Coal Combustion Related Source)", xlab='Year', ylab='Total Emissions'))

# Save the plot 
dev.off()
