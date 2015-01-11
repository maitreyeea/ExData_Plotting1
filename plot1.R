## Read Dataset
testdat <- read.table("./household_power_consumption.txt",header = TRUE, sep=';',stringsAsFactors = FALSE)
## Convert char date column to date
dateSub <- testdat[,1]    
char2date <- as.Date(dateSub,format = "%d/%m/%Y")
newdat <- cbind(char2date,testdat)
## Subset data for only 2 dates
subdat <- subset(newdat, char2date >= "2007-02-01" & char2date <= "2007-02-02")

## Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px",bg = "white")
hist(as.numeric(subdat$Global_active_power),xlab = "Global Active Power(kilowatts)",main = "Global Active Power", col = "red")
dev.off()
