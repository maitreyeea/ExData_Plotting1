## Read Dataset
testdat <- read.table("./household_power_consumption.txt",header = TRUE, sep=';',stringsAsFactors = FALSE)
## Convert char date column to date
dateSub <- testdat[,1]    
char2date <- as.Date(dateSub,format = "%d/%m/%Y")
newdat <- cbind(char2date,testdat)
## Subset data for only 2 dates
subdat <- subset(newdat, char2date >= "2007-02-01" & char2date <= "2007-02-02")

## DateTime conversion
condate <- as.POSIXlt(paste(subdat$Date,subdat$Time),format="%d/%m/%Y %H:%M:%S")
plot2dat <- cbind(condate,subdat)

## Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px",bg = "white")
par(mfrow = c(2, 2), mar=c(4,4,2,2), oma=c(1.5,2,0,0))
#row = 1 & column =1
plot(plot2dat$Global_active_power ~ plot2dat$condate, type = "l",xlab ="", ylab = "Global Active Power")
#row = 1 & column = 2
plot(as.numeric(plot2dat$Voltage) ~ plot2dat$condate, type = "l",xlab ="datetime", ylab = "Voltage")
#row = 2 & column = 1
{with(plot2dat,plot(as.numeric(plot2dat$Sub_metering_1) ~ condate,type = "n",ylab = "Energy sub metering", xlab = ""))
 lines(as.numeric(plot2dat$Sub_metering_1) ~ plot2dat$condate,type = "l",col = "black")
 lines(as.numeric(plot2dat$Sub_metering_2) ~ plot2dat$condate,type = "l",col = "red")
 lines(plot2dat$Sub_metering_3 ~ plot2dat$condate, type = "l", col = "blue")
 legend("topright", lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")}
#row = 2 & column = 2
plot(as.numeric(plot2dat$Global_reactive_power) ~ plot2dat$condate, type = "l",xlab ="datetime",ylab = "Global_reactive_power")
dev.off()