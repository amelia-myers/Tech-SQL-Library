CREATE DATABASE db_Library01


USE db_Library01

CREATE TABLE PUBLISHER (
	Name VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(75) NOT NULL, 
	Phone VARCHAR(25) NOT NULL 
	);

CREATE TABLE BOOK (
	BookId INT PRIMARY KEY NOT NULL IDENTITY (1,1), 
	Title VARCHAR(50) NOT NULL, 
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_Name FOREIGN KEY REFERENCES PUBLISHER(Name) ON UPDATE CASCADE ON DELETE CASCADE
	);

CREATE TABLE BOOK_AUTHORS (
	BookId INT NOT NULL CONSTRAINT fk_BookId FOREIGN KEY REFERENCES BOOK(BookId) ON UPDATE CASCADE ON DELETE CASCADE, 
	AuthorName VARCHAR(50) NOT NULL
	); 

CREATE TABLE LIBRARY_BRANCH (
	BranchId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL, 
	Address VARCHAR(50)
	);

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (001,1), 
	Name VARCHAR (50) NOT NULL, 
	Address VARCHAR(50) NOT NULL, 
	Phone VARCHAR(50) NOT NULL
	); 

CREATE TABLE BOOK_COPIES (
	BookId INT NOT NULL,
	BranchId INT NOT NULL CONSTRAINT fk_BranchId FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
	);

CREATE TABLE BOOK_LOANS (
	BookId INT NOT NULL, 
	BranchId INT NOT NULL, 
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE, 
	DateOut DATE NOT NULL, 
	DueDate DATE NOT NULL 
	); 




INSERT INTO PUBLISHER 
	(Name, Address, Phone)
	VALUES
	('Doubleday', '532 Pubby Road', '514-546-8324'),
	('Viking Press', '6523 Journals Avenue', '656-543-8654'),
	('Penguin', '586 Arctic Way', '532-120-3518'),
	('Farrar, Straus And Giroux', '211 Federal Parkway', '620-482-6224'),
	('Dell Publishing', '204 Techno Lane', '246-241-9664'),
	('W.W. Norton & Company', '84356 Pachy Park', '813-684-6523'),
	('Random House', '6522 NW Camels Boardwalk', '684-218-9735'),
	('Simon & Schuster', '549 Winding Road', '651-381-2597'),
	('FSG Originals', '5486 Greenburg Lane', '651-785-4382'),
	('Ballantine Books', '38490 Hart Avenue', '684-321-4564'),
	('Harry N. Abrams', '8435 Lardo Lake', '684-318-5381'),
	('Bloomsbury Publishing', '3820 Gallery Way', '381-683-4838')
	; 

SELECT * FROM PUBLISHER;


INSERT INTO BOOK
	(Title, PublisherName)
	VALUES
	('The Shining', 'Doubleday'), 
	('It', 'Viking Press'), 
	('The Lost Tribe', 'Penguin'),
	('Annihilation', 'Farrar, Straus And Giroux'),
	('Authority', 'Farrar, Straus And Giroux'),
	('Acceptance', 'Farrar, Straus And Giroux'),
	('Slaughterhouse-Five', 'Dell Publishing'),
	('Galapagos', 'Dell Publishing'), 
	('Fight Club', 'W.W. Norton & Company'), 
	('Invisible Monsters', 'W.W. Norton & Company'),
	('Geek Love', 'Random House'), 
	('The Great Gatsby', 'Simon & Schuster'), 
	('Quesadillas: A Novel', 'FSG Originals'),
	('Down The Rabbit Hole', 'FSG Originals'), 
	('Everyday Cook', 'Ballantine Books'), 
	('Good Eats, Volume 1', 'Harry N. Abrams'),
	('Good Eats, Volume 2', 'Harry N. Abrams'), 
	('Good Eats, Volume 3', 'Harry N. Abrams'), 
	('Harry Potter and the Goblet of Fire', 'Bloomsbury Publishing'),
	('Harry Potter and the Half-Blood Prince', 'Bloomsbury Publishing')
	;

