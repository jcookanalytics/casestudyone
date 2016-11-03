#Makefile


#Call World Bank 2012 GDP data
source("./analysis/data/GDPdata.R")

#Call World Bank 2012 Education Data
source("./analysis/data/Edudata.R")

#Merge the datasets together by CountryCode
source("./analysis/data/Merge.R")