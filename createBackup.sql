CREATE PROCEDURE CreateBackup
AS
BACKUP DATABASE Project2
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\Project2.bak'
GO