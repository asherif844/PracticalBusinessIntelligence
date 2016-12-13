from bs4 import BeautifulSoup
from urllib.request import urlopen
import pandas as pd
import os #operating system module

os.getcwd() #provides current working directory
os.chdir('C:/Users/asher/Desktop') # changes my working directory to my desktop
#please set your working directory to a location you have easy access to

os.getcwd()

html = urlopen('https://github.com/asherif844/PracticalBusinessIntelligence/wiki/AdventureWorks---Detail-by-CountryCode')

soup = BeautifulSoup(html.read(), "html.parser")

title_1=soup.findAll("table")

CountryRegionCode = []
PercentBikeRides = []
final_table = soup.find('table')

for row in final_table.find_all('tr')[1:]:
# Create a variable of all the <td> tag pairs in each of the #<tr> rows after the first row
    col = row.find_all('td')
    column_1 = col[0].string.strip()
    CountryRegionCode.append(column_1)
    column_2 = col[1].string.strip()
    PercentBikeRides.append(column_2)

columns = {'CountryRegionCode':CountryRegionCode, 'PercentBikeRides':PercentBikeRides}

dataframe=pd.DataFrame(columns)

#preview the first five rows of the dataframe
dataframe.head()

#export the dataframe to a csv file
dataframe.to_csv('CountryRegionBikes.csv')
