Use [master]
restore database AdventureWorks2014

from disk = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\Backup\AdventureWorks2014.bak'

with move 'AdventureWorks2014_data'

to 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AdventureWorks2014.mdf',

move 'AdventureWorks2014_log'

to 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AdventureWorks2014.ldf'

,replace

