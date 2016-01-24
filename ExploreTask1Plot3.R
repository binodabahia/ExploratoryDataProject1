#Reads test data
mydata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
dates<-as.Date(mydata$Date, format="%d/%m/%Y")
times=strptime(mydata$Time,format="%H:%M:%S")
times2<-sub(".* ", "", times)
mydata2<-mydata
mydata2$Date<-dates
mydata2$Time<-times2
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
mydata3 <- mydata2[mydata2$Date >= DATE1 & mydata2$Date <= DATE2,]
mydata3$Global_active_power<-as.numeric(as.character((mydata3$Global_active_power)))


library(dplyr)

Pdata <- mutate(mydata3,Date.Time=paste(mydata3$Date,mydata3$Time))
DateTime <- strptime(Pdata$Date.Time,format="%Y-%m-%d %H:%M:%S")
Pdata$Date.Time<-DateTime
Pdata$Sub_metering_1<-as.numeric(as.character((Pdata$Sub_metering_1)))
with(Pdata,plot(Date.Time,Sub_metering_1,type='l',xlab="",ylab="Energy Sub Metering",ylim=c(0,40),col="black"))
lines(Pdata$Date.Time,as.numeric(as.character(Pdata$Sub_metering_2)),ylim=range(0,40),col="red")
lines(Pdata$Date.Time,Pdata$Sub_metering_3,ylim=range(0,40),col="blue")
#par(new=T)
#with(Pdata,plot(Date.Time,Sub_metering_2,type='l',axes=F,col="red"))
# with(Pdata,plot(Date.Time,Sub_metering_1,type='l',axes=F,col="black"))
# par(new=F)


#Pdata <- select(Pdata,Date.Time,Global_active_power:Sub_metering_3,-Date,-Time)
dev.copy(png, file = "GlobalActivePower3.png")
dev.off()