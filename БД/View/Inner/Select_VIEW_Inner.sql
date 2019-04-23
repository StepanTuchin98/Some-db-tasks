USE Atelier2
GO

CREATE VIEW Material_Order_View 
AS
SELECT MO.IDMaterialOrder as 'Номер заказа', MP.Cost as 'Цена материала',P.CompanyName as 'Имя производителя',  M.[Name] as 'Материал'
FROM [MaterialOrder] MO
JOIN [Material_Provider] MP ON MO.IDMaterial_Provider = MP.IDMaterial_Provider
JOIN [Provider] as P ON P.IDProvider = MP.IDProvider
JOIN [Material] as M ON MP.IDMaterial = M.IDMaterial
GO


print('Material_Order_View')
SET statistics io on
SET statistics time on

SELECT *
FROM Material_Order_View
ORDER BY 'Цена материала'


DROP VIEW Material_Order_View
GO

CREATE VIEW View_Order
AS
SELECT o.IDOrder, o.StartDate, o.EndDate, o.Cost, c.Surname, wr.Phone as 'Number to call'
FROM [Order] as o
JOIN Client as c ON C.IDClient = c.IDClient
JOIN Work as w ON w.IDWork = o.IDWork
JOIN Worker as wr ON wr.IDWorker = w.IDWorker
GO

Select *
FROM View_Order
Order By IDOrder
GO

DROP VIEW View_Order
GO

CREATE VIEW Work_View
AS
SELECT WR.Surname, WR.Salary, W.Term as 'Задействован в работе до' 
FROM Worker as WR
JOIN Work as W ON W.IDWorker = WR.IDWorker

GO

SELECT *
FROM Work_View
Order By 'Задействован в работе до' 

DROP VIEW Work_View