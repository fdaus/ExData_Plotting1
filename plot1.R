
url =  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
download.file(url, destfile = "exdata.zip")
unzip("exdata.zip")
exdata <- read.csv2(file = "household_power_consumption.txt",stringsAsFactors = FALSE)

#convert time format
x <- paste(exdata$Date)
Date<- strptime(x, "%d/%m/%Y")

#add new date column
xdata <- cbind(Date,subset(exdata,select = Time:Sub_metering_3))

#select data only from this date
finalData<- subset(xdata, Date== "2007-02-01"|Date == "2007-02-02")

#1st graph

finalData$Global_active_power <- as.numeric(as.character(finalData$Global_active_power))
hist(finalData$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

