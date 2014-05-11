## Reading data
##################
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
fileURL <- "household_power_consumption.txt"
rawData <- read.table(fileURL, col.names=colNames,sep=";", na.strings = "?", header=TRUE)

## Subset data
##################
rawData[,"Date"]<-as.Date(rawData[,"Date"],format='%d/%m/%Y')
minDay <- as.Date("01/02/2007",format='%d/%m/%Y')
maxDay <- as.Date("02/02/2007",format='%d/%m/%Y')
testData <- rawData[rawData$Date >= minDay,]
colnames(testData) <- colNames
testData <- testData[testData$Date <= maxDay,]
colnames(testData) <- colNames

datetime<-as.POSIXct(paste(testData$Date,testData$Time))
Sub_metering_1<-testData$Sub_metering_1
Sub_metering_2<-testData$Sub_metering_2
Sub_metering_3<-testData$Sub_metering_3
png(filename = "plot3.png",  width = 480, height = 480);
plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
dev.off()