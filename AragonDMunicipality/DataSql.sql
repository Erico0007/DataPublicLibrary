use AragonMunicipalLibrary;
go




BULK INSERT Adult
FROM 'C:\Users\Eric\OneDrive - McGill University\Desktop\SQL Practice\AragonDMunicipality\Sample_Library_Data_Sources\adult.txt'
WITH (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1,
    CODEPAGE = 'ACP'
);
go




Select * from Adult
go


BULK INSERT Copy
FROM 'C:\Users\Eric\OneDrive - McGill University\Desktop\SQL Practice\AragonDMunicipality\Sample_Library_Data_Sources\copy.txt'
WITH (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1,
    CODEPAGE = 'ACP'
);
go

Select * from Copy
go


BULK INSERT Item
FROM 'C:\Users\Eric\OneDrive - McGill University\Desktop\SQL Practice\AragonDMunicipality\Sample_Library_Data_Sources\item.txt'
WITH (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1,
    CODEPAGE = 'ACP'
);

Select * from Item
go


BULK INSERT Juvenile
FROM 'C:\Users\Eric\OneDrive - McGill University\Desktop\SQL Practice\AragonDMunicipality\Sample_Library_Data_Sources\juvenile.txt'
WITH (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1,
    CODEPAGE = 'ACP'
);
go

Select * from juvenile
go


BULK INSERT Loan
FROM 'C:\Users\Eric\OneDrive - McGill University\Desktop\SQL Practice\AragonDMunicipality\Sample_Library_Data_Sources\loan.txt'
WITH (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1,
    CODEPAGE = 'ACP'
);
go

Select*from Loan
go


BULK INSERT Loanhist
FROM 'C:\Users\Eric\OneDrive - McGill University\Desktop\SQL Practice\AragonDMunicipality\Sample_Library_Data_Sources\loanhist.txt'
WITH (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1,
    CODEPAGE = 'ACP'
);
go

Select*from LoanHist


BULK INSERT Member
FROM 'C:\Users\Eric\OneDrive - McGill University\Desktop\SQL Practice\AragonDMunicipality\Sample_Library_Data_Sources\member.txt'
WITH (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1,
    CODEPAGE = 'ACP'
);
go

SELECT * FROM loanhist;

Select * from Member;

BULK INSERT Reservation
FROM 'C:\Users\Eric\OneDrive - McGill University\Desktop\SQL Practice\AragonDMunicipality\Sample_Library_Data_Sources\reservation.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE = 'ACP'
);
GO

select * from Reservation


BULK INSERT Title
FROM 'C:\Users\Eric\OneDrive - McGill University\Desktop\SQL Practice\AragonDMunicipality\Sample_Library_Data_Sources\title.txt'
WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1,
    CODEPAGE = 'ACP'
);
go

Select * From Title