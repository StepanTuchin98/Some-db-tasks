USE Atelier2
GO

Create PROCEDURE dbo.worker_cursor
	@CursorOut CURSOR VARYING OUTPUT

AS
SET NOCOUNT ON;
SET @CursorOut = CURSOR

FORWARD_ONLY STATIC FOR
	SELECT w.Surname, w.Phone, wr.Term
	FROM Worker as w
	INNER JOIN [Work] wr ON w.IDWorker = wr.IDWorker
OPEN @CursorOut
GO

DECLARE @CursorIn CURSOR
EXEC dbo.worker_cursor  @CursorOut = @CursorIn OUTPUT

WHILE(@@FETCH_STATUS = 0)
BEGIN
	FETCH NEXT FROM @CursorIn
END
CLOSE @CursorIn

GO

DROP PROCEDURE dbo.worker_cursor