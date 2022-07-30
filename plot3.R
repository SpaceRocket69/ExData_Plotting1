data <- read.csv("household_power_consumption.txt", sep = ';')
data$Date <- paste(data$Date, data$Time)
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y %H:%M:%S")
data$Time <- NULL
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

sub <- subset(data, (Date < strptime("2007-02-03", "%Y-%m-%d") & Date >= strptime("2007-02-01", "%Y-%m-%d")))

with(sub, plot(Date, Sub_metering_1, type='n', ylab="Energy sub metering", xlab=""))
lines(sub$Date, sub$Sub_metering_1, col='black', type='l')
lines(sub$Date, sub$Sub_metering_2, col='red', type='l')
lines(sub$Date, sub$Sub_metering_3, col='blue', type='l')
legend("topright", legend = paste("Sub_metering_", 1:3),
       col = c('black', 'red', 'blue'), lty=1)


dev.copy(png, file = "plot3.png")
dev.off()