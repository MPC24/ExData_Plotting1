hpc <- read.csv("C:/Users/Mike/Desktop/household_power_consumption.txt", sep=";", quote="", header = TRUE, as.is = TRUE, na.string = "?")

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

hpc$DateTime <- paste(hpc$Date, hpc$Time)

hpc$DateTime <- strptime(hpc$DateTime, format = "%Y-%m-%d %H:%M:%S")

hpc.plots <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

hist(hpc.plots$Global_active_power, main = "Global Active Power", xlab = "Global Acitve Power (kilowats)", col = "red")

plot(hpc.plots$Date,hpc.plots$Global_active_power, type = "l" main = "Global Active Power", ylab = "Global Acitve Power (kilowats)", xlab = "", lty = 2)