USE [master]
GO
/****** Object:  Database [CustomerDatabase]    Script Date: 8/19/2022 7:40:01 AM ******/
CREATE DATABASE [CustomerDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CustomerDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CustomerDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CustomerDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CustomerDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomerDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomerDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CustomerDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CustomerDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CustomerDatabase] SET QUERY_STORE = OFF
GO
USE [CustomerDatabase]
GO
/****** Object:  Table [dbo].[ContactTypes]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactTypes](
	[Identifier] [int] IDENTITY(1,1) NOT NULL,
	[ContactType] [nvarchar](50) NULL,
 CONSTRAINT [PK_ContactTypes] PRIMARY KEY CLUSTERED 
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Identifier] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](255) NULL,
	[ContactName] [nvarchar](255) NULL,
	[ContactTypeIdentifier] [int] NULL,
	[GenderIdentifier] [int] NULL,
 CONSTRAINT [Customer$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GenderType] [nvarchar](max) NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewAccountTable]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewAccountTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerAccountNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_NewAccountTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContactTypes] ON 

INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (1, N'Account Manager')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (2, N'Assistant Sales Agent')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (3, N'Assistant Sales representative')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (4, N'Marketing assistant')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (5, N'Marketing Manager')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (6, N'Order Administrator')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (7, N'Owner')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (8, N'Owner/Marketing Assistant')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (9, N'Sales Agent')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (10, N'Sales Associate')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (11, N'Sales Manager')
INSERT [dbo].[ContactTypes] ([Identifier], [ContactType]) VALUES (12, N'Sales Representative')
SET IDENTITY_INSERT [dbo].[ContactTypes] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (1, N'Fly Girls', N'Tim Clark', 7, 2)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (2, N'Coffee Paradise', N'Ann Adams', 12, 1)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (3, N'Garrys Coffee', N'Mary Clime', 7, 2)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (4, N'Salem Boat Rentals', N'Bill Willis', 9, 2)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (5, N'Knifes are us', N'Kathy Willians', 7, 1)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (6, N'Karen''s fish', N'Karen Payne', 7, 1)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (7, N'Best tax preparers', N'Hank Smith', 7, 3)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (8, N'ABC', N'Karen Payne', 7, 1)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (9, N'Waters LLC', N'Karla Nicolas', 11, 1)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (12, N'Rodriguez and Sons', N'Ervin Zemlak', 11, 2)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (13, N'Maggio, Maggio and Heller', N'Lorene Roberts', 6, 2)
INSERT [dbo].[Customer] ([Identifier], [CompanyName], [ContactName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (14, N'Ankunding, Goodwin and Mayer', N'Joe Dare', 7, 2)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([id], [GenderType]) VALUES (1, N'Female')
INSERT [dbo].[Genders] ([id], [GenderType]) VALUES (2, N'Male')
INSERT [dbo].[Genders] ([id], [GenderType]) VALUES (3, N'Other')
SET IDENTITY_INSERT [dbo].[Genders] OFF
SET IDENTITY_INSERT [dbo].[NewAccountTable] ON 

INSERT [dbo].[NewAccountTable] ([Id], [CustomerAccountNumber]) VALUES (1, N'A0001')
SET IDENTITY_INSERT [dbo].[NewAccountTable] OFF
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_ContactTypes] FOREIGN KEY([ContactTypeIdentifier])
REFERENCES [dbo].[ContactTypes] ([Identifier])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_ContactTypes]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Genders] FOREIGN KEY([GenderIdentifier])
REFERENCES [dbo].[Genders] ([id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Genders]
GO
/****** Object:  StoredProcedure [dbo].[ContactByType]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE PROCEDURE [dbo].[ContactByType] 
    @ContactTitleTypeIdentifier INT
AS 
BEGIN 
    SET NOCOUNT ON; 
    SELECT  
        Identifier,  
        CompanyName,  
        ContactName  
    FROM  
        Customer  
    WHERE  
        Customer.ContactTypeIdentifier = @ContactTitleTypeIdentifier
END 
 


GO
/****** Object:  StoredProcedure [dbo].[Customer_Reader]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Customer_Reader]
	@CustomerIdentifier int=null,
	@CompanyName varchar(50)=null
AS
BEGIN

	SET NOCOUNT ON;

	SELECT Identifier ,
           CompanyName ,
           ContactName ,
           ContactTypeIdentifier ,
           GenderIdentifier FROM dbo.Customer
	WHERE
	(Identifier=@CustomerIdentifier OR @CustomerIdentifier IS NULL)	AND 
	(CompanyName=@CompanyName OR @CompanyName IS NULL)

END
GO
/****** Object:  StoredProcedure [dbo].[CustomerInsertOrUpdate]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[CustomerInsertOrUpdate] 
    @Identifier int = NULL OUTPUT, 
    @CompanyName nvarchar(255), 
    @ContactName nvarchar(255), 
    @ContactTitle nvarchar(255) 
AS 
BEGIN 
    SET NOCOUNT ON; 
    IF @Identifier IS NULL 
    BEGIN 
        INSERT INTO Customer  
            (CompanyName,ContactName,ContactTitle) 
        VALUES  
            (@CompanyName, @ContactName, @ContactTitle) 
        SET @Identifier = SCOPE_IDENTITY() 
    END 
    ELSE 
    BEGIN 
        UPDATE Customer 
        SET    CompanyName = @CompanyName, 
            ContactName = @ContactName, 
            ContactTitle = @ContactTitle 
    END     
END 
 

GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================= 
-- Author:        <Author,,Name> 
-- Create date: <Create Date,,> 
-- Description:    <Description,,> 
-- ============================================= 
CREATE PROCEDURE [dbo].[DeleteCustomer] 
    @flag bit output,-- return 0 for fail,1 for success 
    @Identity int 
AS 
BEGIN 
    -- SET NOCOUNT ON added to prevent extra result sets from 
    -- interfering with SELECT statements. 
    SET NOCOUNT ON; 
    BEGIN TRANSACTION  
    BEGIN TRY 
        DELETE FROM Customer WHERE Identifier = @Identity set @flag=1;  
        IF @@TRANCOUNT > 0 
            BEGIN commit TRANSACTION; 
        END 
    END TRY 
    BEGIN CATCH 
        IF @@TRANCOUNT > 0 
            BEGIN rollback TRANSACTION;  
        END 
        set @flag=0;  
    END CATCH  
 END  
 
 

GO
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertCustomer]  
    @CompanyName NVARCHAR(200), 
    @ContactName NVARCHAR(200), 
    @ContactTypeIdentifier INT, 
    @Identity INT OUT 
AS 
BEGIN 
    -- SET NOCOUNT ON added to prevent extra result sets from 
    -- interfering with SELECT statements. 
    SET NOCOUNT ON; 
 
INSERT INTO Customer(CompanyName,ContactName,ContactTypeIdentifier)  
    VALUES(@CompanyName,@ContactName,@ContactTypeIdentifier) 
 
SET @Identity = SCOPE_IDENTITY() 
 
END 
 


GO
/****** Object:  StoredProcedure [dbo].[SelectAllCustomers]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE PROCEDURE [dbo].[SelectAllCustomers] 
AS 
BEGIN 
    SET NOCOUNT ON; 
SELECT Cust.Identifier ,
       Cust.CompanyName ,
       Cust.ContactName ,
       Cust.ContactTypeIdentifier ,
       CT.ContactType AS ContactTitle
FROM   Customer AS Cust
       INNER JOIN ContactTypes AS CT ON Cust.ContactTypeIdentifier = CT.Identifier;
END 


GO
/****** Object:  StoredProcedure [dbo].[SelectContactTitles]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================= 
-- Author:        <Author,,Name> 
-- Create date: <Create Date,,> 
-- Description:    <Description,,> 
-- ============================================= 
CREATE PROCEDURE [dbo].[SelectContactTitles] 
AS 
BEGIN 
    SET NOCOUNT ON; 

SELECT Identifier
      ,ContactType
  FROM dbo.ContactTypes
END 
 


GO
/****** Object:  StoredProcedure [dbo].[UpateCustomer]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================= 
-- Author:        <Author,,Name> 
-- Create date: <Create Date,,> 
-- Description:    <Description,,> 
-- ============================================= 
CREATE PROCEDURE [dbo].[UpateCustomer] 
    @flag BIT OUTPUT,-- return 0 for fail,1 for success 
    @CompanyName NVARCHAR(200), 
    @ContactName NVARCHAR(200), 
    @ContactTypeIdentifier INT, 
    @Identity INT 
AS 
BEGIN 
    -- SET NOCOUNT ON added to prevent extra result sets from 
    -- interfering with SELECT statements. 
    SET NOCOUNT ON; 
    BEGIN TRANSACTION  
    BEGIN TRY 
        UPDATE dbo.Customer SET  
            CompanyName = @CompanyName,  
            ContactName = @ContactName,  
            ContactTypeIdentifier = @ContactTypeIdentifier 
        WHERE Identifier = @Identity 
        SET @flag=1;  
        IF @@TRANCOUNT > 0 
            BEGIN COMMIT TRANSACTION; 
        END 
    END TRY 
    BEGIN CATCH 
        IF @@TRANCOUNT > 0 
            BEGIN ROLLBACK TRANSACTION;  
        END 
        SET @flag=0; 
    END CATCH 
 END  
 
 


GO
/****** Object:  StoredProcedure [dbo].[usp_ThrowDummyException]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ThrowDummyException] 
  @ErrorMessage   varchar(2000) OUTPUT
 ,@ErrorSeverity  INT OUTPUT
 ,@ErrorState     INT OUTPUT
AS
BEGIN


BEGIN TRY

	RAISERROR('your message here',16,1)

END TRY

BEGIN CATCH
    SET @ErrorMessage  = ERROR_MESSAGE()
    SET @ErrorSeverity = ERROR_SEVERITY()
    SET @ErrorState    = ERROR_STATE()
    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[uspDummy]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspDummy]   
    @FirstName nvarchar(50) OUT, 
    @LastName nvarchar(200)OUT, 
    @Identity int OUT 
AS 
BEGIN 

    SET NOCOUNT ON; 

	SET @Identity = 100
	SET @FirstName = N'Karen'
	SET @LastName = N'Payne'
END 
 

GO
/****** Object:  StoredProcedure [dbo].[uspInsertPerson]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================= 
-- Author:        <Author,,Name> 
-- Create date: <Create Date,,> 
-- Description:    <Description,,> 
-- ============================================= 
CREATE PROCEDURE [dbo].[uspInsertPerson]   
    @FirstName nvarchar(50), 
    @LastName nvarchar(200), 
    @Identity int OUT 
AS 
BEGIN 
    -- SET NOCOUNT ON added to prevent extra result sets from 
    -- interfering with SELECT statements. 
    SET NOCOUNT ON; 
 
INSERT INTO [dbo].[Table_1]([FirstName],[LastName]) 
    VALUES(@FirstName,@LastName) 
 
SET @Identity = SCOPE_IDENTITY() 
END 
 

GO
/****** Object:  StoredProcedure [dbo].[uspUpatePerson]    Script Date: 8/19/2022 7:40:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[uspUpatePerson] 
    @flag bit output,-- return 0 for fail,1 for success 
    @FirstName nvarchar(200), 
    @LastName nvarchar(200), 
    @Identity int 
AS 
BEGIN 
    -- SET NOCOUNT ON added to prevent extra result sets from 
    -- interfering with SELECT statements. 
    SET NOCOUNT ON; 
    BEGIN TRANSACTION  
    BEGIN TRY 
        UPDATE [dbo].[Table_1] SET  
            FirstName = @FirstName,  
            LastName = @LastName 
        WHERE Identifier = @Identity 
        set @flag=1;  
        IF @@TRANCOUNT > 0 
            BEGIN commit TRANSACTION; 
        END 
    END TRY 
    BEGIN CATCH 
        IF @@TRANCOUNT > 0 
            BEGIN rollback TRANSACTION;  
        END 
        set @flag=0; 
    END CATCH 
END 
 

GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CustomersDatabase.[Customer].[Identifier]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Identifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CustomersDatabase.[Customer].[CompanyName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CustomersDatabase.[Customer].[ContactName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'ContactName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CustomersDatabase.[Customer].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'CONSTRAINT',@level2name=N'Customer$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CustomersDatabase.[Customer]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer'
GO
USE [master]
GO
ALTER DATABASE [CustomerDatabase] SET  READ_WRITE 
GO
