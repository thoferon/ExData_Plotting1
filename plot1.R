source("load_data.R")
data <- load_data()
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)",
     col = "red", main = "Gobal Active Power")
dev.off()
