#EXploratory Data Analysis, Course Project 2
#Date - 24/08/2014(dd/mm/yyyy)
#Author - Vishwa Nath Jha

#Loading datasets for the assignments

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Subsetting for Baltimore City, Maryland

MaryD.onroad <- subset(NEI, fips == '24510' & type == 'ON-ROAD')

# Subsetting for Los Angeles County, California
CA.onroad <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

# Aggregate
MaryD.DF <- aggregate(MaryD.onroad[, 'Emissions'], by=list(MaryD.onroad$year), sum)
colnames(MaryD.DF) <- c('year', 'Emissions')
MaryD.DF$City <- paste(rep('MaryD', 4))

CA.DF <- aggregate(CA.onroad[, 'Emissions'], by=list(CA.onroad$year), sum)
colnames(CA.DF) <- c('year', 'Emissions')
CA.DF$City <- paste(rep('CA', 4))

DF <- as.data.frame(rbind(MaryD.DF, CA.DF))

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time 
# in motor vehicle emissions?

ggplot(data=DF, aes(x=year, y=Emissions)) + geom_line(aes(group = 1, col=year)) + geom_point(aes(size=2, col=year)) + 
  ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + facet_grid(. ~ City) + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))


#Creating the plots in the same directory
dev.copy(png, file="plot6.png", width=900, height=600, units='px')
dev.off()
