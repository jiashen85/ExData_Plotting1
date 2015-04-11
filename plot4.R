#Step1: In order to make the plot easy to reproduce, data has been read again. So does the time conversion. 

df<-read.table("./household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings="?")
#reassign column names as the selective reading didn't read in the column names. 
names(df)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#make another column put Date and Time together which are already converted using strptime function. 
df$Datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")


#plo4:display 4 plots on the same pane by using with function. 

#specify the margin, outer margin and if it's filled up by row or column. 
par(mfrow=c(2,2),mar=c(2,2,2,2),oma=(0,0,2,0))

with(df,{
 plot(df$Datetime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
 plot(df$Datetime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
 plot(df$Datetime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
 plot(df$Datetime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})


points(df$Datetime, df$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering",col = "red")
points(df$Datetime, df$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering",col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))