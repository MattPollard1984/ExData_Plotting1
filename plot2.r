## Read in data required
##      Delimited by ";"
##      Set Headers to be FALSE - then set explicitly.
##      Skip first 66637 rows - start at 01/02/2007
##      Number of rows is 2880 - end before 03/02/2007
dataIn <- read.table("household_power_consumption.txt", header=FALSE, sep=";", skip=66637, nrows=2880, col.names = c("Date", "Time", "Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Check top and bottom are as we expect
##head(dataIn)
##tail(dataIn)

## Convert date and time in input data into Date and Time format in R
dataIn$DateTime <- as.POSIXlt(paste(dataIn$Date, dataIn$Time), format = "%d/%m/%Y %H:%M:%S")

## Set up PNG device to save file to 
png(file="plot2.png", height = 480, width = 480)

## Set "frame" to be one row and one column
par(mfrow=c(1,1))

## Draw base for plot (type=n)
##      Include Y-axis title
##      Remove X-axis title (DateTime from colum name by default)
with(dataIn, plot(DateTime, Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab=""))

## Add in the lines, with type = "l" to join them with a line
with(dataIn, lines(DateTime, Global_active_power, type="l"))

## Close png device
dev.off()
