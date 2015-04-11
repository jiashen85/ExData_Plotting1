#Step1: In order to make the plot easy to reproduce, data has been read again. So does the time conversion. 

df<-read.table("./household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings="?")
#reassign column names as the selective reading didn't read in the column names. 
names(df)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#make another column put Date and Time together which are already converted using strptime function.
df$Datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
 

#plot2: plot a graphic with x-axis being the weekdays of 1/2/3007 and 2/2/2007 and y-axis being "Global Active Power (kilowatts)".
#the continuous line graphic is generated over the time of the weekdays. Therefore, the "Datetime" column is used. 
  
  plot(df$Datetime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
