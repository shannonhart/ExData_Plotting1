setwd("C:\\Users\\shannon\\ETA project 1")
getwd()
install.packages(sqldf)
library(sqldf)
dataset ="exdata_data_household_power_consumption/household_power_consumption.txt"
selectdata <- read.csv.sql(dataset, sql = 'select Date,Global_active_power from file where Date = "1/2/2007" OR Date = "2/2/2007"', header=T, sep=";")
##make plot

png("plot1.png")

##add colors
hist(as.numeric(data$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()