library ("data.table") #load data.table library so that fread function is available
df<-fread("household_power_consumption.txt") #read the txt file from your working directory
df1<-subset(df,df$Date %in% c("1/2/2007","2/2/2007")) #create a subset just looking at feb1 and feb2 2007

df1$datetime<-paste(df1$Date,df1$Time)
##creates a datetime field so that graphs can incorporate both
plot(strptime(df1$datetime,'%d/%m/%Y %H:%M:%S'), as.numeric(df1$Global_active_power), type = "l",xlab="",ylab="Global Active Power (kilowatts)")  
##above line creates linegraph of GAP over time, removes x label and modifies y label

dev.copy(png,'plot2.png') > dev.off()
##above line writes the graphic to png file
