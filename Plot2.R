Plot2

data <- read.csv2("~/R/RSTUDIO/Coursera Data Science/Modul3/household_power_consumption.txt", stringsAsFactors=FALSE, header= TRUE, sep= ";", dec=".", na.strings=c("?",""))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

data <- data[complete.cases(data),]

hour <- paste(data$Date, data$Time)

hour <- setNames(hour, "TimeandDate")

data <- data[ ,!(names(data) %in% c("Date","Time"))]

data <- cbind(hour, data)

data$hour <- as.POSIXct(hour)

plot(data$Global_active_power~data$hour, type="l", ylab="Global Active Power (kilowatts)", xlab="")