use master ;
go 

create database AragonMunicipalLibrary

on primary( 

name = 'AragonMinicapilityDatabase',
size = 30 mb,
filegrowth = 10mb ,
maxsize = unlimited ,
 filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQL2025\MSSQL\DATA\AragonMunicipalLibrary.mdf'
 )

 log on 

(

name = 'AragonMunicipalLibrarye_log',
size = 7 MB,
filegrowth = 10%,
maxsize = 25 MB,
filename =  'C:\Program Files\Microsoft SQL Server\MSSQL17.SQL2025\MSSQL\DATA\AragonMunicipalLibrary.ldf'
)
;
go