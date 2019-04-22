power_data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## Creating column in the table to merge date and time.
FullTimeDate <- strptime(paste(power_data$Date, power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_data <- cbind(power_data, FullTimeDate)

## Changing types of columns according to requirements.
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
power_data$Time <- format(power_data$Time, format="%H:%M:%S")
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

## subset data.
subPower_data <- subset(power_data, Date == "2007-02-01" | Date =="2007-02-02")

## plotting Global Active Power with Time and Date
png("plot2.png", width=480, height=480)
with(subPower_data, plot(FullTimeDate, Global_active_power, type="l", xlab="Days", ylab="Global Active Power (kilowatts)"))
dev.off()