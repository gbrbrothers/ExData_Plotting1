data <- read.csv2("household_power_consumption.txt", na.strings="?", 
                  stringsAsFactors = FALSE)
                  
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_subset <- subset(data, Date > "2007-01-31")
data_subset <- subset(data_subset, Date < "2007-02-03")

data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)
hist(data_subset$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

