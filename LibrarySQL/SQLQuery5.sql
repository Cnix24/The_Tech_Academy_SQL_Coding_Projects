
--4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

USE db_library
GO

CREATE PROC dbo.uspBorrowDate
AS

DECLARE @branch VARCHAR(50)
DECLARE @date VARCHAR(20)

SET @branch = 'Sharpstown'
SET @date = GETDATE();

SELECT
	tbl_books.book_title, tbl_borrower.borrower_name, tbl_borrower.borrower_address
	FROM tbl_bookLoans
	INNER JOIN tbl_books ON tbl_bookLoans.book_id = tbl_books.book_id
	INNER JOIN tbl_borrower ON tbl_bookLoans.card_no = tbl_borrower.card_no
	INNER JOIN tbl_libraryBranch on tbl_bookLoans.branch_id = tbl_libraryBranch.branch_id
	WHERE tbl_libraryBranch.branch_name = @branch AND tbl_bookLoans.date_due = @date;

