library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[NEI$fips=="24510" | NEI$fips=="06037",]
SCC <- readRDS("Source_Classification_Code.rds")
SCC  <- SCC[grepl("Motor",SCC$SCC.Level.Three),]
NEI <- NEI[NEI$SCC %in% SCC$SCC,]
plotdata <- aggregate(Emissions ~ year+fips,data=NEI,sum)
bc <- plotdata[plotdata$fips=="24510",]
bc$index <- 100*bc$Emissions/bc$Emissions[bc$year=="1999"]
la <- plotdata[plotdata$fips=="06037",]
la$index <- 100*la$Emissions/la$Emissions[la$year=="1999"]
plotdata <- rbind(bc,la)
png("plot6.png",width = 480, height = 480, units = "px")
plot <- ggplot(data=plotdata,aes(x=as.factor(year),y=index,fill=fips)) + geom_bar(
    stat="identity",position=position_dodge()) + scale_fill_discrete(
        name="Region", breaks=c("06037","24510"),
        labels=c("Los Angeles County","Baltimore City")) + ggtitle(
            "Changes in emissions from Motor Vehicles\n sources in Baltimore City vs. Los Angeles County") + 
    xlab("Year") +
    ylab("Index of changes (base value is 1999)")
print(plot)
dev.off()