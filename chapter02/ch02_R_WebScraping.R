
library(XML) #Loads the XML library into our code
library(RCurl) #Loads the RCurl library into our code

getwd() # Retrieves our current working directory
setwd('C:/Users/asher/Desktop') 
#sets working directory to necessary location
#please set your directory to a location that suits you
getwd() # confirm new working directory has been set


url <-"https://github.com/asherif844/PracticalBusinessIntelligence/wiki/AdventureWorks---Weekly-Data-by-Discount"
# defines the url value to be set to the URL link of our choice

get_URL <- getURL(url) # Leverages the RCurl library to bring the link back as a string
str(get_URL) #displays the structure of the variable, which in this case is the link to the website

retrieveTable <- readHTMLTable(get_URL, which = 1) 
#reads the table in an HTML format 
#and which specifies the order of the table if there was more than one
head(retrieveTable) #returns the first five rows of the table
str(retrieveTable)

retrieveTable$DiscountCode <-as.numeric(retrieveTable$DiscountCode)

str(retrieveTable)


write.csv(retrieveTable, file = "DiscountCodebyWeek.csv") #writes #the data frame to a csv file to your directory



