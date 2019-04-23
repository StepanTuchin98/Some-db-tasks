USE Atelier2
GO

CREATE PROCEDURE sp_comment 
		@Comment varchar(50),
		@IDClient int,
		@IDOrder int, 
		@IDWorker int  
	AS
		Insert dbo.Comment
		(IDClient, IDOrder, IDWorker, Comment)
		Values
		(@IDClient, @IDOrder, @IDWorker, @Comment)

GO
EXEC sp_comment 'Good', 1, 1, 3
GO

DROP PROCEDURE sp_comment
GO

--output
Create proc sp_ordercount
	@StartDate date,
	@EndDate date,
	@sum int output
AS
	SELECT @sum = COUNT(o.IDOrder)
	FROM [Order] as o
	WHERE o.StartDate >= @StartDate AND o.EndDate <= @EndDate
GO

DECLARE @count int
EXEC sp_ordercount '2017-01-01', '2019-11-02', @count output
Print(@count)

GO
DROP PROCEDURE sp_ordercount