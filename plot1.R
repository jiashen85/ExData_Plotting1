#Step1: Read the data of 1/2/2007 and 2/2/2007 into R

df<-read.table("./household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings="?")
#reassign column names as the selective reading didn't read in the column names.
names(df)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
 
#make another column put Date and Time together which are already converted using strptime function. 
df$Datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
 

#plot 1: histagram of Global Active Power's frequency 
hist(df$Global_active_power, main = "Global Active Power", ylab = "Frequency",xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0,1200), xlim = c(0, 6), xaxp = c(0, 6, 3))