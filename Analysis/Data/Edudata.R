#load repmis package
library(repmis)

#loading the 2012 GDP raw data
EduData <- source_data("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")

#remove all the rows that are aggregates of incomes and regions
EduData.clean <- EduData[-grep("aggregate",EduData$`Special Notes`),]

#remove the extra columns that are not being used in the analysis
EduData.clean <- EduData.clean[,c(1,3)]

#rename the table to have names that are easier for r to use
names(EduData.clean) <- c("CountryCode","Income.Group")
