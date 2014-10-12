rm(list=ls())
# Read data into R:
data <- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subset to contain the related datess: 
subData<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Changing the class of Date variable from character to Date: 
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")

# Date and Time variable =  "DateTime" column:
subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time))

# Creating the plot3:
png("plot3.png", width = 480, height = 480)
plot(subData$DateTime, subData$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subData$DateTime, subData$Sub_metering_2, type="l", col="red")
lines(subData$DateTime, subData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()