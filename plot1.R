library(lubridate)

epc = read.delim("household_power_consumption.txt",sep=";",na.strings="?")

epc$Date <- dmy(epc$Date)

epc <- subset(epc,Date>=ymd("2007-02-01")&Date<=ymd("2007-02-02"))

epc$Global_active_power <- as.numeric(epc$Global_active_power)

png(filename="plot1.png",
    width = 480,
    height = 480,
    bg = "transparent",
    type = "cairo-png")

with(epc, hist(Global_active_power,
               col="red",
               xlab="Global Active Power (kilowatts)",
               ylab="Frequency",
               main="Global Active Power"))

dev.off()