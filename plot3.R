## Read the data into dataframe

household_power_consumption <- read.csv("~/R/ExDataPlotting/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
rawdata <- subset(household_power_consumption, Date %in% c("1/2/2007","2/2/2007"))


library(dplyr)
graphdata <- select(rawdata, Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3, Date, Time)

graphdata$datetime <- paste(graphdata$Date, graphdata$Time)
graphdata$datetime = as.POSIXlt(graphdata$datetime,format="%d/%m/%Y %H:%M:%S")

#Creating png file
png("~/R/ExDataPlotting/plot3.png", width = 480, height = 480, units = "px")
#creating the plot
with(graphdata, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(graphdata$datetime, graphdata$Sub_metering_2, col = "red")
lines(graphdata$datetime, graphdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="l",col=c("black","red","blue"), lwd=2)
#closing the device
dev.off()