#Import Data
hpc <- read.csv("~/Energy Database/hpc.txt", sep=";", quote="", stringsAsFactors=FALSE)

#Make Date Time Column
hpc$datime <- paste(hpc$Date, hpc$Time)

#Convertime Date Time Column
hpc$datime <- strptime(hpc$datime, format = "%d/%m/%Y %H:%M:%S")

#Subset the Date Range
hpsub <- subset(hpc, as.Date(hpc$datime) > "2007-01-31 23:59:00" & as.Date(hpc$datime) < "2007-02-03 00:00:00")

#Convert GAP to numeric
hpsub$Global_active_power <- as.numeric(hpsub$Global_active_power)

#Create plot
plot(hpsub$datime, hpsub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")