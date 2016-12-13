 SELECT 
 StoreAddress.City as 'City'
,StoreAddress.Name as 'Store Name'
,StoreAddress.PostalCode as 'Postal Code'
,sum(StoreDemo.NumberEmployees) as 'Number of Employees'
 
 FROM [AdventureWorks2014].[Sales].[vStoreWithAddresses] as StoreAddress
 INNER JOIN [AdventureWorks2014].[Sales].[vStoreWithDemographics] StoreDemo on
 StoreAddress.BusinessEntityID=StoreDemo.BusinessEntityID 
 
 Group by 
 StoreAddress.City
,StoreAddress.Name
,StoreAddress.PostalCode
 order by 1 asc;