Use Atelier

ALTER TABLE [Model_Material_Quantity]  nocheck constraint all
delete from  [Model]
DBCC CHECKIDENT ([Model], RESEED, 0)
GO

ALTER TABLE [Model_Material_Quantity]  nocheck constraint all 
ALTER TABLE [Material_Provider]  nocheck constraint all
delete from [Material] 
DBCC CHECKIDENT ([Material], RESEED, 0)
GO

ALTER TABLE [MaterialOrder]  nocheck constraint all
DELETE from  [Material_Provider]
DBCC CHECKIDENT ([Material_Provider], RESEED, 0)
GO

ALTER TABLE [Material_Provider]  nocheck constraint all
delete from [Provider]
DBCC CHECKIDENT ([Provider], RESEED, 0)
GO

ALTER TABLE [Client_Size_Clothes]  nocheck constraint all
ALTER TABLE [Client_Size_Boots]  nocheck constraint all
ALTER TABLE [Comment]  nocheck constraint all
ALTER TABLE [Order]  nocheck constraint all
delete from [Client]
DBCC CHECKIDENT ([Client], RESEED, 0)
GO

ALTER TABLE [Comment]  nocheck constraint all
delete from [Order] 
DBCC CHECKIDENT ([Order], RESEED, 0)
GO

ALTER TABLE [Work]  nocheck constraint all
delete from [Worker] 
DBCC CHECKIDENT ([Worker], RESEED, 0)
GO

ALTER TABLE [Order]  nocheck constraint all
delete from [Client_Size_Boots]
DBCC CHECKIDENT ([Client_Size_Boots], RESEED, 0)
GO

ALTER TABLE [Order]  nocheck constraint all
delete from [Client_Size_Clothes]
DBCC CHECKIDENT ([Client_Size_Clothes], RESEED, 0)
GO

ALTER TABLE [Order]  nocheck constraint all
delete from [Work]
DBCC CHECKIDENT ([Work], RESEED, 0)
GO

ALTER TABLE [Work]  nocheck constraint all
delete from [MaterialOrder]
DBCC CHECKIDENT ([MaterialOrder], RESEED, 0)
GO

ALTER TABLE [Client] nocheck constraint all
delete from [Comment]
DBCC CHECKIDENT ([Comment], RESEED, 0)
GO

ALTER TABLE [Model] nocheck constraint all
delete from [Model_Material_Quantity]
DBCC CHECKIDENT ([Model_Material_Quantity], RESEED, 0)
GO