SELECT * FROM BOOK;


INSERT INTO BOOK_AUTHORS 
	(BookId, AuthorName)
	VALUES
	('1', 'Stephen King'),
	('2', 'Stephen King'), 
	('3', 'Pete Pan'), 
	('4', 'Jeff VanderMeer'),
	('5', 'Jeff VanderMeer'),
	('6', 'Jeff VanderMeer'),
	('7', 'Kurt Vonnegut'),
	('8', 'Kurt Vonnegut'),
	('9', 'Chuck Palahniuk'),
	('10', 'Chuck Palahniuk'),
	('11', 'Katherine Dunn'),
	('12', 'F. Scott Fitzgerald'),
	('13', 'Juan Pablo Villalobos'),
	('14', 'Juan Pablo Villalobos'),
	('15', 'Alton Brown'),
	('16', 'Alton Brown'),
	('17', 'Alton Brown'),
	('18', 'Alton Brown'),
	('19', 'J.K. Rowling'),
	('20', 'J.K. Rowling')
	;

SELECT * FROM BOOK_AUTHORS;


INSERT INTO LIBRARY_BRANCH 
	(BranchName, Address) 
	VALUES
	('Sharpstown', '382 Reading Road'),
	('Central', '6456 Middleton Lane'),
	('Bookingston', '6835 Booker Boardwalk'), 
	('Nature Park', '9357 Treeton Alley')
	;

SELECT * FROM LIBRARY_BRANCH;


INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES
	('Jason Bourne', '3846 Sneaky Swamp', '555-684-3849'),
	('Jack Sparrow', '534 Ocean Avenue', '684-318-6813'),
	('Jane Smith', '684 Adventure Lane', '635-438-7652'),
	('Jack Torrence', '3816 Mountain Way', '381-796-2110'),
	('Mr. Fox', '7310 Borrows Tunnel', '014-638-4318'),
	('Olive Hoover', '9838 Sunshine Street', '204-798-3836'),
	('Truman Burbank', '3842 Eerie Avenue', '320-768-6532'),
	('Max Fischer', '6785 Rushmore Road', '378-572-2752'),
	('Juno MacGuff', '540 Living Lane', '836-576-2796'),
	('Margot Tenenbaum', '3816 Dramatic Drive', '785-683-7953'),
	('Llewyn Davis', '7683 Sound Street', '693-489-4831')
	;

SELECT * FROM BORROWER;


INSERT INTO BOOK_COPIES
	(BookId, BranchId, No_Of_Copies)
	VALUES
	('1', '1', '2'),
	('1', '3', '2'),
	('2', '1', '2'),
	('2', '4', '2'),
	('3', '2', '2'),
	('3', '4', '2'),
	('4', '1', '2'),
	('4', '3', '2'),
	('5', '3', '2'),
	('5', '4', '2'),
	('6', '2', '2'),
	('6', '3', '2'),
	('7', '1', '2'),
	('7', '2', '2'),
	('8', '1', '2'),
	('8', '4', '2'),
	('9', '3', '2'),
	('9', '4', '2'),
	('10', '1', '2'),
	('10', '2', '2'),
	('11', '3', '2'),
	('11', '4', '2'),
	('12', '1', '2'),
	('12', '2', '2'),
	('13', '2', '2'),
	('13', '3', '2'),
	('14', '2', '2'),
	('14', '4', '2'),
	('15', '1', '2'),
	('15', '4', '2'),
	('16', '1', '2'),
	('16', '3', '2'),
	('17', '1', '2'),
	('17', '2', '2'),
	('18', '3', '2'),
	('18', '4', '2'),
	('19', '2', '2'),
	('19', '4', '2'),
	('20', '2', '2'),
	('20', '3', '2')
	;

INSERT INTO BOOK_COPIES
	(BookId, BranchId, No_Of_Copies)
	VALUES
	('1', '2', '2')
	;

INSERT INTO BOOK_COPIES
	(BookId, BranchId, No_Of_Copies)
	VALUES
	('2', '2', '2')
	;

