#plot 4


png("plot4.png", width = 480,height = 480)

#4th graph

par(mfcol = c(2,2))

plot(x=finalData$Date,y = finalData$Global_active_power,type="l",ylab = "Global Active Power" , xlab = "")

plot(x=finalData$Date,y = finalData$Sub_metering_1,type="l",ylab = "Energy sub metering" , xlab = "")
lines(x=finalData$Date,y = finalData$Sub_metering_2, col="Red")
lines(x=finalData$Date,y = finalData$Sub_metering_3, col="Blue")
legend("topright",bty = "n",lty=1,col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(x=finalData$Date,y = finalData$Voltage,type="l",ylab = "Voltage" , xlab = "datetime")


plot(x=finalData$Date,y = finalData$Global_reactive_power,type="l",ylab = "Global_rective_power" , xlab = "datetime")

#off device
dev.off()