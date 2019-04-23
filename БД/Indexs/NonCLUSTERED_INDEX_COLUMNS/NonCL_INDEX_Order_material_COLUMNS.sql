USE Atelier2
GO

CREATE NONCLUSTERED INDEX NonCL_INDEX_Order_material_Column --ñ âêëþ÷¸ííûìè òàáëèöàìè
ON [dbo].MaterialOrder([IDModel_Material_Quantity], [IDMaterial_Provider])
INCLUDE([StartDate], [EndDate])
GO

PRINT('ÍÅÊËÀÑÒÅÐÍÛÉ Ñ ÂÊËÞ×¨ÍÍÛÌÈ ÒÀÁËÈÖÀÌÈ - ÍÀ×ÀËÎ')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM MaterialOrder as MO
JOIN Material_Provider as MP ON MO.IDMaterial_Provider = MP.IDMaterial_Provider
GO

SELECT MO.StartDate, MO.EndDate
FROM ([MaterialOrder] as MO
INNER JOIN Model_Material_Quantity as MMQ ON MO.IDModel_Material_Quantity = MMQ.IDModel_Material_Quantity) 
INNER JOIN Material_Provider as MP ON MO.IDMaterial_Provider = MP.IDMaterial_Provider
WHERE MMQ.Quantity >= 2  AND MP.Cost < 400
GO
PRINT('ÍÅÊËÀÑÒÅÐÍÛÉ Ñ ÂÊËÞ×¨ÍÍÛÌÈ ÒÀÁËÈÖÀÌÈ - ÊÎÍÅÖ')

DROP INDEX NonCL_INDEX_Order_material_Column ON MaterialOrder