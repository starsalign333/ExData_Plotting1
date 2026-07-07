library(lubridate)
data = read.csv("household_power_consumption.txt", sep=";")
data$Date = strptime(data$Date, format = "%d/%m/%Y")
data = data[which(year(data$Date) == 2007 & month(data$Date) == 02 &
                    (day(data$Date) == 01 | day(data$Date) == 02)),]
hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power",
     xlab="Frequency", ylab="Global Active Power (kilowatts)")
