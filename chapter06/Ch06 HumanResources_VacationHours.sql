SELECT 
[JobTitle]
,sum([VacationHours]) as VacationHours

FROM [AdventureWorks2014].[HumanResources].[Employee]
group by [JobTitle]
order by [VacationHours] desc; 
