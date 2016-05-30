##First set working directory to where data is stored on computer.
data<-read.csv("household_power_consumption.txt", sep = ";")
## Trim down the dates that are needed to create the plots.
subset<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]




## Converting dates
datetime <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(datetime)
subset$Timestamp <-paste(subset$Date, subset$Time)

plot(strptime(subset$Timestamp, "%d/%m/%Y %H:%M:%S"), subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()