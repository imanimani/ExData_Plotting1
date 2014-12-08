require(sqldf)
tempDF <- read.csv.sql("household_power_consumption.txt"
         , header = TRUE, sep = ";", dbname = tempfile()
         , sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ")
names(tempDF)<-gsub("_","",names(tempDF))
Sys.setlocale("LC_ALL", "English")
par(mfrow=c(2,2),mar=c(4,4,2,1))
with (tempDF, plot(time2,Globalactivepower,type = "l",
                   xlab ="", ylab ="Global Active Power" ))
with (tempDF, plot(time2,Voltage,type = "l",
                   xlab ="datatime", ylab ="Voltage" ))
with (tempDF,plot(time2,Submetering1,type = "l",
                  xlab ="", ylab ="Energy sub metering" ))
with (tempDF,lines(time2,Submetering2,col="red"))
with (tempDF,lines(time2,Submetering3,col="blue"))
legend("topright",legend=c("Submetering_1","Submetering_2","Sub_metering_3"),
       lwd=2,lty=1,bty= "O",box.lwd=1,col=c("black","red","blue"),cex=1,inset=0)
with (tempDF, plot(time2,Globalreactivepower,type = "l",
                   xlab ="datatime", ylab ="Global_reactive_power"))