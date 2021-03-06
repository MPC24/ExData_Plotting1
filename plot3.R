#Import Data
hpc <- read.csv("~/Energy Database/hpc.txt", sep=";", quote="", stringsAsFactors=FALSE)

#Make Date Time Column
hpc$datime <- paste(hpc$Date, hpc$Time)

#Convertime Date Time Column
hpc$datime <- strptime(hpc$datime, format = "%d/%m/%Y %H:%M:%S")

#Subset the Date Range
hpsub <- subset(hpc, as.Date(hpc$datime) > "2007-01-31 23:59:00" & as.Date(hpc$datime) < "2007-02-03 00:00:00")

#Convert subs to numeric
hpsub$Sub_metering_1 <- as.numeric(hpsub$Sub_metering_1)

#Create plot
plot(hpsub$datime, hpsub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpsub$datime, hpsub$Sub_metering_2, col = "red")
lines(hpsub$datime, hpsub$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

