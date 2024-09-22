create table tbl_borrower (borrower_cardNo int auto_increment primary key,borrower_borrowerName varchar(50),borrower_borrowerAddress varchar(100),borrower_borrowerPhone bigint);
create table tbl_library_branch(library_branch_BranchID int auto_increment primary key,library_branch_BranchName varchar(50),library_branch_BranchAddress varchar(100));
create table tbl_publisher(publisher_PublisherName varchar(50) primary key,publisher_PublisherAddress varchar(100),publisher_PublisherPhone bigint);
create table tbl_book(book_BookID int auto_increment primary key,book_Title varchar(50),book_PublisherName varchar(50),foreign key(book_PublisherName) references tbl_publisher(publisher_PublisherName));
create table tbl_book_authors(book_authors_AuthorId int auto_increment primary key,book_authors_authorName varchar(50),book_authors_BookId int,foreign key(book_authors_BookId) references tbl_book(book_BookId));
create table tbl_book_copies(book_copies_CopiesId int auto_increment primary key,book_copies_BookId int,book_copies_BranchId int,book_copies_No_Of_Copies int,constraint fk1 foreign key(book_copies_BookId) references tbl_book(book_BookId),constraint fk2 foreign key(book_copies_BranchId) references tbl_library_branch(library_branch_BranchId));
create table tbl_book_loans(book_loans_LoansId int auto_increment primary key,book_loans_BookId int,book_loans_BranchId int,book_loans_CardNo int,book_loans_DateOut date,book_loans_DueDate date,constraint fk3 foreign key(book_loans_CardNo) references tbl_borrower(borrower_CardNo),constraint fk4 foreign key(book_loans_BranchId) references tbl_library_branch(library_branch_BranchId),constraint fk5 foreign key(book_loans_BookId) references tbl_book(book_BookId));

 alter table tbl_book_loans add constraint foreign key(book_loans_BookId) references tbl_book_copies(book_copies_BookId);

insert into tbl_borrower values(100,'Joe Smith','1321 4th Street,New York, NY 10014',212-312-1234),
(101,'Jane Smith','1321 4th Street,New York, NY 10014',212-931-4124),
(102,'Tom-Li','981 Main Street, Ann Arbor, MI 48104',734-902-7455),
(103,'Angela Thompson',	'2212 Green Avenue, Ann Arbor, MI 48104',	313-591-2122),
(104,'Harry Emnace',	'121 Park Drive, Ann Arbor, MI 48104',	412-512-5522),
(105,'Tom Haverford','23 75th Street, New York, NY 10014',	212-631-3418),
(106,'Haley Jackson','231 52nd Avenue New York, NY 10014',	212-419-9935),
(107,'Michael Horford',	'653 Glen Avenue, Ann Arbor, MI 48104',	734-998-1513)
;

insert into tbl_book_loans (book_loans_BookID,book_loans_BranchID,book_loans_CardNo,book_loans_DateOut,book_loans_DueDate)values
(3,4,	107,	'2018-01-13',	          '2018-02-13'),
(18,4,	107,'2018-01-13',	          '2018-02-13'),
(12,4,	102,	'2018-01-14',	          '2018-02-14'),
(11,4,	103,	'2018-01-15',           '2018-02-15'),
(9,4,103,	'2018-01-15',	          '2018-02-15'),
(7,4,107,	'2018-01-19',	          '2018-02-19'),
(4,4,	103,	'2018-01-19',	          '2018-02-19'),
(1,4,	103,	'2018-01-22',	          '2018-02-22');


insert into tbl_library_branch values(1,
'Sharpstown',	'32 Corner Road');
insert into tbl_library_branch(library_branch_BranchName,library_branch_BranchAddress)values('Central',	'491 3rd Street'),
('Saline',	'40 State Street'),
('Ann Arbor',	'101 South University');

