## This file is for making plot2 of project2 of exploratory data analysis of coursera

library(ggplot2)

## Set the current working directory
setwd("C:/Users/Qiuxinpei/Desktop/Coursera/Data Science/4 Exploratory Data Analysis/ื๗าต/Project2")

## Load the data
if (!file.exists("./data")) {
  unzip("./data.zip", exdir = "./data")
}
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Plot2(png file)
png("Plot2.png", width=480, height=480)
Baltimore <- NEI[NEI$fips == "24510", ]
totalEmissionsBaltimore <- aggregate(Baltimore$Emissions, 
                                     list(Baltimore$year), FUN = "sum")
plot(totalEmissionsBaltimore, type = "b", pch = 8, 
     col = "green", xlab = "Year", 
     main = expression('Total PM'[2.5]*" Emissions in Baltimore City, Maryland from 1999 to 2008"), 
     ylab = expression('Total PM'[2.5]*" Emission (in tons)"))

## Close the .PNG graphic device
dev.off()

