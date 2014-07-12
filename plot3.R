# read in full dataset
powerData <- read.csv('household_power_consumption.txt', sep=';', na.strings = "?", stringsAsFactors=FALSE)

# restrict to only Feb 1-2, 2007
powerData <- subset(powerData, Date %in% c('1/2/2007','2/2/2007'))

powerData$DateTime <- strptime(paste(powerData$Date,powerData$Time), format='%d/%m/%Y %H:%M:%S')

png('plot3.png')
with(powerData, {
    plot(DateTime, Sub_metering_1, type='n', ylab='Energy sub metering', xlab='', main='')
    lines(DateTime, Sub_metering_1)
    lines(DateTime, Sub_metering_2, col='red')
    lines(DateTime, Sub_metering_3, col='blue')
})
legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'))
dev.off()
