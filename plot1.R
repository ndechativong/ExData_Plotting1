# Plot 1

# Read data from file, only from 2007-02-01 to 2007-02-02
header <- read.table(file = "./data/household_power_consumption.txt", sep = ";", nrows = 1)
power <- read.table(file = "./data/household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, na.strings = "?")
names(power) <- unlist(header)

# Plot histogram of the Global Active Power 
hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Copy the plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

# Close the PNG device
dev.off()