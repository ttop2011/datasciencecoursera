##First set working directory to where data is stored on computer.
data<-read.csv("household_power_consumption.txt", sep = ";")
## Trim down the dates that are needed to create the plots.
subset<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting dates
datetime <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(datetime)
subset$Timestamp <-paste(subset$Date, subset$Time)

#Sets graphing parameters so that 4 graphs are drawn by column
par(mfcol = c(2,2))


# Creates graph of date/time vs global active power data
plot(strptime(subset$Timestamp, "%d/%m/%Y %H:%M:%S"), subset$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")


#Creates 2nd graph in column 1 
#Creates plot of date/time v Sub metering 1 data
plot(strptime(subset$Timestamp, "%d/%m/%Y %H:%M:%S"), subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

#Adds line graph for date/time v Sub metering 2 data in red
lines(strptime(subset$Timestamp, "%d/%m/%Y %H:%M:%S"), subset$Sub_metering_2, type = "l", col = "red" )

#Adds line graph for date/time v Sub metering 3 data in blue
lines(strptime(subset$Timestamp, "%d/%m/%Y %H:%M:%S"), subset$Sub_metering_3, type = "l", col = "blue" )

#Adds legend to graph
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Creates first graph in column 2
#This graphs date/time v Voltage
plot(strptime(subset$Timestamp, "%d/%m/%Y %H:%M:%S"), subset$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

#Creates second graph in column 2
#This plots datetime v global reactive power
plot(strptime(subset$Timestamp, "%d/%m/%Y %H:%M:%S"), subset$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
