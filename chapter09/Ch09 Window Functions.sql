SELECT
CountryRegion.Name as 'Country Name'
,CountryRegionBikes.[PercentBikeRides] as 'Percent Bike Riders'
,RANK() OVER (ORDER BY [PercentBikeRides] DESC) AS 'Ranking'
,DENSE_RANK() OVER (ORDER BY [PercentBikeRides] DESC) AS 'Dense Ranking'
,ROW_NUMBER() OVER (ORDER BY [PercentBikeRides] DESC) AS 'Row Number'

FROM [AdventureWorks2014].[dbo].[CountryRegionBikes] as CountryRegionBikes

inner join [AdventureWorks2014].[Person].[CountryRegion] as CountryRegion on
CountryRegion.CountryRegionCode = CountryRegionBikes.CountryRegionCode

order by 2 desc