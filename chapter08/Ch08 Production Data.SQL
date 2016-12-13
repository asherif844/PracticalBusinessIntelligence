SELECT 
loc.Name as WarehouseName
,inv.ProductID
,prod.Name as ProductName
,sum(inv.Quantity) as Inventory
,sum(prod.ReorderPoint) as ReorderPoint
,case when sum(inv.Quantity) > sum(prod.ReorderPoint) then 'N' else 'Y' end as ReorderFlag

FROM [AdventureWorks2014].[Production].[Location] as loc
inner join [AdventureWorks2014].[Production].[ProductInventory] as inv on
loc.LocationID = inv.LocationID
inner join [AdventureWorks2014].[Production].[Product] as prod on 
prod.ProductID =  inv.ProductID


group by 
loc.Name
,inv.ProductID
,prod.Name
