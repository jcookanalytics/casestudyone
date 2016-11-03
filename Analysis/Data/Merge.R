#Merge the data together
#Do not use all = TRUE.  This will cause to lose the data for the first question
GDP.Edu <- merge(x=GDP.clean, y=EduData.clean,by="CountryCode")
