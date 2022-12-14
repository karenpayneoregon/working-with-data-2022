USE [master]
GO
/****** Object:  Database [CustomerDatabase2]    Script Date: 8/19/2022 7:41:50 AM ******/
CREATE DATABASE [CustomerDatabase2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerDatabase2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CustomerDatabase2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CustomerDatabase2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CustomerDatabase2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CustomerDatabase2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerDatabase2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerDatabase2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerDatabase2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerDatabase2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomerDatabase2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerDatabase2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CustomerDatabase2] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerDatabase2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerDatabase2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerDatabase2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerDatabase2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CustomerDatabase2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CustomerDatabase2] SET QUERY_STORE = OFF
GO
USE [CustomerDatabase2]
GO
/****** Object:  Table [dbo].[ContactDevices]    Script Date: 8/19/2022 7:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactDevices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContactId] [int] NULL,
	[PhoneTypeIdentifier] [int] NULL,
	[PhoneNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_ContactDevices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 8/19/2022 7:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[ContactTypeIdentifier] [int] NULL,
	[GenderIdentifier] [int] NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactType]    Script Date: 8/19/2022 7:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactType](
	[ContactTypeIdentifier] [int] IDENTITY(1,1) NOT NULL,
	[ContactTitle] [nvarchar](max) NULL,
 CONSTRAINT [PK_ContactType] PRIMARY KEY CLUSTERED 
(
	[ContactTypeIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 8/19/2022 7:41:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryIdentifier] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/19/2022 7:41:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerIdentifier] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactId] [int] NULL,
	[Street] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[CountryIdentifier] [int] NULL,
	[Phone] [nvarchar](24) NULL,
	[ContactTypeIdentifier] [int] NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Customers_1] PRIMARY KEY CLUSTERED 
(
	[CustomerIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 8/19/2022 7:41:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[GenderIdentifier] [int] IDENTITY(1,1) NOT NULL,
	[GenderType] [nvarchar](max) NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[GenderIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneType]    Script Date: 8/19/2022 7:41:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneType](
	[PhoneTypeIdenitfier] [int] IDENTITY(1,1) NOT NULL,
	[PhoneTypeDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhoneType] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeIdenitfier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContactDevices] ON 

INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (1, 1, 3, N'(5) 555-4729')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (2, 2, 3, N'(5) 555-3932')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (3, 3, 3, N'(171) 555-7788')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (4, 4, 3, N'0921-12 34 65')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (5, 1, 1, N'(5) 555-4729')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (6, 5, 3, N'0921-12 34 35')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (7, 5, 2, N'0921-11 34 65')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (8, 5, 1, N'0921-10 34 65')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (9, 6, 3, N'0621-08460')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (10, 6, 2, N'0621-08444')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (11, 6, 1, N'0555-08460')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (12, 7, 3, N'88.60.15.31')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (13, 8, 3, N'(91) 555 22 82')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (14, 9, 3, N'91.24.45.40')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (15, 11, 3, N'(1) 135-5555')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (16, 12, 3, N'(5) 555-3392')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (17, 14, 3, N'(171) 555-2282')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (18, 15, 3, N'0241-039123')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (19, 16, 3, N'40.67.88.88')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (20, 17, 3, N'(171) 555-0297')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (21, 18, 3, N'7675-3425')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (22, 19, 3, N'(91) 555 94 44')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (23, 20, 3, N'20.16.10.16')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (24, 21, 3, N'0695-34 67 21')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (25, 22, 3, N'089-0877310')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (26, 23, 3, N'40.32.21.21')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (27, 24, 3, N'011-4988269')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (28, 25, 3, N'(1) 354-2534')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (29, 26, 3, N'(93) 203 4560')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (30, 27, 3, N'(95) 555 82 82')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (31, 28, 3, N'0555-09876')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (32, 29, 3, N'30.59.84.10')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (33, 30, 3, N'61.77.61.10')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (34, 31, 3, N'069-0245984')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (35, 32, 3, N'035-640230')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (36, 33, 3, N'(02) 201 24 67')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (37, 34, 3, N'0342-023176')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (38, 35, 3, N'(171) 555-7733')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (39, 36, 3, N'(1) 135-5333')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (40, 37, 3, N'0221-0644327')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (41, 38, 3, N'(1) 42.34.22.66')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (42, 39, 3, N'(5) 552-3745')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (43, 40, 3, N'6562-9722')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (44, 41, 3, N'(1) 356-5634')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (45, 42, 3, N'0372-035188')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (46, 43, 3, N'(1) 123-5555')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (47, 44, 3, N'0522-556721')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (48, 45, 3, N'0897-034214')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (49, 46, 3, N'(91) 745 6200')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (50, 47, 3, N'07-98 92 35')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (51, 48, 3, N'(171) 555-1717')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (52, 49, 3, N'31 12 34 56')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (53, 50, 3, N'(1) 47.55.60.10')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (54, 51, 3, N'(071) 23 67 22 20')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (55, 52, 3, N'0251-031259')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (56, 53, 3, N'(5) 555-2933')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (57, 54, 3, N'86 21 32 43')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (58, 55, 3, N'78.32.54.86')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (59, 56, 3, N'26.47.15.10')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (60, 57, 3, N'0711-020361')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (61, 58, 3, N'981-443655')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (62, 60, 3, N'(26) 642-7012')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (63, 61, 3, N'(907) 555-7584')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (64, 62, 3, N'(604) 555-4729')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (65, 63, 3, N'(604) 555-3392')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (66, 64, 3, N'(415) 555-5938')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (67, 65, 3, N'2967 542')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (68, 66, 3, N'(2) 283-2951')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (69, 67, 3, N'(208) 555-8097')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (70, 68, 3, N'(198) 555-8888')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (71, 69, 3, N'(9) 331-6954')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (72, 70, 3, N'(406) 555-5834')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (73, 71, 3, N'(505) 555-5939')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (74, 72, 3, N'(8) 34-56-12')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (75, 73, 3, N'(503) 555-7555')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (76, 74, 3, N'(503) 555-6874')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (77, 75, 3, N'(503) 555-9573')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (78, 76, 3, N'(503) 555-3612')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (79, 77, 3, N'(514) 555-8054')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (80, 78, 3, N'(21) 555-0091')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (81, 79, 3, N'(21) 555-4252')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (82, 80, 3, N'(21) 555-3412')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (83, 81, 3, N'(11) 555-7647')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (84, 82, 3, N'(11) 555-9857')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (85, 83, 3, N'(11) 555-9482')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (86, 84, 3, N'(11) 555-1189')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (87, 85, 3, N'(11) 555-2167')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (88, 86, 3, N'(14) 555-8122')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (89, 87, 3, N'(5) 555-1340')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (90, 88, 3, N'(509) 555-7969')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (91, 90, 3, N'(206) 555-8257')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (92, 91, 3, N'(206) 555-4112')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (93, 24, 1, N'011-4988270')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (94, 24, 2, N'022-4988255')
INSERT [dbo].[ContactDevices] ([id], [ContactId], [PhoneTypeIdentifier], [PhoneNumber]) VALUES (95, 1, 2, N'456-987-1234')
SET IDENTITY_INSERT [dbo].[ContactDevices] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (1, N'Maria', N'Anders', 1, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (2, N'Ana', N'Trujillo', 7, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (3, N'Antonio', N'Moreno', 7, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (4, N'Thomas', N'Hardy', 12, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (5, N'Christina', N'Berglund', 6, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (6, N'Hanna', N'Moos', 12, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (7, N'FrÃ©dÃ©rique', N'Citeaux', 5, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (8, N'MartÃ­n', N'Sommer', 7, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (9, N'Laurence', N'Lebihan', 7, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (10, N'Victoria', N'Ashworth', 1, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (11, N'Patricio', N'Simpson', 12, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (12, N'Francisco', N'Chang', 5, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (13, N'Yang', N'Wang', 7, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (14, N'Elizabeth', N'Brown', 12, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (15, N'Sven', N'Ottlieb', 6, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (16, N'Janine', N'Labrune', 7, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (17, N'Ann', N'Devon', 9, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (18, N'Roland', N'Mendel', 11, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (19, N'Die', N'Roel', 1, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (20, N'Martine', N'RancÃ©', 2, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (21, N'Maria', N'Larsson', 7, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (22, N'Peter', N'Franken', 5, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (23, N'Carine', N'Schmitt', 5, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (24, N'Paolo', N'Accorti', 12, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (25, N'Lino', N'Rodriguez', 11, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (26, N'Eduardo', N'Saavedra', 5, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (27, N'JosÃ©', N'Pedro Freyre', 11, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (28, N'Philip', N'Cramer', 10, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (29, N'Daniel', N'Tonini', 12, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (30, N'Annette', N'Roulet', 11, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (31, N'Renate', N'Messner', 12, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (32, N'Giovanni', N'Rovelli', 5, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (33, N'Catherine', N'Dewey', 9, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (34, N'Alexander', N'Feuer', 4, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (35, N'Simon', N'Crowther', 10, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (36, N'Yvonne', N'Moncada', 9, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (37, N'Henriette', N'Pfalzheim', 7, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (38, N'Marie', N'Bertrand', 7, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (39, N'Guillermo', N'FernÃ¡ndez', 12, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (40, N'Georg', N'Pipps', 11, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (41, N'Isabel', N'de Castro', 12, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (42, N'Horst', N'Kloss', 1, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (43, N'Sergio', N'GutiÃ©rrez', 12, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (44, N'Maurizio', N'Moroni', 10, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (45, N'Michael', N'Holz', 11, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (46, N'Alejandra', N'Camino', 1, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (47, N'Jonas', N'Bergulfsen', 7, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (48, N'Hari', N'Kumar', 11, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (49, N'Jytte', N'Petersen', 7, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (50, N'Dominique', N'Perrier', 5, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (51, N'Pascale', N'Cartrain', 1, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (52, N'Karin', N'Josephs', 5, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (53, N'Miguel', N'Angel Paolino', 7, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (54, N'Palle', N'Ibsen', 11, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (55, N'Mary', N'Saveley', 9, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (56, N'Paul', N'Henriot', 1, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (57, N'Rita', N'MÃ¼ller', 12, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (58, N'Pirkko', N'Koskitalo', 1, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (59, N'Matti', N'Karttunen', 8, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (60, N'Zbyszek', N'Piestrzeniewicz', 7, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (61, N'Rene', N'Phillips', 12, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (62, N'Elizabeth', N'Lincoln', 1, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (63, N'Yoshi', N'Tannamuri', 4, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (64, N'Jaime', N'Yorres', 7, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (65, N'Patricia', N'McKenna', 10, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (66, N'Manuel', N'Pereira', 7, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (67, N'Jose', N'Pavarotti', 12, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (68, N'Helen', N'Bennett', 5, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (69, N'Carlos', N'nzÃ¡lez', 1, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (70, N'Liu', N'Wong', 4, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (71, N'Paula', N'Wilson', 3, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (72, N'Felipe', N'Izquierdo', 7, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (73, N'Howard', N'Snyder', 5, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (74, N'Yoshi', N'Latimer', 12, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (75, N'Fran', N'Wilson', 11, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (76, N'Liz', N'Nixon', 5, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (77, N'Jean', N'FresniÃ¨re', 4, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (78, N'Mario', N'Pontes', 1, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (79, N'Bernardo', N'Batista', 1, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (80, N'Janete', N'Limeira', 2, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (81, N'Pedro', N'Afonso', 10, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (82, N'Aria', N'Cruz', 4, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (83, N'AndrÃ©', N'Fonseca', 10, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (84, N'LÃºcia', N'Carvalho', 4, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (85, N'Anabela', N'Domingues', 12, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (86, N'Paula', N'Parente', 11, 1)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (87, N'Carlos', N'HernÃ¡ndez', 12, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (88, N'John', N'Steel', 5, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (89, N'Helvetius', N'Nagy', 10, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (90, N'Karl', N'Jablonski', 7, 2)
INSERT [dbo].[Contacts] ([ContactId], [FirstName], [LastName], [ContactTypeIdentifier], [GenderIdentifier]) VALUES (91, N'Art', N'Braunschweiger', 11, 2)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[ContactType] ON 

INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (1, N'Accounting Manager')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (2, N'Assistant Sales Agent')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (3, N'Assistant Sales Representative')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (4, N'Marketing Assistant')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (5, N'Marketing Manager')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (6, N'Order Administrator')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (7, N'Owner')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (8, N'Owner/Marketing Assistant')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (9, N'Sales Agent')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (10, N'Sales Associate')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (11, N'Sales Manager')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (12, N'Sales Representative')
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (13, N'Vice President, Sales')
SET IDENTITY_INSERT [dbo].[ContactType] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (1, N'Argentina')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (2, N'Austria')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (3, N'Belgium')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (4, N'Brazil')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (5, N'Canada')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (6, N'Denmark')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (7, N'Finland')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (8, N'France')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (9, N'Germany')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (10, N'Ireland')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (11, N'Italy')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (12, N'Mexico')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (13, N'Norway')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (14, N'Poland')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (15, N'Portugal')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (16, N'Spain')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (17, N'Sweden')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (18, N'Switzerland')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (19, N'UK')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (20, N'USA')
INSERT [dbo].[Countries] ([CountryIdentifier], [Name]) VALUES (21, N'Venezuela')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (1, N'Alfreds Futterkiste', 1, N'Obere Str. 58', N'Berlin', N'12209', 9, N'030-0074321', 1, CAST(N'2020-04-24T19:57:56.4741226' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (2, N'Ana Trujillo Emparedados y helados', 2, N'Avda. de la ConstituciÃ³n 2222', N'MÃ©xico D.F.', N'05021', 12, N'(5) 555-4729', 7, CAST(N'2018-11-04T01:30:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (3, N'Antonio Moreno TaquerÃ­a', 3, N'Mataderos  2312', N'MÃ©xico D.F.', N'05023', 12, N'(5) 555-3932', 7, CAST(N'2018-07-04T13:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (4, N'Around the Horn', 4, N'120 Hanover Sq.', N'London', N'WA1 1DP', 19, N'(171) 555-7788', 12, CAST(N'2018-07-04T13:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (5, N'Berglunds snabbkÃ¶p', 5, N'BerguvsvÃ¤gen  8', N'LuleÃ¥', N'S-958 22', 17, N'0921-12 34 65', 6, CAST(N'2018-07-04T13:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (6, N'Blauer See Delikatessen', 6, N'Forsterstr. 57', N'Mannheim', N'68306', 8, N'0621-08460', 12, CAST(N'2018-07-04T13:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (7, N'Blondesddsl pÃ¨re et fils', 7, N'24, place KlÃ©ber', N'Strasbourg', N'67000', 9, N'88.60.15.31', 5, CAST(N'2018-07-04T13:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (8, N'BÃ³lido Comidas preparadas', 8, N'C/ Araquil, 67', N'Madrid', N'28023', 16, N'(91) 555 22 82', 7, CAST(N'2018-07-04T13:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (9, N'Bon app''', 9, N'12, rue des Bouchers', N'Marseille', N'13008', 1, N'91.24.45.40', 7, CAST(N'2018-07-04T13:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (10, N'B''s Beverages', 10, N'Fauntleroy Circus', N'London', N'EC2 5NT', 12, N'(171) 555-1212', 12, CAST(N'2018-07-04T13:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (11, N'Cactus Comidas para llevar', 11, N'Cerrito 333', N'Buenos Aires', N'1010', 19, N'(1) 135-5555', 9, CAST(N'2018-07-04T13:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactId], [Street], [City], [PostalCode], [CountryIdentifier], [Phone], [ContactTypeIdentifier], [ModifiedDate]) VALUES (12, N'Centro comercial Moctezuma', 12, N'Sierras de Granada 9993', N'MÃ©xico D.F.', N'05022', 1, N'(5) 555-3392', 5, CAST(N'2018-07-04T13:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([GenderIdentifier], [GenderType]) VALUES (1, N'Female')
INSERT [dbo].[Genders] ([GenderIdentifier], [GenderType]) VALUES (2, N'Male')
INSERT [dbo].[Genders] ([GenderIdentifier], [GenderType]) VALUES (3, N'Other')
SET IDENTITY_INSERT [dbo].[Genders] OFF
SET IDENTITY_INSERT [dbo].[PhoneType] ON 

INSERT [dbo].[PhoneType] ([PhoneTypeIdenitfier], [PhoneTypeDescription]) VALUES (1, N'Home')
INSERT [dbo].[PhoneType] ([PhoneTypeIdenitfier], [PhoneTypeDescription]) VALUES (2, N'Cell')
INSERT [dbo].[PhoneType] ([PhoneTypeIdenitfier], [PhoneTypeDescription]) VALUES (3, N'Office')
SET IDENTITY_INSERT [dbo].[PhoneType] OFF
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ContactDevices]  WITH CHECK ADD  CONSTRAINT [FK_ContactDevices_Contacts1] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contacts] ([ContactId])
GO
ALTER TABLE [dbo].[ContactDevices] CHECK CONSTRAINT [FK_ContactDevices_Contacts1]
GO
ALTER TABLE [dbo].[ContactDevices]  WITH CHECK ADD  CONSTRAINT [FK_ContactDevices_PhoneType] FOREIGN KEY([PhoneTypeIdentifier])
REFERENCES [dbo].[PhoneType] ([PhoneTypeIdenitfier])
GO
ALTER TABLE [dbo].[ContactDevices] CHECK CONSTRAINT [FK_ContactDevices_PhoneType]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_ContactType] FOREIGN KEY([ContactTypeIdentifier])
REFERENCES [dbo].[ContactType] ([ContactTypeIdentifier])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_ContactType]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Genders] FOREIGN KEY([GenderIdentifier])
REFERENCES [dbo].[Genders] ([GenderIdentifier])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_Genders]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Contacts] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contacts] ([ContactId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Contacts]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_ContactType] FOREIGN KEY([ContactTypeIdentifier])
REFERENCES [dbo].[ContactType] ([ContactTypeIdentifier])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_ContactType]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Countries] FOREIGN KEY([CountryIdentifier])
REFERENCES [dbo].[Countries] ([CountryIdentifier])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Countries]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
USE [master]
GO
ALTER DATABASE [CustomerDatabase2] SET  READ_WRITE 
GO
