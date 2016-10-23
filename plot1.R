## Read the data into dataframe

household_power_consumption <- read.csv("~/R/ExDataPlotting/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
rawdata <- subset(household_power_consumption, Date %in% c("1/2/2007","2/2/2007"))
library(dplyr)
rawdata <- mutate(rawdata, Global_active_power = as.numeric(Global_active_power), Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2))

#Creating png file
png("~/R/ExDataPlotting/plot1.png", width = 480, height = 480, units = "px")
#creating the plot
hist(rawdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#closing the device
dev.off()