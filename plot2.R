# read in full dataset
powerData <- read.csv('household_power_consumption.txt', sep=';', na.strings = "?", stringsAsFactors=FALSE)

# restrict to only Feb 1-2, 2007
powerData <- subset(powerData, Date %in% c('1/2/2007','2/2/2007'))

# combine date+time into a single datetime column
powerData$DateTime <- strptime(paste(powerData$Date,powerData$Time), format='%d/%m/%Y %H:%M:%S')

png('plot2.png')
with(powerData, plot(DateTime, Global_active_power, type='n', ylab='Global Active Power (kilowatts)', xlab='', main='Global Active Power'))
with(powerData, lines(DateTime, Global_active_power))
dev.off()
