# Read the data from a txt file
dataset <- read.table(file = "D:/Users/Fleur/Documents/data/household_power_consumption.txt",
                      header = TRUE, sep = ";", na.strings = "?", 
                      colClasses = c(rep("character",2),rep("numeric",7)))

# Merge the date and time column and convert to POSIXlt format.
dataset$DateTime <- strptime(paste(dataset$Date,dataset$Time,sep = " "), format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

# Convert the date column to 'Date' type.
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# Select the data where date is in  2007-02-01 and 2007-02-02
data <- dataset[dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02", ]

# Remove the original dataset since it is not needed anymore.
rm(dataset)

# Create a plot of time vs global active power. Send the plot to a .png file.  
png(file = "plot2.png")
with(data, plot(DateTime, Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()