library(lubridate)
library(dplyr)

epc = read.delim("household_power_consumption.txt",sep=";",na.strings="?")

epc$Date <- dmy(epc$Date)

epc <- subset(epc,Date>=ymd("2007-02-01")&Date<=ymd("2007-02-02"))

epc <- mutate(epc,DateTime=ymd_hms(paste(Date,Time)))

png(filename="plot2.png",
    width = 480,
    height = 480,
    bg = "transparent",
    type = "cairo-png")

with(epc, plot(DateTime,
               Global_active_power,type="l",
               xlab="",
            ylab="Global Active Power (kilowatts)"))

dev.off()