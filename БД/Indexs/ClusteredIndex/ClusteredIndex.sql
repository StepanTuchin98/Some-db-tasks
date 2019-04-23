CREATE CLUSTERED INDEX CL_INDEX_Worker_COMPOSITE --���������
ON [dbo].Worker([Name], [Surname], [Salary])

CREATE CLUSTERED INDEX CL_INDEX_Order --���������
ON [dbo].[Order]([Cost])

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

PRINT('����� �� ���� � ��������')
SELECT * 
FROM [Order]
WHERE Cost > 1000

PRINT('����� �� ������� ��������� � ��������')
Select * 
From [Order] o Inner Join (Select wr.[Name], wr.Surname, w.IDWork, wr.Salary 
							from [Worker] wr Inner Join Work w ON wr.IDWorker= w.IDWorker)
						wkr ON wkr.IDWork = o.IDWork
Where  o.Cost > 1500 AND [Name] = '����'  AND Surname = '����������'

PRINT('����� �� �������� � ��������')
Select * 
From Worker
Where  [Salary] Between 11000 And 18000

PRINT('������� ������')
Select Name, Salary, Surname, IDWorker
FROM Worker
Group by [Name],[Salary], [Surname], [IDWorker]
Having Salary > '15000'
Order by Salary DESC

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

DROP INDEX CL_INDEX_Order ON [Order]

DROP INDEX CL_INDEX_Worker_COMPOSITE ON Worker --���������