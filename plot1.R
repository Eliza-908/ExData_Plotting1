setwd("/Users/Eliza/datasciencecoursera/ExData_Plotting1")

## Read in the data files and extract the 2 dates of interest. Note that a memory test should
## be run beforehand to ensure enough memory. 

dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataDates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Read in global active power and create a histogram
global_active_power <- as.numeric(dataDates$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

