use AragonMunicipalLibrary;
go



-- Drop in correct dependency order (child → parent)

IF OBJECT_ID('dbo.Juvenile', 'U') IS NOT NULL
    DROP TABLE dbo.Juvenile;
GO

IF OBJECT_ID('dbo.Copy', 'U') IS NOT NULL
    DROP TABLE dbo.Copy;
GO

IF OBJECT_ID('dbo.Item', 'U') IS NOT NULL
    DROP TABLE dbo.Item;
GO

IF OBJECT_ID('dbo.Loan', 'U') IS NOT NULL
    DROP TABLE dbo.Loan;
GO

IF OBJECT_ID('dbo.Member', 'U') IS NOT NULL
    DROP TABLE dbo.Member;
GO

IF OBJECT_ID('dbo.Reservation', 'U') IS NOT NULL
    DROP TABLE dbo.Reservation;
GO

IF OBJECT_ID('dbo.Title', 'U') IS NOT NULL
    DROP TABLE dbo.Title;
GO

-- Adult must be dropped LAST because Juvenile references it
IF OBJECT_ID('dbo.Adult', 'U') IS NOT NULL
    DROP TABLE dbo.Adult;
GO

IF OBJECT_ID('dbo.Loanhist', 'U') IS NOT NULL
    DROP TABLE dbo.LoanHist;
GO


---------------------------------------------------------
-- Now recreate tables
---------------------------------------------------------

CREATE TABLE Adult (
    AdultID INT PRIMARY KEY,
    Street VARCHAR(100),
    City VARCHAR(50),
    State CHAR(2),
    ZipCode VARCHAR(15),
    CreatedDate DATETIME
);
GO

CREATE TABLE Copy (
    CopyID INT,
    ItemID INT,
    BranchID INT,
    IsAvailable CHAR(1),
    PRIMARY KEY (CopyID, ItemID, BranchID)
);
GO

CREATE TABLE Item (
    ItemID INT,
    TitleID INT,
    Language VARCHAR(30),
    Format VARCHAR(20),
    InStock CHAR(1),
    PRIMARY KEY (ItemID, TitleID, Language, Format)
);
GO

CREATE TABLE Juvenile (
    JuvenileID INT PRIMARY KEY,
    AdultID INT,
    CreatedDate DATETIME,
    FOREIGN KEY (AdultID) REFERENCES Adult(AdultID)
);
GO

CREATE TABLE Loan (
    MemberID INT,
    CopyID INT,
    BranchID INT,
    LoanAmount INT,
    LoanDate DATETIME,
    ReturnDate DATETIME
);
GO


CREATE TABLE LoanHist (
    MemberID INT NOT NULL,
    CopyID INT NOT NULL,
    LoanDate DATETIME NOT NULL,
    BranchID INT NOT NULL,
    LoanAmount INT NOT NULL,
    ReturnDate DATETIME NULL,
    ProcessedDate DATETIME NULL
);
go

CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    MemberType CHAR(1)
);
GO

CREATE TABLE Reservation (
    MemberID INT,
    ItemID INT,
    ReservationDate DATETIME,
    PRIMARY KEY (MemberID, ItemID)
);
GO

CREATE TABLE Title (
    TitleID INT PRIMARY KEY,
    TitleName VARCHAR(200),
    Author VARCHAR(100)
);
GO





ALTER TABLE Loan 
ALTER COLUMN LoanDate VARCHAR(50) NULL;




ALTER TABLE Member
ALTER COLUMN MemberType VARCHAR(50);


DROP TABLE IF EXISTS Juvenile;
DROP TABLE IF EXISTS Adult;


DROP TABLE Loan;
GO