setwd("~/Desktop/Coursera/Explo_W1")
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

extr<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
extr$datetime<-strptime(paste(extr$Date, extr$Time), format= "%d/%m/%Y %H:%M:%S")

with(extr, plot( datetime, as.numeric(Global_active_power)/1000, pch = 1, type="l"
                 , xlab= "", ylab= "Global Active Power (kilowatts)"))

dev.copy(png, file="plot2.png")
dev.off()