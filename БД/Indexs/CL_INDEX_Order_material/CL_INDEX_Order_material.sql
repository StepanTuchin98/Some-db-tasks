USE Atelier2
GO

create clustered index CL_INDEX_Order_material --óíèêàëüíûé
ON [dbo].[MaterialOrder]([IDMaterialOrder])

PRINT('ÊËÀÑÒÅÐÍÛÉ ÓÍÈÊÀËÜÍÛÉ - ÍÀ×ÀËÎ')
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

PRINT('1')
SELECT [IDMaterialOrder] 
FROM [MaterialOrder]
GO

PRINT('2')
Select * 
From [MaterialOrder] mo inner join [Model_Material_Quantity] mm On mo.IDModel_Material_Quantity = mm.IDModel_Material_Quantity
Where Quantity Between 1 and 3 
GO

PRINT('3')
Select [IDMaterialOrder], StartDate 
FROM [MaterialOrder]
Group by [IDMaterialOrder], StartDate
Having [IDMaterialOrder] > 10 AND StartDate < GETDATE()
Order by [IDMaterialOrder] DESC
GO

PRINT('ÊËÀÑÒÅÐÍÛÉ ÓÍÈÊÀËÜÍÛÉ - ÊÎÍÅÖ')

DROP INDEX CL_INDEX_Order_material on [MaterialOrder]