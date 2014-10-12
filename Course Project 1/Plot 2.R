rm(list=ls())

# Read data into R:
data <- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subset to contain the related datess: 
subData<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Change from character class to Date class on  Date variable:
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")

# Date and Time variable =  "DateTime" column:
subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time))

# Creating the plot2:
png("plot2.png", width = 480, height = 480)
plot(subData$DateTime, subData$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()
