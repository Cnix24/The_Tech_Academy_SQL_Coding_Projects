-- 7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
USE db_library
GO

CREATE PROC dbo.uspAuthorCopies
AS


DECLARE @authorName VARCHAR(100)
DECLARE @branchName VARCHAR(50)


SET @authorName = 'Stephen King'
SET @branchName = 'Central'


SELECT book_title AS 'Book Title: ', tbl_bookCopies.number_ofCopies AS 'Count: ' 
	FROM tbl_books
	INNER JOIN tbl_bookAuthors ON tbl_books.book_id = tbl_bookAuthors.book_id
	INNER JOIN tbl_bookCopies ON tbl_books.book_id = tbl_bookCopies.book_id
	INNER JOIN tbl_libraryBranch ON tbl_bookCopies.branch_id = tbl_libraryBranch.branch_id
	WHERE
	tbl_bookAuthors.book_authorName = @authorName AND tbl_libraryBranch.branch_name = @branchName
;
