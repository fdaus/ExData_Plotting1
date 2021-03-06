#plot3

url =  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
download.file(url, destfile = "exdata.zip")
unzip("exdata.zip")
exdata <- read.csv2(file = "household_power_consumption.txt",stringsAsFactors = FALSE)

#convert time format
x <- paste(exdata$Date,exdata$Time,sep = ",")
Date<- strptime(x, "%d/%m/%Y,%H:%M:%S")

#add new date column
xdata <- cbind(Date,subset(exdata,select = Time:Sub_metering_3))

#select data only from this date
finalData<- subset(xdata, Date >= "2007-02-01"&Date < "2007-02-03")


#3rd graph

png("plot3.png",width = 480, height = 480)
plot(x=finalData$Date,y = finalData$Sub_metering_1,type="l",ylab = "Energy sub metering" , xlab = "")
lines(x=finalData$Date,y = finalData$Sub_metering_2, col="Red")
lines(x=finalData$Date,y = finalData$Sub_metering_3, col="Blue")
legend("topright",lty=1,col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
