## Read the data into dataframe


household_power_consumption <- read.csv("~/R/ExDataPlotting/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
rawdata <- subset(household_power_consumption, Date %in% c("1/2/2007","2/2/2007"))


#Subsetting
library(dplyr)
graphdata <- select(rawdata, Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3, Voltage = as.numeric(Voltage), Global_active_power = as.numeric(Global_active_power), Global_reactive_power = as.numeric(Global_reactive_power), Date, Time)

graphdata$datetime <- paste(graphdata$Date, graphdata$Time)
graphdata$datetime = as.POSIXlt(graphdata$datetime,format="%d/%m/%Y %H:%M:%S")

#Creating png file
png("~/R/ExDataPlotting/plot4.png", width = 480, height = 480, units = "px")

#set number of graphs
par(mfrow= c(2,2))

#creating the plots
# Global active power
with(graphdata, plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab=""))
#Voltage
with(graphdata, plot(datetime, Voltage, type="l", ylab="Voltage", xlab="datetime"))
#Energy submeteringr
with(graphdata, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(graphdata$datetime, graphdata$Sub_metering_2, col = "red")
lines(graphdata$datetime, graphdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="l",col=c("black","red","blue"), lwd=2)
#Global reactive power
with(graphdata, plot(datetime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))

#closing the device
dev.off()