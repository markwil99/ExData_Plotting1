library ("data.table") #load data.table library so that fread function is available
df<-fread("household_power_consumption.txt") #read the txt file from your working directory
df1<-subset(df,df$Date %in% c("1/2/2007","2/2/2007")) #create a subset just looking at feb1 and feb2 2007
hist(as.numeric(df1$Global_active_power),main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", ylim=c(0, 1300))
##above line creates histogram with red bars, showing proper labels and y axis scaled above 1200
dev.copy(png,'plot1.png') > dev.off()
##above line writes the graphic to png file
