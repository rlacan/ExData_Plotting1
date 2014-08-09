## CREATE THE 4th PLOT
## READING DATA
data_energy<-read.table("household_power_consumption.txt",sep=";",header=TRUE) ## read the data from the file on the working directory
data_energy$Date<-as.Date(data_energy$Date,format="%d/%m/%Y") ## convert the column date on date type
data_energy1<-subset(data_energy, data_energy$Date=="2007/02/02"|data_energy$Date=="2007/02/01") ## subset the data of 2007/02/02 and 2007/02/01
data_energy<-data_energy1
data_energy$Date_Time<-paste(data_energy$Date, data_energy$Time) ## convert de new column with the Date and Time paste
data_energy$Date_Time<-strptime(data_energy$Date_Time,format="%Y-%m-%d %H:%M:%S") ## convert the data type
## CREATE THE 4th PLOT
par(mfrow=c(2,2),cex=0.6) ## set general parametres
## FIRST PLOT
with(data_energy,plot(Date_Time,as.numeric(as.character(Global_active_power)),type="l",ylab="Global Active Power",xlab=""))
## SECOND PLOT
with(data_energy,plot(Date_Time,as.numeric(as.character(Voltage)),type="l",ylab="Voltage",xlab="datetime"))
## THIRD PLOT
with(data_energy,plot(Date_Time,as.numeric(as.character(Sub_metering_1)),type="n",xlab="",ylab="Energy sub metering")); with(data_energy,lines(Date_Time,as.numeric(as.character(Sub_metering_1)))); with(data_energy,lines(Date_Time,as.numeric(as.character(Sub_metering_2)),col="red")); with(data_energy,lines(Date_Time,as.numeric(as.character(Sub_metering_3)),col="blue"));legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lty=0)
## FOURTH PLOT
with(data_energy,plot(Date_Time,as.numeric(as.character(Global_reactive_power)),type="l",ylab="Global reactive power",xlab="datatime"))
## CREATE PNG FILE
png(filename = "plot4.png", width = 480, height = 480, units = "px")
