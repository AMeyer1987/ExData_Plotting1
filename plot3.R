library(lubridate)
library(dplyr)

epc = read.delim("household_power_consumption.txt",sep=";",na.strings="?")

epc$Date <- dmy(epc$Date)

epc <- subset(epc,Date>=ymd("2007-02-01")&Date<=ymd("2007-02-02"))

epc <- mutate(epc,DateTime=ymd_hms(paste(Date,Time)))

png(filename="plot3.png",
    width = 480,
    height = 480,
    bg = "transparent",
    type = "cairo-png")

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

dev.off()