#Creates the third plot


#Load all the datat into memory; this machine's memory exceeds the requirements so just read everything in
data <- read.table('household_power_consumption.txt', header=TRUE,     sep=';', na.strings='?')

#Format our dataset as necessary for further analysis
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data$Time <- paste(data$Date, data$Time, sep=" ")
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")

#Subset Our Data
data <- subset(data,Time$year==107 & Time$mon==1 & (Time$mday==1 | Time$mday==2))

#Match date and time together, make things numeric
data$Global_active_power = as.numeric(data$Global_active_power)



#Create the plot as required
plotinfo <- as.numeric(data$Global_active_power)
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(x=(data$Time),y=data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(x=(data$Time),y=data$Voltage,type="l",ylab="Voltage",xlab="Time")

plot(x=(data$Time),y=data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(data$Time),y=data$Sub_metering_2,col="red")
lines(x=(data$Time),y=data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.4)
plot(data$Time, data$Global_reactive_power, type = "l", main = "", xlab = "Time")

dev.off()