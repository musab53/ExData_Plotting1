# I started with unzipping the data file and setting the Work  dir 

setwd("~/Desktop/Coursera/exdata_data_household_power_consumption")


# load dplyr pack


library(dplyr)

# now will load the data 

Power_Con <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?", "")))

# now will filter on needed date 

data_PC <- filter(Power_Con, Date == "1/2/2007" | Date == "2/2/2007")


# Converting the data and time to format 


data_PC$Date <- as.Date(data_PC$Date, format = "%d/%m/%Y")

data_PC$timetemp <- paste(data_PC$Date, data_PC$Time)

data_PC$Time <- strptime(data_PC$timetemp, format = "%Y-%m-%d %H:%M:%S")


# Now Plotting  Plot #3

png(file = "Plot3.png", width = 480, height = 480)

plot(x = data_PC$Time, y = data_PC$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(x = data_PC$Time, y = data_PC$Sub_metering_2, type = "l", col = "red")

lines(x = data_PC$Time, y = data_PC$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"),lty= 1 )
dev.off()

