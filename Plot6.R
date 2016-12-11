## This file is for making plot6 of project2 of exploratory data analysis of coursera

library(plyr)
library(ggplot2)
library(grid)

## Set the current working directory
setwd("C:/Users/Qiuxinpei/Desktop/Coursera/Data Science/4 Exploratory Data Analysis/ื๗าต/Project2")

## Load the data
if (!file.exists("./data")) {
  unzip("./data.zip", exdir = "./data")
}
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Gather the subset of the NEI data which corresponds to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

## Subset the vehicles NEI data by each city's fip and add city name.
vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
vehiclesBaltimoreNEI$city <- "Baltimore City"

vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"

## Combine the two subsets with city name into one data frame
bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)

## PLot6(png file)
png("Plot6.png",width=480,height=480,units="px",bg="transparent")

ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

## Close the .PNG graphic device
dev.off()
