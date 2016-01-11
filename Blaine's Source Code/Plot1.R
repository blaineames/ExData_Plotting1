setwd("~/Users/B/Desktop/DataScience/Data")
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "hpc.zip")
unzip("hpc.zip")

library(lubridate)

#Read in file for analysis
hpc <- read.csv("~/Desktop/DataScience/Data/household_power_consumption.txt", sep=";")

#Subset and convert date and time
hpc_ts <- transform (subset(hpc, Date=="1/2/2007"| Date =="2/2/2007"),
                      Date=mdy(Date), 
                      Time=hms(Time))

#Break out the Global Active Power column to plot
gap <- as.numeric(levels(hpc_ts$Global_active_power))[hpc_ts$Global_active_power]

#Histogram with appropriate labels
hist(gap, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Freqency")


