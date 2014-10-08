Sys.setlocale("LC_ALL", "English")
unzip("exdata-data-household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt",
sep=";", na.strings="?",
stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]
data$Datetime <- strptime(paste(data$Date,data$Time),
format="%Y-%m-%d %H:%M:%S")
hist(data$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
