SELECT 
[StateProvinceName] as 'State'
,case when [CountryRegionName] = 'Canada' then count([BusinessEntityID]) else 0 end as 'Canada'
,case when [CountryRegionName] = 'France' then count([BusinessEntityID]) else 0 end as 'France'
,case when [CountryRegionName] = 'United Kingdom' then count([BusinessEntityID]) else 0 end as 'United Kingdom'


FROM [AdventureWorks2014].[Sales].[vIndividualCustomer]
where [CountryRegionName] IN ('Canada', 'France', 'United Kingdom')
Group by 
[CountryRegionName]
,[StateProvinceName]
Order by 1 asc;
