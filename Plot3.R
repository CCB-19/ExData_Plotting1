Plot3

data <- read.csv2("~/R/RSTUDIO/Coursera Data Science/Modul3/household_power_consumption.txt", stringsAsFactors=FALSE, header= TRUE, sep= ";", dec=".", na.strings=c("?",""))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

data <- data[complete.cases(data),]

hour <- paste(data$Date, data$Time)

hour <- setNames(hour, "TimeandDate")

data <- data[ ,!(names(data) %in% c("Date","Time"))]

data <- cbind(hour, data)

data$hour <- as.POSIXct(hour)

plot(data$Sub_metering_1~data$hour, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        
      lines(data$Sub_metering_2~data$hour, col="red")
      
      lines(data$Sub_metering_3~data$hour, col="blue")

legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), fill = NULL,
       border = "black", lty= c(1, 1, 1))