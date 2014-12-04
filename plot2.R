household_power_consumption <- read.table("~/classes/data_science_toolbox/EDA/household_power_consumption.txt", sep=";", quote="\"", stringsAsFactors=FALSE)
x<-household_power_consumption[1,]
hpc<-subset(household_power_consumption,V1=="1/2/2007"|V1=="2/2/2007")
colnames(hpc)<-x
hpc<-hpc[-1,]
hpc$Date<-as.Date(hpc$Date, "%m/%d/%Y")
y<-hpc$Date
z<-hpc$Time
df1<-data.frame(y,z)
zz<-within(df1, { timestamp=format(as.POSIXct(paste(y, z)), "%d/%m/%Y %H:%M:%S") })
d<-strptime(zz[,3],format="%m/%d/%Y %H:%M:%S")
hpc_new<-data.frame(d,hpc)
for (i in 4:10){hpc_new[,i]<-as.numeric(hpc_new[,i])}
plot(hpc_new$d,hpc_new$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab='')