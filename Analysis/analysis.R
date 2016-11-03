##Analysis
#Question 1
#Showing the number of countries that match from the datasets
matches <- nrow(GDP.Edu)

paste("The number of country codes that match is:",matches)

#Question 2

asc.GDP <- GDP.Edu[order(GDP.Edu$GDP.in.US.Dollars.2012),]

paste(asc.GDP[13,"Country"], "is the Country with the 13th lowest GDP in the dataset ")

#Question 3

High.income.OECD <- GDP.Edu[GDP.Edu$Income.Group=="High income: OECD",]
average.Rank.High.income.OECD <- mean(High.income.OECD$GDP.Rank)
High.income.non.OECD <- GDP.Edu[GDP.Edu$Income.Group=="High income: nonOECD",]
average.Rank.High.income.non.OECD <- mean(High.income.non.OECD$GDP.Rank)

###The averages of high income countries in the OECD
round(average.Rank.High.income.OECD,2)

###The average rank of high income countries not in the OECD
round(average.Rank.High.income.non.OECD,2)

###The difference between the two groups
round(average.Rank.High.income.non.OECD-average.Rank.High.income.OECD,2)

#As we can see there is a clear difference in the GDP rankings between these groups


#Question 4
#adding additional libraries to plot the GDP data
library(ggplot2)
library(scales)
#Plotted by Rank instead of by Country as it would include all the countries and plot looked a lot cleaner
#interpretion of each data point also makes a lot more sense
ggplot(data=GDP.Edu, aes(x=-GDP.Rank,y=GDP.in.US.Dollars.2012, color = factor(Income.Group)))+ geom_point()+ labs(x="Country Rank",y="GDP in Millions US") + theme(legend.title = element_text(color = "black", size=16, face="bold")) + scale_color_discrete(name="Income Group") + scale_y_continuous(labels= comma)

#As we can see from the plot most countries have a very similar GDP.  Only the Top 6 even reach a GDP over over 2.5 trillion US dollars.  There is not significant increase in GDP   
           
#Question 5
quintiles <- cut(GDP.Edu$GDP.Rank,breaks=c(0,38.1,76.1,114.1,152.1,190.1),labels= c(1,2,3,4,5))
GDP.Edu$Group <- as.character(quintiles)
GDP.lower.middle.income.1 <- GDP.Edu[GDP.Edu$Income.Group=="Lower middle income" & GDP.Edu$Group=="1",]

#Of the 38 highest ranked countries
nrow(GDP.lower.middle.income.1) 
#are lower middle income Countries.