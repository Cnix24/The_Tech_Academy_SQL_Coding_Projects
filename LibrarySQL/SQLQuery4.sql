--3.) Retrieve the names of all borrowers who do not have any books checked out.

USE db_library
GO

CREATE PROC dbo.uspNoBooks
AS

BEGIN
	DECLARE @bookCount INT
	DECLARE @errorString varchar(100)
	DECLARE @results AS varchar(10)

	SET @bookCount = 0
	SET @errorString = 'There are no borrowers with "'+CONVERT(varchar(10), @bookCount)+'" loaned books in our database.'
	SET @results = (SELECT COUNT(tbl_bookLoans.book_id) FROM tbl_bookLoans)

	BEGIN TRY
		IF @results > @bookCount
			BEGIN
				RAISERROR(@errorString, 16, 1)
				RETURN 
			END
		ELSE IF @results = @bookCount
			BEGIN
				SELECT
				tbl_borrower.borrower_name AS 'Name: ', COUNT(tbl_bookLoans.book_id) AS 'Number of Books loaned: '
				FROM tbl_bookLoans
				INNER JOIN tbl_borrower ON tbl_bookLoans.card_no = tbl_borrower.card_no
				GROUP BY
				tbl_borrower.borrower_name
			;
			END
	END TRY

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10, 1)
	END CATCH
END

