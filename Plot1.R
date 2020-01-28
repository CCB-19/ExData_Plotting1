Plot1

data <- read.csv2("~/R/RSTUDIO/Coursera Data Science/Modul3/household_power_consumption.txt", stringsAsFactors=FALSE, header= TRUE, sep= ";", dec=".", na.strings=c("?",""))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")


