#EXploratory Data Analysis, Course Project 2
#Date - 24/08/2014(dd/mm/yyyy)
#Author - Vishwa Nath Jha

#Loading datasets for the assignments

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

#Aggregating by year to check the trend 

Emissions <- aggregate(NEI[,'Emissions'],by=list(NEI$year),FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources
#for each of the years 1999, 2002, 2005, and 2008.

#Creating the barplots

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

#Creating the plots in the same directory
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
