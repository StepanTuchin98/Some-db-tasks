USE Atelier2
GO

CREATE NONCLUSTERED INDEX NonCL_INDEX_Order_material_Filter --с включёнными строками
ON [dbo].[MaterialOrder]([IDModel_Material_Quantity], [IDMaterial_Provider])
WHERE ([IDMaterial_Provider] < 20 AND [IDMaterial_Provider] > 3) AND ([IDModel_Material_Quantity] IN (3,5,7))

PRINT('НЕКЛАСТЕРНЫЙ ФИЛЬТРОВАННЫЙ - НАЧАЛО')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM [MaterialOrder] as MO
JOIN Material_Provider as M ON MO.[IDMaterial_Provider] = M.[IDMaterial_Provider]

SELECT MO.StartDate, MO.EndDate, MMQ.Quantity, MP.Cost
FROM ([MaterialOrder] as MO
INNER JOIN Model_Material_Quantity as MMQ ON MO.IDModel_Material_Quantity = MMQ.IDModel_Material_Quantity) 
INNER JOIN Material_Provider as MP ON MO.IDMaterial_Provider = MP.IDMaterial_Provider
WHERE MMQ.Quantity >= 2  AND MP.Cost < 400

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
PRINT('НЕКЛАСТЕРНЫЙ ФИЛЬТРОВАННЫЙ - КОНЕЦ')

DROP INDEX NonCL_INDEX_Order_material_Filter ON MaterialOrder
