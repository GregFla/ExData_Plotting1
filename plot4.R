setwd("~/Desktop/Coursera/Explo_W1")
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

extr<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
extr$datetime<-strptime(paste(extr$Date, extr$Time), format= "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
with(extr, {
      plot( datetime, Global_active_power, xlab = "", ylab = "Global Active Power",type = "l")
      plot( datetime, Voltage, type="l")
      with(extr, plot( datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
      points(x=extr$datetime, y=extr$Sub_metering_2, type = "l", col="red")
      points(x=extr$datetime, y=extr$Sub_metering_3, type = "l", col="blue")
      legend("topright" ,pch = 95 , col=c("black", "red", "blue"), 
             legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
      # Parasite sur courbe rouge (2) à éliminer
      plot(datetime, Global_reactive_power, type = "l")
})

dev.copy(png, file="plot4.png")
dev.off()