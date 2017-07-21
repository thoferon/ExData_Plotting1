source("load_data.R")
data <- load_data()
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

## Top-left plot
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Bottom-left plot
plot(data$DateTime, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 3)

## Top-right plot
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

## Bottom-right plot
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
