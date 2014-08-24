#EXploratory Data Analysis, Course Project 2
#Date - 24/08/2014(dd/mm/yyyy)
#Author - Vishwa Nath Jha

#Loading datasets for the assignments

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Subsetting data for Baltimore City, Maryland & On-Road

MaryD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MaryD.df <- aggregate(MaryD.onroad[, 'Emissions'], by=list(MaryD.onroad$year), sum)
colnames(MaryD.df) <- c('year', 'Emissions')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

ggplot(data=MaryD.df, aes(x=year, y=Emissions)) + geom_line(aes(group = 1, col=year)) + geom_point(aes(size=2, col=year)) + 
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))


#Creating the plots in the same directory
dev.copy(png, file="plot5.png", width=900, height=600, units='px')
dev.off()
