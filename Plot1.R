hcd<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                na.strings = "?")
hcd_final <- subset(hcd, Date %in% c("1/2/2007","2/2/2007"))
hcd_Date <- as.Date(hcd_final$Date, format="%d/%m/%Y")
png("plot1.png", width=480, height=480)
hist(hcd_final$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()