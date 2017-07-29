setwd("~/Desktop/Coursera/Explo_W1")
data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

extr<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
extr$datetime<-strptime(paste(extr$Date, extr$Time), format= "%d/%m/%Y %H:%M:%S")

with(extr, plot( datetime, Global_active_power, pch = 1, type="l"
                 , xlab= "", ylab= "Global Active Power (kilowatts)"))

dev.copy(png, file="plot2.png")
dev.off()