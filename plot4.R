library(lubridate)
data<-read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ))

#Subsets relevant data.
subbed<-subset(data, Date=="1/2/2007"|Date=="2/2/2007")

#Create new column with datetime in it.
subbed$datetime<-paste(subbed$Date, subbed$Time)

#Converts datetime to datetime object.
subbed$datetime<-dmy_hms(subbed$datetime)

#Opens appropriate graphics device
png("plot4.png", width=480, height=480)

#Creates the plot holders
par(mfrow=c(2,2), mar=c(4,4,2,1))
#topleft plot
with(subbed, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
#topright plot
with(subbed, plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))
#bottomleft plot
with(subbed, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(subbed, points(datetime, Sub_metering_2, type="l", col="red"))
with(subbed, points(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright",bty="n", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#bottomright plot
with(subbed, plot(datetime, Global_reactive_power, type="l"))

#close the graphics device
dev.off()