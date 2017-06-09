library(lubridate)
data<-read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ))

#Subsets relevant data.
subbed<-subset(data, Date=="1/2/2007"|Date=="2/2/2007")

#Create new column with datetime in it.
subbed$datetime<-paste(subbed$Date, subbed$Time)

#Converts datetime to datetime object.
subbed$datetime<-dmy_hms(subbed$datetime)

#Opens appropriate graphics device
png("plot3.png", width=480, height=480)

#creates the plot
with(subbed, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(subbed, points(datetime, Sub_metering_2, col="red", type="l"))
with(subbed, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Closes the graphics device.
dev.off()