#EXploratory Data Analysis, Course Project 2
#Date - 24/08/2014(dd/mm/yyyy)
#Author - Vishwa Nath Jha

#Loading datasets for the assignments

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
#variable, which of these four sources have seen decreases in emissions from 1999–2008
#for Baltimore City? Which have seen increases in emissions from 1999–2008?
#Use the ggplot2 plotting system to make a plot answer this question.


#subsetting data for Baltimore county, Maryland
MaryD <- subset(NEI, fips=='24510')
MaryD$year <- factor(MaryD$year, levels=c('1999', '2002', '2005', '2008'))

#creating plots using ggplot2

ggplot(data=MaryD, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City, Maryland') +
  geom_jitter(alpha=0.10)


#Creating the plots in the same directory
dev.copy(png, file="plot3.png", width=800, height=500, units='px')
dev.off()
