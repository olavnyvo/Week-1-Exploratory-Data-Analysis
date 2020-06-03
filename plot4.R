# Processing data plot from file power consumption data
hpowr <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(hpowr) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowr <- subset(hpowr,hpowr$Date=="1/2/2007" | hpowr$Date =="2/2/2007")

# Converting Date and Time formats to Date and POSIXlt respectively
subpowr$Date <- as.Date(subpowr$Date, format="%d/%m/%Y")
subpowr$Time <- strptime(subpowr$Time, format="%H:%M:%S")
subpowr[1:1440,"Time"] <- format(subpowr[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowr[1441:2880,"Time"] <- format(subpowr[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot4.png", width=480, height=480)

# Process multiple plots
par(mfrow=c(2,2))

with(subpowr,{
  plot(subpowr$Time,as.numeric(as.character(subpowr$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpowr$Time,as.numeric(as.character(subpowr$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpowr$Time,subpowr$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpowr,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpowr,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpowr,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpowr$Time,as.numeric(as.character(subpowr$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()