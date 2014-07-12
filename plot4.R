# read in full dataset
powerData <- read.csv('household_power_consumption.txt', sep=';', na.strings = "?", stringsAsFactors=FALSE)

# restrict to only Feb 1-2, 2007
powerData <- subset(powerData, Date %in% c('1/2/2007','2/2/2007'))

# combine date+time into a single datetime column
powerData$DateTime <- strptime(paste(powerData$Date,powerData$Time), format='%d/%m/%Y %H:%M:%S')

png('plot4.png')

# 2 x 2 plot grid
par(mfcol=c(2, 2), mar=c(4,4,2,2))

with(powerData, {
    # top left, same as plot2
    plot(DateTime, Global_active_power, type='n', ylab='Global Active Power (kilowatts)', xlab='', main='')
    lines(DateTime, Global_active_power)

    # bottom left, same as plot3
    plot(DateTime, Sub_metering_1, type='n', ylab='Energy sub metering', xlab='', main='')
    lines(DateTime, Sub_metering_1)
    lines(DateTime, Sub_metering_2, col='red')
    lines(DateTime, Sub_metering_3, col='blue')
    legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'))

    # top right, voltage
    plot(DateTime, Voltage, type='n', xlab='datetime', main='')
    lines(DateTime, Voltage)
    
    # bottom right, global_reactive power
    plot(DateTime, Global_reactive_power, type='n', xlab='datetime', main='')
    lines(DateTime, Global_reactive_power)    
})

dev.off()
