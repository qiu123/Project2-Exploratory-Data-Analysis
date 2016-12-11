## This file is for making plot3 of project2 of exploratory data analysis of coursera

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

## Plot3(png file)
png("Plot3.png", width=480, height=480)
Baltimore <- NEI[NEI$fips == "24510", ]
BData <- ddply(Baltimore, .(type,year), summarize, 
               TotalEmissions = sum(Emissions))
ggplot(BData, aes(year, TotalEmissions, colour = type)) +
  geom_line() + geom_point() + 
  labs(title = expression('Total PM'[2.5]*" Emissions in Baltimore City, Maryland from 1999 to 2008"), 
  x = "Year", y = expression('Total PM'[2.5]*" Emission (in tons)"))

## Close the .PNG graphic device
dev.off()

