USE db_Library01; 


CREATE PROCEDURE dbo.LibraryInfo
AS

--ITEM 1

SELECT 
	a6.BranchName, a1.Title, a5.No_Of_Copies
	FROM LIBRARY_BRANCH a6
	INNER JOIN BOOK_COPIES a5 ON a5.BranchId = a6.BranchID
	INNER JOIN BOOK a1 ON a1.BookId = a5.BookId 
	WHERE a6.BranchName = 'Sharpstown' AND
	a1.Title = 'The Lost Tribe';


--ITEM 2

SELECT 
	a6.BranchName, a1.Title, a5.No_Of_Copies
	FROM LIBRARY_BRANCH a6
	INNER JOIN BOOK_COPIES a5 ON a5.BranchId = a6.BranchID
	INNER JOIN BOOK a1 ON a1.BookId = a5.BookId 
	WHERE a1.Title = 'The Lost Tribe';


--ITEM 3

SELECT 
	Name
	FROM BORROWER
	WHERE CardNo NOT IN (SELECT CardNo FROM BOOK_LOANS); 


--ITEM 4

SELECT 
	a1.Title, a7.Name, a7.Address
	FROM BOOK_LOANS a4
	INNER JOIN BOOK a1 ON a4.BookId = a1.BookId
	INNER JOIN BORROWER a7 ON a4.CardNo = a7.CardNo
	INNER JOIN LIBRARY_BRANCH a6 ON a4.BranchId = a6.BranchId
	WHERE a6.BranchName = 'Sharpstown' AND
	a4.DueDate = CAST(GETDATE()AS DATE); 


--ITEM 5 

SELECT a6.BranchName, SUM(a5.No_Of_Copies) 
	FROM BOOK_COPIES a5 
	INNER JOIN LIBRARY_BRANCH a6 ON a6.BranchId = a5.BranchId
	GROUP BY a6.BranchName; 


--ITEM 6

SELECT 
	a7.Name, a7.Address, COUNT(a4.CardNo) AS 'Book Total'
	FROM BORROWER a7
	INNER JOIN BOOK_LOANS a4 ON a7.CardNo = a4.CardNo
	GROUP BY a7.Name, a7.Address 
	HAVING COUNT(a4.CardNo) > '5'; 


--ITEM 7

SELECT 
	a1.Title, a5.No_Of_Copies 
	FROM BOOK a1
	INNER JOIN BOOK_COPIES a5 ON a1.BookId = a5.BookId
	INNER JOIN LIBRARY_BRANCH a6 ON a5.BranchId = a6.BranchId
	INNER JOIN BOOK_AUTHORS a2 ON a1.BookId = a2.BookId
	WHERE a6.BranchName = 'Central' AND
	a2.AuthorName = 'Stephen King';


GO



