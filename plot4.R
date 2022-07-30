data <- read.csv("household_power_consumption.txt", sep = ';')
data$Date <- paste(data$Date, data$Time)
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y %H:%M:%S")
data$Time <- NULL
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

sub <- subset(data, (Date < strptime("2007-02-03", "%Y-%m-%d") & Date >= strptime("2007-02-01", "%Y-%m-%d")))

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
#1
with(sub, plot(Date, Global_active_power, type='l', ylab="Global Active Power", xlab=""))
#2
with(sub, plot(Date, Voltage, type='l', xlab="datetime"))
#3
with(sub, plot(Date, Sub_metering_1, type='n', ylab="Energy sub metering", xlab=""))
lines(sub$Date, sub$Sub_metering_1, col='black', type='l')
lines(sub$Date, sub$Sub_metering_2, col='red', type='l')
lines(sub$Date, sub$Sub_metering_3, col='blue', type='l')
legend("topright", legend = paste("Sub_metering_", 1:3),
       col = c('black', 'red', 'blue'), lty=1, cex=0.8)
#4
with(sub, plot(Date, Global_reactive_power, type='l', xlab="datetime"))

dev.copy(png, file = "plot4.png")
dev.off()