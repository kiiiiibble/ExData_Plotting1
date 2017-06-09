library(lubridate)
data<-read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ))

#Subsets relevant data.
subbed<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#Create new column with datetime in it.
subbed$datetime<-paste(subbed$Date, subbed$Time)

#Converts datetime to datetime object.
subbed$datetime<-dmy_hms(subbed$datetime)

#Opens appropriate graphics device
png("plot2.png", width=480, height=480)

#Creates the plot
with(subbed, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#Closes the graphics device
dev.off()
