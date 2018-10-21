--C:\Users\Beosama\Desktop\Study\colledge\Kiểm thử phần mềm\DemoDATABASE

IF DB_ID('DemoQuanLyThuVienAlphaVer1_2') IS NULL 
	CREATE DATABASE DemoQuanLyThuVienAlphaVer1_2
GO


USE DemoQuanLyThuVienAlphaVer1_2
GO

-- Book
-- BookCategory
-- Account
-- Student
-- Rent / phieu muon -> bill
-- RentInfo / thong tin phieu -> billinfo


CREATE TABLE Student
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Học sinh chưa có tên',
	mssv NVARCHAR(100) NOT NULL DEFAULT N'113',
	--khoa
	status NVARCHAR(100) NOT NULL DEFAULT N'' -- đang thuê || chưa thuê
	
)
GO
CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,	
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Gia Lai',
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL  DEFAULT 0 -- 1: admin && 0: staff
)
GO

CREATE TABLE BookCategory -- danh mục sách
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)
GO

CREATE TABLE Book
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idCategory INT NOT NULL,
	releaseYear INT NOT NULL,
	nameAuthor NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	nameNXB NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	price FLOAT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idCategory) REFERENCES dbo.BookCategory(id)
	
)
GO

CREATE TABLE Rent
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idStudent INT NOT NULL,
	status INT NOT NULL DEFAULT 0 
	
	FOREIGN KEY (idStudent) REFERENCES dbo.Student(id)
)
GO

CREATE TABLE RentInfo
(
	id INT IDENTITY PRIMARY KEY,
	idRent INT NOT NULL,
	idBook INT NOT NULL,
	count INT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idRent) REFERENCES dbo.Rent(id),
	FOREIGN KEY (idBook) REFERENCES dbo.Book(id)
)
GO



--**************************************************************************************************
-- INSERT secsion
--**************************************************************************************************











INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'GiaLai' , -- UserName - nvarchar(100)
          N'Admin' , -- DisplayName - nvarchar(100)
          N'123' , -- PassWord - nvarchar(1000)
          1  -- Type - int
        )
INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'16510100451' , -- UserName - nvarchar(100)
          N'Nguyễn Minh Đức #1' , -- DisplayName - nvarchar(100)
          N'123' , -- PassWord - nvarchar(1000)
          0  -- Type - int
        )
GO

INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'16510100452' , -- UserName - nvarchar(100)
          N'Nguyễn Minh Đức #2' , -- DisplayName - nvarchar(100)
          N'123' , -- PassWord - nvarchar(1000)
          0  -- Type - int
        )
GO
INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'16510100453' , -- UserName - nvarchar(100)
          N'Nguyễn Minh Đức #3' , -- DisplayName - nvarchar(100)
          N'123' , -- PassWord - nvarchar(1000)
          0  -- Type - int
        )
GO

INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'16510100454' , -- UserName - nvarchar(100)
          N'Nguyễn Minh Đức #4' , -- DisplayName - nvarchar(100)
          N'123' , -- PassWord - nvarchar(1000)
          0  -- Type - int
        )
GO


--xử lý đăng nhập
CREATE PROC USP_Login
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName AND PassWord = @passWord
END
GO


--**************************************************************************************************







--ALTER procedure [dbo].[spInsertDeletedIntoTBLContent]
--@ContentID int, 











--Cannot insert explicit value for identity column in table 'Book' when IDENTITY_INSERT is set to OFF.
SET IDENTITY_INSERT dbo.Book ON
--The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Book__price__22AA2996". The conflict occurred in database "DemoQuanLyThuVienAlphaVer1_2", table "dbo.BookCategory", column 'id'.
--The statement has been terminated.
INSERT dbo.Book
        ( id ,
          name ,
          idCategory ,
          releaseYear ,
          nameAuthor ,
          nameNXB ,
          price
        )
VALUES  ( 0 , -- id - int
          N'Cách để thông đít cực mạnh' , -- name - nvarchar(100)
          0 , -- idCategory - int
          0 , -- releaseYear - int
          N'Nguyễn Minh Đức' , -- nameAuthor - nvarchar(100)
          N'Danh Copperating' , -- nameNXB - nvarchar(100)
          69696969.0  -- price - float
        )

SET IDENTITY_INSERT dbo.Book OFF
GO


