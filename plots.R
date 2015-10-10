# Plot 1
# read and subset data
epc = read.table("household_power_consumption.txt",skip=grep("1/2/2007",readLines("household_power_consumption.txt")),sep=";")
epc_ss = subset(epc,epc$V1 == "1/2/2007" | epc$V1 == "2/2/2007")
# start a graphics device driver for the OS X System
quartz()
# draw histogram
hist(as.numeric(epc_ss$V3)/1000, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
# copy the graphics contents of the current device to a file
dev.copy(png, file = "plot1.png")
# return output to the terminal
dev.off()

# Plot 2
# Create new columns for time and date values
epc_ss$Time = strptime(paste(epc_ss$V1, epc_ss$V2), format = "%d/%m/%Y %H:%M:%S")
epc_ss$Date = as.Date(epc_ss$V1, format = "%d/%m/%Y")
# start a graphics device driver for the OS X System
quartz()
# draw the plot
plot(epc_ss$Time, as.numeric(epc_ss$V3)/1000, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# copy the graphics contents of the current device to a file
dev.copy(png, file = "plot2.png")
# return output to the terminal
dev.off()

# Plot 3
# start a graphics device driver for the OS X System
quartz()
# draw the plot
plot(epc_ss$Time, as.numeric(epc_ss$V7), type="l", xlab="", ylab="Energy sub metering")
# add connected line segments to the plot
lines(epc_ss$Time, as.numeric(epc_ss$V8), type="l", xlab="", ylab="Energy sub metering", col="red")
lines(epc_ss$Time, as.numeric(epc_ss$V9), type="l", xlab="", ylab="Energy sub metering", col="blue")
# add a legend
legend(strptime("2/2/2007 09:00:00", format = "%d/%m/%Y %H:%M:%S"), 35, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"))
# copy the graphics contents of the current device to a file
dev.copy(png, file = "plot3.png")
# return output to the terminal
dev.off()

# Plot 4
# start a graphics device driver for the OS X System
quartz()
# create a multi-paneled plotting window
par(mfrow=c(2,2))
# add the four plots
plot(epc_ss$Time, as.numeric(epc_ss$V3)/1000, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(epc_ss$Time, as.numeric(epc_ss$V5), type="l", xlab="datetime", ylab="Voltage")
plot(epc_ss$Time, as.numeric(epc_ss$V7), type="l", xlab="", ylab="Energy sub metering")
lines(epc_ss$Time, as.numeric(epc_ss$V8), type="l", xlab="", ylab="Energy sub metering", col="red")
lines(epc_ss$Time, as.numeric(epc_ss$V9), type="l", xlab="", ylab="Energy sub metering", col="blue")
legend(strptime("2/2/2007 09:00:00", format = "%d/%m/%Y %H:%M:%S"), 35, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"))
plot(epc_ss$Time, as.numeric(epc_ss$V4), type="l", xlab="datetime", ylab="Global_reactive_power")
# copy the graphics contents of the current device to a file
dev.copy(png, file = "plot4.png")
# return output to the terminal
dev.off()
