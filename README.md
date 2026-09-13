# DataPublicLibrary
Database Design &amp; Business Applications Development
To design and develop a database management system using recommended best practices covered in class. You will work to prepare the final project based on a case problem. You should use all techniques covered in this course.
This project describes a case study project. You must follow all requested tasks and apply them to your own project.
Although one person can maintain a small database management system, larger systems require groups of people filling a variety of roles. Of course, the line between these roles can be blurred, and many aspects of database design require collaboration to solve a problem.
Project Update Meeting: at the end of each class, you’ll have about 15 minutes to discuss your project.
Start working with your team members. It is often helpful to have someone volunteer to be the "leader". Another group member should volunteer to post the group's SUMMARY message. Some groups divide up the work, and each student has a smaller task. Other groups have each member research and then they combine the best of the answers together. It's up to you.
How to be successful in the group work:
•
Determine which group you are in.
•
Decide in the next class how to divide the work. Decide who will post the summary response.
Project includes (Part One)
1.
Following the Step-by-Step in Designing a database.
2.
Creating database, schema, and table objects (Task 1).
3.
Applying data integrity using constraints (Task 2).
Task 1
To ensure that you have a way to practice everything you learned in Database course, you are going to design and complete a separate database for a similar business, Aragon Municipal Library, which has slightly different data needs and requirements from its main business in USA. Aragon Municipal Library is located in Montreal, Quebec (Canada).
This library has similar needs to those of West Municipal Library, USA, but because Canada has different requirements for the data it collects, you will need to develop the database with these needs in mind. You will create this database and then do all subsequent work in your copy of the database. This approach makes it possible for you to develop a database from scratch and practice everything you learned in the database courses.
The Library Database Case Study provides an overview of the operations at the West Municipal Library, describes the daily library functions, and presents the database that was designed for the library.
Create tables in the Library Database
I.
Create tables in the Library Database, minimum 9 tables for the Library Database:
1.
Member table, defining the following column names with their respective data types.
member_no, lastName, firstName, middelInitial, photograph, and so on.
2.
Adult table, defining the column names with their respective data types. Make sure that the phone_no column allows null values. Make sure that all other columns do not allow null values.
member_no, street, city, state, zip, phone_no, expr_date, and so on.
3.
Create the rest of the tables based on the business rules defined in this project. Create the Library diagram.
Task 2
In this Task, you will:
1.
Define and use all types of constraints to enforce business rules: Primary Key, Foreign Key, Default, Check, and Unique constraints to enforce data integrity.
2.
Create or modify the default constraint that makes QC (Quebec) the default for the province column in the adult table.
3.
Create a phone number constraint to the adult table. You may use a regular expression pattern.
4.
Create all primary key constraints.
5.
Write a script that adds all foreign key constraints.
6.
Write a script that adds all default constraints.
7.
Write a script that adds all check key constraints.
8.
Write a script that adds all unique constraints.
Task 3 – Creating Views
In this task, you will
I.
Use the Library database created and modified in the previous tasks.
II.
Write scripts that join tables in the library database.
III.
Use the GROUP BY and HAVING clauses to summarize data by groups.
IV.
Create Views
1.
Create a mailing list of Library members that includes the members’ full names and complete address information.
2.
Write and execute a query on the title, item, and copy tables that returns the isbn, copy_no, on_loan, title, translation, and cover, and values for rows in the copy table with an ISBN of 1 (one), 500 (five hundred), or 1000 (thousand). Order the result by ISBN column.
3.
Write and execute a query to retrieve the member’s full name and member_no from the member table and the isbn and log_date values from the reservation table for members 250, 341, 1675. Order the results by member_no. You should show information for these members, even if they have no books or reserve.
4.
Create a view and save it as adultwideView that queries the member and adult tables. Lists the name & address for all adults.
5.
Create a view and save it as ChildwideView that queries the member, adult, and juvenile tables. Lists
Create a view and save it as CopywideView that queries the copy, title and item tables. Lists complete information about each copy.
Course Name: Database Design & Business Applications Development Team Project
Department of Career and Management Studies – McGill University Page 3 of 5
L a s t U p d a t e d : J u n e 2 0 , 2 0 2 4
7.
Create a view and save it as LoanableView that queries CopywideView (3-table join). Lists complete information about each copy marked as loanable (loanable = 'Y').
8.
Create a view and save it as OnshelfView that queries CopywideView (3-table join). Lists complete information about each copy that is not currently on loan (on_loan ='N').
9.
Create a view and save it as OnloanView that queries the loan, title, and member tables. Lists the member, title, and loan information of a copy that is currently on loan.
10.
Create a view and save it as OverdueView that queries OnloanView (3-table join.) Lists the member, title, and loan information of a copy on loan that is overdue (due_date < current date).


Generating Usage Reports
Occasionally, librarians must compile usage information, mostly for the Town Council or the Planning Commission. These groups usually want to know information, such as the volume of circulation, the popularity of various books, the reliability of return, and the average length of a borrowing term. Therefore, the librarians need to be able to prepare quick summaries of this information.
The types of questions that are frequently asked include the following:
1.
How many loans did the library make last year?
2.
What percentage of the membership borrowed at least one book?
3.
What was the greatest number of books borrowed by any one individual?
4.
What percentage of the books was loaned out at least once last year?
5.
What percentage of all loans eventually become overdue?
6.
What is the average length of a loan?
7.
What are the library's peak hours for loans?
