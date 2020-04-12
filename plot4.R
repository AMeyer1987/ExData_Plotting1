library(lubridate)
library(dplyr)

epc = read.delim("household_power_consumption.txt",sep=";",na.strings="?")

epc$Date <- dmy(epc$Date)

epc <- subset(epc,Date>=ymd("2007-02-01")&Date<=ymd("2007-02-02"))

epc <- mutate(epc,DateTime=ymd_hms(paste(Date,Time)))

png(filename="plot4.png",
    width = 480,
    height = 480,
    bg = "transparent",
    type = "cairo-png")

# plot(0,0,type="n")

par(mfrow = c(2,2))

# First plot
with(epc, plot(DateTime,
               Global_active_power,type="l",
               xlab="",
               ylab="Global Active Power (kilowatts)"))

# Second plot
with(epc, plot(DateTime,
               Voltage,type="l",
               xlab="datetime",
               ylab="Voltage"))

# Third plot
with(epc, plot(DateTime,
               Sub_metering_1,type="l",
               xlab="",
               ylab="Energy sub metering",
               col="black"))
with(epc, lines(DateTime,
                Sub_metering_2,
                type="l",
                col="red"))
with(epc, lines(DateTime,
                Sub_metering_3,
                type="l",
                col="blue"))
legend("topright",y=names(epc)[7:9],col=c("black","red","blue"),lwd=1)

# Fourth plot
with(epc, plot(DateTime,
               Global_reactive_power,type="l",
               xlab="datetime"))


dev.off()