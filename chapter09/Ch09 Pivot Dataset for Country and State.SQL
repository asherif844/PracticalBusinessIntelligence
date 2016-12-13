SELECT * 
FROM
(SELECT
[CountryRegionName]
,[StateProvinceName]
,[BusinessEntityID] 
FROM [AdventureWorks2014].[Sales].[vIndividualCustomer]
where CountryRegionName IN ('Canada', 'France', 'United Kingdom')
) as tabular

PIVOT (
Count([BusinessEntityID])
FOR [CountryRegionName]
IN 
([Canada],[France],[United Kingdom])) as NewPivot