setwd("~/Users/B/Desktop/DataScience/Data")
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "hpc.zip")
unzip("hpc.zip")

library(lubridate)

#Read in file for analysis
hpc <- read.csv("~/Desktop/DataScience/Data/household_power_consumption.txt", sep=";")

hpc_ts <- transform (subset(hpc, Date=="1/2/2007"| Date =="2/2/2007"),
                     Date=mdy(Date))

#format date and combine Date/Time into a single column
hpc_ts$Date <- ydm(hpc_ts$Date)
weekday <- wday(hpc_ts$Date, label = TRUE)
hpc_wday <- cbind(hpc_ts, weekday)
hpc_wday$Global_active_power <- as.numeric(levels(hpc_wday$Global_active_power))[hpc_wday$Global_active_power]
hpc_wday$datetime <- as.POSIXct(paste(hpc_wday$Date, hpc_wday$Time), format="%Y-%m-%d %H:%M:%S")

#Plot the date/time factor by Global Active Power
plot(hpc_wday$datetime, hpc_wday$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
