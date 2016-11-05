#Read data source
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Subset data
data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Convert dates
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

#Create Plot 4
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    #1st Plot
    plot(data2$Global_active_power~data2$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    #2nd Plot
    plot(data2$Voltage~data2$Datetime, type="l", ylab="Voltage (volt)", xlab="")
    #3rd Plot
    plot(data2$Sub_metering_1~data2$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(data2$Sub_metering_2~data2$Datetime,col='Red')
    lines(data2$Sub_metering_3~data2$Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    #4th Plot
  plot(data2$Global_reactive_power~data2$Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")

#Save plot
  dev.copy(png, file="plot4.png", height=480, width=480)
  dev.off()
