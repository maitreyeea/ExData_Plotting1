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

## Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px",bg = "white")
{with(plot2dat,plot(as.numeric(plot2dat$Sub_metering_1) ~ condate,type = "n",ylab = "Energy sub metering", xlab = ""))
lines(as.numeric(plot2dat$Sub_metering_1) ~ plot2dat$condate,type = "l",col = "black")
lines(as.numeric(plot2dat$Sub_metering_2) ~ plot2dat$condate,type = "l",col = "red")
lines(plot2dat$Sub_metering_3 ~ plot2dat$condate, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))}
dev.off()