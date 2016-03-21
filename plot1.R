#
# Plot 1: Global Active Power
#

power <- read.csv("household_power_consumption.txt", na.strings=c("?"),
                  header=TRUE, sep=";")
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
hist(power$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.copy(png, "plot1.png")
dev.off()