insert into tbl_publisher values
('George Allen & Unwin',	'83 Alexander Ln, Crows Nest NSW 2065, Australia',	-8466),
('Alfred A. Knopf',	'The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019',	212-940-7390),
('Bloomsbury',	'Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018',	212-419-5300),
('Shinchosa',	'Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan',	-12006),
('Harper and Row',	'HarperCollins Publishers, 195 Broadway, New York, NY 10007',	212-207-7000),
('Pan Books',	'175 Fifth Avenue, New York, NY 10010',	646-307-5745),
('Chalto & Windus',	'375 Hudson Street, New York, NY 10014',	212-366-2000),
('Harcourt Brace Jovanovich',	'3 Park Ave, New York, NY 10016',	212-420-5800),
('W.W. Norton',	'W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110',	212-354-5500),
('Scholastic',	'557 Broadway, New York, NY 10012',	800-724-6527),
('Bantam',	'375 Hudson Street, New York, NY 10014',	212-366-2000),
('Picador USA',	'175 Fifth Avenue, New York, NY 10010',646-307-5745);


insert into tbl_book_authors(book_authors_BookID,book_authors_AuthorName) values
(2,'Stephen King'),
(3,'Stephen King'),
(4,'Frank Herbert'),
(5,'J.R.R. Tolkien'),
(6,'Christopher Paolini'),
(6,'Patrick Rothfuss'),
(8,'J.K. Rowling'),
(9,'Haruki Murakami'),
(10,	'Shel Silverstein'),
(11,'Douglas Adams'),
(12,	'Aldous Huxley'),
(13,'William Goldman'),
(14,'Chuck Palahniuk'),
(15,'Louis Sachar'),
(16,'J.K. Rowling'),
(17,'J.K. Rowling'),
(18,'J.R.R. Tolkien'),
(19,'George R.R. Martin'),
(20	,'Mark Lee');

insert into tbl_book values
(1,'The Name of the Wind',	'DAW Books'),
(2,'It',			'Viking'),
(3,'The Green Mile',	'Signet Books'),
(4,'Dune',	 	 'Chilton Books'),
(5,'The Hobbit',	'George Allen & Unwin'),
(6,'Eragon',	'Alfred A. Knopf'),
(7,'A Wise Mans Fear',	'DAW Books'),
(8,'Harry Potter and the Philosophers Stone',	'Bloomsbury'),
(9,'Hard Boiled Wonderland and The End of the World','Shinchosa'),
(10,'The Giving Tree',	'Harper and Row'),
(11,'The Hitchhikers Guide to the Galaxy',	'Pan Books'),
(12,'Brave New World',	'Chalto & Windus'),
(13,'The Princess Bride',	'Harcourt Brace Jovanovich'),
(14,'Fight Club',	'W.W. Norton'),
(15,'Holes',		'Scholastic'),
(16,'Harry Potter and the Chamber of Secrets',	'Bloomsbury'),
(17,'Harry Potter and the Prisoner of Azkaban',	'Bloomsbury'),
(18,'The Fellowship of the Ring',		'George Allen & Unwin'),
(19,'A Game of Thrones',			'Bantam'),
(20,'The Lost Tribe',	'Picador USA');

