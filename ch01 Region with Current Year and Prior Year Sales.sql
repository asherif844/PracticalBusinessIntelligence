Select 
region.Name as Region
,round(sum(sales.SalesYTD),2) as SalesYTD
,round(sum(sales.SalesLastYear),2) as SalesPY
FROM [AdventureWorks2014].[Sales].[SalesTerritory] region
left outer join [AdventureWorks2014].[Sales].[SalesPerson] sales on
sales.TerritoryID = region.TerritoryID
where region.CountryRegionCode = 'US'
Group by region.Name
order by region.Name asc
