use AragonMunicipalLibrary;
go


--Creating the Views 


--Create a mailing list of Library members that includes the members’ full names and complete address
--information.

Create view Mailinglist as 
Select Member.FirstName +  ' ' + Member.LastName as Fullname,
Adult.Street,
Adult.City,
Adult.State,
Adult.ZipCode
from Member
Join Adult
on Member.MemberID = Adult.AdultID;
go

Select * from Mailinglist;
go


--Write and execute a query on the title, item, and copy tables that returns the isbn, copy_no, on_loan,
--title, translation, and cover
--and values for rows in the copy table with an ISBN of 1 (one), 500 (five
--hundred), or 1000 (thousand). Order the result by ISBN column

CREATE VIEW ItemISBN AS
SELECT 
    Copy.ItemID AS ISBN,
    Copy.CopyID AS CopyNo,
    Copy.IsAvailable AS OnLoan,
    Title.TitleName AS BookName,
    Item.Language AS Translation,
    Item.Format AS Cover
FROM Copy
JOIN Item
    ON Item.ItemID = Copy.ItemID
JOIN Title
    ON Item.TitleID = Title.TitleID
WHERE Copy.ItemID IN (1, 500, 1000);

GO


Select * from ItemISBN;



--Write and execute a query to retrieve the member’s full name and member_no from the member table
--and the isbn and log_date values from the reservation table for members 250, 341, 1675
--Order the results
--by member_no.

SELECT Member.MemberID,
Member.FirstName +  ' ' + Member.LastName as Fullname,
Reservation.ItemID AS ISBN,
Reservation.ReservationDate as LogDate
from Member
left join Reservation
     on Member.MemberID = Reservation.MemberID
     Where Member.MemberID in (250,341,1675)
     Order by Member.MemberID;
     go


     --Create a view and save it as adultwideView that queries the member and adult tables. Lists the name & address for all adults.
--Create a view and save it


Create View Adultview as 

Select
   Member.MemberID,
   Member.FirstName,
   Member.LastName,
   Adult.Street,
   Adult.city,
   Adult.State,
   Adult.Zipcode
   From Member
   Join Adult
   on Member.MemberID = Adult.AdultID;


   Select *from Adultview;


   go



   --Create a view and save it as ChildwideView that queries the member, adult, and juvenile tables. Lists the name & address for the juveniles.




   CREATE VIEW ChildwideView AS
SELECT
    Member.MemberID,
    Member.FirstName,
    Member.LastName,
    Adult.Street,
    Adult.City,
    Adult.State,
    Adult.ZipCode
FROM Member
JOIN Juvenile
    ON Member.MemberID = Juvenile.JuvenileID
JOIN Adult
    ON Juvenile.AdultID = Adult.AdultID;

    
go 

Select * From ChildwideView;
go


   --Create a view and save it as CopywideView that queries the copy, title and item tables. Lists complete information about each copy.
   CREATE VIEW CopywideView AS
SELECT
    Copy.CopyID,
    Copy.ItemID,
    Copy.BranchID,
    Copy.IsAvailable,
    Item.Language,
    Item.Format,
    Item.InStock,
    Title.TitleName,
    Title.Author
FROM Copy
JOIN Item
    ON Copy.ItemID = Item.ItemID
JOIN Title
    ON Item.TitleID = Title.TitleID;


    Select *From CopywideView;



    --Create a view and save it as LoanableView that queries CopywideView (3-table join). Lists complete information about each copy marked as loanable (loanable = 'Y').

  CREATE VIEW LoanableView AS

  Select *
   from CopywideView
    where CopywideView.IsAvailable = 'Y';
    GO

    Select * From  LoanableView;




    --Create a view and save it as OnshelfView that queries CopywideView (3-table join). Lists complete information about each copy that is not currently on loan (on_loan ='N').

    Create View OneshelfView as
    Select * 
    from CopywideView
    Where CopywideView.InStock = 'N';
    Go 

      Select * From  OneshelfView;

      Drop View OneshelfView;



    --Create a view and save it as OnloanView that queries the loan, title, and member tables. Lists the member, title, and loan information of a copy that is currently on loan


    Create view OnloanView as
    Select
    Member.MemberID,
    Member.FirstName +  ' ' + Member.LastName as Fullname,
    Title.TitleID,
    Title.TitleName AS BookName,
    Title.Author,
    Loan.CopyID,
    Loan.LoanDate,
    Loan.ReturnDate
    FROM Loan
    Join Member
       on Loan.MemberID = Member.Memberid
       Join Copy 
       on  loan.copyID = copy.copyID
       Join Item
        on copy.itemID = item.itemID
        Join title 
        ON item.titleID = title.titleID
        WHERE loan.returnDate IS NULL;
        go


        Select * From OnloanView;

      

        -- Check if your Loan table actually has active loans

        SELECT *
          FROM Loan
         WHERE ReturnDate IS NULL;



--Create a view and save it as OverdueView that queries OnloanView (3-table join.) Lists the member, title, and loan information of a copy on loan that is overdue (due_date < current date).

Create view OverdueView as
Select *
from OnloanView
Where OnloanView.ReturnDate < GETDATE();

Select * From OverdueView;
go

