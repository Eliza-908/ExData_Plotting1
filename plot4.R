setwd("/Users/Eliza/datasciencecoursera/ExData_Plotting1")

## Read in the data files and extract the 2 dates of interest. Note that a memory test should
## be run beforehand to ensure enough memory. 
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataDates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Extract all the necessary variables 
datetime <- strptime(paste(dataDates$Date, dataDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering_1 <- as.numeric(dataDates$Sub_metering_1)
sub_metering_2 <- as.numeric(dataDates$Sub_metering_2)
sub_metering_3 <- as.numeric(dataDates$Sub_metering_3)
global_active_power <- as.numeric(dataDates$Global_active_power)
global_reactive_power <- as.numeric(dataDates$Global_reactive_power)
voltage <- as.numeric(dataDates$Voltage)

## Create the 4 panelled plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex = 0.2)

plot(datetime, voltage, type='l', ylab = "Voltage")

plot(datetime, sub_metering_1, type = 'l', col = "black", ylab = "Energy sub metering", xlab = "")
lines(datetime, sub_metering_2, type = 'l', col = "red")
lines(datetime, sub_metering_3, type = 'l', col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty='o')

plot(datetime, global_reactive_power, type='l', ylab = "Global Reactive Power")

dev.off()

