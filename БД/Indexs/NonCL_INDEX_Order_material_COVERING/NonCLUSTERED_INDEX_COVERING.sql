USE Atelier2
GO

CREATE NONCLUSTERED INDEX NonCL_INDEX_Order_material_COVERING --œŒ –€¬€¿ﬁŸ»…
ON [dbo].[MaterialOrder]([IDModel_Material_Quantity],[IDMaterial_Provider])

PRINT('Õ≈ À¿—“≈–Õ€… œŒ –€¬¿ﬁŸ»…')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM [MaterialOrder]
GO

SELECT MMQ.Quantity, MO.StartDate, MO.EndDate
FROM ([MaterialOrder] as MO
INNER JOIN [Model_Material_Quantity] as MMQ ON MO.IDModel_Material_Quantity = MMQ.IDModel_Material_Quantity) 
INNER JOIN [Material_Provider] as MP ON MO.IDMaterial_Provider = MP.IDMaterial_Provider 
ORDER BY Cost DESC

PRINT('Õ≈ À¿—“≈–Õ€… œŒ –€¬¿ﬁŸ»… -  ŒÕ≈÷')

DROP INDEX NonCL_INDEX_Order_material_COVERING ON [MaterialOrder]