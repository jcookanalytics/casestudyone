#load repmis package
library(repmis)

#loading the 2012 GDP raw data
GDP <- source_data("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")

#subset the data to exclude extra columns
GDP.clean <- GDP[,c(1:2,4:5)]

#rename the columns
colnames(GDP.clean) <- c("CountryCode","GDP.Rank","Country","GDP.in.US.Dollars.2012")

#Subset to remove blank rows and notes
GDP.clean <- GDP.clean[GDP.clean$CountryCode!="",]
GDP.clean <- GDP.clean[GDP.clean$GDP.Rank!="",]

#Change GDP ranking to numeric to allow correct sorting
GDP.clean <- transform(GDP.clean, GDP.Rank = as.numeric(GDP.Rank))

#Change GDP in US dollars to be a number by substituting all the commas out and changing the class to numeric
GDP.clean <- transform(GDP.clean, GDP.in.US.Dollars.2012 = as.numeric(gsub(",","",GDP.in.US.Dollars.2012)))
