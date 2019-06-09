library(data.table)

#read data
DT <- read.table("household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)

#Move names up into first column
colnames(DT) <- DT[1,]
DT <- DT[-1, ] 

subsetting <- subset(DT,DT$Date=="1/2/2007" | DT$Date =="2/2/2007")

datetime <-strptime(paste(subsetting$Date, subsetting$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime,as.numeric(subsetting$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")

lines(datetime, as.numeric(subsetting$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(subsetting$Sub_metering_3), type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col = c("black", "red", "blue"))


dev.off()
