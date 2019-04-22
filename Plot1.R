power_data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## converting data according to requirement
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
power_data$Time <- format(power_data$Time, format="%H:%M:%S")
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

## Subsetting the data according to the date
subPower_data <- subset(power_data, Date == "2007-02-01" | Date =="2007-02-02")

## Plotting subset of data on Histogram
png("plot1.png", width=480, height=480)
hist(subPower_data$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
