#Step1: In order to make the plot easy to reproduce, data has been read again. So does the time conversion. 

df<-read.table("./household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings="?")
#reassign column names as the selective reading didn't read in the column names. 
names(df)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#make another column to put Date and Time together which are already converted using strptime function. 
df$Datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

#plot3: Plot "sub_metering_1", "sub_metering_2" and "sub_metering_3" against Datetime by marking them into different colors. 
#a legend is created to tell readers which is which. The plot3 is written into the graphics device in this case because some of the legend text will be cut off when saving. 

png(filename = "plot3.png",
    width = 480, height = 480)
par(mfrow=c(1,1))
plot(df$Datetime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
#to add more relationships in the same plot, by simply using points(). 
points(df$Datetime, df$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering",col = "red")
points(df$Datetime, df$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering",col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()