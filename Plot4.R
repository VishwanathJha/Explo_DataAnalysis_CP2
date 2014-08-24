#EXploratory Data Analysis, Course Project 2
#Date - 24/08/2014(dd/mm/yyyy)
#Author - Vishwa Nath Jha

#Loading datasets for the assignments

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]



# Merge two data sets
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

#creating plots using ggplot2

ggplot(data=merge.sum, aes(x=Year, y=Emissions/1000)) + 
  geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle(expression('Total Emissions of PM'[2.5])) + 
  ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
  theme(legend.position='none') + scale_colour_gradient(low='black', high='red')


#Creating the plots in the same directory
dev.copy(png, file="plot4.png", width=900, height=600, units='px')
dev.off()
