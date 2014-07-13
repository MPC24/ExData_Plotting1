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

#Develop histograph
hist(hpsub$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")