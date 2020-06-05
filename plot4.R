hcd <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", stringsAsFactors = FALSE)
hcdfinal <- subset(hcd, Date %in% c("1/2/2007","2/2/2007"))
hcddate <- as.Date(hcdfinal$Date, "%d/%m/%Y")
datetime <- paste(as.Date(hcddate), hcdfinal$Time)
hcdfinal$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hcdfinal, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="Datetime")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), )
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global_reactive_power (kilowatts)", xlab="Datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()