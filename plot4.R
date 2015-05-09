
library ("data.table") #load data.table library so that fread function is available
df<-fread("household_power_consumption.txt") #read the txt file from your working directory
df1<-subset(df,df$Date %in% c("1/2/2007","2/2/2007")) #create a subset just looking at feb1 and feb2 2007

df1$datetime<-paste(df1$Date,df1$Time)
##creates a datetime field so that graphs can incorporate both

png(filename = "plot4.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)
##opens png device and sets desired image size to 480x480, and designates "plot4.png" as the output file

par(mfcol=c(2,2)) ##sets the plot output to 2x2 graphs
par(mar=c(5,5,1,1)) #sets margins so that multiple graphs fit on page

##graph 1:
plot(strptime(df1$datetime,'%d/%m/%Y %H:%M:%S'), as.numeric(df1$Global_active_power), type = "l",xlab="",ylab="Global Active Power")  
##above line creates linegraph of GAP over time, removes x label and modifies y label

##graph 2:
plot(strptime(df1$datetime,'%d/%m/%Y %H:%M:%S'), as.numeric(df1$Sub_metering_1), type = "l",xlab="",ylab="Energy sub metering")
##above line creates linegraph of sub-metering_1 over time, removes x label and modifies y label
lines(strptime(df1$datetime,'%d/%m/%Y %H:%M:%S'),as.numeric(df1$Sub_metering_2), type = "l", col="red")
##adds the red line for sub-metering 2
lines(strptime(df1$datetime,'%d/%m/%Y %H:%M:%S'),as.numeric(df1$Sub_metering_3), type = "l", col="blue")
##adds the blue line for sub_metering_3
legend("topright",lty=c(1,1), col=c("black","red","blue"),legend=c("Sub_Metering 1","Sub_Metering 2","Sub_metering 3"),bty="n", cex=0.8) 
# adds the legend to topright corner, colors legend items and provides legend text

##graph 3:
plot(strptime(df1$datetime,'%d/%m/%Y %H:%M:%S'), as.numeric(df1$Voltage), type = "l",xlab="datetime",ylab="Voltage")

##graph 4:
plot(strptime(df1$datetime,'%d/%m/%Y %H:%M:%S'), as.numeric(df1$Global_reactive_power), type = "l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
##above line turns the png device off
