library(lubridate)
data = read.csv("household_power_consumption.txt", sep=";")
data$Date = strptime(paste(data$Date, data$Time, data$Weekday, sep=" "), format ="%d/%m/%Y %H:%M:%S")
data = data[which(year(data$Date) == 2007 & month(data$Date) == 02 &
                    (day(data$Date) == 01 | day(data$Date) == 02)),]
plot(julian(data$Date), data$Global_active_power, ylab="Global Active Power (kilowatts)",
     xlab="", type="l", xaxt="n")
axis(1, at=c(13545.21, 13546.21, 13547.21), labels=c("Thu", "Fri", "Sat"))

     