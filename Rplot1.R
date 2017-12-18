  ## Aim of this function is reading the household power consumption file
  ## Data subset used is from 2007-02-01 to 2007-02-02 only
  ## Histogram of global active power(kilowatts) will be generated
  ## Dataset Internet source: Electric power consumption [20Mb]
  ## Household_power_consumption.txt is downloaded to working dir
  
  ## Read full dataset from working Directory
  power_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                         nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
  
  ## Subset data from 2007-02-01 to 2007-02-02
  data <- subset(power_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  rm(power_data)
  
  ## Date conversion
  datetime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(datetime)
  
  ## Plot1 histogram from 2007-02-01 to 2007-02-02
  hist(data$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
  
  ## Saving to file
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()