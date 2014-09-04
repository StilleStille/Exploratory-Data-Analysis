unzip("exdata-data-household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt",
                 sep=";", na.strings="?",
                 stringsAsFactors=F)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

png("plot1.png")
hist(data$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()