insert into tbl_book_copies(book_copies_BookID,book_copies_BranchID,book_copies_No_Of_Copies)values
(2	,1,	5),
(3	,1,	5),
(4	,1,	5),
(5	,1,	5),
(6	,1,	5),
(7	,1,	5),
(8	,1	,5),
(9	,1	,5),
(10	,1	,5),
(11	,1	,5),
(12	,1	,5),
(13	,1	,5),
(14	,1,	5),
(15	,1,	5),
(16	,1,	5),
(17	,1,	5),
(18	,1,	5),
(19	,1,	5),
(20	,1,	5),
(1	,2,	5),
(2	,2,	5),
(3	,2,	5),
(4	,2,	5),
(5	,2,	5),
(6	,2,	5),
(7	,2,	5),
(8	,2,	5),
(9	,2,	5),
(10	,2,	5),
(11	,2,	5),
(12	,2	,5),
(13	,2,	5),
(14	,2,	5),
(15	,2,	5),
(16	,2,	5),
(17	,2,	5),
(18	,2,	5),
(19	,2,	5),
(20	,2,	5),
(1	,3,	5),
(2	,3,	5),
(3	,3,	5),
(4	,3,	5),
(5	,3,	5),
(6	,3,	5),
(7	,3,	5),
(8	,3,	5),
(9	,3,	5),
(10	,3,	5),
(11	,3,	5),
(12	,3,	5),
(13	,3,	5),
(14	,3,	5),
(15,3,	5),
(16	,3	,5),
(17	,3,	5),
(18	,3,	5),
(19	,3,	5),
(20	,3,	5),
(1	,4,	5),
(2	,4,	5),
(3	,4,	5),
(4	,4,	5),
(5	,4,	5),
(6	,4,	5),
(7	,4,	5),
(8	,4,	5),
(9	,4	,5),
(10	,4,	5),
(11	,4,	5),
(12	,4,	5),
(13	,4	,5),
(14	,4,	5),
(15	,4,	5),
(16	,4	,5),
(17,4,	5),
(18,4,	5),
(19,4,	5),
(20,4,	5);





question:-How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

select sum(tbl_book_copies.book_copies_No_Of_Copies) as total_copies from tbl_book join tbl_book_copies
 on tbl_book.book_BookID=tbl_book_copies.book_copies_BookId join tbl_library_branch 
 on tbl_book_copies.book_copies_BranchId=tbl_library_branch.library_branch_BranchID where tbl_book.book_title='The Lost Tribe'
and tbl_library_branch.library_branch_BranchName = 'Sharpstown';


question:-How many copies of the book titled "The Lost Tribe" are owned by each library branch?

select sum(tbl_book_copies.book_copies_No_Of_Copies) as total_copies,tbl_book.book_title from tbl_book join tbl_book_copies 
on tbl_book.book_BookID=tbl_book_copies.book_copies_BookId where tbl_book.book_title='The Lost Tribe';


question:-Retrieve the names of all borrowers who do not have any books checked out.

select tbl_borrower.borrower_borrowerName from tbl_borrower join tbl_book_loans
 on tbl_borrower.borrower_cardNo=tbl_book_loans.book_loans_CardNo where tbl_book_loans.book_loans_CardNo is null;
 
 
 
question:- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.

 select count(tbl_book_copies.book_copies_No_Of_Copies),tbl_borrower.borrower_borrowerName,
 tbl_borrower.borrower_borrowerAddress from tbl_borrower join tbl_book_loans on 
 tbl_borrower.borrower_cardNo= tbl_book_loans.book_loans_CardNo join tbl_book_copies on
 tbl_book_loans.book_loans_BookId=tbl_book_copies.book_copies_BookId group by tbl_borrower.borrower_borrowerName,
 tbl_borrower.borrower_borrowerAddress having count(tbl_book_copies.book_copies_No_Of_Copies)>5;
 
 
 
 question :- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18,
 retrieve the book title, the borrower's name, and the borrower's address. 
 
 select tbl_borrower.borrower_borrowerName,tbl_borrower.borrower_borrowerAddress from tbl_borrower
 join tbl_book_loans on tbl_borrower.borrower_cardNo=tbl_book_loans.book_loans_CardNo
 join  tbl_library_branch on tbl_book_loans.book_loans_BranchId = tbl_library_branch.library_branch_BranchID
 where tbl_library_branch.library_branch_BranchName='Sharpstown' and tbl_book_loans.book_loans_DueDate='2018-03-02';
 
 

 
 question:- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
 
 select tbl_library_branch.library_branch_BranchID, tbl_library_branch.library_branch_BranchName, 
 sum(tbl_book_copies.book_copies_No_Of_Copies) from tbl_library_branch join tbl_book_copies
 on tbl_library_branch.library_branch_BranchID=tbl_book_copies.book_copies_BranchId 
 group by tbl_library_branch.library_branch_BranchID, tbl_library_branch.library_branch_BranchName;
 
 
 
 
