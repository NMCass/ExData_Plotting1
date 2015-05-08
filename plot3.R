#read in dataset from working directory
hpc <- read.csv("~/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

#subset desired days
day1<-subset(hpc, Date=="1/2/2007")
day2<-subset(hpc, Date=="2/2/2007")
subhpc<-rbind(day1, day2)
rm(day1, day2, hpc)
#combine and convert date and time variable
subhpc$DT<-strptime(paste(subhpc$Date, subhpc$Time), format="%d/%m/%Y %H:%M:%S")
# Open png device
png(filename="plot3.png", width=480, height=480, units="px")
#create plot and add all 3 lines
plot(subhpc$DT,y=subhpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(subhpc$DT,y=subhpc$Sub_metering_2, type="l", xlab="", col="red")
points(subhpc$DT,y=subhpc$Sub_metering_3, type="l", xlab="", col="blue")
#add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))
#close device
dev.off()