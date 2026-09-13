use AragonMunicipalLibrary;
go


-- Task 4 Create Stored Procedures and Triggers




create trigger trg_loancreated 
 on loan
after insert
as 
begin 

Declare @CopyID INT;

SELECT @Copyid = Copyid
from inserted ;


update Copy
SET IsAvailable = 'Y'
Where CopyID = @CopyID;
END;
GO

SELECT name
FROM sys.triggers;

--Trigger: When a loan is returned


CREATE TRIGGER TRG_RETURNEDLOAN 
ON LOAN 
AFTER UPDATE 
AS 
BEGIN 
Declare @CopyID INT;

Select @CopyID = CopyID
FROM inserted;

UPDATE Copy
SET IsAvailable = 'N'  
where CopyID = @CopyID
end;



--Trigger: Detect overdue loans

create trigger trg_overdueloan 
on loan
after UPDATE
as 
begin 

DECLARE @COPYID INT;
DECLARE @RETURNDATE DATE;
DECLARE @loandate DATE ;

SELECT @CopyID = CopyID,
  @RETURNDATE = returnDate,
  @loandate = loandate
FROM inserted;

if (@RETURNDATE is not null and @RETURNDATE > @loandate)
begin 
update Copy
SET IsAvailable = 'N'  
where CopyID = @CopyID;
end
end;

go




--Count total loans per member

CREATE TRIGGER TRG_LOANPERMEMBER
ON Loan
AFTER INSERT 
AS
BEGIN 
    SET NOCOUNT ON;

    -- Update all members affected by the insert in one set-based operation
    UPDATE m
    SET M.MemberType= l.TotalLoans
    FROM Member m
    INNER JOIN (
        SELECT MemberID, COUNT(*) AS TotalLoans
        FROM Loan
        WHERE MemberID IN (SELECT DISTINCT MemberID FROM INSERTED)
        GROUP BY MemberID
    ) l ON m.MemberID = l.MemberID;
END;








