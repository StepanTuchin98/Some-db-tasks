USE Atelier2
GO

CREATE INDEX CL_INDEX_Worker_FILTER --фильрующий
ON [dbo].[Worker]([Salary], [License])
WHERE ( [Salary] >= 18000) And ([License] = 'True')

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

Select [Name], [Surname], Salary
From Worker
Where Salary Between 15000 and 19000 

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

DROP INDEX CL_INDEX_Worker_FILTER ON Worker