
setwd("C:/Coursera/JHU/Exploratory Data Analysis")
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

Lines<-readLines(unz(temp, "household_power_consumption.txt"))
unlink(temp)

inLine<-grep("^[12]/2/2007",substr(Lines,1,8))
ds<-read.table(text=Lines[inLine],sep=";",header=TRUE,col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
par(bg="white")
hist(ds$Global_active_power, xlab="Global Active Power (kilowatts)",main="Global Active Power", col="red")
dev.copy(device=png, file="plot1.png", width=480, height=480)
dev.off()



