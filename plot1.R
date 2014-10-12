#Load sqldf package
require("sqldf")

#Read data from CSV
t2 <- read.table('household_power_consumption.txt',sep = ";",header = TRUE,
	as.is = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity',
	'Sub_metering_1','Sub_metering_2','Sub_metering_3'))

#Subset to keep required data
t2 <- sqldf('select Global_active_power from t2 where Date in ("2/2/2007","1/2/2007")')

#Cast Active power to numeric
t2$Global_active_power <- as.numeric(t2$Global_active_power)

#Create plot
png(filename = "plot1.png",width = 480, height = 480,units="px") 
hist(t2$Global_active_power,ylim = c(0,1200),xlab = "Global Active Power(Kilowatts)"
     ,main = "Global Active Power",col = "red")
dev.off()