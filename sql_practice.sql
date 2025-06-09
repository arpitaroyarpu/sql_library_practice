Library database:

CREATE TABLE Books(
    BookID int PRIMARY KEY,
    Title varchar(30),
    Author varchar(30),
    Genre varchar(20),
    Year int 
);

create table Members( 
    MemberID int primary key,
    Name varchar(30),
    JoinDate date
)

create table Loans(
    LoanID int primary key,
    BookID int,
    MemberID int,
    LoanDate date,
    ReturnDate date,
    foreign key (BookID) references Books(BookID),
    foreign key (MemberID) references Members(MemberID)
);

insert into Books (BookID, Title, Author, Genre, Year) values (1, 'The Art of SQL', 'Stephane Faroult', 'Programming', 2006);
insert into Books (BookID, Title, Author, Genre, Year) values (2, 'Clean Code', 'Robert C. Martin', 'Programming', 2008);
insert into Books (BookID, Title, Author, Genre, Year) values (3, 'Sapiens', 'Yuval Noah Harari', 'History', 2011);
insert into Books (BookID, Title, Author, Genre, Year) values (4, '1984', 'George Orwell', 'Fiction', 1949);
insert into Books (BookID, Title, Author, Genre, Year) values (5, 'Database System Concepts', 'Silberschatz', 'Programming', 2010);

INSERT INTO Members VALUES
(101, 'Arpita Roy', '2023-06-01'),
(102, 'Rafiul Islam', '2024-01-15'),
(103, 'Shila Akter', '2025-02-20'),
(104, 'Rumi Das', '2025-05-05');

INSERT INTO Loans VALUES
(1001, 1, 101, '2025-05-01', '2025-05-10'),
(1002, 2, 102, '2025-05-03', NULL),
(1003, 3, 103, '2025-04-15', '2025-04-25'),
(1004, 5, 104, '2025-05-10', NULL),
(1005, 4, 101, '2025-03-01', '2025-03-15');

1.Display all members’ names.
select Name
from Members;

2.Get titles and authors of all programming books.
select Title, Author 
from Books 
where Genre = 'Programming';

3.Show all loan records with book titles and member names (JOIN required).
select Loans.*, Books.Title, Members.Name
from Loans 
join Books on Loans.BookID = Books.BookID
join Members on Loans.MemberID = Members.MemberID;

4.List all books published after the year 2000.
select * from Books 
where Year > 2000;

5.Display all books currently on loan with the names of members who borrowed them. (ReturnDate IS NULL)
select Books.Title, Members.Name
from Loans
join Books on Loans.BookID = Books.BookID
join Members on Loans.MemberID = Members.MemberID
where ReturnDate is null;

6.Find members who joined after January 1, 2024.
select *
from Members 
where JoinDate > '2024-01-01';

7.Retrieve books in the 'Fiction' or 'History' genre.
select *
from Books 
where Genre = 'Fiction' or 'History'; //only shows one

select *
from Books 
where Genre in ('Fiction', 'History');  //shows both

8.Show books written by 'Robert C. Martin'.
select * 
from Books
where Author = 'Robert C. Martin';

9.Count how many books each member has borrowed. (GROUP BY)
select MemberID, count(*) as borrowCount 
from loans
group by MemberID;

10.List all books borrowed in May 2025.
select * 
from Loans 
where LoanDate BETWEEN '2025-05-01' AND '2025-05-31';

11.Get all distinct book titles that have been borrowed at least once.
select DISTINCT Books.Title
from Books, Loans 
where Loans.BookID = Books.BookID;
 or
select Books.Title 
from Loans 
join Books on Loans.BookID = Books.BookID;

12.Find the most recently published book. (MAX on Year)
select * 
from Books 
where Year = (select max(Year) from Books);
or
select * 
from Books 
order by Year desc 
limit 1;

13.Display members who have borrowed more than one book.
select Members.MemberID, Members.Name
from Members 
join Loans on Members.MemberID = Loans.MemberID 
group by Members.MemberID, Members.Name
having count(*) > 1;

14.Show loan details for members whose name starts with 'R'.
select Loans.*, Members.Name 
from loans
join Members on Loans.MemberID = Members.MemberID
where Members.Name like 'R%';

15. List books that have never been borrowed. (Subquery)
select * 
from Books 
where BookID not in (select BookID from Loans);

16.Show the titles of the books borrowed and not yet returned. (JOIN + IS NULL)
select Books.Title 
from Loans 
join Books on Loans.BookID = Books.BookID
where ReturnDate is null;

17.Get the total number of loans for each genre. (JOIN + GROUP BY Genre)
select Books.Genre, count(*) as TotalLoans
from Loans 
join Books on Loans.BookID = Books.BookID
group by Books.Genre;

18.Find members who borrowed books published before 2000. (JOIN with condition)
select DISTINCT Members.Name
from Loans 
join Members on Loans.MemberID = Members.MemberID
join Books on Loans.BookID = Books.BookID
where Books.Year < 2000;

19.Show books borrowed between '2025-04-01' and '2025-05-31'.
select Books.Title
from Loans 
join Books on Loans.BookID = Books.BookID
where LoanDate between '2025-04-01' and '2025-05-31';

20.Retrieve the names of members who borrowed 'Clean Code'. (JOIN with WHERE on Title)
select distinct Members.Name
from Loans
join Books on Loans.BookID = Books.BookID
join Members on Loans.MemberID = Members.MemberID
where Books.Title = 'Clean Code';




