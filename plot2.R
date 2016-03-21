#
# Plot 2: Global Active Power by day
#

power <- read.csv("household_power_consumption.txt", na.strings=c("?"),
                  header=TRUE, sep=";")
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
power <- mutate(power, DateTime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

plot(power$DateTime,power$Global_active_power,type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()

