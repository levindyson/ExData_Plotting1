library(data.table)

#read data
DT <- read.table("household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)

#Move names up into first column
colnames(DT) <- DT[1,]
DT <- DT[-1, ] 

subsetting <- subset(DT,DT$Date=="1/2/2007" | DT$Date =="2/2/2007")

datetime <-strptime(paste(subsetting$Date, subsetting$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime,as.numeric(subsetting$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

title(main="Global Active Power Vs Time")
dev.off()
