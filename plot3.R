library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[NEI$fips=="24510",]
plotdata <- aggregate(Emissions ~ year+type,data=NEI,sum)
png("plot3.png",width = 480, height = 480, units = "px")
plot <- qplot(year,Emissions,data=plotdata,geom="line",color=plotdata$type,
              main="Total emissions by source types for  Baltimore City", 
              xlab="Year",ylab="Emisssions (in tons)") + 
            scale_colour_discrete(name = "Type of source")
print(plot)
dev.off()