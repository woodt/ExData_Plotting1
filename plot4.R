#
# Plot 4: multiple plots
#

power <- read.csv("household_power_consumption.txt", na.strings=c("?"),
                  header=TRUE, sep=";")
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
power <- mutate(power, DateTime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

par(mfrow=c(2,2))

plot(power$DateTime,power$Global_active_power,type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

plot(power$DateTime,power$Voltage,type="l",
     xlab="datetime",
     ylab="Voltage")

with(power, plot(DateTime, Sub_metering_1, type="l", col="black",
                 xlab="",
                 ylab="Energy sub metering"))
with(power, lines(DateTime, Sub_metering_2, col="red"))
with(power, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lwd=1, bty="n")

plot(power$DateTime,power$Global_reactive_power,type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.copy(png, "plot4.png")
dev.off()

