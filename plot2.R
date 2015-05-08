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
png(filename="plot2.png", width=480, height=480, units="px")
#create plot
plot(subhpc$DT, subhpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#close png device
dev.off()