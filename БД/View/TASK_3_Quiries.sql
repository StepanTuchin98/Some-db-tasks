USE Atelier;
GO

--INNER JOIN
SELECT c.Surname, s.Size
FROM Client AS c
    INNER JOIN [Client_Size_Boots] AS s
    ON c.IDClient = s.IDClient
	ORDER BY [Name] DESC
GO

--LEFT JOIN
-- When client dont have sizes
SELECT c.Surname AS Client, s.Size AS Size
FROM Client c
LEFT JOIN [Client_Size_Clothes] s
ON c.[IDClient] = s.[IDClient]
GO

--RIGHT JOIN
-- When worker is free
SELECT wer.Surname AS Employee, w.Term, wer.Phone
FROM Work w
RIGHT JOIN Worker wer
ON w.IDWorker = wer.IDWorker
GO

--FULL JOIN
--When worker is free and the work dont have worker
SELECT wer.Surname AS Employee, w.Term, wer.Phone
FROM Work w
FULL JOIN Worker wer
ON w.IDWorker = wer.IDWorker
GO

--CROSS JOIN
SELECT p.CompanyName, p.Phone, m.[Name]
FROM [Provider] p
CROSS JOIN [Material] m
ORDER BY m.IDMaterial
GO

--CROSS APPLY
SELECT mp.Cost, mp.IDProvider
FROM [Material_Provider] mp
CROSS APPLY 
(SELECT p.CompanyName
FROM [Provider] p 
WHERE mp.Cost < 1000) p
GO

--ñàìîñîåäèíåíèå
SELECT o.IDClient, c.Surname, o.StartDate, o.EndDate, o.Cost
FROM [Order] o
JOIN Client c
ON o.IDClient = c.IDClient
ORDER BY o.Cost
GO

--IN
SELECT *
FROM [Worker]
WHERE IDWorker IN (1,3)

--LIKE
SELECT *
FROM Client
WHERE [Surname] LIKE 'È%'
GO

--BETWEEN
SELECT *
FROM [Material_Provider]
WHERE [Cost] BETWEEN 500 AND 1500
GO

--REPLACE
SELECT REPLACE([Provider].CompanyName, 'à', 'À') AS 'Invalid company name'
FROM [Provider]
GO

--NULL
Select Term, IDWork  
FROM [Work]
WHERE IDWorker IS NULL
GO

--STUFF
SELECT STUFF(CompanyName, 1,0, 'ÊÐÓÒÀß ÔÈÐÌÀ ') AS 'New_Company_Name'
FROM [Provider]
GO

--GETDATE
SELECT * 
FROM [Order]
WHERE StartDate = cast(getdate() as date)
GO

--DATEDIFF 
SELECT DATEDIFF(DAY, StartDate, EndDate) AS 'Time_To_Do', IDOrder AS 'Order'
FROM [Order]
GO

--DATEPART
SELECT *, DATEPART(YEAR, StartDate) AS 'Year of Order'
FROM [Order]
GO

--COALESCE
SELECT [CompanyName], [Phone],
COALESCE (IIF([CompanyName] ='Ìàòåðèàëèñò', NULL, [Phone]), [CompanyName]) AS 'FirstNotNULL'
FROM [Provider]  
GO

--CAST, CONVERT
SELECT [Name], Cost 
FROM Model
WHERE CAST(Cost AS int) LIKE '%'
GO

SELECT [Name], Cost 
FROM Model
WHERE CONVERT(int, Cost) LIKE '%'
GO

--ALL, ANY, GROUP BY, HAVING
SELECT c.IDClient, c.[Name], c.Surname, Sum(cost) as 'Sum_to_pay', o.EndDate 
FROM Client c
Join [Order] o ON  o.IDClient = c.IDClient
GROUP BY c.IDClient, EndDate, c.[Name], c.Surname
 
SELECT [Name]
FROM Material
WHERE [IDMaterial] = ANY (SELECT [IDMaterial] FROM [Model_Material_Quantity] WHERE Quantity > 3);

SELECT IDMaterial, AVG(Cost) AS Avg_Cost
FROM Material_Provider
GROUP BY IDMaterial
HAVING AVG(Cost) < 800;


--CASE
SELECT Cost, 'Price of material' =
	CASE 
		WHEN [Material_Provider].Cost = 200 THEN 'Áÿçü'
		WHEN [Material_Provider].Cost = 1500 THEN 'Ø¸ëê'
		ELSE 'NULL'
	END
FROM [Material_Provider]
ORDER BY Cost DESC
GO