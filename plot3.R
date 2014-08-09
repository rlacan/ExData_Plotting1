## CREATE THE 3th PLOT
## READING DATA
data_energy<-read.table("household_power_consumption.txt",sep=";",header=TRUE) ## read the data from the file on the working directory
data_energy$Date<-as.Date(data_energy$Date,format="%d/%m/%Y") ## convert the column date on date type
data_energy1<-subset(data_energy, data_energy$Date=="2007/02/02"|data_energy$Date=="2007/02/01") ## subset the data of 2007/02/02 and 2007/02/01
data_energy<-data_energy1
data_energy$Date_Time<-paste(data_energy$Date, data_energy$Time) ## convert de new column with the Date and Time paste
data_energy$Date_Time<-strptime(data_energy$Date_Time,format="%Y-%m-%d %H:%M:%S") ## convert the data type
## CREATE THE 3th PLOT
par(mfrow=c(1,1),mar=c(4,4,1,2)) ## set general parametres
## BASE PLOT
with(data_energy,plot(Date_Time,as.numeric(as.character(Sub_metering_1)),type="n",xlab="",ylab="Energy sub metering")) ## the base plot
## FIRST PLOT
with(data_energy,lines(Date_Time,as.numeric(as.character(Sub_metering_1))))## create the 1st plot
## SECOND PLOT
with(data_energy,lines(Date_Time,as.numeric(as.character(Sub_metering_2)),col="red")) ## create the 2nd plot
## 3th PLOT
with(data_energy,lines(Date_Time,as.numeric(as.character(Sub_metering_3)),col="blue")) ## create the 3th plot
## LEGEND
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.9) ## create the legend
## CREATE PNG FILE
png(filename = "plot3.png", width = 480, height = 480, units = "px") ## create the png file
