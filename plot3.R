data <- read.csv2("household_power_consumption.txt", na.strings="?", 
                  stringsAsFactors = FALSE)
                  
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_subset <- subset(data, Date > "2007-01-31")
data_subset <- subset(data_subset, Date < "2007-02-03")

data_subset$Sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
data_subset$Sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
data_subset$Sub_metering_3 <- as.numeric(data_subset$Sub_metering_3)
data_subset$DateTime <- as.POSIXct(paste(data_subset$Date, data_subset$Time), 
                                   format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
with(data_subset, plot(Sub_metering_1~DateTime, type="l",
                       ylab = "Global Active Power (kilowatts)", xlab = ""))
with(data_subset, lines(Sub_metering_2~DateTime, col = "red"))
with(data_subset, lines(Sub_metering_3~DateTime, col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=1:1, cex=1)

dev.off()

