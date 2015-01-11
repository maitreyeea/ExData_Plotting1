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

## Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px",bg = "white")
plot(plot2dat$Global_active_power ~ plot2dat$condate, type = "l",xlab ="", ylab = "Global Active Power(kilowatts)")
dev.off()
