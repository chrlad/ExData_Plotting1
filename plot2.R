## Read the data into dataframe

household_power_consumption <- read.csv("~/R/ExDataPlotting/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
rawdata <- subset(household_power_consumption, Date %in% c("1/2/2007","2/2/2007"))


library(dplyr)
graphdata <- select(rawdata, Global_active_power = as.numeric(Global_active_power), Date, Time)

graphdata$datetime <- paste(graphdata$Date, graphdata$Time)
graphdata$datetime = as.POSIXlt(graphdata$datetime,format="%d/%m/%Y %H:%M:%S")

#Creating png file
png("~/R/ExDataPlotting/plot2.png", width = 480, height = 480, units = "px")
#creating the plot
with(graphdata, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
#closing the device
dev.off()