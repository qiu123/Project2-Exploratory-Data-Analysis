## This file is for making plot4 of project2 of exploratory data analysis of coursera

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
Coal <- SCC[grep("Comb.*Coal", SCC$Short.Name), "SCC"]
CoalNEI <- NEI[NEI$SCC %in% Coal, ]
TData <- ddply(CoalNEI, .(year), summarise, TotalEmissions = sum(Emissions))

## Plot4(png file)
png("Plot4.png", width=480, height=480)
ggplot(TData, aes(year, TotalEmissions)) + 
  geom_line(color = "blue") + geom_point() + 
  labs(title = "Total Emissions from Coal Combustion-Related Sources", 
  x = "Year", y = "Total Emissions")

## Close the .PNG graphic device
dev.off()

