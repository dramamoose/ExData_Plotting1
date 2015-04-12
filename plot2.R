#Creates the second plot


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
png("plot2.png", width = 480, height = 480)
plot(x=(data$Time),y=data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()