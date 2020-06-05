hcd <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", stringsAsFactors = FALSE)
hcdfinal <- subset(hcd, Date %in% c("1/2/2007","2/2/2007"))
hcddate <- as.Date(hcdfinal$Date, "%d/%m/%Y")
datetime <- paste(as.Date(hcddate), hcddate$Time)
dat <- as.POSIXct(datetime)

with(hcdfinal, {
        plot(Global_active_power~dat, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()