## This file is for making plot5 of project2 of exploratory data analysis of coursera

library(plyr)
library(ggplot2)

## Set the current working directory
setwd("C:/Users/Qiuxinpei/Desktop/Coursera/Data Science/4 Exploratory Data Analysis/ื๗าต/Project2")

## Load the data
if (!file.exists("./data")) {
  unzip("./data.zip", exdir = "./data")
}
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Data analysis
Motor <- ddply(NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",],
               .(type, year), summarize, TotalEmissions = sum(Emissions))

## Plot5(png file)
png("Plot5.png", width=480, height=480)
ggplot(Motor, aes(year, TotalEmissions)) + 
  geom_line(color = "black") + geom_point() + 
  labs(title = "Total Emissions from Motor Vehicles in Baltimore City", 
  x = "Year", y = "Total Emissions")

## Close the .PNG graphic device
dev.off()

