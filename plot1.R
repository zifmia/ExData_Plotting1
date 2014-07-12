# read in full dataset
powerData <- read.csv('household_power_consumption.txt', sep=';', na.strings = "?")

# restrict to only Feb 1-2, 2007
powerData <- subset(powerData, Date %in% c('1/2/2007','2/2/2007'))

png('plot1.png')
with(powerData, hist(Global_active_power, col='red',xlab='Global Active Power (kilowatts)', main='Global Active Power'))
dev.off()
