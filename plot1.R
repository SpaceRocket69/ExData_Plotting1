data <- read.csv("household_power_consumption.txt", sep = ';')
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

sub <- subset(data, (Date < as.Date("2007-02-03") & Date >= as.Date("2007-02-01")))

hist(sub$Global_active_power, col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
