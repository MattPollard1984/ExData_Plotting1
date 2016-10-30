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
## Done here as copying plot seems to ruin the legend
png(file="plot3.png", height = 480, width = 480)

## Set "frame" to be one row and one column
par(mfrow=c(1,1))

## Draw base for plot (type=n)
##      Include Y-axis title
##      Remove X-axis title (DateTime from colum name by default)
with(dataIn, plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))

## Add in the lines, with type = "l" to join them with a line
## Three lines of data for meter 1, 2 and 3
## Colour black, red and blue respectively
with(dataIn, lines(DateTime, Sub_metering_1, type="l", col="black"))
with(dataIn, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(dataIn, lines(DateTime, Sub_metering_3, type="l", col="blue"))

## Add the legend to the top right hand corner
## Use lty to get lines 
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy plot from screen to png file
##dev.copy(png, "plot3.png")

## Close png device
dev.off()
