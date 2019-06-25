CREATE DATABASE db_library

USE db_library

CREATE TABLE tbl_libraryBranch(
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50),
	branch_address VARCHAR(80)
);

CREATE TABLE tbl_publisher(
	publisher_name VARCHAR(60) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(80),
	publisher_phone CHAR(10)
);

CREATE TABLE tbl_books(
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	book_title VARCHAR(100),
	book_publisherName VARCHAR(60) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE tbl_bookAuthors(
	book_id INT  NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_authorName VARCHAR(100),
);


CREATE TABLE tbl_bookCopies(
	book_id INT  NOT NULL CONSTRAINT fk_book_id_copies FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_libraryBranch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	number_ofCopies INT
);

CREATE TABLE tbl_borrower(
	card_no INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	borrower_name VARCHAR(90) NOT NULL,
	borrower_address VARCHAR(100),
	borrower_phone INT
);

CREATE TABLE tbl_bookLoans(
	book_id INT  NOT NULL CONSTRAINT fk_book_id_loans FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id_loans FOREIGN KEY REFERENCES tbl_libraryBranch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE,
	date_due DATE
);


--at least 4 branches, include 'Central' and 'Sharpstown'
INSERT INTO tbl_libraryBranch
	VALUES
	('Central', '2000 Center St.'),
	('Sharpstown', '2222 Knife Circle'),
	('Overland', '3333 North Ave.'),
	('Broadway', '1234 Cats Ln.')
;

--Publisher
INSERT INTO tbl_publisher
	VALUES
	('Scholastic', '3252 Book Fair Ave.', 777-656-5455),
	('Publishers R Us', '998 Publishing Lane', 556-898-7215)
;

--There are at least 20 books in the BOOK table.
INSERT INTO tbl_books
	VALUES
	('The Lost Tribe', 'Scholastic'),
	('The Shining', 'Publishers R Us'),
	('The Catcher in the Rye', 'Scholastic'),
	('It', 'Publishers R Us'),
	('Where The Red Fern Grows', 'Scholastic'),
	('Great Gatsby', 'Publishers R Us'),
	('Call Me By Your Name', 'Scholastic'),
	('SQL for Dummies', 'Publishers R Us'),
	('Moby Dick', 'Scholastic'),
	('Harry Potter and the Goblet of Fire', 'Publishers R Us'),
	('The Art of French Cooking', 'Scholastic'),
	('Almost Famous', 'Publishers R Us'),
	('Murder on the Orient Express', 'Scholastic'),
	('The Last of the Mohicans', 'Publishers R Us'),
	('The Scarlet Letter', 'Scholastic'),
	('Blood Mirror', 'Publishers R Us'),
	('Mistborn', 'Scholastic'),
	('How To Make Coffee', 'Publishers R Us'),
	('The Grapes of Wrath', 'Scholastic'),
	('James and the Giant Peach', 'Publishers R Us')
;

--There are at least 10 authors in the BOOK_AUTHORS table. include stephen king
INSERT INTO tbl_bookAuthors
	VALUES
	(1000, 'Johnny Boy'),
	(1001, 'Stephen King'),
	(1002, 'Holden Caulfield'),
	(1003, 'Stephen King'),
	(1004, 'Big Dan & Little Anne'),
	(1005, 'Zelda Fitzgerald'),
	(1006, 'Louis Guadigno'),
	(1007, 'The Tech Academy'),
	(1008, 'Ernest Hemingway'),
	(1009, 'JK Rowling'),
	(1010, 'Julia Child'),
	(1011, 'Kate Hudson'),
	(1012, 'Agatha Christie'),
	(1013, 'Daniel Day Lewis'),
	(1014, 'Hester Prynne'),
	(1015, 'Brent Weeks'),
	(1016, 'Brandon Sanderson'),
	(1017, 'Calvin Attl'),
	(1018, 'Johnny Depp'),
	(1019, 'Roald Dahl')
;

--Each library branch has at least 10 book titles, and at least two copies of each of those titles. There is a book called 'The Lost Tribe' found in the 'Sharpstown' branch.
INSERT INTO tbl_bookCopies
	VALUES
	(1000, 2, 5),
	(1001, 1, 20),
	(1002, 1, 3),
	(1003, 2, 9),
	(1004, 1, 7),
	(1005, 1, 4),
	(1006, 1, 6),
	(1007, 2, 33),
	(1008, 2, 2),
	(1009, 2, 12),
	(1010, 2, 20),
	(1011, 1, 55),
	(1012, 1, 7),
	(1013, 1, 15),
	(1014, 2, 19),
	(1015, 2, 77),
	(1016, 1, 44),
	(1017, 1, 2),
	(1018, 1, 1),
	(1019, 2, 0)
;

--There are at least 8 borrowers in the BORROWER table, and at least 2 of those borrowers have more than 5 books loaned to them.
INSERT INTO tbl_borrower
	VALUES
	('Jane Doe', '111 Bambi Lane', 111-222-3333),
	('Buzz Lightyear', '2 Infinity Drive', 111-222-3333),
	('Arthur Pendragon', '14 Camelot Avenue', 111-222-3333),
	('George Washington', '1600 Pennsylvania Ave', 111-222-3333),
	('Rachel Green', '2 Central Perk Circle', 111-222-3333),
	('Zuko Firelord', '66 Ba Singe Se', 111-222-3333),
	('Remus Lupin', '44 Moonmoon Street', 111-222-3333),
	('Ariana Grande', '7 Rings Parkway', 111-222-3333)
;

--There are at least 50 loans in the BOOK_LOANS table. and at least 2 of those borrowers have more than 5 books loaned to them.
INSERT INTO tbl_bookLoans
	VALUES
	--1-10
	(1000, 2, 100, '2008-10-31', '2008-11-8'),
	(1001, 1, 100, '2008-10-31', '2008-11-8'),
	(1002, 3, 100, '2008-10-31', '2008-11-8'),
	(1003, 1, 100, '2008-10-31', '2008-11-8'),
	(1004, 4, 100, '2008-10-31', '2008-11-8'),
	(1005, 3, 101, '2008-10-31', '2008-11-8'),
	(1006, 2, 101, '2008-10-31', '2008-11-8'),
	(1007, 1, 101, '2008-10-31', '2008-11-8'),
	(1008, 2, 101, '2008-10-31', '2008-11-8'),
	(1009, 1, 101, '2008-10-31', '2008-11-8'),
	--11-20
	(1010, 2, 102, '2008-10-31', '2008-11-8'),
	(1011, 1, 103, '2008-10-31', '2008-11-8'),
	(1012, 2, 104, '2008-10-31', '2008-11-8'),
	(1013, 1, 105, '2008-10-31', '2008-11-8'),
	(1014, 2, 106, '2008-10-31', '2008-11-8'),
	(1015, 1, 107, '2008-10-31', '2008-11-8'),
	(1016, 2, 100, '2008-10-31', '2008-11-8'),
	(1017, 1, 101, '2008-10-31', '2008-11-8'),
	(1018, 2, 102, '2008-10-31', '2008-11-8'),
	(1019, 1, 103, '2008-10-31', '2008-11-8'),
	--21-30
	(1010, 2, 102, '2008-10-31', '2008-11-8'),
	(1011, 1, 103, '2008-10-31', '2008-11-8'),
	(1012, 2, 104, '2008-10-31', '2008-11-8'),
	(1013, 1, 105, '2008-10-31', '2008-11-8'),
	(1014, 2, 106, '2008-10-31', '2008-11-8'),
	(1015, 1, 107, '2008-10-31', '2008-11-8'),
	(1016, 2, 100, '2008-10-31', '2008-11-8'),
	(1017, 1, 101, '2008-10-31', '2008-11-8'),
	(1018, 2, 102, '2008-10-31', '2008-11-8'),
	(1019, 1, 103, '2008-10-31', '2008-11-8'),
	--31-40
	(1010, 2, 102, '2008-10-31', '2008-11-8'),
	(1011, 1, 103, '2008-10-31', '2008-11-8'),
	(1012, 2, 104, '2008-10-31', '2008-11-8'),
	(1013, 1, 105, '2008-10-31', '2008-11-8'),
	(1014, 2, 106, '2008-10-31', '2008-11-8'),
	(1015, 1, 107, '2008-10-31', '2008-11-8'),
	(1016, 2, 100, '2008-10-31', '2008-11-8'),
	(1017, 1, 101, '2008-10-31', '2008-11-8'),
	(1018, 2, 102, '2008-10-31', '2008-11-8'),
	(1019, 1, 103, '2008-10-31', '2008-11-8'),
	--41-50
	(1010, 2, 102, '2008-10-31', '2008-11-8'),
	(1011, 1, 103, '2008-10-31', '2008-11-8'),
	(1012, 2, 104, '2008-10-31', '2008-11-8'),
	(1013, 1, 105, '2008-10-31', '2008-11-8'),
	(1014, 2, 106, '2008-10-31', '2008-11-8'),
	(1015, 1, 107, '2008-10-31', '2008-11-8'),
	(1016, 2, 100, '2008-10-31', '2008-11-8'),
	(1017, 1, 101, '2008-10-31', '2008-11-8'),
	(1018, 2, 102, '2008-10-31', '2008-11-8'),
	(1019, 1, 103, '2008-10-31', '2008-11-8')
;


