# Plot 4

# Read data from file, only from 2007-02-01 to 2007-02-02
header <- read.table(file = "./data/household_power_consumption.txt", sep = ";", nrows = 1)
power <- read.table(file = "./data/household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, na.strings = "?")
names(power) <- unlist(header)

# Combine Date and Time into one variable
dt <- paste(power$Date, power$Time, sep = " ")
measure_dt <- strptime(dt, format = "%d/%m/%Y %H:%M:%S")
power$measure_dt <- measure_dt

# Set parameters for plotting area
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# Q1: Plot line graph of the Global Active Power over the period
with(power, plot(measure_dt, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# Q2: plot line graph of the averaged Voltage over the period
with(power, plot(measure_dt, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# Q3: Plot line graph of the Global Active Power over the period
with(power, plot(measure_dt, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub meeting"))
with(power, lines(measure_dt, Sub_metering_2, type = "l", col = "red"))
with(power, lines(measure_dt, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Q4: Plot line graph of Global Reactive Power over the period
with(power, plot(measure_dt, Global_reactive_power, type = "l", xlab = "datetime"))

# Copy the plot to a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)

# Close the PNG device
dev.off()