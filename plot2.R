require(sqldf)
tempDF <- read.csv.sql("household_power_consumption.txt"
       , header = TRUE, sep = ";", dbname = tempfile()
       , sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ")
names(tempDF)<-gsub("_","",names(tempDF))
require(lubridate)
P<-paste(tempDF$Date, tempDF$Time)
tempDF$time2<-strptime(P, "%d/%m/%Y %H:%M:%S")
with (tempDF, plot(time2,Globalactivepower,type = "l",
        xlab ="", ylab ="Global Active Power(kilowatts)" ))