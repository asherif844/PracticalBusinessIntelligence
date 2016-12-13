CREATE PROCEDURE dbo.Crosstab as

Declare @CountryNames NVARCHAR(4000)= ''
Declare @SQL_Statement NVARCHAR(4000) = ''		
SELECT @CountryNames += quotename(CountryRegionName)+','
  FROM [AdventureWorks2014].[Sales].[vIndividualCustomer]
group by CountryRegionName

set @CountryNames = substring(@CountryNames,1, len(@CountryNames)-1)

--print @CountryNames


set @SQL_Statement = 
'SELECT * 
FROM
(SELECT
[CountryRegionName]
,[StateProvinceName]
,[BusinessEntityID] 
FROM [AdventureWorks2014].[Sales].[vIndividualCustomer]
) as tabular

PIVOT (
Count([BusinessEntityID])
FOR [CountryRegionName]
IN 
('
+@CountryNames+
')) as NewPivot ' 

--print @SQL_Statement

execute sp_executesql @SQL_Statement