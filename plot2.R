data <- read.csv2("household_power_consumption.txt", na.strings="?", 
                  stringsAsFactors = FALSE)
                  
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_subset <- subset(data, Date > "2007-01-31")
data_subset <- subset(data_subset, Date < "2007-02-03")

data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)
data_subset$DateTime <- as.POSIXct(paste(data_subset$Date, data_subset$Time), 
                                   format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
with(data_subset, plot(Global_active_power~DateTime, type="l",
     ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()

