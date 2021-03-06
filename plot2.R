# Processing data plot from file power consumption data
hpowr <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(hpowr) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowr <- subset(hpowr,hpowr$Date=="1/2/2007" | power$Date =="2/2/2007")

# Converting Date and Time from character format to Date and POSIXlt
subpowr$Date <- as.Date(subpowr$Date, format="%d/%m/%Y")
subpowr$Time <- strptime(subpowr$Time, format="%H:%M:%S")
subpowr[1:1440,"Time"] <- format(subpowr[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowr[1441:2880,"Time"] <- format(subpowr[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot2.png",width = 480,height = 480)

# plotting
plot(subpowr$Time,as.numeric(as.character(subpowr$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

title(main="Global Active Power Vs Time")

dev.off()