INSERT INTO BOOK_COPIES
	(BookId, BranchId, No_Of_Copies)
	VALUES
	('3', '1', '2')
	;

SELECT * FROM BOOK_COPIES;


INSERT INTO BOOK_LOANS
	(BookId, BranchId, CardNo, DateOut, DueDate)
	VALUES
	('1', '1', '3', '2017-09-19', '2017-09-26'),
	('1', '3', '1', '2017-09-20', '2017-09-27'),
	('1', '3', '8', '2017-09-17', '2017-09-24'),
	('2', '4', '9', '2017-09-18', '2017-09-25'),
	('2', '1', '3', '2017-09-19', '2017-09-26'),
	('3', '2', '7', '2017-09-21', '2017-09-28'),
	('4', '1', '2', '2017-09-20', '2017-09-27'),
	('4', '1', '10', '2017-09-24', '2017-10-01'),
	('4', '3', '1', '2017-09-15', '2017-09-22'),
	('4', '3', '5', '2017-09-22', '2017-09-29'), 
	('5', '4', '4', '2017-09-23', '2017-09-30'),
	('5', '3', '1', '2017-09-20', '2017-09-27'), 
	('6', '2', '7', '2017-09-21', '2017-09-28'),
	('6', '2', '11', '2017-09-23', '2017-09-30'),
	('7', '1', '2', '2017-09-16', '2017-09-23'),
	('7', '1', '3', '2017-09-19', '2017-09-26'),
	('7', '2', '11', '2017-09-23', '2017-09-30'),
	('8', '4', '4', '2017-09-23', '2017-09-30'),
	('8', '1', '2', '2017-09-16', '2017-09-23'), 
	('9', '3', '5', '2017-09-22', '2017-09-29'),
	('9', '4', '4', '2017-09-18', '2017-09-25'), 
	('10', '1', '10', '2017-09-24', '2017-10-01'),
	('10', '2', '7', '2017-09-21', '2017-09-28'),
	('10', '2', '11', '2017-09-19', '2017-09-26'), 
	('11', '4', '4', '2017-09-23', '2017-09-30'),
	('11', '3', '1', '2017-09-20', '2017-09-27'),
	('12', '1', '10', '2017-09-24', '2017-10-01'),
	('12', '1', '2', '2017-09-17', '2017-09-24'), 
	('12', '2', '7', '2017-09-21', '2017-09-28'),
	('13', '3', '1', '2017-09-18', '2017-09-25'),
	('13', '3', '8', '2017-09-17', '2017-09-24'),
	('14', '2', '7', '2017-09-19', '2017-09-26'),
	('14', '4', '9', '2017-09-21', '2017-09-28'),
	('15', '1', '10', '2017-09-24', '2017-10-01'),
	('15', '4', '9', '2017-09-21', '2017-09-28'),
	('15', '4', '4', '2017-09-23', '2017-09-30'),
	('16', '1', '2', '2017-09-17', '2017-09-24'),
	('16', '1', '5', '2017-09-23', '2017-09-30'),
	('16', '3', '1', '2017-09-20', '2017-09-27'),
	('16', '3', '8', '2017-09-17', '2017-09-24'),
	('17', '2', '5', '2017-09-18', '2017-09-25'),
	('17', '1', '3', '2017-09-18', '2017-09-25'),
	('17', '2', '7', '2017-09-21', '2017-09-28'),
	('18', '4', '4', '2017-09-23', '2017-09-30'),
	('18', '4', '2', '2017-09-19', '2017-09-26'),
	('19', '2', '7', '2017-09-21', '2017-09-28'),
	('19', '4', '5', '2017-09-18', '2017-09-25'),
	('20', '2', '7', '2017-09-21', '2017-09-28'),
	('20', '3', '8', '2017-09-22', '2017-09-29'),
	('20', '3', '1', '2017-09-20', '2017-09-27')
	;


--TABLE CREATION ABOVE QUERIES BELOW 


