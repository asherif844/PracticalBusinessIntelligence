SELECT distinct
       Address1.AddressLine1
      ,Address1.AddressLine2
      ,Address1.City
      ,Address1.StateProvinceID
      ,Address1.PostalCode
	  ,Type_Desc.Name
  FROM [AdventureWorks2014].[Person].[Address] Address1
  
  Inner Join [AdventureWorks2014].[Person].[BusinessEntityAddress] Type_ on
  Type_.AddressID = Address1.AddressID

  Inner Join [AdventureWorks2014].[Person].[AddressType] Type_Desc on
  Type_.AddressTypeID = Type_Desc.AddressTypeID
