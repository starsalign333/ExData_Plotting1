library(lubridate)
data = read.csv("household_power_consumption.txt", sep=";")
data$Date = strptime(paste(data$Date, data$Time, data$Weekday, sep=" "), format ="%d/%m/%Y %H:%M:%S")
data = data[which(year(data$Date) == 2007 & month(data$Date) == 02 &
                    (day(data$Date) == 01 | day(data$Date) == 02)),]

par(mfrow=c(2, 2), mar=c(4, 4, 2, 1))
plot(julian(data$Date), data$Global_active_power, ylab="Global Active Power (kilowatts)",
     xlab="", type="l", xaxt="n")
axis(1, at=c(13545.21, 13546.21, 13547.21), labels=c("Thu", "Fri", "Sat"))

plot(julian(data$Date), data$Voltage, ylab="Voltage",
     xlab="datetime", type="l", xaxt="n")
axis(1, at=c(13545.21, 13546.21, 13547.21), labels=c("Thu", "Fri", "Sat"))

plot(julian(data$Date), data$Sub_metering_1, ylab="Energy sub metering",
     xlab="", type="l", xaxt="n")
points(julian(data$Date), data$Sub_metering_2, type="l", col="red")
points(julian(data$Date), data$Sub_metering_3, type="l", col="blue")
axis(1, at=c(13545.21, 13546.21, 13547.21), labels=c("Thu", "Fri", "Sat"))
legend(x="topright",  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, box.col="white", cex=0.75, inset=0.01)

plot(julian(data$Date), data$Global_reactive_power, ylab="Global_reactive_power",
     xlab="datetime", type="l", xaxt="n", yaxt="n")
axis(1, at=c(13545.21, 13546.21, 13547.21), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5), cex.axis=0.9)

