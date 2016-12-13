USE [AdventureWorks2014] --Identifies the Database to assign the view
GO

CREATE VIEW [Sales].[vSalesAmountbySalesReason] AS --Naming the View
SELECT
distinct
SalesReason.Name as 'Sale Reason Name'
,SalesReason.ReasonType as 'Sale Reason Type'
,sum(round(SalesOrderHeader.SubTotal,2)) as 'Sales Amount'
,sum(round(SalesOrderHeader.TaxAmt,2)) as 'Tax'
,sum(round(SalesOrderHeader.Freight,2)) as 'Freight Amount'

FROM [AdventureWorks2014].[Sales].[SalesReason] as SalesReason

inner join [AdventureWorks2014].[Sales].[SalesOrderHeaderSalesReason] as SalesOrderHeaderSalesReason on 
SalesOrderHeaderSalesReason.SalesReasonID = SalesReason.SalesReasonID 


inner join [AdventureWorks2014].[Sales].[SalesOrderHeader] as SalesOrderHeader on
SalesOrderHeader.SalesOrderID = SalesOrderHeaderSalesReason.SalesOrderID

where
SalesReason.Name <> 'Other'

Group by SalesReason.Name, SalesReason.ReasonType
