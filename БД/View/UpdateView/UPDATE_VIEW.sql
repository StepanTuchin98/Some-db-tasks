USE Atelier2
GO

CREATE VIEW Worker_UPDATE
AS
SELECT w.INN, w.Salary, License
FROM Worker w 
WHERE (License is NOT NULL) 
WITH CHECK OPTION
GO


update Worker_UPDATE 
SET Salary = 20000
WHERE License = NULL
GO

EXEC sp_helptext 'Worker_UPDATE'
GO

SELECT *
FROM Worker_UPDATE
Order by Salary

DROP VIEW Worker_UPDATE
GO

CREATE VIEW Size_INSERT With Encryption 
AS
SELECT [Size], [IDClient]
FROM Client_Size_Boots c
WHERE Size < 50
WITH CHECK OPTION
GO
 
		 
EXEC sp_helptext 'Size_INSERT'
GO

INSERT INTO Size_INSERT
([IDClient], [Size])
values
(4, 35)
GO

DROP VIEW Size_INSERT 