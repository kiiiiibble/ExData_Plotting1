library(lubridate)
data<-read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ))

#Converts dates and times to proper class.
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)

#Subsets relevant data.
subbed<-subset(data, Date==ymd("2007-02-01") | Date==ymd("2007-02-02"))

#Opens appropriate graphics device
png("plot1.png", width=480, height=480)

#Creates the plot
hist(subbed$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#Closes the graphics device
dev.off()
