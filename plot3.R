setwd("/Users/Eliza/datasciencecoursera/ExData_Plotting1")

## Read in the data files and extract the 2 dates of interest. Note that a memory test should
## be run beforehand to ensure enough memory. 
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataDates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Extract the time and plot the submeterings over time
datetime <- strptime(paste(dataDates$Date, dataDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering_1 <- as.numeric(dataDates$Sub_metering_1)
sub_metering_2 <- as.numeric(dataDates$Sub_metering_2)
sub_metering_3 <- as.numeric(dataDates$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, sub_metering_1, type = 'l', col = "black", ylab = "Energy sub metering", xlab = "")
lines(datetime, sub_metering_2, type = 'l', col = "red")
lines(datetime, sub_metering_3, type = 'l', col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

