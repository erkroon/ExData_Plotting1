library(utils)
library(datasets)
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "./power.zip")  
unzip("./power.zip")
datafile <- read.table("./household_power_consumption.txt", sep = ";", header= TRUE, na= "?", colClasses=c("character", "character", rep("numeric",7)))

#Convert the date and time 
datafile$Time <- strptime(paste(datafile$Date, datafile$Time), "%d/%m/%Y %H:%M:%S")
datafile$Date <- as.Date(datafile$Date, "%d/%m/%Y")

##get the two days
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
newfile <- subset(datafile, Date %in% dates)


#hist(newfile$Global_active_power)

# create the plots
png(filename = "plot2.png",
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(newfile$Time, newfile$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
