library(data.table)

#read data
DT <- read.table("household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)

#Move names up into first column
colnames(DT) <- DT[1,]
DT <- DT[-1, ] 

#select specific dates
subsetting <- subset(DT,DT$Date=="1/2/2007" | DT$Date =="2/2/2007")

#plot Global Active Power
globalActivePower <- as.numeric(subsetting$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
