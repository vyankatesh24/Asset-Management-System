USE [master]
GO
/****** Object:  Database [AssetManagementDB]    Script Date: 17/03/2018 01:25:09 PM ******/
CREATE DATABASE [AssetManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssetManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AssetManagementDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AssetManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AssetManagementDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AssetManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssetManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssetManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssetManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssetManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssetManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssetManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssetManagementDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AssetManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AssetManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssetManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssetManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssetManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssetManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssetManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssetManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssetManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssetManagementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AssetManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssetManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssetManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssetManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssetManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssetManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssetManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssetManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AssetManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [AssetManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssetManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssetManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssetManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [AssetManagementDB]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 17/03/2018 01:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset](
	[A_Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Weight] [nvarchar](10) NULL,
	[DateOfPurchase] [date] NOT NULL,
	[Price] [money] NOT NULL,
	[D_Id] [int] NULL,
	[B_Id] [int] NULL,
	[AccessionNo] [nvarchar](50) NULL,
	[BillNo] [nvarchar](20) NOT NULL,
	[VendorName] [nvarchar](255) NOT NULL,
	[VendorAddress] [nvarchar](255) NOT NULL,
	[status] [nvarchar](50) NULL,
	[warranty] [nvarchar](5) NULL,
	[DateOfAllocate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[A_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 17/03/2018 01:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[B_Id] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [nvarchar](10) NULL,
	[VendorName] [nvarchar](255) NULL,
	[VendorAddress] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[B_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BillNo] ASC,
	[VendorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Borrow_Request]    Script Date: 17/03/2018 01:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow_Request](
	[Br_Id] [int] IDENTITY(1,1) NOT NULL,
	[A_Id] [int] NOT NULL,
	[Requesting_dept_id] [int] NULL,
	[Date_of_Request] [date] NOT NULL,
	[Date_of_pickup] [date] NOT NULL,
	[Date_of_return] [date] NOT NULL,
	[Req_status] [nvarchar](50) NULL,
	[Date_of_Approval] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Br_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 17/03/2018 01:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[D_Id] [int] IDENTITY(1,1) NOT NULL,
	[D_name] [nvarchar](100) NOT NULL,
	[Faculty] [nvarchar](50) NOT NULL,
	[U_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[D_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[D_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Repair_Request]    Script Date: 17/03/2018 01:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Repair_Request](
	[Rr_Id] [int] IDENTITY(1,1) NOT NULL,
	[A_id] [int] NOT NULL,
	[Date_of_request] [datetime] NOT NULL,
	[Date_of_Approval] [datetime] NULL,
	[amount_est] [money] NOT NULL,
	[amount_actual] [money] NULL,
	[Req_status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Rr_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scrap_Request]    Script Date: 17/03/2018 01:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scrap_Request](
	[Sr_Id] [int] IDENTITY(1,1) NOT NULL,
	[Date_of_request] [datetime] NULL,
	[Date_of_Approval] [date] NULL,
	[Amount_Released] [money] NULL,
	[Amount_Written_off] [money] NULL,
	[A_id] [int] NULL,
	[Req_status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sr_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 17/03/2018 01:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[U_Id] [int] IDENTITY(1,1) NOT NULL,
	[U_fname] [nvarchar](20) NULL,
	[U_lname] [nvarchar](20) NULL,
	[U_email] [nvarchar](255) NULL,
	[U_contact] [nvarchar](12) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[type] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[U_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD FOREIGN KEY([D_Id])
REFERENCES [dbo].[Department] ([D_Id])
GO
ALTER TABLE [dbo].[Borrow_Request]  WITH CHECK ADD FOREIGN KEY([Requesting_dept_id])
REFERENCES [dbo].[Department] ([D_Id])
GO
ALTER TABLE [dbo].[Borrow_Request]  WITH CHECK ADD FOREIGN KEY([A_Id])
REFERENCES [dbo].[Asset] ([A_Id])
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([U_Id])
REFERENCES [dbo].[User] ([U_Id])
GO
ALTER TABLE [dbo].[Repair_Request]  WITH CHECK ADD FOREIGN KEY([A_id])
REFERENCES [dbo].[Asset] ([A_Id])
GO
ALTER TABLE [dbo].[Scrap_Request]  WITH CHECK ADD FOREIGN KEY([A_id])
REFERENCES [dbo].[Asset] ([A_Id])
GO
USE [master]
GO
ALTER DATABASE [AssetManagementDB] SET  READ_WRITE 
GO
