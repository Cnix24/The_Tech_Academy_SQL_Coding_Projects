-- 5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
USE db_library
GO

CREATE PROC dbo.uspBranchLoans
AS

SELECT
	tbl_libraryBranch.branch_name AS 'Branch: ',
	COUNT(tbl_libraryBranch.branch_name) AS 'Number of Books loaned: '
	FROM 
	tbl_bookLoans
	INNER JOIN tbl_libraryBranch ON tbl_bookLoans.branch_id = tbl_libraryBranch.branch_id
	GROUP BY
	tbl_libraryBranch.branch_name
;