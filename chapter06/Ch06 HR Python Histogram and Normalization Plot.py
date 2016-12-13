import numpy as np
import pandas as pd
import scipy.stats as stats
from scipy.stats import norm
import matplotlib.pyplot as plt

connection = pypyodbc.connect(driver='{SQL Server}', 
                              server='DESKTOP-3RPUKTS\SQLBI', 
                              database='AdventureWorks2014',               
               trusted_connection='yes')

connection.getinfo

cursor = connection.cursor()

Query = ("SELECT [JobTitle],sum([VacationHours]) as VacationHours FROM" 
		"[AdventureWorks2014].[HumanResources].[Employee]"
        "group by [JobTitle]"
        "order by [VacationHours] asc")

cursor.execute(Query)
results = cursor.fetchall()
type(results)

dataframe = pd.DataFrame(results, columns=["Job Title", "Vacation Hours"])

dataframe.head(20)

%matplotlib inline  
VacationHours=dataframe['Vacation Hours']
plt.hist(VacationHours, normed = True)
plt.title('Vacation Hours')
plt.xlabel('Hours')
plt.ylabel('Count')
plt.show()


Vacation_Hours_mean = np.mean(VacationHours)
Vacation_Hours_std = np.std(VacationHours)

print('mean = '+ str(Vacation_Hours_mean))
print('standard deviation = ' +str(Vacation_Hours_std))

#plot the normal curve
normal_distribution_curve = stats.norm.pdf(VacationHours, Vacation_Hours_mean, Vacation_Hours_std)
plt.title("Vacation Hours")
plt.xlabel("Hours")
plt.ylabel("Count")
plt.plot(VacationHours, normal_distribution_curve, color = "orange")

#plot the normal curve with the histogram
plt.hist(VacationHours, normed = True) # plotting histogram
plt.plot(VacationHours, normal_distribution_curve, color = "orange") #plotting normal curve
plt.title("Vacation Hours") #Assign title
plt.xlabel("Hours") #Assign x label
plt.ylabel("Count") #Assign y label
plt.show()

#plot the normal curve with histogram and vertical line
plt.hist(VacationHours, normed = True) # plotting histogram
plt.plot(VacationHours, normal_distribution_curve, color = "orange") #plotting normal curve
plt.title("Vacation Hours") #Assign title
plt.xlabel("Hours") #Assign x label
plt.ylabel("Count") #Assign y label
plt.axvline(Vacation_Hours_mean, color = "r", linestyle = "dashed", linewidth = 2)
plt.show()

#plot the normal curve with histogram, vertical line, and annotation
plt.hist(VacationHours, normed = True) # plotting histogram
plt.plot(VacationHours, normal_distribution_curve, color = "orange") #plotting normal curve
plt.title("Vacation Hours") #Assign title
plt.xlabel("Hours") #Assign x label
plt.ylabel("Count") #Assign y label
plt.axvline(Vacation_Hours_mean, color = "r", linestyle = "dashed", linewidth = 2)
plt.annotate('Mean = '+ str(round(Vacation_Hours_mean,2)),
            xy=(Vacation_Hours_mean, 0.0013), xycoords='data',
            xytext=(Vacation_Hours_mean*2, 0.0035), textcoords='data',
            arrowprops=dict(arrowstyle="->",
                            connectionstyle="arc3"),)
plt.show()

dataframe.tail(10)

Vacation_Hours_Top10 = dataframe.tail(10)


#plotting with seaborn
import seaborn as sb 
#plotting a histogram
sb.distplot(VacationHours, kde = False, rug=True)

#plotting a normal distribution plot
sb.kdeplot(VacationHours, shade = True)

#plotting a histogram and a normal distribution plot
sb.distplot(VacationHours, kde = True, rug=False)


