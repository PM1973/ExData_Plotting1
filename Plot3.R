## Reading in the entire dataset from my working directory into R
## The dataset has 2,075,259 rows and 9 columns 
entire_dataset <- read.csv("./COURSE PROJECT1_EDA/household_power_consumption.txt", 
             header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, 
             stringsAsFactors=F, comment.char="", quote='\"') 
entire_dataset$Date <- as.Date(entire_dataset$Date, format="%d/%m/%Y") 
 

## We will only be using data from the dates 2007-02-01 and 2007-02-02
## Subsetting to those dates
data <- subset(entire_dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(entire_dataset) 


## Converting the Date and Time variables to Date/Time classes in R 
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 


## Making the plot 3 in order to examine how household energy usage
## varies over a 2-day period in February, 2007
with(data, { 
       plot(Sub_metering_1~Datetime, type="l", 
            ylab="Energy sub metering", xlab="") 
       lines(Sub_metering_2~Datetime,col='Red') 
       lines(Sub_metering_3~Datetime,col='Blue') 
   }) 
 legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

 
## Naming the plot and saving it to a png file 
dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 

