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


#PLOT 1
hist(mydata3$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="orange",
     xlim=c(0,6),
     breaks=12)

dev.copy(png, file = "GlobalActivePower.png")
dev.off()

#PLOT 2
hist(mydata3$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="orange",
     xlim=c(0,6),
     breaks=12)

dev.copy(png, file = "GlobalActivePower.png")
dev.off()
