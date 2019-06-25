
--2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?

USE db_library
GO

CREATE PROC dbo.uspBookTitleCopyCount
AS


DECLARE @bookTitle VARCHAR(100)

SET @bookTitle = 'The Lost Tribe'

SELECT
	tbl_books.book_title, number_ofCopies, tbl_libraryBranch.branch_name as 'Library Branch: '
	FROM tbl_bookCopies
	INNER JOIN tbl_books ON tbl_bookCopies.book_id = tbl_books.book_id
	INNER JOIN tbl_libraryBranch ON tbl_bookCopies.branch_id = tbl_libraryBranch.branch_id
	WHERE
	@bookTitle = tbl_books.book_title
;
