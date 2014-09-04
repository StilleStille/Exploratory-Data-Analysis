Sys.setlocale("LC_ALL", "English")

unzip("exdata-data-household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt",
                 sep=";", na.strings="?",
                 stringsAsFactors=F)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]
data$Datetime <- strptime(paste(data$Date,data$Time),
                          format="%Y-%m-%d %H:%M:%S")


png("plot4.png")
par(mfrow=c(2,2))

plot(data$Datetime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

plot(data$Datetime, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

plot(data$Datetime, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, type="l", col="red")
lines(data$Datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data$Datetime, data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global Reactive Power")

dev.off()