NEI <- readRDS("summarySCC_PM25.rds")
plotdata <- aggregate(Emissions ~year,data=NEI,sum)
png("plot1.png",width = 480, height = 480, units = "px")
with(plotdata,plot(Emissions ~ as.factor(year),main="Total emissions in US", 
                   xlab="Year",ylab="Emisssions (in tons)"))
dev.off()