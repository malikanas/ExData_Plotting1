power_data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## Creating column in the table to merge date and time.
FullTimeDate <- strptime(paste(power_data$Date, power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_data <- cbind(power_data, FullTimeDate)

## Changing types of columns according to requirements.
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
power_data$Time <- format(power_data$Time, format="%H:%M:%S")
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)
power_data$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
power_data$Voltage <- as.numeric(powerdata$Voltage)
power_data$Global_intensity <- as.numeric(powerdata$Global_intensity)
power_data$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
power_data$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
power_data$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

## subset data.
subPower_data <- subset(power_data, Date == "2007-02-01" | Date =="2007-02-02")

## plotting Global Active Power with Time and Date
png("plot3.png", width=480, height=480)
with(subPower_data, plot(FullTimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy Sub Metering"))
lines(subPower_data$FullTimeDate, subPower_data$Sub_metering_2,type="l", col= "red")
lines(subPower_data$FullTimeDate, subPower_data$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()