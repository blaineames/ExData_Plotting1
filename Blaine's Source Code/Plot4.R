#set plotting area
par(mfrow=c(2,2))


#Plot2 the date/time factor by Global Active Power
plot(hpc_wday$datetime, hpc_wday$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Plot for Voltage
hpc_wday$Voltage <- as.numeric(as.character(hpc_wday$Voltage))
plot(hpc_wday$datetime, hpc_wday$Voltage, type = "l", col = "black", xlab = "", ylab = "Voltage")

#Plot3 the date/time factor by Global Active Power
plot(hpc_wday$datetime, hpc_wday$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
points(hpc_wday$datetime, hpc_wday$Sub_metering_2, type = "l", col = "red")
points(hpc_wday$datetime, hpc_wday$Sub_metering_3, type = "l", col = "blue")

#Add legend to the top-right with appropriate colored lines
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,2),col=c("black", "blue", "red"), cex = 0.5)

#Global Reactive Power
hpc_wday$Global_reactive_power <- as.numeric(as.character(hpc_wday$Global_reactive_power))
plot(hpc_wday$datetime, hpc_wday$Global_reactive_power, type = "l", col = "black", xlab = "", ylab = "Global_reactive_power")
