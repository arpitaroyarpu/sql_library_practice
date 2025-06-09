# 📚 DBMS SQL Practice – 20 Essential Queries

This repository contains a set of **SQL practice queries** based on a sample library database. These queries are tailored to help prepare for semester finals, especially focusing on **JOINs**, filtering, and real-world use cases.

---

## 🗃️ Database Schema

**Books(BookID, Title, Author, Genre, Year)**  
**Members(MemberID, Name, JoinDate)**  
**Loans(LoanID, BookID, MemberID, LoanDate, ReturnDate)**

---

## 🔍 Sample Data

Sample data for each table is available in `db_practice.sql`.

---

## ✅ List of 20 Practice Queries

| No. | Query Description |
|-----|-------------------|
| 1   | Display all members’ names. |
| 2   | Get titles and authors of all programming books. |
| 3   | Show all loan records with **book titles** and **member names** (JOIN required). |
| 4   | List all books published after the year 2000. |
| 5   | Display all books **currently on loan** with the names of members who borrowed them. *(ReturnDate IS NULL)* |
| 6   | Find members who joined after January 1, 2024. |
| 7   | Retrieve books in the 'Fiction' or 'History' genre. |
| 8   | Show books written by 'Robert C. Martin'. |
| 9   | Count how many books each member has borrowed. *(GROUP BY)* |
| 10  | List all books borrowed in May 2025. |
| 11  | Get all distinct book titles that have been borrowed at least once. |
| 12  | Find the most recently published book. *(MAX on Year)* |
| 13  | Display members who have borrowed more than one book. |
| 14  | Show loan details for members whose name starts with 'R'. |
| 15  | List books that have **never been borrowed**. *(Subquery)* |
| 16  | Show the titles of the books borrowed and not yet returned. *(JOIN + IS NULL)* |
| 17  | Get the total number of loans for each genre. *(JOIN + GROUP BY Genre)* |
| 18  | Find members who borrowed books published before 2000. *(JOIN with condition)* |
| 19  | Show books borrowed between '2025-04-01' and '2025-05-31'. |
| 20  | Retrieve the names of members who borrowed 'Clean Code'. *(JOIN with WHERE on Title)* |

---

## 🔗 SQL Techniques Covered

- `SELECT`, `WHERE`, `JOIN`, `GROUP BY`, `ORDER BY`
- `IS NULL`, `DISTINCT`, `MAX()`, `COUNT()`
- `BETWEEN`, `LIKE`, `IN`, `NOT IN`
- Subqueries

---

## 📌 Usage

1. Import `db_practice.sql` into **XAMPP (phpMyAdmin)** or any SQL environment.
2. Run queries one by one to test your understanding.
3. Track your progress!

---

## 👩‍💻 Author

**Arpita Roy**  
Master's Student in IT | Passionate About Teaching & SQL 💻❤️  
📅 Semester Final: June 2025  

---

## 📂 Files in This Repo

- `sql_practice.sql` – Table creation and sample inserts  
- `README.md` – Description of database & query list  

---

⭐️ If you're preparing for a DBMS exam, **fork this repo**, practice daily, and happy querying!

