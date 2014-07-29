library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[NEI$fips=="24510",]
SCC <- readRDS("Source_Classification_Code.rds")
SCC  <- SCC[grepl("Motor",SCC$SCC.Level.Three),]
NEI <- NEI[NEI$SCC %in% SCC$SCC,]
plotdata <- aggregate(Emissions ~ year,data=NEI,sum)
png("plot5.png",width = 480, height = 480, units = "px")
plot <- ggplot(data=plotdata,aes(x=as.factor(year),y=Emissions)) + geom_bar(fill="blue",
    stat="identity") + ggtitle(
            "Emissions from Motor Vehicles\n sources in Baltimore City") + 
    xlab("Year") +
    ylab("Emisssions (in tons)")
print(plot)
dev.off()