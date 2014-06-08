data = "exdata_data_household_power_consumption/household_power_consumption.txt"
subdata <- read.csv.sql(data, sql = 'select Sub_metering_1, Sub_metering_2, Sub_metering_3 from file where Date = "1/2/2007" OR Date = "2/2/2007"', header=T, sep=";")
#make plot
png("plot3.png")
plot(as.numeric(subdata$Sub_metering_1), type="l", ylab="Energy sub metering",xlab="",axes=F)
## add lines and colors

lines(as.numeric(subdata$Sub_metering_2), col="red")
lines(as.numeric(subdata$Sub_metering_3), col="blue")
box()
axis(2)

## add labels
plength <- length(subdata$Sub_metering_1)
axis(1,at=c(0,plength/2,plength),labels=c("Thu","Fri","Sat"))
legend("topright",legend=c(colnames(subdata)),lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))
dev.off()
