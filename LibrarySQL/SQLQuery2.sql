
--1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

USE db_library
GO

CREATE PROC dbo.uspSharpstownCheck
AS

DECLARE @bookTitle VARCHAR(100)
DECLARE @branch VARCHAR(50)

SET @bookTitle = 'The Lost Tribe'
SET @branch = 'Sharpstown'

SELECT number_ofCopies
	FROM tbl_bookCopies
	INNER JOIN tbl_libraryBranch ON tbl_bookCopies.branch_id = tbl_libraryBranch.branch_id
	INNER JOIN tbl_books ON tbl_bookCopies.book_id = tbl_books.book_id
	WHERE tbl_books.book_title = @bookTitle
	AND
	tbl_libraryBranch.branch_name = @branch
;


