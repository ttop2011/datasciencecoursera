##First set working directory to where data is stored on computer.
data<-read.csv("household_power_consumption.txt", sep = ";")
## Trim down the dates that are needed to create the plots.
subset<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))
hist(subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()