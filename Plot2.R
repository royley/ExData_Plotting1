#Read data source - assuming the source file is saved in the working directory
  data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Subset data
  data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Convert dates
  datetime <- paste(as.Date(data2$Date), data2$Time)
  data2$Datetime <- as.POSIXct(datetime)

#Create Plot 2
  plot(data2$Global_active_power~data2$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Save plot 
  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()
