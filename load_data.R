load_data <- function() {
    if(!file.exists("data.zip"))
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      destfile = "data.zip", method = "curl")
    if(!file.exists("household_power_consumption.txt")) unzip("data.zip")

    fulldata <- read.csv2("household_power_consumption.txt", na.strings = "?",
                          as.is = TRUE)
    selector <- fulldata$Date == "1/2/2007" | fulldata$Date == "2/2/2007"
    data <- fulldata[selector,]
    data$DateTime <- paste(data$Date, data$Time)
    data$DateTime <- strptime(data$DateTime, format = "%e/%m/%Y %H:%M:%S")
    # For some reason, I can't specify the column classes to read.csv2 as it
    # somehow considers '4.126' not to be a real number.
    data[,3] <- as.numeric(data[,3])
    data[,4] <- as.numeric(data[,4])
    data[,5] <- as.numeric(data[,5])
    data[,6] <- as.numeric(data[,6])
    data[,7] <- as.numeric(data[,7])
    data[,8] <- as.numeric(data[,8])
    data[,9] <- as.numeric(data[,9])
    data
}
