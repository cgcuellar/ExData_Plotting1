data <- read.csv("household_power_consumption.txt", header = T, sep = ";", 
	na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors=F, 
	comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subset_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(data)

subset_data_time <- paste(as.Date(subset_data$Date), subset_data$Time)

subset_data$Datetime <- as.POSIXct(subset_data_time)

plot(subset_data$Global_active_power~subset_data$Datetime, 
	type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()