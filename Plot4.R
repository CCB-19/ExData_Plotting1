Plot4

data <- read.csv2("~/R/RSTUDIO/Coursera Data Science/Modul3/household_power_consumption.txt", stringsAsFactors=FALSE, header= TRUE, sep= ";", dec=".", na.strings=c("?",""))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

data <- data[complete.cases(data),]

hour <- paste(data$Date, data$Time)

hour <- setNames(hour, "TimeandDate")

data <- data[ ,!(names(data) %in% c("Date","Time"))]

data <- cbind(hour, data)

data$hour <- as.POSIXct(hour)

par(mfrow=c(2,2), mar=c(4,4,1,1))

plot(data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(data$Voltage~data$hour, type="l", ylab="Voltage (volt)", xlab="")

plot(data$Sub_metering_1~data$hour, type="l", ylab="Global Active Power (kilowatts)", xlab="")

        lines(data$Sub_metering_2~data$hour, col="red")

        lines(data$Sub_metering_3~data$hour, col="blue")

legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), fill = NULL, lty= 1, bty="n")

plot(data$Global_reactive_power~data$hour, type="l", ylab="Global Reactive Power (Kilowatts)")