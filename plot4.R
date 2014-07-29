library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC  <- SCC[grepl("Coal",SCC$SCC.Level.Three),]
NEI <- NEI[NEI$SCC %in% SCC$SCC,]
plotdata <- aggregate(Emissions ~year,data=NEI,sum)
png("plot4.png",width = 480, height = 480, units = "px")
plot <- ggplot(data=plotdata,aes(x=as.factor(year),y=Emissions)) + geom_bar(fill="red",
         stat="identity") + ggtitle("Emissions from coal \n combustion-related sources in US") + 
    xlab("Year") +
    ylab("Emisssions (in tons)")
print(plot)
dev.off()