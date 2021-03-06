rm(list=ls())

#Read data into R:
data <- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subset to contain the related datess: 
subData <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Change from character class to Date class on  Date variable: 
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")

# Creating the plot3:
png("plot1.png", width = 480, height = 480)
hist(subData$Global_active_power, type="l", main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()
