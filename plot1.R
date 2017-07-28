setwd("~/Desktop/Coursera/Explo_W1")
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

extr<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
extr$datetime<-strptime(paste(extr$Date, extr$Time), format= "%d/%m/%Y %H:%M:%S")

hist(as.numeric(extr$Global_active_power)/1000, col="red", main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()