  library(data.table)
  
  #read data
  DT <- read.table("household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)
  
  #Move names up into first column
  colnames(DT) <- DT[1,]
  DT <- DT[-1, ] 
  
  subsetting <- subset(DT,DT$Date=="1/2/2007" | DT$Date =="2/2/2007")
  
  datetime <-strptime(paste(subsetting$Date, subsetting$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2,2))
  plot(datetime,as.numeric(subsetting$Global_active_power), type="l", xlab="", ylab="Global Active Power")
  plot(datetime,as.numeric(subsetting$Voltage) , type="l", xlab="datetime", ylab="Voltage")
  plot(datetime,as.numeric(subsetting$Sub_metering_1), type="l", ylab="Energy Sub metering", xlab="")
  lines(datetime,as.numeric(subsetting$Sub_metering_2), type="l", col="red")
  lines(datetime,as.numeric(subsetting$Sub_metering_3), type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  plot(datetime,as.numeric(subsetting$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
