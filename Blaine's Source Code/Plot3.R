#Update factors to numeric
hpc_wday$Sub_metering_2 <- as.numeric(as.character(hpc_wday$Sub_metering_2))
hpc_wday$Sub_metering_1 <- as.numeric(as.character(hpc_wday$Sub_metering_1))

#Plot the date/time factor by Global Active Power
plot(hpc_wday$datetime, hpc_wday$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
points(hpc_wday$datetime, hpc_wday$Sub_metering_2, type = "l", col = "red")
points(hpc_wday$datetime, hpc_wday$Sub_metering_3, type = "l", col = "blue")

#Add legend to the top-right with appropriate colored lines
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black", "blue", "red"))
