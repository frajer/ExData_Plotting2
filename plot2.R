NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[NEI$fips=="24510",]
plotdata <- aggregate(Emissions ~year,data=NEI,sum)
png("plot2.png",width = 480, height = 480, units = "px")
with(plotdata,plot(Emissions ~ year, type="l",col="green",
                   main="Total emissions for Baltimore City", 
                   xlab="Year",ylab="Emisssions (in tons)"))
dev.off()