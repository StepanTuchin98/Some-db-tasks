GO
Use Atelier2
GO
CREATE PROCEDURE GetClientById
	@IDClient int
AS
		BEGIN
			SELECT *
			From [Client]
			Where Client.IDClient = @IDClient
		END
GO

EXEC GetClientById 1
GO

DROP PROCEDURE GetClientById

GO
CREATE PROCEDURE [dbo].[GetAllOrders]
	@IDClient int
AS
BEGIN
	 SELECT c.Name, c.Surname, c.Phone, o.StartDate, o.EndDate, o.Cost, cm.Comment
	 FROM Client c 
	 INNER JOIN [Order] o  ON o.IDClient = c.IDClient 
	 Inner JOIN Comment cm On cm.IDClient = c.IDClient
END

EXEC GetAllOrders 1
GO

DROP PROCEDURE GetAllOrders
