'Ensure directory with source file is the home directory'

'Reading and Subsetting the source file for the two dates'
df1=subset(read.table(file="household_power_consumption.txt",header=TRUE,sep=";"),Date %in% c("1/2/2007",   "2/2/2007"))

'Changing DATE into appropriate datetime format by combining date and time variables'

df_strp=strptime(paste(df1$Date,df1$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
df2=data.frame(df1,df_strp)

'Plot 1'

png("plot1.png",width=480,height=480)

par(mfrow=c(1,1))

hist(as.numeric(as.character(df2$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

dev.off()
