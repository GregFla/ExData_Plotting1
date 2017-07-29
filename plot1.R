setwd("~/Desktop/Coursera/Explo_W1")
data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

extr<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
extr$datetime<-strptime(paste(extr$Date, extr$Time), format= "%d/%m/%Y %H:%M:%S")

hist(extr$Global_active_power, col="red", main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()