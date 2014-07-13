'Ensure directory with source file is the home directory'

'Reading and Subsetting the source file for the two dates'
df1=subset(read.table(file="household_power_consumption.txt",header=TRUE,sep=";"),Date %in% c("1/2/2007",   "2/2/2007"))

'Changing DATE into appropriate datetime format by combining date and time variables'

df_strp=strptime(paste(df1$Date,df1$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
df2=data.frame(df1,df_strp)

'Plot 3'



png("plot3.png",width=480,height=480)

par(mfrow=c(1,1))

with(df2,plot(df_strp,df2$Sub_metering_1,type="n",ylim=c(0,38),xlab="",ylab="Energy sub metering "))
with(df2,points(df_strp,as.numeric(as.character(df2$Sub_metering_1)),type="l",col="black"))
with(df2,points(df_strp,as.numeric(as.character(df2$Sub_metering_2)),type="l",col="red"))
with(df2,points(df_strp,as.numeric(as.character(df2$Sub_metering_3)),type="l",col="blue"))
legend("topright",lty=1,lwd=2.5,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
