# Plot 1
epc = read.table("household_power_consumption.txt",skip=grep("1/2/2007",readLines("household_power_consumption.txt")),sep=";")
epc_ss = subset(epc,epc$V1 == "1/2/2007" | epc$V1 == "2/2/2007")
quartz()
hist(as.numeric(epc_ss$V3)/1000, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()

# Plot 2
epc_ss$Time = strptime(paste(epc_ss$V1, epc_ss$V2), format = "%d/%m/%Y %H:%M:%S")
epc_ss$Date = as.Date(epc_ss$V1, format = "%d/%m/%Y")
quartz()
plot(epc_ss$Time, as.numeric(epc_ss$V3)/1000, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()



