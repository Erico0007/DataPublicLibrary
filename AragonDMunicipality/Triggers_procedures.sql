use AragonMunicipalLibrary;
go



---Task 4 Create Stored Procedures and Triggers


--How many loans did the library make last year

Create Procedure LoanLibrary

as 
begin 

DECLARE @TargetYear int = 2008;

DECLARE @last_year_start DATE = DATEFROMPARTS(@TargetYear - 1, 1, 1);
DECLARE @last_year_end   DATE = DATEFROMPARTS(@TargetYear - 1, 12, 31);

SELECT COUNT(*) FROM Loan
  Where LoanDate between @last_year_start and @last_year_end;

end 

EXEC LoanLibrary;



--What percentage of the membership borrowed at least one book?




Create Procedure BookPercentage

as 

Begin 

DECLARE @TargetYear int = 2008;

DECLARE @last_year_start DATE = DATEFROMPARTS(@TargetYear - 1, 1, 1);
DECLARE @last_year_end   DATE = DATEFROMPARTS(@TargetYear - 1, 12, 31);

DECLARE @TOTALMEMBERS INT;
DECLARE @BORRROWINGMEMBERS INT;
DECLARE @PERCENTAGE FLOAT;

Select @TOTALMEMBERS = COUNT(*) FROM Member;

SELECT @BORRROWINGMEMBERS = COUNT(DISTINCT MEMBERID)  FROM LOAN 
WHERE LoanDate between @last_year_start and @last_year_end;


select @PERCENTAGE = (@BORRROWINGMEMBERS/@TOTALMEMBERS)*100;

Select  @PERCENTAGE AS PercentageBorrowed ;

end 

EXEC BookPercentage



--What was the greatest number of books borrowed by any one individual?


Create Procedure BookBorrowed

as 

begin 

DECLARE @MAXIMUNVALUE  INT;

Select @MAXIMUNVALUE = MAX(LoansCount)
from 
(
SELECT MemberID, COUNT(*) AS LoansCount
from Loan
Group by MemberID
) as BorrowedStats 

Select @MAXIMUNVALUE as Maxborrowedbook;
end 
go

EXEC BookBorrowed






--percentage of all loans eventually become overdue?


Create Procedure LoanOverdue 

as 

BEGIN 

DECLARE @TOTALSLOANS INT;
DECLARE @OVERDUELOANS INT;
DECLARE @PERCENTAGEOVERDUE FLOAT;


SELECT @TOTALSLOANS = COUNT(*)FROM Loan 

SELECT @OVERDUELOANS = COUNT (*) From  Loan 
        where loan.loandate < loan.returndate

select @PERCENTAGEOVERDUE = (@OVERDUELOANS / @TOTALSLOANS)*100

SELECT @PERCENTAGEOVERDUE AS OVERDUE;

END;


EXEC LoanOverdue

DROP PROCEDURE LoanOverdue;



--What is the average length of a loan?

CREATE PROCEDURE LOANAVERAGE

AS 

BEGIN 

DECLARE @LENGTHLOAN  float ;


SELECT @LENGTHLOAN = AVG(loanavg)
from(
SELECT 
  DATEDIFF(DAY, LoanDate,Loan.ReturnDate) AS  loanavg
    from Loan ) as loanaveragelength

    Select @LENGTHLOAN as Averageloan 

    end;


    EXEC LOANAVERAGE;



    --What are the library's peak hours for loans?


    CREATE PROCEDURE  LIBRARYHOUR 
    
    AS 
    BEGIN 

  DECLARE  @PEAKHOUR INT; 

    -- Count loans per hour and select the hour with the highest count


    SELECT TOP 1 @PEAKHOUR = LOANHOUR
    FROM(

    SELECT DATEPART( HOUR,Loan.LoanDate) as LOANHOUR,
    COUNT (*) as LoanPerHour
    from Loan
    group by DATEPART(Hour, Loan.LoanDate)
    ) as Hourstats
    Order by LoanPerHour desc 

    SELECT @PEAKHOUR AS LOANPEAKHOUR;
    END;
    GO

    EXEC LIBRARYHOUR;





