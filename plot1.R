
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
finalData$Global_active_power <- as.numeric(as.character(finalData$Global_active_power))

#1st graph

png("plot1.png",height = 480, width = 480)
hist(finalData$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
