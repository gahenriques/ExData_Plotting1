setwd("~/Desktop/Coursera/Data Sciences/Exploratory_Data/Data")

energy_db <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep = ";", na.strings = "?", 
                      colClasses = c("factor", "factor", 
                      rep("numeric", 7)))

energy_db$Date <- as.Date(energy_db$Date, "%d/%m/%Y")

energy_db$Time <- strptime(energy_db$Date, "%H/%M/%S")

short_db_energy <- subset(energy_db, 
                          Date >= "2007-02-01" & Date <= "2007-02-02")

hist(short_db_energy$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png,'plot1.png')
dev.off()
