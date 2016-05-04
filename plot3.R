# Plot 3

# Read data from file, only from 2007-02-01 to 2007-02-02
header <- read.table(file = "./data/household_power_consumption.txt", sep = ";", nrows = 1)
power <- read.table(file = "./data/household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, na.strings = "?")
names(power) <- unlist(header)

# Combine Date and Time into one variable
dt <- paste(power$Date, power$Time, sep = " ")
measure_dt <- strptime(dt, format = "%d/%m/%Y %H:%M:%S")
power$measure_dt <- measure_dt

# Plot line graph of the Global Active Power over the period
with(power, plot(measure_dt, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub meeting"))
with(power, lines(measure_dt, Sub_metering_2, type = "l", col = "red"))
with(power, lines(measure_dt, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Copy the plot to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)

# Close the PNG device
dev.off()