#EXploratory Data Analysis, Course Project 2
#Date - 24/08/2014(dd/mm/yyyy)
#Author - Vishwa Nath Jha

#Loading datasets for the assignments

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")


#Have total emissions from PM2.5 decreased in
#the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

#subsetting data for Baltimore county, Maryland
MaryD <- subset(NEI, fips=='24510')

#creating barplots 

barplot(tapply(X=MaryD$Emissions, INDEX=MaryD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MaryD', 
        xlab='Year', ylab=expression('PM'[2.5]))

#Creating the plots in the same directory
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
