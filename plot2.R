data <- read.csv("household_power_consumption.txt", sep = ';')
data$Date <- paste(data$Date, data$Time)
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y %H:%M:%S")
data$Time <- NULL
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

sub <- subset(data, (Date < strptime("2007-02-03", "%Y-%m-%d") & Date >= strptime("2007-02-01", "%Y-%m-%d")))

with(sub, plot(Date, Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png, file = "plot2.png")
dev.off()