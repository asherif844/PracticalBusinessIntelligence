#Installing and calling packages for RODBC to be setup for access to the SQL Server#
install.packages('RODBC')
library('RODBC')

connection_SQLBI<-odbcConnect("SQLBI")

#Get Connection Details 
connection_SQLBI

##query fetching begin##
SQL_Query_1<-sqlQuery(connection_SQLBI,
        'SELECT [WeekInYear]
        ,[DiscountCode]
        FROM [AdventureWorks2014].[dbo].[DiscountCodebyWeek]' )
##query fetching end##

head(SQL_Query_1)
str(SQL_Query_1)

##Change Column Names##
colnames(SQL_Query_1)<- c("Week", "Discount")

#Create a new column
SQL_Query_1$Weeks <- as.numeric(SQL_Query_1$Week)

SQL_Query_1<-SQL_Query_1[,-1] #removes first column
SQL_Query_1<-SQL_Query_1[c(2,1)] #reverses columns 1 and 2
attach(SQL_Query_1) #allows environment to recognize dataframe innately
head(SQL_Query_1) #previews first six rows

plot(SQL_Query_1, main = 'Discount Code by Week')
plot(SQL_Query_1, main = 'Discount Code by Week', type="o")

par(mfrow=c(2,1)) #develops the matrix
plot(SQL_Query_1, main = 'Discount Code by Week')
plot(SQL_Query_1, main = 'Discount Code by Week', type="o")

#ggplots
install.packages('ggplot2')
library('ggplot2')

point_plot <- ggplot(SQL_Query_1, aes(x=jitter(Weeks), y=jitter(Discount), col=Discount)) + 
  geom_line() + geom_point()+
  labs(x="Weeks (1-52)", y="Discount Code", col="Discount Code", title="Discount Code by Week")
point_plot + theme_bw()




#advanced line plots

install.packages('plotly')
library('plotly')

plot_ly(data = SQL_Query_1, x = Weeks, y = Discount, type = 'scatter', mode = 'lines') %>%
  layout(title = 'Discount Code by Week',
         xaxis = list(title = 'Weeks (1-52)',
                      zeroline = TRUE),
         yaxis = list(title = 'Discount Code'))




str(p <- plot_ly(SQL_Query_1, x = Weeks, y = Discount, name = 'Discount',type = 'scatter',  mode = 'lines'))

p %>%
  add_trace(y = fitted(loess(Discount ~ Weeks)), x = Weeks, name = 'Average') %>%
  layout(title = 'Discount Code by Week + 52-Week Average',
         xaxis = list(title = 'Weeks (1-52)',
                      zeroline = TRUE),
         yaxis = list(title = 'Discount Code'))



plot_ly(SQL_Query_1, x = Weeks, y = Discount, mode='markers', color=Discount, size = Discount)%>%
  layout(title = 'Discount Code by Week',
       xaxis = list(title = 'Weeks (1-52)',
                    zeroline = TRUE),
       yaxis = list(title = 'Discount Code'))

#end advanced line plots


#begin forecasting code
install.packages('forecast')
library('forecast')
Query1_TS<-ts(SQL_Query_1$Discount)

par(mfrow=c(3,1))
plot.ts(Query1_TS, xlab = 'Week (1-52)', ylab = 'Discount', main = 'Time Series of Discount Code by Week')

discountforecasts <- HoltWinters(Query1_TS, beta=FALSE, gamma=FALSE)
plot(discountforecasts)

discountforecasts_8periods <- forecast.HoltWinters(discountforecasts, h=8)
plot.forecast(discountforecasts_8periods, ylab='Discount', xlab = 'Weeks (1-60)', main = 'Forecasting 8 periods')


