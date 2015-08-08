setwd("/Users/Eliza/datasciencecoursera/ExData_Plotting1")

## Read in the data files and extract the 2 dates of interest. Note that a memory test should
## be run beforehand to ensure enough memory. 
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataDates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Extract the time and plot global active power over time
datetime <- strptime(paste(dataDates$Date, dataDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(dataDates$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, global_active_power, type="l", xlab="Time", ylab="Global Active Power (kilowatts)")
dev.off()


