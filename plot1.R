## CREATE THE 1st PLOT
## READING DATA
data_energy<-read.table("household_power_consumption.txt",sep=";",header=TRUE) ## read the data from the file on the working directory
data_energy$Date<-as.Date(data_energy$Date,format="%d/%m/%Y") ## convert the column date on date type
data_energy1<-subset(data_energy, data_energy$Date=="2007/02/02"|data_energy$Date=="2007/02/01") ## subset the data of 2007/02/02 and 2007/02/01
data_energy<-data_energy1
data_energy$Date_Time<-paste(data_energy$Date, data_energy$Time) ## convert de new column with the Date and Time paste
data_energy$Date_Time<-strptime(data_energy$Date_Time,format="%Y-%m-%d %H:%M:%S") ## convert the data type
## CREATE PLOT
par(mfrow=c(1,1),mar=c(4,4,1,2)) ## set general parametres
hist(as.numeric(as.character(data_energy$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",cex=0.7) ## create de 1st plott
png(filename = "plot1.png", width = 480, height = 480, units = "px") ## create the png
