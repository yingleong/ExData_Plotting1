
setwd("C:/Coursera/JHU/Exploratory Data Analysis")
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

Lines<-readLines(unz(temp, "household_power_consumption.txt"))
unlink(temp)

inLine<-grep("^[12]/2/2007",substr(Lines,1,8))
ds<-read.table(text=Lines[inLine],sep=";",header=TRUE,col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 

ds$DateTime<-apply(ds, 1, FUN=function(x){return (as.POSIXct(paste(x[1],' ',x[2]),format="%d/%m/%Y %H:%M:%S", origin="1970-01-01"))})

daterange=c(as.POSIXlt(min(ds$DateTime), origin="1970-01-01"), as.POSIXlt(max(ds$DateTime), origin="1970-01-02"))
plot(ds$Global_active_power~ds$DateTime, type='l', ylab="Global Active Power (kilowatts)", xlab="", xaxt='n')
  
axis.POSIXct(1, at=seq(daterange[1], daterange[2],by="day"), format="%a") 
dev.copy(device=png, file="plot2.png", width=480, height=480)
dev.off()