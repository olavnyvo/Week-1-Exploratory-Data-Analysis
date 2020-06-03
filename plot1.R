#Processing data plot from file power consumption data
hpowr <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(hpowr) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowr <- subset(hpowr,hpowr$Date=="1/2/2007" | hpowr$Date =="2/2/2007")

png("plot1.png",width = 480,height = 480) 

#plotting
hist(as.numeric(as.character(subpowr$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")

dev.off()