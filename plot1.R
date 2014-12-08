require(sqldf)
tempDF <- read.csv.sql("household_power_consumption.txt"
        , header = TRUE, sep = ";", dbname = tempfile()
         , sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ")
names(tempDF)<-gsub("_","",names(tempDF))
with (tempDF,hist(Globalactivepower, xlab ="Global Active Power(kilowatts)"
          ,main ="Global Active Power",col ="red"))