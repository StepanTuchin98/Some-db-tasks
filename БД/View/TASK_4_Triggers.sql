USE Atelier

GO
--INSERT TRIGGER
CREATE TRIGGER Insert_Order_Cost_Trigger ON [Order] FOR INSERT
AS
IF @@ROWCOUNT = 1
	BEGIN
	IF EXISTS (
		SELECT *
		FROM inserted
		WHERE inserted.Cost <= 0)
	BEGIN
		ROLLBACK
		PRINT('ERROR! Cost cannot be less than zero')
	END
	IF EXISTS(
		SELECT *
		FROM inserted
		WHERE inserted.StartDate > inserted.EndDate)
	BEGIN
		ROLLBACK
		PRINT('ERROR! Order is finished earlier than accepted')
	END
END


INSERT [dbo].[Order]
([IDClient], [IDSizeBoots], [IDSizeClothes], [IDWork], [Cost], [StartDate], [EndDate])
values
('3', '1', '1', '3', '-500', cast(getdate() as date), '2020-03-09');


INSERT [dbo].[Order]
([IDClient], [IDSizeBoots], [IDSizeClothes], [IDWork], [Cost], [StartDate], [EndDate])
values
('3', '1', '1', '3', '100', '2020-03-10', '2020-03-09');

--Insted of
GO
CREATE TRIGGER Instead_of_Insert_Trigger ON Material INSTEAD OF INSERT
AS 
BEGIN 
	DECLARE @Name_material varchar(50)
	SET @Name_material = (SELECT [Name] FROM inserted); 
	IF EXISTS(

		SELECT [Name] 
		FROM Material
		WHERE [Name] = @Name_material) 
		Begin
		PRINT ('ERROR! Duplicate material')
	ROLLBACK
	END
	
	ELSE
	INSERT Material
	([Name])
	VALUES
	(@Name_material)
END
GO

INSERT INTO [dbo].[Material]
([Name])
values
('Шёлк')

--UPDATE TRIGGER
GO
CREATE TRIGGER Update_Material_Name_Trigger ON Material FOR UPDATE
AS
		ROLLBACK
		PRINT ('ERROR! Can not edit material')
GO

UPDATE Material
SET [Name] = 'ffsf'  WHERE IDMaterial = '1'
GO

CREATE TRIGGER Update_Order_Date_Trigger ON [Order] FOR UPDATE
AS
	DECLARE @ID_order int
	DECLARE @StartDate date
	SELECT @ID_order = i.IDOrder FROM inserted i;
	SELECT @StartDate = i.StartDate FROM inserted i;
	IF UPDATE(StartDate)
		ROLLBACK
		PRINT ('ERROR! It is not possible to change the start date')
GO

UPDATE [Order]
SET [StartDate] = '2018-10-25'  WHERE IDOrder = '1'


--Insted of update
GO
CREATE TRIGGER Instead_of_Update_Trigger ON [MaterialOrder] INSTEAD OF UPDATE
AS
BEGIN 
	DECLARE @IDMaterialOrder int
	DECLARE @IDMaterial_ProviderIns int
	DECLARE @IDMaterial_ProviderDel int
	DECLARE @EndDateInserted date
	DECLARE @EndDateDeleted date
	
	SET @IDMaterialOrder = (SELECT IDMaterialOrder FROM inserted);
	SET @EndDateInserted = (SELECT [EndDate] FROM inserted);
	SET @EndDateDeleted = (SELECT [EndDate] FROM deleted);
	SET @IDMaterial_ProviderIns = (SELECT [IDMaterial_Provider] FROM inserted);
	SET @IDMaterial_ProviderDel = (SELECT [IDMaterial_Provider] FROM deleted);
	
	IF UPDATE (EndDate)
		BEGIN
			UPDATE [Work]
			SET [Term] = DATEADD(DAY, DATEDIFF(DAY, @EndDateDeleted, @EndDateInserted), [Work].[Term]) 
			WHERE IDMaterialOrder = @IDMaterialOrder

			UPDATE [MaterialOrder]
			SET [EndDate] = @EndDateInserted 
			WHERE [MaterialOrder].IDMaterialOrder = @IDMaterialOrder
		END
	IF UPDATE (IDMaterial_Provider)
		BEGIN
				UPDATE [MaterialOrder]
				SET IDMaterial_Provider = @IDMaterial_ProviderIns  WHERE MaterialOrder.IDMaterial_Provider = @IDMaterial_ProviderDel
		END
END
GO

UPDATE [MaterialOrder]
SET EndDate = '2018-11-03'  WHERE MaterialOrder.IDMaterialOrder = 2


UPDATE Work
SET Term = '2019-08-10'  WHERE Work.IDMaterialOrder = 2


--DELETE TRIGGER
GO
CREATE TRIGGER Delete_Comment_Trigger ON [Comment] FOR DELETE
AS
BEGIN
	IF EXISTS (
	SELECT * 
	FROM deleted
	WHERE Comment = 'Bad Work' )
	BEGIN
		ROLLBACK
		PRINT ('ERROR! Prohibition on remove bad comments')
		RETURN
	END
END
GO

INSERT [dbo].[Comment]
([IDClient], [IDOrder], [IDWorker], [Comment])
values
('1', '2', '1', 'Bad Work')

DELETE [Comment]
FROM [Comment] c
WHERE c.Comment = 'Bad Work'

GO
CREATE TRIGGER Delete_Material_Trigger ON Material FOR DELETE
AS
BEGIN
	IF EXISTS (
		SELECT * 
		FROM deleted INNER JOIN Material ON deleted.[Name] = Material.[Name])
		
		PRINT ('ERROR! Prohibition on remove of material name')
		ROLLBACK
END
GO

INSERT Material
([Name])
VALUES
('Гобелен')

DELETE FROM Material
WHERE [Name] = 'Гобелен'

--Insted of
GO
CREATE TRIGGER Instead_of_Delete_Trigger ON [Provider] INSTEAD OF DELETE
AS
BEGIN
	DECLARE @ProviderName [varchar](50)
	DECLARE @TempProviderID [int]
	
	SET @ProviderName = (SELECT CompanyName FROM deleted);
	SET @TempProviderID = (SELECT mo.IDMaterial_Provider
								FROM [MaterialOrder] mo INNER JOIN (SELECT DISTINCT IDMaterial_Provider 
								FROM [Material_Provider] m 
								INNER JOIN [Provider] p ON p.IDProvider = m.IDProvider
								WHERE CompanyName = @ProviderName) t ON mo.IDMaterial_Provider = t.IDMaterial_Provider)
	ALTER TABLE Material_Provider  nocheck constraint all
	DELETE FROM [Provider]
	WHERE [Provider].IDProvider = (SELECT IDProvider FROM deleted)

	ALTER TABLE MaterialOrder  nocheck constraint all
	DELETE FROM [Material_Provider]
	WHERE [Material_Provider].IDProvider = (SELECT IDProvider FROM deleted)

	UPDATE [MaterialOrder]
	SET IDMaterial_Provider = -1  
	WHERE MaterialOrder.IDMaterial_Provider = @TempProviderID
END
GO


DELETE FROM [Provider]
WHERE CompanyName = 'Кроем всё'