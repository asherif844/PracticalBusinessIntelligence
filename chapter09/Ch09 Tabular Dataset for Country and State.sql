SELECT 
[CountryRegionName]	as 'Country'
,[StateProvinceName] as 'State'
,count([BusinessEntityID]) as 'Unit Counts'

FROM [AdventureWorks2014].[Sales].[vIndividualCustomer]
Group by 
[CountryRegionName]
,[StateProvinceName]
