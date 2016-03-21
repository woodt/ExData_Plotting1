#
# Plot 3: Submetering by day
#

power <- read.csv("household_power_consumption.txt", na.strings=c("?"),
                  header=TRUE, sep=";")
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
power <- mutate(power, DateTime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

with(power, plot(DateTime, Sub_metering_1, type="l", col="black",
                 xlab="",
                 ylab="Energy sub metering"))
with(power, lines(DateTime, Sub_metering_2, col="red"))
with(power, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lwd=1)
dev.copy(png, "plot3.png")
dev.off()

