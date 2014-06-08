## Read data
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header = T, colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings = "?")

##Add DateTime variable to data frame
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

##Subset data
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

## Creating the PNG requirements and plotting the Global Active Power data
png("plot2.png", height = 480, width = 480)

##Create plot
plot(data$DateTime, data$Global_active_power, pch = NA, xlab = "", ylab = "Global Active Power (kilowatts)")

##Add lines
lines(data$DateTime, data$Global_active_power)

##Close device
dev.off()
