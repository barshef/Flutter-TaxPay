USE [master]
GO
/****** Object:  Database [FlutterWaveDb]    Script Date: 8/2/2018 11:30:37 PM ******/
CREATE DATABASE [FlutterWaveDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlutterwaveDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FlutterwaveDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FlutterwaveDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FlutterwaveDb_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FlutterWaveDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlutterWaveDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlutterWaveDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlutterWaveDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlutterWaveDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FlutterWaveDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlutterWaveDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET RECOVERY FULL 
GO
ALTER DATABASE [FlutterWaveDb] SET  MULTI_USER 
GO
ALTER DATABASE [FlutterWaveDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlutterWaveDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlutterWaveDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlutterWaveDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlutterWaveDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FlutterWaveDb', N'ON'
GO
ALTER DATABASE [FlutterWaveDb] SET QUERY_STORE = OFF
GO
USE [FlutterWaveDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FlutterWaveDb]
GO
/****** Object:  Schema [Barsh]    Script Date: 8/2/2018 11:30:37 PM ******/
CREATE SCHEMA [Barsh]
GO
/****** Object:  Table [dbo].[AgencyException]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgencyException](
	[ExecepAgencyID] [bigint] IDENTITY(1,1) NOT NULL,
	[AgencyName] [nvarchar](max) NULL,
	[AgencyCode] [varchar](50) NULL,
 CONSTRAINT [PK_AgencyException] PRIMARY KEY CLUSTERED 
(
	[ExecepAgencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompulsoryAgency]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompulsoryAgency](
	[StaticAgencyId] [bigint] IDENTITY(1,1) NOT NULL,
	[AgencyName] [nvarchar](max) NULL,
	[AgencyCode] [varchar](50) NULL,
	[StateCode] [varchar](500) NULL,
 CONSTRAINT [PK_CompulsoryAgency] PRIMARY KEY CLUSTERED 
(
	[StaticAgencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](1000) NOT NULL,
	[CountryCode] [varchar](40) NOT NULL,
	[Capital] [varchar](max) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GateWay]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GateWay](
	[GateWayID] [bigint] IDENTITY(1,1) NOT NULL,
	[GateWayName] [varchar](250) NULL,
 CONSTRAINT [PK_GateWay] PRIMARY KEY CLUSTERED 
(
	[GateWayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LGA]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LGA](
	[LgaId] [int] IDENTITY(1,1) NOT NULL,
	[LgaCode] [varchar](10) NOT NULL,
	[LgaName] [varchar](100) NOT NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_LGA] PRIMARY KEY CLUSTERED 
(
	[LgaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nationality_Information]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality_Information](
	[NationalityId] [bigint] IDENTITY(1,1) NOT NULL,
	[NationalityN] [varchar](500) NULL,
 CONSTRAINT [PK_Nationality_Information] PRIMARY KEY CLUSTERED 
(
	[NationalityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RevenueException]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevenueException](
	[ExcepRevId] [bigint] IDENTITY(1,1) NOT NULL,
	[RevenueName] [nvarchar](max) NULL,
	[RevenueCode] [varchar](50) NULL,
	[StateCode] [varchar](500) NULL,
 CONSTRAINT [PK_RevenueException] PRIMARY KEY CLUSTERED 
(
	[ExcepRevId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [varchar](10) NOT NULL,
	[StateName] [varchar](100) NOT NULL,
	[CountryCode] [varchar](40) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StateUrl]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateUrl](
	[InstitutionCode] [bigint] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](255) NULL,
	[StateCode] [varchar](50) NULL,
	[StateFullName] [varchar](500) NULL,
	[StateUrlName] [varchar](250) NULL,
	[StateRegUrl] [varchar](250) NULL,
	[StatePhone] [varchar](50) NULL,
	[StateEmail] [varchar](50) NULL,
	[StateAddress] [varchar](max) NULL,
	[GateWayID] [bigint] NULL,
	[BankCode] [varchar](50) NULL,
	[BankName] [varchar](100) NULL,
	[BranchCode] [varchar](50) NULL,
	[BranchName] [varchar](100) NULL,
	[HashValue] [varchar](100) NULL,
	[UCC] [varchar](20) NULL,
	[PCC] [varchar](20) NULL,
	[DateEntered] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Institution] PRIMARY KEY CLUSTERED 
(
	[InstitutionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAgencyList]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgencyList](
	[SN] [bigint] NULL,
	[AgencyName] [varchar](200) NULL,
	[AgencyCode] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRevenueList]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRevenueList](
	[SN] [bigint] IDENTITY(1,1) NOT NULL,
	[RevenueName] [varchar](200) NULL,
	[RevenueCode] [varchar](100) NULL,
	[AgencyCode] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionLog]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionLog](
	[TransLogID] [bigint] IDENTITY(1,1) NOT NULL,
	[TransRefNo] [varchar](200) NOT NULL,
	[PaymentReference] [varchar](250) NULL,
	[ReceiptNo] [varchar](200) NULL,
	[Surname] [varchar](200) NULL,
	[OtherNames] [varchar](200) NULL,
	[Address] [varchar](250) NULL,
	[Email] [varchar](200) NULL,
	[PhoneNo] [varchar](50) NULL,
	[AgencyName] [varchar](200) NULL,
	[AgencyCode] [varchar](200) NULL,
	[RevenueName] [varchar](200) NULL,
	[RevenueCode] [varchar](200) NULL,
	[AmountPaid] [decimal](18, 2) NULL,
	[PaymentPeriod] [varchar](200) NULL,
	[PayGateWay] [varchar](100) NULL,
	[InstitutionCode] [bigint] NULL,
	[CountryName] [varchar](200) NULL,
	[StateName] [varchar](200) NULL,
	[City] [varchar](200) NULL,
	[Area] [varchar](200) NULL,
	[LGA] [varchar](200) NULL,
	[TransactionStatus] [bit] NULL,
	[TransStatusMsg] [varchar](250) NULL,
	[TransStatusCode] [varchar](250) NULL,
	[JsonResponse] [text] NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_TransactionLog] PRIMARY KEY CLUSTERED 
(
	[TransRefNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersInformation]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInformation](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](500) NULL,
	[LastName] [nvarchar](150) NULL,
	[OtherNames] [varchar](500) NULL,
	[UserName] [varchar](500) NOT NULL,
	[Password] [varchar](500) NULL,
	[VCode] [varchar](500) NULL,
	[WrongLoginAttempt] [bigint] NULL,
	[IsEnabled] [bit] NULL,
	[EnabledDate] [datetime] NULL,
	[PwdExpired] [bit] NULL,
	[ActivationCode] [uniqueidentifier] NULL,
	[IsLocked] [char](1) NULL,
	[StateName] [varchar](500) NULL,
	[InstitutionCode] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedByID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[LastModifiedBy] [varchar](200) NULL,
	[DateLastmodified] [datetime] NULL,
	[IsApproved]  AS (CONVERT([bit],case when [MaxApprovedCount]=[ApprovalCount] then (1) else (0) end,(0))),
	[MaxApprovedCount] [int] NULL,
	[ApprovalCount] [int] NULL,
	[MaxAppConstant] [int] NULL,
	[UserLevelID] [bigint] NULL,
 CONSTRAINT [PK_tblLoginAcess] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersLevel]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersLevel](
	[UserLevelID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserLevel] [varchar](200) NULL,
 CONSTRAINT [PK_UsersLevel] PRIMARY KEY CLUSTERED 
(
	[UserLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AgencyException] ON 

INSERT [dbo].[AgencyException] ([ExecepAgencyID], [AgencyName], [AgencyCode]) VALUES (1, N'BOARD OF INTERNAL REVENUE', N'100080021110000')
SET IDENTITY_INSERT [dbo].[AgencyException] OFF
SET IDENTITY_INSERT [dbo].[CompulsoryAgency] ON 

INSERT [dbo].[CompulsoryAgency] ([StaticAgencyId], [AgencyName], [AgencyCode], [StateCode]) VALUES (1, N'BOARD OF INTERNAL REVENUE', N'100080021110000', N'OGSS')
SET IDENTITY_INSERT [dbo].[CompulsoryAgency] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (1, N'Andorra', N'AD', N'Andorra la Vella')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (2, N'United Arab Emirates', N'AE', N'Abu Dhabi')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (3, N'Afghanistan', N'AF', N'Kabul')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (4, N'Antigua and Barbuda', N'AG', N'Saint John''s')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (5, N'Anguilla', N'AI', N'The Valley')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (6, N'Albania', N'AL', N'Tirana')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (7, N'Armenia', N'AM', N'Yerevan')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (8, N'Angola', N'AO', N'Luanda')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (9, N'Antarctica', N'AQ', N'N/A')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (10, N'Argentina', N'AR', N'Buenos Aires')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (11, N'American Samoa', N'AS', N'Pago Pago')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (12, N'Austria', N'AT', N'Vienna')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (13, N'Australia', N'AU', N'Canberra')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (14, N'Aruba', N'AW', N'Oranjestad')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (15, N'Aland Islands', N'AX', N'Mariehamn')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (16, N'Azerbaijan', N'AZ', N'Baku')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (17, N'Bosnia and Herzegovina', N'BA', N'Sarajevo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (18, N'Barbados', N'BB', N'Bridgetown')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (19, N'Bangladesh', N'BD', N'Dhaka')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (20, N'Belgium', N'BE', N'Brussels')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (21, N'Burkina Faso', N'BF', N'Ouagadougou')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (22, N'Bulgaria', N'BG', N'Sofia')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (23, N'Bahrain', N'BH', N'Manama')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (24, N'Burundi', N'BI', N'Bujumbura')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (25, N'Benin', N'BJ', N'Porto-Novo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (26, N'Saint Barthelemy', N'BL', N'Gustavia')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (27, N'Bermuda', N'BM', N'Hamilton')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (28, N'Brunei Darussalam', N'BN', N'Bandar Seri Begawan')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (29, N'Bolivia', N'BO', N'La Paz')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (30, N'Brazil', N'BR', N'Brasilia')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (31, N'Bahamas', N'BS', N'Nassau')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (32, N'Bhutan', N'BT', N'Thimphu')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (33, N'Botswana', N'BW', N'Gaborone')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (34, N'Belarus', N'BY', N'Minsk')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (35, N'Belize', N'BZ', N'Belmopan')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (36, N'Canada', N'CA', N'Ottawa')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (37, N'Cocos Islands', N'CC', N'West Island')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (38, N'Democratic Republic of the Congo', N'CD', N'Kinshasa')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (39, N'Central African Republic', N'CF', N'Bangui')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (40, N'Republic of Congo', N'CG', N'Brazzaville')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (41, N'Switzerland', N'CH', N'Bern')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (42, N'Cote d''Ivoire', N'CI', N'Yamoussoukro')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (43, N'Cook Islands', N'CK', N'Avarua')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (44, N'Chile', N'CL', N'Santiago')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (45, N'Cameroon', N'CM', N'Yaounde')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (46, N'China', N'CN', N'Beijing')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (47, N'Colombia', N'CO', N'Bogota')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (48, N'Costa Rica', N'CR', N'San Jose')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (49, N'Cuba', N'CU', N'Havana')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (50, N'Cape Verde', N'CV', N'Praia')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (51, N'CuraÃ§ao', N'CW', N'Willemstad')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (52, N'Christmas Island', N'CX', N'The Settlement')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (53, N'Cyprus', N'CY', N'Nicosia')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (54, N'Northern Cyprus', N'CYP', N'North Nicosia')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (55, N'Czech Republic', N'CZ', N'Prague')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (56, N'Germany', N'DE', N'Berlin')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (57, N'Djibouti', N'DJ', N'Djibouti')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (58, N'Denmark', N'DK', N'Copenhagen')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (59, N'Dominica', N'DM', N'Roseau')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (60, N'Dominican Republic', N'DO', N'Santo Domingo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (61, N'Algeria', N'DZ', N'Algiers')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (62, N'Ecuador', N'EC', N'Quito')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (63, N'Estonia', N'EE', N'Tallinn')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (64, N'Egypt', N'EG', N'Cairo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (65, N'Western Sahara', N'EH', N'El-AaiÃºn')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (66, N'Eritrea', N'ER', N'Asmara')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (67, N'Spain', N'ES', N'Madrid')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (68, N'Ethiopia', N'ET', N'Addis Ababa')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (69, N'Finland', N'FI', N'Helsinki')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (70, N'Fiji', N'FJ', N'Suva')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (71, N'Falkland Islands', N'FK', N'Stanley')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (72, N'Federated States of Micronesia', N'FM', N'Palikir')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (73, N'Faroe Islands', N'FO', N'Torshavn')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (74, N'France', N'FR', N'Paris')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (75, N'Gabon', N'GA', N'Libreville')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (76, N'United Kingdom', N'GB', N'London')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (77, N'Grenada', N'GD', N'Saint George''s')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (78, N'Georgia', N'GE', N'Tbilisi')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (79, N'Guernsey', N'GG', N'Saint Peter Port')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (80, N'Ghana', N'GH', N'Accra')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (81, N'Gibraltar', N'GI', N'Gibraltar')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (82, N'Greenland', N'GL', N'Nuuk')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (83, N'The Gambia', N'GM', N'Banjul')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (84, N'Guinea', N'GN', N'Conakry')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (85, N'Equatorial Guinea', N'GQ', N'Malabo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (86, N'Greece', N'GR', N'Athens')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (87, N'South Georgia and South Sandwich Islands', N'GS', N'King Edward Point')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (88, N'Guatemala', N'GT', N'Guatemala City')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (89, N'Guam', N'GU', N'Hagatna')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (90, N'Guinea-Bissau', N'GW', N'Bissau')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (91, N'Guyana', N'GY', N'Georgetown')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (92, N'Hong Kong', N'HK', N'N/A')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (93, N'Heard Island and McDonald Islands', N'HM', N'N/A')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (94, N'Honduras', N'HN', N'Tegucigalpa')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (95, N'Croatia', N'HR', N'Zagreb')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (96, N'Haiti', N'HT', N'Port-au-Prince')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (97, N'Hungary', N'HU', N'Budapest')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (98, N'Indonesia', N'ID', N'Jakarta')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (99, N'Ireland', N'IE', N'Dublin')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (100, N'Israel', N'IL', N'Jerusalem')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (101, N'Isle of Man', N'IM', N'Douglas')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (102, N'India', N'IN', N'New Delhi')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (103, N'British Indian Ocean Territory', N'IO', N'Diego Garcia')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (104, N'Iraq', N'IQ', N'Baghdad')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (105, N'Iran', N'IR', N'Tehran')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (106, N'Iceland', N'IS', N'Reykjavik')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (107, N'Italy', N'IT', N'Rome')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (108, N'Jersey', N'JE', N'Saint Helier')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (109, N'Jamaica', N'JM', N'Kingston')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (110, N'Jordan', N'JO', N'Amman')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (111, N'Japan', N'JP', N'Tokyo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (112, N'Kenya', N'KE', N'Nairobi')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (113, N'Kyrgyzstan', N'KG', N'Bishkek')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (114, N'Cambodia', N'KH', N'Phnom Penh')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (115, N'Kiribati', N'KI', N'Tarawa')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (116, N'Comoros', N'KM', N'Moroni')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (117, N'Saint Kitts and Nevis', N'KN', N'Basseterre')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (118, N'Kosovo', N'KO', N'Pristina')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (119, N'North Korea', N'KP', N'Pyongyang')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (120, N'South Korea', N'KR', N'Seoul')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (121, N'Kuwait', N'KW', N'Kuwait City')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (122, N'Cayman Islands', N'KY', N'George Town')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (123, N'Kazakhstan', N'KZ', N'Astana')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (124, N'Laos', N'LA', N'Vientiane')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (125, N'Lebanon', N'LB', N'Beirut')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (126, N'Saint Lucia', N'LC', N'Castries')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (127, N'Liechtenstein', N'LI', N'Vaduz')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (128, N'Sri Lanka', N'LK', N'Colombo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (129, N'Liberia', N'LR', N'Monrovia')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (130, N'Lesotho', N'LS', N'Maseru')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (131, N'Lithuania', N'LT', N'Vilnius')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (132, N'Luxembourg', N'LU', N'Luxembourg')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (133, N'Latvia', N'LV', N'Riga')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (134, N'Libya', N'LY', N'Tripoli')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (135, N'Morocco', N'MA', N'Rabat')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (136, N'Monaco', N'MC', N'Monaco')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (137, N'Moldova', N'MD', N'Chisinau')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (138, N'Montenegro', N'ME', N'Podgorica')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (139, N'Saint Martin', N'MF', N'Marigot')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (140, N'Madagascar', N'MG', N'Antananarivo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (141, N'Marshall Islands', N'MH', N'Majuro')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (142, N'Macedonia', N'MK', N'Skopje')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (143, N'Mali', N'ML', N'Bamako')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (144, N'Myanmar', N'MM', N'Rangoon')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (145, N'Mongolia', N'MN', N'Ulaanbaatar')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (146, N'Macau', N'MO', N'N/A')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (147, N'Northern Mariana Islands', N'MP', N'Saipan')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (148, N'Mauritania', N'MR', N'Nouakchott')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (149, N'Montserrat', N'MS', N'Plymouth')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (150, N'Malta', N'MT', N'Valletta')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (151, N'Mauritius', N'MU', N'Port Louis')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (152, N'Maldives', N'MV', N'Male')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (153, N'Malawi', N'MW', N'Lilongwe')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (154, N'Mexico', N'MX', N'Mexico City')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (155, N'Malaysia', N'MY', N'Kuala Lumpur')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (156, N'Mozambique', N'MZ', N'Maputo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (157, N'Namibia', N'NA', N'Windhoek')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (158, N'New Caledonia', N'NC', N'Noumea')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (159, N'Niger', N'NE', N'Niamey')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (160, N'Norfolk Island', N'NF', N'Kingston')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (161, N'Nigeria', N'NG', N'Abuja')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (162, N'Nicaragua', N'NI', N'Managua')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (163, N'Netherlands', N'NL', N'Amsterdam')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (164, N'Norway', N'NO', N'Oslo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (165, N'Nepal', N'NP', N'Kathmandu')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (166, N'Nauru', N'NR', N'Yaren')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (167, N'Niue', N'NU', N'Alofi')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (168, N'Somaliland', N'NULL', N'Hargeisa')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (169, N'New Zealand', N'NZ', N'Wellington')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (170, N'Oman', N'OM', N'Muscat')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (171, N'Panama', N'PA', N'Panama City')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (172, N'Peru', N'PE', N'Lima')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (173, N'French Polynesia', N'PF', N'Papeete')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (174, N'Papua New Guinea', N'PG', N'Port Moresby')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (175, N'Philippines', N'PH', N'Manila')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (176, N'Pakistan', N'PK', N'Islamabad')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (177, N'Poland', N'PL', N'Warsaw')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (178, N'Saint Pierre and Miquelon', N'PM', N'Saint-Pierre')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (179, N'Pitcairn Islands', N'PN', N'Adamstown')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (180, N'Puerto Rico', N'PR', N'San Juan')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (181, N'Palestine', N'PS', N'Jerusalem')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (182, N'Portugal', N'PT', N'Lisbon')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (183, N'Palau', N'PW', N'Melekeok')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (184, N'Paraguay', N'PY', N'Asuncion')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (185, N'Qatar', N'QA', N'Doha')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (186, N'Romania', N'RO', N'Bucharest')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (187, N'Serbia', N'RS', N'Belgrade')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (188, N'Russia', N'RU', N'Moscow')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (189, N'Rwanda', N'RW', N'Kigali')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (190, N'Saudi Arabia', N'SA', N'Riyadh')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (191, N'Solomon Islands', N'SB', N'Honiara')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (192, N'Seychelles', N'SC', N'Victoria')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (193, N'Sudan', N'SD', N'Khartoum')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (194, N'Sweden', N'SE', N'Stockholm')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (195, N'Singapore', N'SG', N'Singapore')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (196, N'Saint Helena', N'SH', N'Jamestown')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (197, N'Slovenia', N'SI', N'Ljubljana')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (198, N'Svalbard', N'SJ', N'Longyearbyen')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (199, N'Slovakia', N'SK', N'Bratislava')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (200, N'Sierra Leone', N'SL', N'Freetown')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (201, N'San Marino', N'SM', N'San Marino')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (202, N'Senegal', N'SN', N'Dakar')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (203, N'Somalia', N'SO', N'Mogadishu')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (204, N'Suriname', N'SR', N'Paramaribo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (205, N'South Sudan', N'SS', N'Juba')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (206, N'Sao Tome and Principe', N'ST', N'Sao Tome')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (207, N'El Salvador', N'SV', N'San Salvador')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (208, N'Sint Maarten', N'SX', N'Philipsburg')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (209, N'Syria', N'SY', N'Damascus')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (210, N'Swaziland', N'SZ', N'Mbabane')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (211, N'Turks and Caicos Islands', N'TC', N'Grand Turk')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (212, N'Chad', N'TD', N'N''Djamena')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (213, N'French Southern and Antarctic Lands', N'TF', N'Port-aux-FranÃ§ais')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (214, N'Togo', N'TG', N'Lome')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (215, N'Thailand', N'TH', N'Bangkok')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (216, N'Tajikistan', N'TJ', N'Dushanbe')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (217, N'Tokelau', N'TK', N'Atafu')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (218, N'Timor-Leste', N'TL', N'Dili')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (219, N'Turkmenistan', N'TM', N'Ashgabat')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (220, N'Tunisia', N'TN', N'Tunis')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (221, N'Tonga', N'TO', N'Nuku''alofa')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (222, N'Turkey', N'TR', N'Ankara')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (223, N'Trinidad and Tobago', N'TT', N'Port of Spain')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (224, N'Tuvalu', N'TV', N'Funafuti')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (225, N'Taiwan', N'TW', N'Taipei')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (226, N'Tanzania', N'TZ', N'Dar es Salaam')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (227, N'Ukraine', N'UA', N'Kyiv')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (228, N'Uganda', N'UG', N'Kampala')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (229, N'United States', N'US', N'Washington')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (230, N'Uruguay', N'UY', N'Montevideo')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (231, N'Uzbekistan', N'UZ', N'Tashkent')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (232, N'Vatican City', N'VA', N'Vatican City')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (233, N'Saint Vincent and the Grenadines', N'VC', N'Kingstown')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (234, N'Venezuela', N'VE', N'Caracas')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (235, N'British Virgin Islands', N'VG', N'Road Town')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (236, N'US Virgin Islands', N'VI', N'Charlotte Amalie')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (237, N'Vietnam', N'VN', N'Hanoi')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (238, N'Vanuatu', N'VU', N'Port-Vila')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (239, N'Wallis and Futuna', N'WF', N'Mata-Utu')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (240, N'Samoa', N'WS', N'Apia')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (241, N'Yemen', N'YE', N'Sanaa')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (242, N'South Africa', N'ZA', N'Pretoria')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (243, N'Zambia', N'ZM', N'Lusaka')
INSERT [dbo].[Country] ([CountryId], [CountryName], [CountryCode], [Capital]) VALUES (244, N'Zimbabwe', N'ZW', N'Harare')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[GateWay] ON 

INSERT [dbo].[GateWay] ([GateWayID], [GateWayName]) VALUES (1, N'RaveSwitch')
SET IDENTITY_INSERT [dbo].[GateWay] OFF
SET IDENTITY_INSERT [dbo].[LGA] ON 

INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (1, N'1', N'Aba North', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (2, N'2', N'Aba South', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (3, N'3', N'Arochukwu', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (4, N'4', N'Bende', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (5, N'5', N'Ikwuano', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (6, N'6', N'Isiala Ngwa North', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (7, N'7', N'Isiala Ngwa South', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (8, N'8', N'Isuikwuato', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (9, N'9', N'Obi Ngwa', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (10, N'10', N'Ohafia', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (11, N'11', N'Osisioma', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (12, N'12', N'Ugwunagbo', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (13, N'13', N'Ukwa East', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (14, N'14', N'Ukwa West', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (15, N'15', N'Umu Nneochi', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (16, N'16', N'Umuahia North', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (17, N'17', N'Umuahia South', 1)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (18, N'18', N'Demsa', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (19, N'19', N'Fufure', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (20, N'20', N'Ganye', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (21, N'21', N'Gayuk', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (22, N'22', N'Gombi', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (23, N'23', N'Grie', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (24, N'24', N'Hong', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (25, N'25', N'Jada', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (26, N'26', N'Lamurde', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (27, N'27', N'Madagali', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (28, N'28', N'Maiha', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (29, N'29', N'Mayo Belwa', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (30, N'30', N'Michika', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (31, N'31', N'Mubi North', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (32, N'32', N'Mubi South', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (33, N'33', N'Numan', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (34, N'34', N'Shelleng', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (35, N'35', N'Song', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (36, N'36', N'Toungo', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (37, N'37', N'Yola North', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (38, N'38', N'Yola South', 2)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (39, N'39', N'Abak', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (40, N'40', N'Eastern Obolo', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (41, N'41', N'Eket', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (42, N'42', N'Esit Eket', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (43, N'43', N'Essien Udim', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (44, N'44', N'Etim Ekpo', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (45, N'45', N'Etinan', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (46, N'46', N'Ibeno', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (47, N'47', N'Ibesikpo Asutan', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (48, N'48', N'Ibiono-Ibom', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (49, N'49', N'Ika', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (50, N'50', N'Ikono', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (51, N'51', N'Ikot Abasi', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (52, N'52', N'Ikot Ekpene', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (53, N'53', N'Ini', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (54, N'54', N'Itu', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (55, N'55', N'Mbo', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (56, N'56', N'Mkpat-Enin', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (57, N'57', N'Nsit-Atai', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (58, N'58', N'Nsit-Ibom', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (59, N'59', N'Nsit-Ubium', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (60, N'60', N'Obot Akara', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (61, N'61', N'Okobo', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (62, N'62', N'Onna', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (63, N'63', N'Oron', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (64, N'64', N'Oruk Anam', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (65, N'65', N'Udung-Uko', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (66, N'66', N'Ukanafun', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (67, N'67', N'Uruan', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (68, N'68', N'Urue-Offong/Oruko', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (69, N'69', N'Uyo', 3)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (70, N'70', N'Aguata', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (71, N'71', N'Anambra East', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (72, N'72', N'Anambra West', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (73, N'73', N'Anaocha', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (74, N'74', N'Awka North', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (75, N'75', N'Awka South', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (76, N'76', N'Ayamelum', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (77, N'77', N'Dunukofia', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (78, N'78', N'Ekwusigo', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (79, N'79', N'Idemili North', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (80, N'80', N'Idemili South', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (81, N'81', N'Ihiala', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (82, N'82', N'Njikoka', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (83, N'83', N'Nnewi North', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (84, N'84', N'Nnewi South', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (85, N'85', N'Ogbaru', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (86, N'86', N'Onitsha North', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (87, N'87', N'Onitsha South', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (88, N'88', N'Orumba North', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (89, N'89', N'Orumba South', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (90, N'90', N'Oyi', 4)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (91, N'91', N'Alkaleri', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (92, N'92', N'Bauchi', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (93, N'93', N'Bogoro', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (94, N'94', N'Damban', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (95, N'95', N'Darazo', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (96, N'96', N'Dass', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (97, N'97', N'Gamawa', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (98, N'98', N'Ganjuwa', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (99, N'99', N'Giade', 5)
GO
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (100, N'100', N'Itas/Gadau', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (101, N'101', N'Jama''are', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (102, N'102', N'Katagum', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (103, N'103', N'Kirfi', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (104, N'104', N'Misau', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (105, N'105', N'Ningi', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (106, N'106', N'Shira', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (107, N'107', N'Tafawa Balewa', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (108, N'108', N'Toro', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (109, N'109', N'Warji', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (110, N'110', N'Zaki', 5)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (111, N'111', N'Brass', 6)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (112, N'112', N'Ekeremor', 6)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (113, N'113', N'Kolokuma/Opokuma', 6)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (114, N'114', N'Nembe', 6)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (115, N'115', N'Ogbia', 6)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (116, N'116', N'Sagbama', 6)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (117, N'117', N'Southern Ijaw', 6)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (118, N'118', N'Yenagoa', 6)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (119, N'119', N'Ado', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (120, N'120', N'Agatu', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (121, N'121', N'Apa', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (122, N'122', N'Buruku', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (123, N'123', N'Gboko', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (124, N'124', N'Guma', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (125, N'125', N'Gwer East', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (126, N'126', N'Gwer West', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (127, N'127', N'Katsina-Ala', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (128, N'128', N'Konshisha', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (129, N'129', N'Kwande', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (130, N'130', N'Logo', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (131, N'131', N'Makurdi', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (132, N'132', N'Obi', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (133, N'133', N'Ogbadibo', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (134, N'134', N'Ohimini', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (135, N'135', N'Oju', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (136, N'136', N'Okpokwu', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (137, N'137', N'Oturkpo', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (138, N'138', N'Tarka', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (139, N'139', N'Ukum', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (140, N'140', N'Ushongo', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (141, N'141', N'Vandeikya', 7)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (142, N'142', N'Abadam', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (143, N'143', N'Askira/Uba', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (144, N'144', N'Bama', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (145, N'145', N'Bayo', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (146, N'146', N'Biu', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (147, N'147', N'Chibok', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (148, N'148', N'Damboa', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (149, N'149', N'Dikwa', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (150, N'150', N'Gubio', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (151, N'151', N'Guzamala', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (152, N'152', N'Gwoza', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (153, N'153', N'Hawul', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (154, N'154', N'Jere', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (155, N'155', N'Kaga', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (156, N'156', N'Kala/Balge', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (157, N'157', N'Konduga', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (158, N'158', N'Kukawa', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (159, N'159', N'Kwaya Kusar', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (160, N'160', N'Mafa', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (161, N'161', N'Magumeri', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (162, N'162', N'Maiduguri', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (163, N'163', N'Marte', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (164, N'164', N'Mobbar', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (165, N'165', N'Monguno', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (166, N'166', N'Ngala', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (167, N'167', N'Nganzai', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (168, N'168', N'Shani', 8)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (169, N'169', N'Abi', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (170, N'170', N'Akamkpa', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (171, N'171', N'Akpabuyo', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (172, N'172', N'Bakassi', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (173, N'173', N'Bekwarra', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (174, N'174', N'Biase', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (175, N'175', N'Boki', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (176, N'176', N'Calabar Municipal', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (177, N'177', N'Calabar South', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (178, N'178', N'Etung', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (179, N'179', N'Ikom', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (180, N'180', N'Obanliku', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (181, N'181', N'Obubra', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (182, N'182', N'Obudu', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (183, N'183', N'Odukpani', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (184, N'184', N'Ogoja', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (185, N'185', N'Yakuur', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (186, N'186', N'Yala', 9)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (187, N'187', N'Aniocha North', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (188, N'188', N'Aniocha South', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (189, N'189', N'Bomadi', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (190, N'190', N'Burutu', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (191, N'191', N'Ethiope East', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (192, N'192', N'Ethiope West', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (193, N'193', N'Ika North East', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (194, N'194', N'Ika South', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (195, N'195', N'Isoko North', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (196, N'196', N'Isoko South', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (197, N'197', N'Ndokwa East', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (198, N'198', N'Ndokwa West', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (199, N'199', N'Okpe', 10)
GO
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (200, N'200', N'Oshimili North', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (201, N'201', N'Oshimili South', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (202, N'202', N'Patani', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (203, N'203', N'Sapele', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (204, N'204', N'Udu', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (205, N'205', N'Ughelli North', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (206, N'206', N'Ughelli South', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (207, N'207', N'Ukwuani', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (208, N'208', N'Uvwie', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (209, N'209', N'Warri North', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (210, N'210', N'Warri South', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (211, N'211', N'Warri South West', 10)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (212, N'212', N'Abakaliki', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (213, N'213', N'Afikpo North', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (214, N'214', N'Afikpo South (Edda)', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (215, N'215', N'Ebonyi', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (216, N'216', N'Ezza North', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (217, N'217', N'Ezza South', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (218, N'218', N'Ikwo', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (219, N'219', N'Ishielu', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (220, N'220', N'Ivo', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (221, N'221', N'Izzi', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (222, N'222', N'Ohaozara', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (223, N'223', N'Ohaukwu', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (224, N'224', N'Onicha', 11)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (225, N'225', N'Akoko-Edo', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (226, N'226', N'Egor', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (227, N'227', N'Esan Central', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (228, N'228', N'Esan North-East', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (229, N'229', N'Esan South-East', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (230, N'230', N'Esan West', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (231, N'231', N'Etsako Central', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (232, N'232', N'Etsako East', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (233, N'233', N'Etsako West', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (234, N'234', N'Igueben', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (235, N'235', N'Ikpoba Okha', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (236, N'236', N'Oredo', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (237, N'237', N'Orhionmwon', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (238, N'238', N'Ovia North-East', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (239, N'239', N'Ovia South-West', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (240, N'240', N'Owan East', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (241, N'241', N'Owan West', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (242, N'242', N'Uhunmwonde', 12)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (243, N'243', N'Ado Ekiti', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (244, N'244', N'Efon', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (245, N'245', N'Ekiti East', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (246, N'246', N'Ekiti South-West', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (247, N'247', N'Ekiti West', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (248, N'248', N'Emure', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (249, N'249', N'Gbonyin', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (250, N'250', N'Ido Osi', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (251, N'251', N'Ijero', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (252, N'252', N'Ikere', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (253, N'253', N'Ikole', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (254, N'254', N'Ilejemeje', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (255, N'255', N'Irepodun/Ifelodun', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (256, N'256', N'Ise/Orun', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (257, N'257', N'Moba', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (258, N'258', N'Oye', 13)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (259, N'259', N'Aninri', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (260, N'260', N'Awgu', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (261, N'261', N'Enugu East', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (262, N'262', N'Enugu North', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (263, N'263', N'Enugu South', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (264, N'264', N'Ezeagu', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (265, N'265', N'Igbo Etiti', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (266, N'266', N'Igbo Eze North', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (267, N'267', N'Igbo Eze South', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (268, N'268', N'Isi Uzo', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (269, N'269', N'Nkanu East', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (270, N'270', N'Nkanu West', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (271, N'271', N'Nsukka', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (272, N'272', N'Oji River', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (273, N'273', N'Udenu', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (274, N'274', N'Udi', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (275, N'275', N'Uzo Uwani', 14)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (276, N'276', N'Abaji', 15)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (277, N'277', N'Bwari', 15)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (278, N'278', N'Gwagwalada', 15)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (279, N'279', N'Kuje', 15)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (280, N'280', N'Kwali', 15)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (281, N'281', N'Municipal Area Council', 15)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (282, N'282', N'Akko', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (283, N'283', N'Balanga', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (284, N'284', N'Billiri', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (285, N'285', N'Dukku', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (286, N'286', N'Funakaye', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (287, N'287', N'Gombe', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (288, N'288', N'Kaltungo', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (289, N'289', N'Kwami', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (290, N'290', N'Nafada', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (291, N'291', N'Shongom', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (292, N'292', N'Yamaltu/Deba', 16)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (293, N'293', N'Aboh Mbaise', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (294, N'294', N'Ahiazu Mbaise', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (295, N'295', N'Ehime Mbano', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (296, N'296', N'Ezinihitte', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (297, N'297', N'Ideato North', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (298, N'298', N'Ideato South', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (299, N'299', N'Ihitte/Uboma', 17)
GO
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (300, N'300', N'Ikeduru', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (301, N'301', N'Isiala Mbano', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (302, N'302', N'Isu', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (303, N'303', N'Mbaitoli', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (304, N'304', N'Ngor Okpala', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (305, N'305', N'Njaba', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (306, N'306', N'Nkwerre', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (307, N'307', N'Nwangele', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (308, N'308', N'Obowo', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (309, N'309', N'Oguta', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (310, N'310', N'Ohaji/Egbema', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (311, N'311', N'Okigwe', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (312, N'312', N'Orlu', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (313, N'313', N'Orsu', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (314, N'314', N'Oru East', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (315, N'315', N'Oru West', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (316, N'316', N'Owerri Municipal', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (317, N'317', N'Owerri North', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (318, N'318', N'Owerri West', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (319, N'319', N'Unuimo', 17)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (320, N'320', N'Auyo', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (321, N'321', N'Babura', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (322, N'322', N'Biriniwa', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (323, N'323', N'Birnin Kudu', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (324, N'324', N'Buji', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (325, N'325', N'Dutse', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (326, N'326', N'Gagarawa', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (327, N'327', N'Garki', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (328, N'328', N'Gumel', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (329, N'329', N'Guri', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (330, N'330', N'Gwaram', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (331, N'331', N'Gwiwa', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (332, N'332', N'Hadejia', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (333, N'333', N'Jahun', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (334, N'334', N'Kafin Hausa', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (335, N'335', N'Kaugama', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (336, N'336', N'Kazaure', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (337, N'337', N'Kiri Kasama', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (338, N'338', N'Kiyawa', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (339, N'339', N'Maigatari', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (340, N'340', N'Malam Madori', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (341, N'341', N'Miga', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (342, N'342', N'Ringim', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (343, N'343', N'Roni', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (344, N'344', N'Sule Tankarkar', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (345, N'345', N'Taura', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (346, N'346', N'Yankwashi', 18)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (347, N'347', N'Birnin Gwari', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (348, N'348', N'Chikun', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (349, N'349', N'Giwa', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (350, N'350', N'Igabi', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (351, N'351', N'Ikara', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (352, N'352', N'Jaba', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (353, N'353', N'Jema''a', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (354, N'354', N'Kachia', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (355, N'355', N'Kaduna North', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (356, N'356', N'Kaduna South', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (357, N'357', N'Kagarko', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (358, N'358', N'Kajuru', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (359, N'359', N'Kaura', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (360, N'360', N'Kauru', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (361, N'361', N'Kubau', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (362, N'362', N'Kudan', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (363, N'363', N'Lere', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (364, N'364', N'Makarfi', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (365, N'365', N'Sabon Gari', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (366, N'366', N'Sanga', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (367, N'367', N'Soba', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (368, N'368', N'Zangon Kataf', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (369, N'369', N'Zaria', 19)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (370, N'370', N'Ajingi', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (371, N'371', N'Albasu', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (372, N'372', N'Bagwai', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (373, N'373', N'Bebeji', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (374, N'374', N'Bichi', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (375, N'375', N'Bunkure', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (376, N'376', N'Dala', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (377, N'377', N'Dambatta', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (378, N'378', N'Dawakin Kudu', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (379, N'379', N'Dawakin Tofa', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (380, N'380', N'Doguwa', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (381, N'381', N'Fagge', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (382, N'382', N'Gabasawa', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (383, N'383', N'Garko', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (384, N'384', N'Garun Mallam', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (385, N'385', N'Gaya', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (386, N'386', N'Gezawa', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (387, N'387', N'Gwale', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (388, N'388', N'Gwarzo', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (389, N'389', N'Kabo', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (390, N'390', N'Kano Municipal', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (391, N'391', N'Karaye', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (392, N'392', N'Kibiya', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (393, N'393', N'Kiru', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (394, N'394', N'Kumbotso', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (395, N'395', N'Kunchi', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (396, N'396', N'Kura', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (397, N'397', N'Madobi', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (398, N'398', N'Makoda', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (399, N'399', N'Minjibir', 20)
GO
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (400, N'400', N'Nasarawa', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (401, N'401', N'Rano', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (402, N'402', N'Rimin Gado', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (403, N'403', N'Rogo', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (404, N'404', N'Shanono', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (405, N'405', N'Sumaila', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (406, N'406', N'Takai', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (407, N'407', N'Tarauni', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (408, N'408', N'Tofa', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (409, N'409', N'Tsanyawa', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (410, N'410', N'Tudun Wada', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (411, N'411', N'Ungogo', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (412, N'412', N'Warawa', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (413, N'413', N'Wudil', 20)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (414, N'414', N'Bakori', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (415, N'415', N'Batagarawa', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (416, N'416', N'Batsari', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (417, N'417', N'Baure', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (418, N'418', N'Bindawa', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (419, N'419', N'Charanchi', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (420, N'420', N'Dan Musa', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (421, N'421', N'Dandume', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (422, N'422', N'Danja', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (423, N'423', N'Daura', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (424, N'424', N'Dutsi', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (425, N'425', N'Dutsin Ma', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (426, N'426', N'Faskari', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (427, N'427', N'Funtua', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (428, N'428', N'Ingawa', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (429, N'429', N'Jibia', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (430, N'430', N'Kafur', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (431, N'431', N'Kaita', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (432, N'432', N'Kankara', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (433, N'433', N'Kankia', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (434, N'434', N'Katsina', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (435, N'435', N'Kurfi', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (436, N'436', N'Kusada', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (437, N'437', N'Mai''Adua', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (438, N'438', N'Malumfashi', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (439, N'439', N'Mani', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (440, N'440', N'Mashi', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (441, N'441', N'Matazu', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (442, N'442', N'Musawa', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (443, N'443', N'Rimi', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (444, N'444', N'Sabuwa', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (445, N'445', N'Safana', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (446, N'446', N'Sandamu', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (447, N'447', N'Zango', 21)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (448, N'448', N'Aleiro', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (449, N'449', N'Arewa Dandi', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (450, N'450', N'Argungu', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (451, N'451', N'Augie', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (452, N'452', N'Bagudo', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (453, N'453', N'Birnin Kebbi', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (454, N'454', N'Bunza', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (455, N'455', N'Dandi', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (456, N'456', N'Fakai', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (457, N'457', N'Gwandu', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (458, N'458', N'Jega', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (459, N'459', N'Kalgo', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (460, N'460', N'Koko/Besse', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (461, N'461', N'Maiyama', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (462, N'462', N'Ngaski', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (463, N'463', N'Sakaba', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (464, N'464', N'Shanga', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (465, N'465', N'Suru', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (466, N'466', N'Wasagu/Danko', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (467, N'467', N'Yauri', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (468, N'468', N'Zuru', 22)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (469, N'469', N'Adavi', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (470, N'470', N'Ajaokuta', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (471, N'471', N'Ankpa', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (472, N'472', N'Bassa', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (473, N'473', N'Dekina', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (474, N'474', N'Ibaji', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (475, N'475', N'Idah', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (476, N'476', N'Igalamela Odolu', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (477, N'477', N'Ijumu', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (478, N'478', N'Kabba/Bunu', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (479, N'479', N'Kogi', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (480, N'480', N'Lokoja', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (481, N'481', N'Mopa Muro', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (482, N'482', N'Ofu', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (483, N'483', N'Ogori/Magongo', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (484, N'484', N'Okehi', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (485, N'485', N'Okene', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (486, N'486', N'Olamaboro', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (487, N'487', N'Omala', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (488, N'488', N'Yagba East', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (489, N'489', N'Yagba West', 23)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (490, N'490', N'Asa', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (491, N'491', N'Baruten', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (492, N'492', N'Edu', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (493, N'493', N'Ekiti', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (494, N'494', N'Ifelodun', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (495, N'495', N'Ilorin East', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (496, N'496', N'Ilorin South', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (497, N'497', N'Ilorin West', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (498, N'498', N'Irepodun', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (499, N'499', N'Isin', 24)
GO
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (500, N'500', N'Kaiama', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (501, N'501', N'Moro', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (502, N'502', N'Offa', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (503, N'503', N'Oke Ero', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (504, N'504', N'Oyun', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (505, N'505', N'Pategi', 24)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (506, N'506', N'Agege', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (507, N'507', N'Ajeromi-Ifelodun', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (508, N'508', N'Alimosho', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (509, N'509', N'Amuwo-Odofin', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (510, N'510', N'Apapa', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (511, N'511', N'Badagry', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (512, N'512', N'Epe', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (513, N'513', N'Eti Osa', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (514, N'514', N'Ibeju-Lekki', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (515, N'515', N'Ifako-Ijaiye', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (516, N'516', N'Ikeja', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (517, N'517', N'Ikorodu', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (518, N'518', N'Kosofe', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (519, N'519', N'Lagos Island', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (520, N'520', N'Lagos Mainland', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (521, N'521', N'Mushin', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (522, N'522', N'Ojo', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (523, N'523', N'Oshodi-Isolo', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (524, N'524', N'Shomolu', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (525, N'525', N'Surulere', 25)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (526, N'526', N'Akwanga', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (527, N'527', N'Awe', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (528, N'528', N'Doma', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (529, N'529', N'Karu', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (530, N'530', N'Keana', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (531, N'531', N'Keffi', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (532, N'532', N'Kokona', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (533, N'533', N'Lafia', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (534, N'534', N'Nasarawa', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (535, N'535', N'Nasarawa Egon', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (536, N'536', N'Obi', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (537, N'537', N'Toto', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (538, N'538', N'Wamba', 26)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (539, N'539', N'Agaie', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (540, N'540', N'Agwara', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (541, N'541', N'Bida', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (542, N'542', N'Borgu', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (543, N'543', N'Bosso', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (544, N'544', N'Chanchaga', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (545, N'545', N'Edati', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (546, N'546', N'Gbako', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (547, N'547', N'Gurara', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (548, N'548', N'Katcha', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (549, N'549', N'Kontagora', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (550, N'550', N'Lapai', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (551, N'551', N'Lavun', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (552, N'552', N'Magama', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (553, N'553', N'Mariga', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (554, N'554', N'Mashegu', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (555, N'555', N'Mokwa', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (556, N'556', N'Moya', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (557, N'557', N'Paikoro', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (558, N'558', N'Rafi', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (559, N'559', N'Rijau', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (560, N'560', N'Shiroro', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (561, N'561', N'Suleja', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (562, N'562', N'Tafa', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (563, N'563', N'Wushishi', 27)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (564, N'564', N'Abeokuta North', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (565, N'565', N'Abeokuta South', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (566, N'566', N'Ado-Odo/Ota', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (567, N'567', N'Ewekoro', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (568, N'568', N'Ifo', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (569, N'569', N'Ijebu East', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (570, N'570', N'Ijebu North', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (571, N'571', N'Ijebu North East', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (572, N'572', N'Ijebu Ode', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (573, N'573', N'Ikenne', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (574, N'574', N'Imeko Afon', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (575, N'575', N'Ipokia', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (576, N'576', N'Obafemi Owode', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (577, N'577', N'Odeda', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (578, N'578', N'Odogbolu', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (579, N'579', N'Ogun Waterside', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (580, N'580', N'Remo North', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (581, N'581', N'Shagamu', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (582, N'582', N'Yewa North', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (583, N'583', N'Yewa South', 28)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (584, N'584', N'Akoko North-East', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (585, N'585', N'Akoko North-West', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (586, N'586', N'Akoko South-East', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (587, N'587', N'Akoko South-West', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (588, N'588', N'Akure North', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (589, N'589', N'Akure South', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (590, N'590', N'Ese Odo', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (591, N'591', N'Idanre', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (592, N'592', N'Ifedore', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (593, N'593', N'Ilaje', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (594, N'594', N'Ile Oluji/Okeigbo', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (595, N'595', N'Irele', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (596, N'596', N'Odigbo', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (597, N'597', N'Okitipupa', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (598, N'598', N'Ondo East', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (599, N'599', N'Ondo West', 29)
GO
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (600, N'600', N'Ose', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (601, N'601', N'Owo', 29)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (602, N'602', N'Aiyedaade', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (603, N'603', N'Aiyedire', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (604, N'604', N'Atakunmosa East', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (605, N'605', N'Atakunmosa West', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (606, N'606', N'Boluwaduro', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (607, N'607', N'Boripe', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (608, N'608', N'Ede North', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (609, N'609', N'Ede South', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (610, N'610', N'Egbedore', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (611, N'611', N'Ejigbo', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (612, N'612', N'Ife Central', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (613, N'613', N'Ife East', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (614, N'614', N'Ife North', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (615, N'615', N'Ife South', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (616, N'616', N'Ifedayo', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (617, N'617', N'Ifelodun', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (618, N'618', N'Ila', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (619, N'619', N'Ilesa East', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (620, N'620', N'Ilesa West', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (621, N'621', N'Irepodun', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (622, N'622', N'Irewole', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (623, N'623', N'Isokan', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (624, N'624', N'Iwo', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (625, N'625', N'Obokun', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (626, N'626', N'Odo Otin', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (627, N'627', N'Ola Oluwa', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (628, N'628', N'Olorunda', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (629, N'629', N'Oriade', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (630, N'630', N'Orolu', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (631, N'631', N'Osogbo', 30)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (632, N'632', N'Afijio', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (633, N'633', N'Akinyele', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (634, N'634', N'Atiba', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (635, N'635', N'Atisbo', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (636, N'636', N'Egbeda', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (637, N'637', N'Ibadan North', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (638, N'638', N'Ibadan North-East', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (639, N'639', N'Ibadan North-West', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (640, N'640', N'Ibadan South-East', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (641, N'641', N'Ibadan South-West', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (642, N'642', N'Ibarapa Central', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (643, N'643', N'Ibarapa East', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (644, N'644', N'Ibarapa North', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (645, N'645', N'Ido', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (646, N'646', N'Irepo', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (647, N'647', N'Iseyin', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (648, N'648', N'Itesiwaju', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (649, N'649', N'Iwajowa', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (650, N'650', N'Kajola', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (651, N'651', N'Lagelu', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (652, N'652', N'Ogbomosho North', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (653, N'653', N'Ogbomosho South', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (654, N'654', N'Ogo Oluwa', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (655, N'655', N'Olorunsogo', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (656, N'656', N'Oluyole', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (657, N'657', N'Ona Ara', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (658, N'658', N'Orelope', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (659, N'659', N'Ori Ire', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (660, N'660', N'Oyo', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (661, N'661', N'Oyo East', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (662, N'662', N'Saki East', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (663, N'663', N'Saki West', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (664, N'664', N'Surulere', 31)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (665, N'665', N'Barkin Ladi', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (666, N'666', N'Bassa', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (667, N'667', N'Bokkos', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (668, N'668', N'Jos East', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (669, N'669', N'Jos North', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (670, N'670', N'Jos South', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (671, N'671', N'Kanam', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (672, N'672', N'Kanke', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (673, N'673', N'Langtang North', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (674, N'674', N'Langtang South', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (675, N'675', N'Mangu', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (676, N'676', N'Mikang', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (677, N'677', N'Pankshin', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (678, N'678', N'Qua''an Pan', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (679, N'679', N'Riyom', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (680, N'680', N'Shendam', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (681, N'681', N'Wase', 32)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (682, N'682', N'Abua/Odual', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (683, N'683', N'Ahoada East', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (684, N'684', N'Ahoada West', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (685, N'685', N'Akuku-Toru', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (686, N'686', N'Andoni', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (687, N'687', N'Asari-Toru', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (688, N'688', N'Bonny', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (689, N'689', N'Degema', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (690, N'690', N'Eleme', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (691, N'691', N'Emuoha', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (692, N'692', N'Etche', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (693, N'693', N'Gokana', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (694, N'694', N'Ikwerre', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (695, N'695', N'Khana', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (696, N'696', N'Obio/Akpor', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (697, N'697', N'Ogba/Egbema/Ndoni', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (698, N'698', N'Ogu/Bolo', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (699, N'699', N'Okrika', 33)
GO
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (700, N'700', N'Omuma', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (701, N'701', N'Opobo/Nkoro', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (702, N'702', N'Oyigbo', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (703, N'703', N'Port Harcourt', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (704, N'704', N'Tai', 33)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (705, N'705', N'Binji', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (706, N'706', N'Bodinga', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (707, N'707', N'Dange Shuni', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (708, N'708', N'Gada', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (709, N'709', N'Goronyo', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (710, N'710', N'Gudu', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (711, N'711', N'Gwadabawa', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (712, N'712', N'Illela', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (713, N'713', N'Isa', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (714, N'714', N'Kebbe', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (715, N'715', N'Kware', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (716, N'716', N'Rabah', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (717, N'717', N'Sabon Birni', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (718, N'718', N'Shagari', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (719, N'719', N'Silame', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (720, N'720', N'Sokoto North', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (721, N'721', N'Sokoto South', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (722, N'722', N'Tambuwal', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (723, N'723', N'Tangaza', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (724, N'724', N'Tureta', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (725, N'725', N'Wamako', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (726, N'726', N'Wurno', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (727, N'727', N'Yabo', 34)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (728, N'728', N'Ardo Kola', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (729, N'729', N'Bali', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (730, N'730', N'Donga', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (731, N'731', N'Gashaka', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (732, N'732', N'Gassol', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (733, N'733', N'Ibi', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (734, N'734', N'Jalingo', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (735, N'735', N'Karim Lamido', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (736, N'736', N'Kumi', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (737, N'737', N'Lau', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (738, N'738', N'Sardauna', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (739, N'739', N'Takum', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (740, N'740', N'Ussa', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (741, N'741', N'Wukari', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (742, N'742', N'Yorro', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (743, N'743', N'Zing', 35)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (744, N'744', N'Bade', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (745, N'745', N'Bursari', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (746, N'746', N'Damaturu', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (747, N'747', N'Fika', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (748, N'748', N'Fune', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (749, N'749', N'Geidam', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (750, N'750', N'Gujba', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (751, N'751', N'Gulani', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (752, N'752', N'Jakusko', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (753, N'753', N'Karasuwa', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (754, N'754', N'Machina', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (755, N'755', N'Nangere', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (756, N'756', N'Nguru', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (757, N'757', N'Potiskum', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (758, N'758', N'Tarmuwa', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (759, N'759', N'Yunusari', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (760, N'760', N'Yusufari', 36)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (761, N'761', N'Anka', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (762, N'762', N'Bakura', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (763, N'763', N'Birnin Magaji/Kiyaw', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (764, N'764', N'Bukkuyum', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (765, N'765', N'Bungudu', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (766, N'766', N'Chafe', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (767, N'767', N'Gummi', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (768, N'768', N'Gusau', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (769, N'769', N'Kaura Namoda', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (770, N'770', N'Maradun', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (771, N'771', N'Maru', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (772, N'772', N'Shinkafi', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (773, N'773', N'Talata Mafara', 37)
INSERT [dbo].[LGA] ([LgaId], [LgaCode], [LgaName], [StateId]) VALUES (774, N'774', N'Zurmi', 37)
SET IDENTITY_INSERT [dbo].[LGA] OFF
SET IDENTITY_INSERT [dbo].[Nationality_Information] ON 

INSERT [dbo].[Nationality_Information] ([NationalityId], [NationalityN]) VALUES (1, N'Nigerian')
INSERT [dbo].[Nationality_Information] ([NationalityId], [NationalityN]) VALUES (2, N'Non - Nigerian')
SET IDENTITY_INSERT [dbo].[Nationality_Information] OFF
SET IDENTITY_INSERT [dbo].[RevenueException] ON 

INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (1, N'Vehicle License Renewal (MV & MC)', N'100080021111067', N'OGSS')
INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (2, N'Number Plate (Motor Vehicle)', N'100080021111068', N'OGSS')
INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (3, N'Number Plate Motor Cycle', N'100080021111069', N'OGSS')
INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (4, N'Learner''s Permit', N'100080021111070', N'OGSS')
INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (5, N'Dealers License', N'100080021111072', N'OGSS')
INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (6, N'New Drivers License', N'100080021111073', N'OGSS')
INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (7, N'Renewal of Drivers License', N'100080021111074', N'OGSS')
INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (8, N'Hackney permit', N'100080021111084', N'OGSS')
INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (9, N'Change of Ownership', N'100080021111083', N'OGSS')
INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (10, N'Trailers And Tippers Permit', N'100080021113006', N'OGSS')
INSERT [dbo].[RevenueException] ([ExcepRevId], [RevenueName], [RevenueCode], [StateCode]) VALUES (11, N'Other Revenue', N'100080021111019', N'OGSS')
SET IDENTITY_INSERT [dbo].[RevenueException] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (1, N'1', N'Abia State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (2, N'2', N'Adamawa State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (3, N'3', N'Akwa Ibom State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (4, N'4', N'Anambra State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (5, N'5', N'Bauchi State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (6, N'6', N'Bayelsa State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (7, N'7', N'Benue State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (8, N'8', N'Borno State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (9, N'9', N'Cross River State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (10, N'10', N'Delta State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (11, N'11', N'Ebonyi State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (12, N'12', N'Edo State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (13, N'13', N'Ekiti State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (14, N'14', N'Enugu State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (15, N'15', N'FCT', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (16, N'16', N'Gombe State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (17, N'17', N'Imo State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (18, N'18', N'Jigawa State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (19, N'19', N'Kaduna State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (20, N'20', N'Kano State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (21, N'21', N'Katsina State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (22, N'22', N'Kebbi State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (23, N'23', N'Kogi State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (24, N'24', N'Kwara State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (25, N'25', N'Lagos State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (26, N'26', N'Nasarawa State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (27, N'27', N'Niger State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (28, N'28', N'Ogun State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (29, N'29', N'Ondo State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (30, N'30', N'Osun State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (31, N'31', N'Oyo State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (32, N'32', N'Plateau State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (33, N'33', N'Rivers State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (34, N'34', N'Sokoto State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (35, N'35', N'Taraba State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (36, N'36', N'Yobe State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (37, N'37', N'Zamfara State', N'NG', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (39, N'39', N'Central', N'GH', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (40, N'40', N'Volta', N'GH', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (41, N'41', N'Eastern', N'GH', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (42, N'42', N'Ashanti', N'GH', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (43, N'43', N'Western', N'GH', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (44, N'44', N'Brong-Ahafo', N'GH', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (45, N'45', N'Northern', N'GH', 161)
INSERT [dbo].[State] ([StateId], [StateCode], [StateName], [CountryCode], [CountryId]) VALUES (46, N'46', N'Upper West', N'GH', 161)
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[StateUrl] ON 

INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (1, N'Abia State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (2, N'Adamawa State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (3, N'Akwa Ibom State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (4, N'Anambra State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (5, N'Bauchi State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (6, N'Bayelsa State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (7, N'Benue State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (8, N'Borno State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (9, N'Cross River State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (10, N'Delta State', N'DTSS', N'DELTA STATE GOVERNMENT', N'deltastatebir.com', N'http://deltastatebir.com/taxsmartreg/', N'090-539-641-18 & 090-539-641-00', N'info@deltabir.com ', N'Revenue House, 105 Airport Road, Opposite Total Filling Station, Warri Delta State', 1, N'GTB', N'GUARANTY TRUST BANK PLC', N'X001', N'ASABA', N'DT004', N'UPS$$Ogun77', N'password', CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (11, N'Ebonyi State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (12, N'Edo State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (13, N'Ekiti State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (14, N'Enugu State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (15, N'FCT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (16, N'Gombe State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (17, N'Imo State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (18, N'Jigawa State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (19, N'Kaduna State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (20, N'Kano State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (21, N'Katsina State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (22, N'Kebbi State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (23, N'Kogi State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (24, N'Kwara State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (25, N'Lagos State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (26, N'Nasarawa State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (27, N'Niger State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (28, N'Ogun State', N'OGSS', N'OGUN STATE GOVERNMENT', N'ogunstatebir.com', N'http://ogunstatebir.com/taxsmartreg/', N'080-602-407-78 & 080-705-806-51', N'info@ogunstaterevenue.com', N'Revenue building, Oke Mosan, Abeokuta, Ogun State', 1, N'UBN', N'UNION BANK PLC', N'S001', N'ABEOKUTA', N'OG001', N'UPS$$Ogun77', N'password', CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (29, N'Ondo State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (30, N'Osun State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (31, N'Oyo State', N'OYSS', N'OYO STATE GOVERNMENT', N'oyostatebir.com', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (32, N'Plateau State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (33, N'Rivers State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (34, N'Sokoto State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (35, N'Taraba State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (36, N'Yobe State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
INSERT [dbo].[StateUrl] ([InstitutionCode], [StateName], [StateCode], [StateFullName], [StateUrlName], [StateRegUrl], [StatePhone], [StateEmail], [StateAddress], [GateWayID], [BankCode], [BankName], [BranchCode], [BranchName], [HashValue], [UCC], [PCC], [DateEntered], [IsDeleted]) VALUES (37, N'Zamfara State', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-22T08:43:54.710' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[StateUrl] OFF
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (1, N'BOARD OF INTERNAL REVENUE', N'100080021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (2, N'BUREAU OF LANDS AND SURVEY', N'400070021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (3, N'BUREAU OF URBAN AND PHYSICAL PLANNING', N'400070031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (4, N'OGUN STATE URBAN AND REGIONAL PLANNING BOARD', N'400070051110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (5, N'MINISTRY OF EDUCATION, SCIENCE AND TECHNOLOGY', N'200050011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (6, N'MINISTRY OF COMMERCE AND INDUSTRIES', N'100020011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (7, N'OGUN STATE HOMEOWNERS` CHARTER PROJECT', N'400210001110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (8, N'MINISTRY OF HEALTH', N'200100011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (9, N'MINISTRY OF AGRICULTURE', N'100010011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (10, N'MINISTRY OF FORESTRY', N'100010021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (11, N'MINISTRY OF ENVIRONMENT', N'400070011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (12, N'AGRICULTURAL DEVELOPMENT CORPORATION', N'100010031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (13, N'CASSAVA REVOLUTION PROGRAMME', N'100010051110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (14, N'CHRISTIAN PILGRIMS'' WELFARE BOARD', N'200020041110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (15, N'CIVIL SERVICE COMMISSION', N'300170031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (16, N'COUNCIL FOR ARTS AND CULTURE', N'200040011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (17, N'FORESTRY PLANTATION PROJECT (AREA J4)', N'100010061110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (18, N'GATEWAY CITY DEVELOPMENT COMPANY', N'100080141110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (19, N'GATEWAY FOOTBALL CLUB', N'200160021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (20, N'GATEWAY HOLDINGS LIMITED', N'100080051110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (21, N'GATEWAY INTERNATIONAL STADIUM IJEBU-ODE', N'200160061110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (22, N'GATEWAY INTERNATIONAL STADIUM ILARO', N'200160071110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (23, N'GATEWAY INTERNATIONAL STADIUM SAGAMU', N'200160051110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (24, N'GATEWAY RADIO', N'200120031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (25, N'GATEWAY SAVINGS AND LOANS LIMITED', N'100080151110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (26, N'GATEWAY TELEVISION', N'200120041110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (27, N'GATEWAY TOURISM DEVELOPMENT CORPORATION', N'200040021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (28, N'GRANTS', N'100400071110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (29, N'HOSPITAL MANAGEMENT BOARD', N'200100021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (30, N'HOUSE OF ASSEMBLY', N'300090071110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (31, N'HOUSE OF ASSEMBLY SERVICE COMMISSION', N'300090072110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (32, N'JUDICIAL SERVICE COMMISSION', N'300130031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (33, N'JUDICIARY', N'300130021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (34, N'LOCAL GOVERNMENT SERVICE COMMISSION', N'300170041110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (35, N'M.K.O. ABIOLA STADIUM', N'200160031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (36, N'BUREAU OF MANAGEMENT AND BUDGET', N'100080031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (37, N'BUREAU OF ESTABLISHMENT AND TRAINING', N'300170011112000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (38, N'MINISTRY OF COMMUNITY DEVELOPMENT AND COOPERATIVES', N'200020011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (39, N'MINISTRY OF COMMUNITY DEVELOPMENT AND COOPERATIVES', N'200020011112000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (40, N'MINISTRY OF CULTURE AND TOURISM', N'200040021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (41, N'BUREAU OF EMPLOYMENT GENERATION (OGEGEP)', N'200060011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (42, N'BUREAU OF TRANSPORTATION', N'100190011112000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (43, N'MINISTRY OF FINANCE', N'100080011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (44, N'BUREAU OF PENSIONS (STATE)', N'300170021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (45, N'AGRO SERVICE CORPORATION', N'100010041110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (46, N'MINISTRY OF HOUSING', N'400110011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (47, N'MINISTRY OF INFORMATION AND STRATEGY', N'200120011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (48, N'MINISTRY OF JUSTICE', N'300130011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (49, N'MINISTRY OF LOCAL GOVERNMENT AND CHIEFTAINCY AFFAIRS', N'200020021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (50, N'MINISTRY OF SPECIAL DUTIES', N'100180021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (51, N'MINISTRY OF WOMEN AFFAIRS AND SOCIAL WELFARE', N'200020031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (52, N'MINISTRY OF WORKS', N'100150011110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (53, N'MINISTRY OF YOUTH AND SPORTS', N'200160011115000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (54, N'MISCELLANEOUS', N'300090061110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (55, N'MOSHOOD ABIOLA POLYTECHNIC', N'200050051110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (56, N'MUSLIM PILGRIMS'' WELFARE BOARD', N'200020051110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (57, N'OFFICE OF THE ACCOUNTANT-GENERAL', N'100080041110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (58, N'OFFICE OF THE AUDITOR-GENERAL FOR LOCAL GOVERNMENT', N'300090091110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (59, N'OFFICE OF THE AUDITOR-GENERAL OF THE STATE', N'300090081100000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (60, N'OFFICE OF THE GOVERNOR', N'300090051110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (61, N'OFFICE OF THE HEAD OF SERVICE', N'300170051110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (62, N'OGADEP', N'100010071110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (63, N'OGROMA', N'100150021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (64, N'OGUN STATE BULK PURCHASING CORPORATION', N'100020021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (65, N'OGUN STATE ELECTRIFICATION PROJECT(OGSEP)', N'100150031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (66, N'OGUN STATE EMERGENCY MANAGEMENT AGENCY (SEMA)', N'400070061110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (67, N'OGUN STATE ENVIRONMENTAL PROTECTION AGENCY (OGEPA)', N'400070041110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (68, N'BUREAU OF INFORMATION AND COMMUNICATION TECHNOLOGY', N'200120021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (69, N'OGUN STATE HOUSING CORPORATION', N'400110041110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (70, N'OGUN STATE HUMAN CAPITAL DEVELOPEMENT PROGRAMME', N'200050091110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (71, N'OGUN STATE INDEPENDENT ELECTORAL COMMISSION', N'300090031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (72, N'OGUN STATE LIBRARY BOARD', N'200050020110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (73, N'OGUN STATE PRIMARY EDUCATION BOARD', N'200050081110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (74, N'OGUN STATE PRIMARY HEALTH CARE DEVELOPEMENT BOARD', N'200100051110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (75, N'OGUN STATE PRINTING CORPORATION', N'200120051110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (76, N'OGUN STATE PROPERTY AND INVESTMENT CORPORATION', N'100080131110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (77, N'OGUN STATE SPORTS COUNCIL', N'200160041110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (78, N'OGUN STATE TEACHING SERVICE COMMISSION', N'200050041110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (79, N'OGUN STATE UNIVERSAL BASIC EDUCATION BOARD (SUBEB)', N'200050030110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (80, N'BUREAU OF CABINET AND SPECIAL SERVICE', N'300090052110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (81, N'OGUN STATE WATER CORPORATION', N'200200011112000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (82, N'OLABISI ONABANJO UNIVERSITY', N'200050061110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (83, N'OLABISI ONABANJO UNIVERSITY TEACHING HOSPITAL', N'200100031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (84, N'OSAMCA', N'100010081110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (85, N'PARKS AND GARAGES REVENUE BOARD', N'100190021110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (86, N'PROPERTY TITLE AND RATIFICATION PROJECT ZONE 1', N'400070071110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (87, N'PROPERTY TITLE AND RATIFICATION PROJECT ZONE 2', N'400070081110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (88, N'TAI SOLARIN UNIVERSITY OF EDUCATION', N'200050071110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (89, N'TRAFFIC COMPLIANCE AND ENFORCEMENT', N'100190031110000')
INSERT [dbo].[tblAgencyList] ([SN], [AgencyName], [AgencyCode]) VALUES (90, N'WATER RESOURCES AND RURAL DEVELOPMENT', N'200200041110000')
SET IDENTITY_INSERT [dbo].[tblRevenueList] ON 

INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1, N'Management Fees', N'100010031112013', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (2, N'Rent/Lease Fees', N'100010031112014', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (3, N'Professional fees', N'100010031112015', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (4, N'Director Fees', N'100010031112016', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (5, N'Earnings from Apoje & Lamiro', N'100010031114001', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (6, N'Margins on Sale of Palm Oil', N'100010031114002', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (7, N'Margins on Sale of Rubber', N'100010031114003', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (8, N'Margins on Sale of Culled Birds', N'100010031114004', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (9, N'Margins on Sale of Eggs', N'100010031114005', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (10, N'Sale of Cashew Nuts', N'100010031114006', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (11, N'Management of Privately Managed Farm Settlements', N'100010031114007', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (12, N'Margin on Sales of Feeds', N'100010031114017', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (13, N'Revenue on Sales of Honey', N'100010031114018', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (14, N'Rental Income from Vehicle Hiring', N'100010031115009', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (15, N'Dividend Income from Investments', N'100010031116008', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (16, N'Interest on Vehicle Advance', N'100010031116010', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (17, N'Bank Interest on Deposits/investments', N'100010031116011', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (18, N'Dividends Receivable from Assocuated Companies', N'100010031116012', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (19, N'Miscelleneous', N'100010031118019', N'100010031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (20, N'Sales of Loan Forms', N'100010041114001', N'100010041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (21, N'Sales of Agricultural Inputs', N'100010041114004', N'100010041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (22, N'Sale of Fertilizers', N'100010041114006', N'100010041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (23, N'Other Miscelleneous', N'100010041114007', N'100010041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (24, N'Mechanisation', N'100010041115002', N'100010041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (25, N'Land Clearing/Heavy Equipment Hire (Headquarter an', N'100010041115003', N'100010041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (26, N'Hiring Fee on Tractors', N'100010041115005', N'100010041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (27, N'Pay As You Earn (PAYE)', N'100080021111001', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (28, N'Admin Charges (Stamp Duties)', N'100080021111002', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (29, N'Economic Development Levy', N'100080021111004', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (30, N'Capital Gains Tax', N'100080021111005', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (31, N'Withholding Tax on Rent', N'100080021111007', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (32, N'Withholding Tax on Dividend', N'100080021111008', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (33, N'Pools Promoters Weekly Tax', N'100080021111009', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (34, N'Stamp Duty', N'100080021111010', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (35, N'Withholding Tax on Contract', N'100080021111012', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (36, N'Withholding Tax on Bank Interest', N'100080021111013', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (37, N'Development Levy', N'100080021111014', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (38, N'5% Development Fund on Contract', N'100080021111015', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (39, N'Withholding Tax on Director''s fees', N'100080021111017', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (40, N'Other Revenue', N'100080021111019', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (41, N'Consumption Tax on Food', N'100080021111020', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (42, N'Consumption Tax on Drinks in Bar', N'100080021111021', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (43, N'Consumption Tax on Accommodation/Rentals', N'100080021111022', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (44, N'Consumption Tax on Other Transactions', N'100080021111023', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (45, N'Lotto Agents License', N'100080021111024', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (46, N'Sport Betting Agent License', N'100080021111025', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (47, N'Direct Assessment', N'100080021111062', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (48, N'Minimum Tax', N'100080021111063', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (49, N'Back Duty Assessment', N'100080021111064', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (50, N'Landed Property Tax', N'100080021111066', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (51, N'Vehicle License Renewal (MV & MC)', N'100080021111067', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (52, N'Number Plate (Motor Vehicle)', N'100080021111068', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (53, N'Number Plate Motor Cycle', N'100080021111069', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (54, N'Learner''s Permit', N'100080021111070', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (55, N'Dealers License', N'100080021111072', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (56, N'New Drivers License', N'100080021111073', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (57, N'Renewal of Drivers License', N'100080021111074', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (58, N'Lottery/Lotto Sales Taxes', N'100080021111075', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (59, N'Slot Gaming Machine Registration/Renewal of License', N'100080021111077', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (60, N'Pools Promoters Registration/Renweal of License', N'100080021111078', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (61, N'lottery/Lotto Registration, Application, Renewal of License', N'100080021111079', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (62, N'Withholding Tax on Consultancy', N'100080021111081', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (63, N'Change of Ownership', N'100080021111083', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (64, N'Hackney permit', N'100080021111084', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (65, N'Consultancy  Registration fee', N'100080021111085', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (66, N'Promoters weekly tax', N'100080021111086', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (67, N'Pools Agents Application,Registration and Renewal of License', N'100080021111099', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (68, N'Sport Betting Registration/Renewal of License', N'100080021111102', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (69, N'Online Sport Betting License', N'100080021111103', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (70, N'Online Sport Betting Monthly Sales Taxes', N'100080021111104', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (71, N'Trailers And Tippers Permit', N'100080021113006', N'100080021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (72, N'Replacement of Computerised Identity Cards', N'300090051112004', N'300090052110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (73, N'Certificate of indigenship', N'300090051112005', N'300090052110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (74, N'Grant from Education Trust Fund', N'200060011130002', N'200060011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (75, N'Issuance of Certificates of recognition to Social/Recreational Clubs', N'200060011212001', N'200060011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (76, N'Fees from Sale of Produce Services', N'200060012114003', N'200060011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (77, N'Proceeds from African Growth and Opportunity Act (AGOA)', N'200060012114004', N'200060011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (78, N'School Fees ', N'300170011112002', N'300170011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (79, N'Executive Computer Literacy Course', N'300170011112003', N'300170011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (80, N'Limited Competitive Examination for GL 03 Post', N'300170011112004', N'300170011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (81, N'Training', N'300170011114001', N'300170011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (82, N'Booking of Auditorium - SDC', N'300170011114007', N'300170011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (83, N'Confirmation/Promotion Test and Drivers Conversion', N'300170011115005', N'300170011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (84, N'Replacement of Pensioner''s I.D. Cards', N'300170011115006', N'300170011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (85, N'Registration of ICT contractors including franchise fees, rates', N'200120021112001', N'200120021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (86, N'Mobile internet Van', N'200120021114002', N'200120021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (87, N'Telecom/Infrastructural Services', N'200120021114003', N'200120021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (88, N'GICT', N'200120021114004', N'200120021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (89, N'Allocation of Government Land', N'400070021112001', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (90, N'Governor''s Consent', N'400070021112002', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (91, N'Registration of document', N'400070021112003', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (92, N'Certificate of Occupancy', N'400070021112004', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (93, N'Sales of Application forms', N'400070021112005', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (94, N'Caveat Emptor', N'400070021112006', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (95, N'Caveat Withdrawal', N'400070021112007', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (96, N'Management of Government acquired but released land', N'400070021112008', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (97, N'Express Consent', N'400070021112009', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (98, N'Express Certificate of Occupancy', N'400070021112010', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (99, N'Forms', N'400070021112011', N'400070021110000')
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (100, N'Surrender Fee', N'400070021112012', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (101, N'Preparation/registration of document/extra copies', N'400070021112013', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (102, N'Capital Contributions on land sold', N'400070021112014', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (103, N'Premium on sale of government land', N'400070021112015', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (104, N'Confirmation of Ownership of Lands', N'400070021112016', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (105, N'Checking Fee', N'400070021112017', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (106, N'Ratification Zone 1', N'400070021112018', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (107, N'Search', N'400070021112019', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (108, N'Registration of Court Judgement', N'400070021112020', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (109, N'Inspection fees for C of O', N'400070021112021', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (110, N'Ratification Zone 2', N'400070021112022', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (111, N'Charting Fees', N'400070021112023', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (112, N'Online Search', N'400070021112024', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (113, N'Publication fee', N'400070021114007', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (114, N'Red Copy', N'400070021114016', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (115, N'Sales of Map', N'400070021114018', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (116, N'Certified True Copy', N'400070021114020', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (117, N'Fees for : deposit of plans, Sales of maps, copy of plans and checking of survey records', N'400070021114024', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (118, N'Administrative Charge on Red Copy', N'400070021114025', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (119, N'C of O Execution Fee', N'400070021114026', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (120, N'Recertification', N'400070021114028', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (121, N'Special Infrastructural Levy', N'400070021114032', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (122, N'Survey Fee', N'400070021114033', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (123, N'Annual Ground Rent', N'400070021115006', N'400070021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (124, N'Sale of Budget Speech and Books of Estimates', N'100080031114001', N'100080031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (125, N'HIPACT Forms etc', N'100080031114002', N'100080031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (126, N'Replacement of Pensioner Identity Cards', N'300170021114001', N'300170021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (127, N'Riders ID Card', N'100190011111003', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (128, N'Proceeds from Mechanical Workshop', N'100190011111004', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (129, N'Proceeds from Road Taxes', N'100190011111005', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (130, N'Parking Franchise', N'100190011112001', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (131, N'Traffic Compliance and Enforcement SchemeTRACE', N'100190011112011', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (132, N'Registration of Commercial Vehicles Tender Fees', N'100190011112012', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (133, N'Road Worthiness & Renewal Fees', N'100190011114002', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (134, N'Safety Inspection Test (BOT) for Private Motor Veh', N'100190011114006', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (135, N'Proceeds from Urban Bus Pilot Scheme (Workers & St', N'100190011114007', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (136, N'Proceeds from Commercial Advertisements on Buses', N'100190011114008', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (137, N'Proceeds from Ogun Trainee Care', N'100190011114009', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (138, N'Proceeds from Tyre Tax Heavy Goods Vehicles (HGV)', N'100190011114010', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (139, N'Sales of biodied Vehicles', N'100190011114013', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (140, N'Unallocated Store(fuel)', N'100190011114014', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (141, N'Unallocated Store(material)', N'100190011114015', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (142, N'Proceeds of Street Mass', N'100190011114016', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (143, N'Rail Transit(SMART)', N'100190011114017', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (144, N'Proceeds from Annual vehicles', N'100190011114018', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (145, N'Proceed from Motor Vehicles', N'100190011114019', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (146, N'Licenses Permits', N'100190011114020', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (147, N'Proceed from Petroleum Pricing Cushion effect', N'100190011114021', N'100190011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (148, N'Building Plan Assessment', N'400070031112001', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (149, N'Petition Fee', N'400070031112002', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (150, N'Penal Fees', N'400070031112003', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (151, N'Change of Use', N'400070031112004', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (152, N'Change in Land Use', N'400070031112005', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (153, N'Planning Information', N'400070031112006', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (154, N'Layout Fees', N'400070031112007', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (155, N'Land Use Clearance /Application fees', N'400070031112008', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (156, N'Masts', N'400070031112009', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (157, N'Registration ', N'400070031112010', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (158, N'Fencing Permit/Repair', N'400070031112011', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (159, N'Petitions', N'400070031112012', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (160, N'Administrative Charge', N'400070031115014', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (161, N'Miscellaneous', N'400070031118013', N'400070031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (162, N'Sales of Seedlings, Tubers and Cassava derivatives', N'100010051110002', N'100010051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (163, N'Grants , Loans. Etc', N'100010051118001', N'100010051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (164, N'Sale of Forms', N'200020041112001', N'200020041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (165, N'Sales of Proficiency Forms', N'300170031112002', N'300170031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (166, N'Gazette Publication', N'300170031112003', N'300170031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (167, N'Inter Service Transfer', N'300170031112004', N'300170031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (168, N'Inter Cadre Transfer', N'300170031112005', N'300170031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (169, N'Verification of Certificates', N'300170031112006', N'300170031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (170, N'Appeals and Petition', N'300170031112008', N'300170031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (171, N'Managing A Bureaucracy', N'300170031112009', N'300170031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (172, N'Payment for Acceptance Letter', N'300170031114001', N'300170031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (173, N'Film Shows', N'200040011114001', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (174, N'Play Production', N'200040011114006', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (175, N'Sales of Publication', N'200040011114009', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (176, N'Sales of Souvenirs', N'200040011114010', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (177, N'State Troupe', N'200040011114011', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (178, N'Theatre Institute', N'200040011114012', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (179, N'Seminar/Workshop', N'200040011114013', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (180, N'X-mas/New Year Expo', N'200040011114014', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (181, N'Musical Concert', N'200040011114015', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (182, N'Exhibition Hall', N'200040011115002', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (183, N'Out-door Space', N'200040011115003', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (184, N'Straw Huts', N'200040011115004', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (185, N'Indoor Adverts', N'200040011115005', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (186, N'Restaurants', N'200040011115007', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (187, N'Hire of Costumes', N'200040011115008', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (188, N'Rent from Main Auditorium ', N'200040011115016', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (189, N'Rent from Cinema Hall', N'200040011115017', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (190, N'Rent from Bar', N'200040011115018', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (191, N'Rent from Kiosk', N'200040011115019', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (192, N'Rent from Outdoor Space', N'200040011115020', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (193, N'Rent from Straw Huts', N'200040011115021', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (194, N'Rent from restaurant', N'200040011115022', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (195, N'Rent from equipment', N'200040011115023', N'200040011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (196, N'Revenue from Medical Centres', N'100010061112002', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (197, N'Fines from Forestry', N'100010061112005', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (198, N'Registration of Contractors', N'100010061112007', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (199, N'Revenue from Guest/Caf?', N'100010061112026', N'100010061110000')
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (200, N'Revenue from Plantation High School', N'100010061112027', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (201, N'Revenue from warehousing', N'100010061112028', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (202, N'Revenue from Nursery/Primary', N'100010061114001', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (203, N'Revenue from Guest/Club Houses', N'100010061114003', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (204, N'Trainings/Seminars/Workshops', N'100010061114008', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (205, N'Revenue from Plantation High School', N'100010061114009', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (206, N'Sales of Birds', N'100010061114010', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (207, N'Sales of Eggs', N'100010061114011', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (208, N'Sales of Sawn Timber', N'100010061114012', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (209, N'Sales of Furniture items', N'100010061114013', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (210, N'Sales of Plantation products', N'100010061114014', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (211, N'Sales of Fire Wood', N'100010061114015', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (212, N'Sales of Used tyres/spent batteries', N'100010061114016', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (213, N'Sales of Abora Leaves', N'100010061114017', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (214, N'Sale of Seedlings', N'100010061114018', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (215, N'Sales of Fish', N'100010061114019', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (216, N'Sales of Fuel and Lubricant', N'100010061114020', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (217, N'Ecotourism (Parks & Gardens)', N'100010061114021', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (218, N'Sales of Bidding Document/Form', N'100010061114022', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (219, N'Transportation Revenue', N'100010061114025', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (220, N'Cassava Revolution Programme', N'100010061114029', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (221, N'Sales of Cassava seedlings', N'100010061114030', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (222, N'Sales of Farm Produce', N'100010061114031', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (223, N'Chemical Treatment of Wood', N'100010061114032', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (224, N'House Rent', N'100010061115023', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (225, N'Hiring of Equipment', N'100010061115024', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (226, N'Payment of Cocoa Farmers', N'100010061115033', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (227, N'Revenue from Roads', N'100010061118004', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (228, N'Electricity Bill', N'100010061118006', N'100010061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (229, N'Sales of forms', N'100080141110002', N'100080141110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (230, N'Premium on the Sales of land', N'100080141114001', N'100080141110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (231, N'Sales of Ticket for matches played', N'200160021114003', N'200160021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (232, N'Clearance of Players and Transfers to interested clubs', N'200160021114004', N'200160021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (233, N'Sale of Souvenirs', N'200160021118001', N'200160021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (234, N'Other Income ', N'200160021118002', N'200160021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (235, N'Dividend income from investments', N'100080051116001', N'100080051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (236, N'Interest from fixed deposits', N'100080051116002', N'100080051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (237, N'Dividend receivable from Associated Companies', N'100080051116003', N'100080051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (238, N'Bank interest received', N'100080051116004', N'100080051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (239, N'Interest on loan', N'100080051116005', N'100080051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (240, N'Gate takings', N'200160061115002', N'200160061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (241, N'Administrative Charges and other Revenue', N'200160061115005', N'200160061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (242, N'Rent of Shop', N'200160061117003', N'200160061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (243, N'Rent of Space', N'200160061117004', N'200160061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (244, N'Rent of Stadium Facilities/Complex', N'200160061117006', N'200160061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (245, N'Hire of Kiosk/Shop', N'200160061118001', N'200160061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (246, N'Gate takings', N'200160071110001', N'200160071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (247, N'Administrative Charge and Other Revenue', N'200160071110002', N'200160071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (248, N'Rent of Shop', N'200160071110003', N'200160071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (249, N'Rent of Space', N'200160071110004', N'200160071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (250, N'Hire of Stadium Facilities\Complex for Event\Rallies\Conferences', N'200160071110005', N'200160071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (251, N'Gate takings', N'200160051112000', N'200160051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (252, N'Administrative Charges and other Revenue', N'200160051112001', N'200160051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (253, N'Rent of Shop', N'200160051112002', N'200160051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (254, N'Rent of Space', N'200160051112003', N'200160051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (255, N'Rent of Stadium Facilities/Complex', N'200160051112004', N'200160051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (256, N'Hire of Kiosk/Shop', N'200160051112005', N'200160051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (257, N'Hire of Stadium Facilities for Private Event/Rallies/Conferences', N'200160051112006', N'200160051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (258, N'Government Payment/Grants', N'200120031113002', N'200120031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (259, N'Sales of Airtime', N'200120031114001', N'200120031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (260, N'Business Centre , Ijebu Ode and Sagamu', N'200120031114005', N'200120031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (261, N'Business Centre and Cyber caf?, Abeokua', N'200120031114006', N'200120031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (262, N'Recording and dubbing Studio, Ijebu Ode, Sagamu and Abeokuta', N'200120031114007', N'200120031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (263, N'Broadcast studio , Ota', N'200120031114008', N'200120031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (264, N'Other non capital intensive revenue yielding projects', N'200120031114009', N'200120031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (265, N'Hire of Conference Hall', N'200120031115003', N'200120031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (266, N'Revenue Yielding Project', N'200120031118004', N'200120031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (267, N'Income from Admin. Fee', N'100080151112003', N'100080151110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (268, N'Interest from Fixed Deposit', N'100080151116001', N'100080151110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (269, N'Interest on Motor Vehicle Advance', N'100080151116002', N'100080151110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (270, N'Bank Interest Received', N'100080151116004', N'100080151110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (271, N'Dividends Received from Government Investments', N'100080151116005', N'100080151110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (272, N'Government Payment/Grants', N'200120041113002', N'200120041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (273, N'Sales of Airtime', N'200120041114001', N'200120041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (274, N'Sales of Airtime to Govt. for services rendered', N'200120041114004', N'200120041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (275, N'Hire of Conference Hall', N'200120041115003', N'200120041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (276, N'50% Registration Fees Of Hotels', N'200040021112001', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (277, N'50% Registration Fees Of Restaurants & Fast Food Joint', N'200040021112002', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (278, N'Night Club/Casino/Dance Bar', N'200040021112003', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (279, N'Handicraft Shops', N'200040021112004', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (280, N'Ogun State Heritage Fiesta: Participation Fees', N'200040021112011', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (281, N'Ogun State Heritage Fiesta: Events Fees', N'200040021112012', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (282, N'Parks & Garages: Parks Development Levy', N'200040021112013', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (283, N'Earnings from Olumo Tourists'' Centre', N'200040021114005', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (284, N'Proceeds from Yemoji Natural Pool', N'200040021114007', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (285, N'Earnings from Tourism', N'200040021114008', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (286, N'Yemoji Natural Pool', N'200040021114009', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (287, N'Recreation Gardens', N'200040021114010', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (288, N'Proceeds from Tourist Post Card', N'200040021114014', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (289, N'Proceeds from Artisan Village', N'200040021114015', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (290, N'Use of Facilities at Tourism Sites', N'200040021115006', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (291, N'Gateway Tourism Golf Tournament', N'200040021118016', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (292, N'Grant Donations', N'200040021118017', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (293, N'Entry Fees', N'200040021118018', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (294, N'Boat Regatta: Grants Donations', N'200040021118019', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (295, N'Grants and subventions from State Government', N'100400071110001', N'100400071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (296, N'Grants and subventions from Federal Government', N'100400071110002', N'100400071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (297, N'Registration Fee for Drug Suppliers', N'200100021112001', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (298, N'Bed Fees', N'200100021112002', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (299, N'Ambulance Fees', N'200100021112003', N'200100021110000')
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (300, N'General Out-Patient Fees', N'200100021112004', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (301, N'Surgical Procedural Fees', N'200100021112005', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (302, N'Dental Procedural Fees', N'200100021112006', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (303, N'Mortuary Fees', N'200100021112007', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (304, N'X-Ray Procedural Fees', N'200100021112008', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (305, N'Preservation & Lab. Fees', N'200100021112009', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (306, N'Laboratory Investigations', N'200100021112013', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (307, N'Major operation', N'200100021112014', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (308, N'Other Charges', N'200100021112017', N'200100021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (309, N'House of Assembly Printing Press', N'300090071114001', N'300090071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (310, N'Sales of Forms and Application Fees', N'300090072110001', N'300090072110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (311, N'Other Acceptance Fees', N'300090072110002', N'300090072110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (312, N'Books and Periodicals', N'300090072110003', N'300090072110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (313, N'Sale of Application for Emloyment Forms', N'300130031112001', N'300130031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (314, N'High Court - Fees and Fines', N'300130021112001', N'300130021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (315, N'Magistrate Court - Fees and Fines', N'300130021112002', N'300130021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (316, N'Customary Court - Fees and Fines', N'300130021112003', N'300130021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (317, N'Probate Earning and Revenue Court - Fees and Fines', N'300130021112004', N'300130021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (318, N'Revenue Court Fees', N'300130021112005', N'300130021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (319, N'Oath and Certification', N'300130021112006', N'300130021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (320, N'Sale of Employment Forms', N'300170041112001', N'300170041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (321, N'Sale of Advertising Rights', N'200160031112003', N'200160031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (322, N'Collection of Other Rates and Fees', N'200160031112004', N'200160031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (323, N'Proceeds from Gate-takings', N'200160031114001', N'200160031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (324, N'State/ Private Function', N'200160031114005', N'200160031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (325, N'Public Meetings', N'200160031114006', N'200160031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (326, N'Receptions', N'200160031114007', N'200160031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (327, N'Political Rally', N'200160031114008', N'200160031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (328, N'Dances/Musical Concert', N'200160031114009', N'200160031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (329, N'Drama Production', N'200160031114010', N'200160031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (330, N'Hire of Stadium Facilities for Private Events/Rallies/Conferences', N'200160031118002', N'200160031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (331, N'Cattle Tax', N'100010011111001', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (332, N'Clinical Fee paid for treatment of small animals', N'100010011112002', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (333, N'Tender Fees', N'100010011112003', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (334, N'Inland Fishermen and Fish Farming Charge', N'100010011112004', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (335, N'Quality Control and Anti - Smuggling Campaign', N'100010011112005', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (336, N'Landscaping and Ornamentals', N'100010011112008', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (337, N'Service Charge on Farm Equipment', N'100010011112009', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (338, N'Fees charged for Service rendered to Fishermen', N'100010011112033', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (339, N'Raising of Shade trees and Ornamentals', N'100010011112034', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (340, N'Service Charge on Farm Mechanisation', N'100010011112061', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (341, N'Produce Inspection & Grading Fees', N'100010011112069', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (342, N'Quality Control & Anti-Smuggling Campaign', N'100010011112070', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (343, N'Livestock - Feed Millers and Vendors'' Licence', N'100010011113071', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (344, N'Service Charge on Crop Enumeration', N'100010011114006', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (345, N'Sales of Seedlings, Crops & Poultry Products', N'100010011114007', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (346, N'Returns from Workshop activities', N'100010011114010', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (347, N'Returns from soil and water conservation', N'100010011114011', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (348, N'Charges on Pest Control and Plant Protection Servi', N'100010011114012', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (349, N'Earning from meat Inspection', N'100010011114013', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (350, N'Sales of Hides and Skins and other product', N'100010011114014', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (351, N'Poultry Mutiplication Centre', N'100010011114015', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (352, N'Sales of Young Bulls', N'100010011114016', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (353, N'Sales of Pullets', N'100010011114017', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (354, N'Sales of Rabbits', N'100010011114018', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (355, N'Sales of Livestock Feeds', N'100010011114019', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (356, N'Cowpea Seed Multiplication', N'100010011114020', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (357, N'Charges on Seed Processing', N'100010011114021', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (358, N'Sales of Rubber Seedling', N'100010011114022', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (359, N'Sales of Cashew Seeding', N'100010011114023', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (360, N'Mango Seeding Production', N'100010011114024', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (361, N'Guava Seedings Production', N'100010011114025', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (362, N'Pawpaw Seedings Production', N'100010011114026', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (363, N'Sales of Marine Fish', N'100010011114027', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (364, N'Sales of Fishing Inputs', N'100010011114028', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (365, N'Sales of Fresh Fish and Fingerlings', N'100010011114029', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (366, N'Sales of Inland Fish', N'100010011114030', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (367, N'Sales of Teak and Gmelina', N'100010011114031', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (368, N'Sales of Timber and Renewal of Property Hammer', N'100010011114032', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (369, N'Sales of Sugarcane', N'100010011114035', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (370, N'Inter State Toll Collection', N'100010011114036', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (371, N'Revenue from Apiculture', N'100010011114037', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (372, N'Charges on Treatment and vaccination of Poultry', N'100010011114038', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (373, N'Revenue from Sericultural Services', N'100010011114039', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (374, N'Revenue from Parks and Gardens', N'100010011114040', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (375, N'Revenue from Snail Domestication', N'100010011114041', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (376, N'Cane Rat Demonstration', N'100010011114042', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (377, N'Wild Life and Ecotourism', N'100010011114043', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (378, N'Wetland Project', N'100010011114044', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (379, N'Sale of Fuel Wood', N'100010011114045', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (380, N'Sale of Rice Seeds', N'100010011114049', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (381, N'Sale of Maize Seeds', N'100010011114050', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (382, N'Sale of Rice Grains/Grain Distribution', N'100010011114051', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (383, N'Sale of Cassava CuttingsTubers', N'100010011114052', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (384, N'Sale of Citrus Buddings', N'100010011114053', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (385, N'Sale of Pineapple Suckers', N'100010011114054', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (386, N'Sale of Plantains/Bananas', N'100010011114055', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (387, N'Sale of Fruits/Vegetables', N'100010011114056', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (388, N'Sale of Cocoa Seedlings', N'100010011114057', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (389, N'Sale of Cocoa Beans', N'100010011114058', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (390, N'Sale of Oil palm Seedlings/Processing', N'100010011114059', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (391, N'Sale of Kolanut Ramet', N'100010011114060', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (392, N'Sale of Broilers', N'100010011114062', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (393, N'Sale of Turkey', N'100010011114063', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (394, N'Sale of Pig Wenaers & Fatteners', N'100010011114064', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (395, N'Sale of Tractors', N'100010011114065', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (396, N'Service Charge on Landscaping and Ornaments', N'100010011114073', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (397, N'Sales of Dry Season Vegetables', N'100010011114074', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (398, N'Sales of Farm Implement', N'100010011114075', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (399, N'Rent from Hiring of Tanker', N'100010011115046', N'100010011110000')
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (400, N'Rent Paid for the use of Agric Show Equipment', N'100010011115047', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (401, N'Rent on Govt. Assets', N'100010011115048', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (402, N'Hire of Tractors', N'100010011115066', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (403, N'Payment by Settlers on Government Assets', N'100010011115068', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (404, N'Lease on Cashew Plantation', N'100010011115076', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (405, N'Rent on Allocated Land', N'100010011115077', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (406, N'Evacuation Fee', N'100010011115079', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (407, N'Produce Licence', N'100010011115080', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (408, N'Subvention and Permit', N'100010011115081', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (409, N'Annual Ground Rent', N'100010011115083', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (410, N'Head: Reimbursement Fees', N'100010011117067', N'100010011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (411, N'Registration of Business Premises', N'100020011112001', N'100020011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (412, N'Processing Fee for Registration of Cooperative Societies', N'100020011112002', N'100020011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (413, N'Provision for Technical & Industrial Facilities', N'100020011112004', N'100020011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (414, N'Inspection of Quarry Industries', N'100020011112007', N'100020011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (415, N'Tuition Fees', N'100020011112008', N'100020011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (416, N'Sales Application Forms', N'100020011112009', N'100020011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (417, N'Amendment of Bye Laws', N'100020011112010', N'100020011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (418, N'Haulage fee', N'100020011112012', N'100020011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (419, N'Dredging fee', N'100020011112013', N'100020011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (420, N'Registration of Business Premises', N'200020011112001', N'200020011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (421, N'Processing Fee for Registration of Co-operative Societies', N'200020011112002', N'200020011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (422, N'Amendment of Bye-Laws', N'200020011112003', N'200020011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (423, N'Sales of Application Forms', N'200020011112004', N'200020011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (424, N'Tuition Fees', N'200020011112005', N'200020011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (425, N'Provision of Technical and Industrial facilities to Entrepreneurs', N'200020011112006', N'200020011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (426, N'Tuition Fees', N'200020011112008', N'200020011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (427, N'Sales Application Forms', N'200020011112009', N'200020011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (428, N'Amendment of Bye Laws', N'200020011112010', N'200020011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (429, N'Processing of Cooperative Societies Registration', N'200020011112011', N'200020011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (430, N'Tuition fees in respect of the course run at the Social Development Institution', N'200020031112001', N'200020011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (431, N'Rent from Cinema Hall', N'200040021112024', N'200040021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (432, N'Renewal fee for Private Secondary Schools', N'200050011112001', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (433, N'Renewal fee for Private Nursery and Primary School', N'200050011112002', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (434, N'Renewal fee for Private Continuing Education Center', N'200050011112003', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (435, N'Renewal fee for Private Vocational/Computer Centers', N'200050011112004', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (436, N'Renewal fee for Private Hostels', N'200050011112005', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (437, N'Inspection fee for Opening of New Private Secondary School', N'200050011112006', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (438, N'Inspection fee for Opening New Private Nursery/Primary Schools', N'200050011112008', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (439, N'Inspection Fee for Opening Private Continuing Education Centers', N'200050011112009', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (440, N'Inspection Fee for Opening of New Private Hostels', N'200050011112010', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (441, N'Inspection fee for Private Vocational Schools', N'200050011112011', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (442, N'Approval Fee for New Private Secondary Schools', N'200050011112012', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (443, N'Approval fee for New Private Nursery and Primary Schools', N'200050011112013', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (444, N'Approval fee for New Private Hostels', N'200050011112014', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (445, N'Approval fee for Private Vocatonal/Computer Centers', N'200050011112015', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (446, N'Issuance of First School Certificates', N'200050011112016', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (447, N'Issuance of Grade II Teachers Certificates', N'200050011112017', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (448, N'Evaluation of Certificates', N'200050011112018', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (449, N'Review of Books', N'200050011112019', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (450, N'Junior Secondary School Certificate Examination', N'200050011112020', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (451, N'Sales of Civil Service Examination Form', N'200050011112021', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (452, N'Sales of Secondary School Screening Forms', N'200050011112022', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (453, N'Sales of Transfer Forms', N'200050011112023', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (454, N'Sales of Application Forms to Open New Secondary Schools', N'200050011112024', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (455, N'Sales of Application Forms to Open New Private Hostels', N'200050011112025', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (456, N'Sales of Application Forms to Open New Private Nursery an Primary Schools', N'200050011112026', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (457, N'Sales of Application Forms to Opean New Private Continuing Education Centers', N'200050011112027', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (458, N'Sales of Application Forms to Open Private Vocational School', N'200050011112028', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (459, N'Proceed from Technical Colleges', N'200050011112029', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (460, N'Sales of Screening Forms to School with Boarding Facilities', N'200050011112030', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (461, N'Proceeds from Simeon Adebo''s Library', N'200050011112031', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (462, N'Rebate for Hostel Accommodation Fee for Public School Students', N'200050011112032', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (463, N'Simeon Adebo Book Fair', N'200050011112033', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (464, N'Proceeds from GTCs', N'200050011112034', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (465, N'Compulsory Examination', N'200050011112035', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (466, N'Search/Names of Schools', N'200050011112036', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (467, N'Sales of S. 75 Certificate', N'200050011112037', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (468, N'Private WAEC Recharge', N'200050011112038', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (469, N'Rental Income / Use of School Premises', N'200050011112039', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (470, N'Signage Charges', N'200050011112040', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (471, N'Civil Service Exam. Form for Candidates', N'200050011114002', N'200050011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (472, N'Quality Control of Portable Water', N'400070011112001', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (473, N'Laboratory Services', N'400070011112002', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (474, N'Sewage/Abattoir Waste Management', N'400070011112003', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (475, N'Illegal Mining', N'400070011112004', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (476, N'Water Extraction Charges', N'400070011112005', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (477, N'Environmental Sanitation Charges', N'400070011112006', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (478, N'Poultry Protection Service', N'400070011112008', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (479, N'Environmental Sanitation and Poultry Projection Service, Sewage / Abattoir Waste Copositing ventures', N'400070011112009', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (480, N'Sale of Composite Solid Waste', N'400070011114007', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (481, N'Sales of Composite Solid waste, conversion Organic Manure deduced from waste to wealth ventures and junic''s Yard', N'400070011114010', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (482, N'Scrap Haulage', N'400070011114011', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (483, N'Scrap Enviromental Toll Collection', N'400070011114012', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (484, N'Leakage Detection Test', N'400070011114013', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (485, N'Removal of Damage Public Water Tanks', N'400070011114014', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (486, N'Evacuation of Burnt and Abandoned Vehicles', N'400070011114015', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (487, N'Emission Control Scheme', N'400070011114016', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (488, N'Rental Fees at the various Mechanic Villages', N'400070011114017', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (489, N'Retention on Service Charges', N'400070011114018', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (490, N'Registration of Enviromental Consultants/Contractors', N'400070011114019', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (491, N'Penalty Fee/Fines', N'400070011114020', N'400070011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (492, N'Grants & Subventions', N'100080011110004', N'100080011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (493, N'Consultancy Services by OGAVEN', N'100080011112005', N'100080011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (494, N'Registration of tax Consultants', N'100080011112006', N'100080011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (495, N'Insurance Companies', N'100080011112008', N'100080011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (496, N'Sales of Statistical Publications.', N'100080011114001', N'100080011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (497, N'Earnings from Workshop & Seminar', N'100080011114002', N'100080011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (498, N'Sale of government''s shareholdings/investments', N'100080011114007', N'100080011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (499, N'Miscelleneous/Caps receipt', N'100080011118009', N'100080011110000')
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (500, N'Sales of Vehicle & Plant', N'100080011234003', N'100080011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (501, N'Sawmill License', N'100010011113027', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (502, N'Residential permit in Forest Revenue', N'100010021111019', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (503, N'Contribution to Forest Regeneration by Plank Selle', N'100010021111020', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (504, N'Tender Fees', N'100010021112010', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (505, N'Revenue from Medical Centre', N'100010021112011', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (506, N'Fines from Forestry', N'100010021112012', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (507, N'Registration of Contractors', N'100010021112014', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (508, N'Penalty/Fees on Ilegal Felling', N'100010021112021', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (509, N'Insurance/Renewal of Sawmill Licence', N'100010021113018', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (510, N'Revenue fron Sericultural Services', N'100010021114003', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (511, N'Revenue from Parks and Gardens', N'100010021114004', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (512, N'Revenue from Snail Domestication', N'100010021114005', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (513, N'Cane Rat Demonstration', N'100010021114006', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (514, N'Wild Life and Ecotourism', N'100010021114007', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (515, N'Wetland Project', N'100010021114008', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (516, N'Sale of Fuel Wood', N'100010021114009', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (517, N'Revenue from Warehousing', N'100010021114015', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (518, N'Revenue from Plantation Scheme', N'100010021114016', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (519, N'Revenue from Guest Houses/Caf?', N'100010021114017', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (520, N'Sales of Timber', N'100010021114022', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (521, N'Sales of Teak and Gmelina', N'100010021114023', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (522, N'Issuance/Renewal of Property Hammer', N'100010021114024', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (523, N'Interstate Tolls', N'100010021114025', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (524, N'Revenue from Agricultural Services', N'100010021114026', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (525, N'Sales of timber Seedlings', N'100010021114027', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (526, N'Lease of Cashew Plantation', N'100010021115001', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (527, N'Lease of Forest Plantation', N'100010021115002', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (528, N'Payment of Cocoa farmers', N'100010021115028', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (529, N'Enclave', N'100010021115035', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (530, N'Non Refundable', N'100010021115036', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (531, N'Revenue from Roads', N'100010021118013', N'100010021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (532, N'Tuition Fees from Schools of Nursing & Midwifery', N'200100011112001', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (533, N'Registration of Health Establishment', N'200100011112003', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (534, N'Inspection Fees for Pharmaceutical Stores', N'200100011112004', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (535, N'Registration of Trado-Medical Practitioners', N'200100011112005', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (536, N'Registration of Trado-Medical Clinics', N'200100011112006', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (537, N'Annual renewal of out patients clinics', N'200100011112007', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (538, N'Annual renewal of Maternity Homes', N'200100011112008', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (539, N'Annual renewal of Private Hospitals, Home other Health Estab (Dental, Eye, Clinics and Lab)', N'200100011112009', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (540, N'Annual Renewal of Patient Medicine License', N'200100011112010', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (541, N'Annual Renewal of Licenses - Private Health Institutions/Centres', N'200100011112012', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (542, N'Tuition Fees from School of Health Technology, Ilese', N'200100011112013', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (543, N'Registration of Other Health Institutions', N'200100011112014', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (544, N'Registration of Out-patient Clinics', N'200100011112015', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (545, N'Application Forms into School of Health Technology, Ilese', N'200100011112016', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (546, N'Application Forms for Admission into Schools of Nursing and Midwifery', N'200100011112017', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (547, N'Application Form for Patent Medicine Stores', N'200100011112018', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (548, N'Registration of Maternity Home', N'200100011112022', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (549, N'Registration of Private Hospitals and Medical centres', N'200100011112023', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (550, N'Admin Charge of license Processed', N'200100011112024', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (551, N'Processing of Pharmacy License', N'200100011113002', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (552, N'New Licenses of private health Institutions and centres', N'200100011113011', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (553, N'Annual Renewal of Hospitals and Medical Centres', N'200100011113025', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (554, N'Annual renewal of Practising License', N'200100011113026', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (555, N'License for trade Medical practitioner', N'200100011113027', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (556, N'Annual Renewal of License for Tra Hosp.Clinic, Mat Homes etc', N'200100011113028', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (557, N'Student Books and Lodging: School of Nursing, Abeokuta', N'200100011114019', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (558, N'Student Books and Lodging: School of Nursing, Ijebu', N'200100011114020', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (559, N'Student Books and Lodging: School of Nursing, Ilaro', N'200100011114021', N'200100011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (560, N'Building Plans', N'400110011112001', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (561, N'Charting fees', N'400110011112002', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (562, N'Assessment Fees - Housing', N'400110011112003', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (563, N'Allocation of Govt Land', N'400110011114004', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (564, N'Governor''s Consent', N'400110011114005', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (565, N'Registration of Documents', N'400110011114006', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (566, N'Certification of Occupancy', N'400110011114007', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (567, N'Sales of Various Application Forms', N'400110011114008', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (568, N'Annual Ground Rent', N'400110011114009', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (569, N'Publication Fees', N'400110011114010', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (570, N'Management of Govt Acquired but released land', N'400110011114011', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (571, N'Charges on Residential', N'400110011115012', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (572, N'Commercial', N'400110011115013', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (573, N'Industrial', N'400110011115014', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (574, N'Public Building Plans', N'400110011115015', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (575, N'Petrol Stations', N'400110011115016', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (576, N'First 2 Pumps', N'400110011115017', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (577, N'Additional Pumps', N'400110011115018', N'400110011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (578, N'Registration of Newspaper', N'200120011112003', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (579, N'Issuance of Fire Safety Certificate and Renewal', N'200120011112012', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (580, N'Cinematography License', N'200120011113008', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (581, N'Renewal of Cinema House', N'200120011113009', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (582, N'Video License (New Registration)', N'200120011113010', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (583, N'Renewal for Video Centre', N'200120011113011', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (584, N'Inspection of Cinema House', N'200120011113013', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (585, N'Inspection of Occasional Theatre Building', N'200120011113014', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (586, N'Sales of Photographs', N'200120011114001', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (587, N'Sales of Publications', N'200120011114004', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (588, N'Bill Board/S.Light poles Advertisement', N'200120011114007', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (589, N'Colour Photo Pro/Pre Press proceed', N'200120011114015', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (590, N'Video Dubbing and Recording', N'200120011115002', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (591, N'Hire of PAE Vans', N'200120011115005', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (592, N'Hire of Video Camera(s)', N'200120011115006', N'200120011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (593, N'Administration of Estate', N'300130011112001', N'300130011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (594, N'Affidavit and Oaths', N'300130011114002', N'300130011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (595, N'Investigation and Boundary Dispute', N'300130011114003', N'300130011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (596, N'Sales of Revised Laws of Ogun State 1978', N'300130011114004', N'300130011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (597, N'Advisory Services and Representations', N'300130011114005', N'300130011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (598, N'Probate Earnings', N'300130011114006', N'300130011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (599, N'Acceptance of Appointment', N'200020021110001', N'200020021110000')
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (600, N'Contract Binding', N'100180021110001', N'100180021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (601, N'Bid Tender Fee', N'100180021110002', N'100180021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (602, N'Mini Power Generation', N'100180021110003', N'100180021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (603, N'Dredging Activity', N'100180021110004', N'100180021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (604, N'Tuition fees in respect of the course run at the Women Development Centres', N'200020031112002', N'200020031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (605, N'Sales of Application Forms', N'200020031112003', N'200020031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (606, N'Registration of Women NGOs', N'200020031112005', N'200020031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (607, N'Probation Officer Cost on Adoption', N'200020031112007', N'200020031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (608, N'Registration Of Creche', N'200020031112008', N'200020031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (609, N'Inspection and registration of Motherless and Orphanages Homes', N'200020031112009', N'200020031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (610, N'Grants & Subventions', N'200020031113006', N'200020031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (611, N'Sales of Standard Food Measure', N'200020031114004', N'200020031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (612, N'Registration Of Day Care', N'200020031114010', N'200020031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (613, N'Induction Course', N'100150011112003', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (614, N'Registration of Contractors/Renewal of Certificate', N'100150011112005', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (615, N'Crossing of Road', N'100150011112006', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (616, N'Deposit for Tender Documents', N'100150011112007', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (617, N'Site Inspection of Petrol Station and Factories', N'100150011112009', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (618, N'Research and Training', N'100150011112010', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (619, N'Insurance of Fire Safety Certificate and Renewal', N'100150011112012', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (620, N'Explosive, Magazine Licences and Renewal', N'100150011113004', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (621, N'Sales of Fire Report', N'100150011114001', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (622, N'Revenue Generated at V.I.O. Stations', N'100150011114008', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (623, N'Tender Fees', N'100150011114013', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (624, N'Worthiness Certificate and Accident Report', N'100150011114014', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (625, N'Road worthiness test', N'100150011114016', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (626, N'Admin Charge', N'100150011114018', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (627, N'Application Form', N'100150011114020', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (628, N'Penalty', N'100150011114023', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (629, N'Special Service requiring use of Water Tanker/Pump', N'100150011115002', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (630, N'Hire of Plant', N'100150011115011', N'100150011110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (631, N'Issuance of Certificate of Recognition to Social Recreational Clubs.', N'200160011114001', N'200160011115000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (632, N'Hiring of Coastal Bus', N'200160011114002', N'200160011115000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (633, N'Sales of Finished products from the centre', N'200160011114006', N'200160011115000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (634, N'Certificate of Recognition', N'200160011114007', N'200160011115000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (635, N'Gateway International Stadium Ijebu-Ode', N'200160011114008', N'200160011115000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (636, N'Sale of Other Hosted Sporting Events'' Tickets', N'200160011115004', N'200160011115000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (637, N'Clearance upon Transfer of Football Players to Other Clubs', N'200160011115005', N'200160011115000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (638, N'Sale of Football Match Tickets', N'200160011118003', N'200160011115000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (639, N'Replacement of Computerized Identity Cards', N'300090061112004', N'300090061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (640, N'Earnings from Govt Quarters', N'300090061114001', N'300090061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (641, N'Sale of Boarded Govt Vehicles', N'300090061114002', N'300090061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (642, N'Catering Services Rendered to Guests ', N'300090061114005', N'300090061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (643, N'Hire of Govt Vehicles', N'300090061115003', N'300090061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (644, N'Development Levy', N'200050051111022', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (645, N'Tuition Fees - full time', N'200050051112001', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (646, N'Part-time Students - Public Admin.', N'200050051112002', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (647, N'Computer Studies', N'200050051112003', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (648, N'Business Studies', N'200050051112004', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (649, N'Public Relations', N'200050051112005', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (650, N'Food Science & Tech. ', N'200050051112006', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (651, N'Science Lab. & tech.', N'200050051112007', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (652, N'Pre ND Students ', N'200050051112008', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (653, N'Mass Communications (ND)', N'200050051112009', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (654, N'Accountancy (Certificate Course)', N'200050051112010', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (655, N'Accountancy (ND)', N'200050051112011', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (656, N'Accountancy (HND)', N'200050051112012', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (657, N'Business Admin. (HND)', N'200050051112013', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (658, N'Marketing (HND)', N'200050051112014', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (659, N'Mass Communications (HND)', N'200050051112015', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (660, N'Business Studies (Certificate Course)', N'200050051112016', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (661, N'Elect/Elect (ND)', N'200050051112017', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (662, N'Banking & Finance (Certificate Course)', N'200050051112018', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (663, N'Registration Fees', N'200050051112019', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (664, N'Examination Fees', N'200050051112020', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (665, N'Standing Rules, Vetting of Results, Library Services, Computer Services', N'200050051112021', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (666, N'Consultancy Services', N'200050051112023', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (667, N'Marketing (ND)', N'200050051112025', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (668, N'Sales of Form-Full Time', N'200050051112026', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (669, N'Banking and Finance (ND))', N'200050051112027', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (670, N'Sales of Forms-Part time', N'200050051112028', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (671, N'Sundry Services', N'200050051118024', N'200050051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (672, N'Sale of Forms', N'200020051112001', N'200020051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (673, N'Income from Admin. Fee', N'100080041112003', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (674, N'Interest from Fixed Deposit', N'100080041116001', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (675, N'Interest on Motor Vehicle Advance', N'100080041116002', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (676, N'Bank Interest Received', N'100080041116004', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (677, N'Dividend from shares other than ODU', N'100080041116005', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (678, N'Dividend from govt. parastatals and corporation', N'100080041116006', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (679, N'Loan repayment by govt. parastatals and corporation', N'100080041116007', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (680, N'Dividend from Odua', N'100080041116008', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (681, N'Sales of vehicles and Plant', N'100080041118009', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (682, N'Sales of Govt. shareholding', N'100080041118010', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (683, N'Transfers to Revenue Account', N'100080041118011', N'100080041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (684, N'Audit/Admin Fees', N'300090091112001', N'300090091110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (685, N'Administration/Registration Fees', N'300090081102001', N'300090081100000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (686, N'Registration Fees and Development Levy', N'300090081102002', N'300090081100000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (687, N'Replacement of Computerised Identity Cards', N'300090051112004', N'300090051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (688, N'Charges on Telex bills', N'300090051112006', N'300090051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (689, N'Earnings from Govt Quarters', N'300090051114001', N'300090051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (690, N'Sale of Boarded Govt Vehicles', N'300090051114002', N'300090051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (691, N'Revenue From Mini Power Plant', N'300090051114003', N'300090051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (692, N'Catering Services Rendered to Guests', N'300090051114005', N'300090051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (693, N'Provision of Accommodation and Catering Services to state public functionaries and others at Guest house', N'300090051114007', N'300090051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (694, N'Hire of Govt Vehicles', N'300090051115003', N'300090051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (695, N'Rent of Government Quarters', N'300170051115001', N'300170051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (696, N'Rent of Govt. Offices', N'300170051115002', N'300170051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (697, N'Consultancy Services by OGADEP', N'100010071112007', N'100010071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (698, N'Earnings from Apoje & Lamiro', N'100010071114001', N'100010071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (699, N'Margin on sales of Palm-Oil', N'100010071114002', N'100010071110000')
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (700, N'Margin on sales of Rubber', N'100010071114003', N'100010071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (701, N'Margin on sales of Culled Birds', N'100010071114004', N'100010071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (702, N'Margin on sales of Eggs', N'100010071114005', N'100010071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (703, N'Sales of Cashew Nuts', N'100010071114006', N'100010071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (704, N'Rent of Shops', N'100010071115008', N'100010071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (705, N'Rent on Government Property', N'100010071115009', N'100010071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (706, N'Rental from Vehicle Hiring', N'100010071115010', N'100010071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (707, N'Repair of Roads', N'100150021110001', N'100150021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (708, N'Sale of Rice', N'100020021114001', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (709, N'Sale of Drinks', N'100020021114002', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (710, N'Sale of Vegetable Oil', N'100020021114003', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (711, N'Sale of Fufu', N'100020021114004', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (712, N'Sale of Wine', N'100020021114005', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (713, N'Sale of Tyres & Tubes', N'100020021114006', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (714, N'Sale of Cement', N'100020021114007', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (715, N'Block-making', N'100020021114008', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (716, N'Bulk Transit', N'100020021114010', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (717, N'Sale of juice', N'100020021114011', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (718, N'Sale of Kerosene', N'100020021114012', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (719, N'Sale of Table Water', N'100020021114013', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (720, N'Sale of Ram and Turkey', N'100020021114014', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (721, N'OGD Roofing Sheets', N'100020021114015', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (722, N'Sales of Salt', N'100020021114016', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (723, N'Sales of Motorcycle', N'100020021114017', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (724, N'Hiring of Equipment', N'100020021115009', N'100020021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (725, N'Repair of damage Streetlights Poles by the Public', N'100150031110001', N'100150031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (726, N'Donation', N'400070061118001', N'400070061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (727, N'Fines on various environmental Sanitation/Pollutant Offence', N'400070041112001', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (728, N'Fees on plot allocation at the various mechanic Village', N'400070041112002', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (729, N'Rental Fees at the Mechanic Village', N'400070041112003', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (730, N'Violation of No-Parking order', N'400070041112004', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (731, N'Environmental Development Charges', N'400070041112006', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (732, N'Environmental Hazard Charges', N'400070041112007', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (733, N'Quality Control', N'400070041112008', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (734, N'Laboratory Services', N'400070041112009', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (735, N'Sewage Management', N'400070041112010', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (736, N'Illegal Mining', N'400070041112011', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (737, N'Retention on Service Charges', N'400070041112012', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (738, N'Hazardous Material Transportation. Permit', N'400070041112013', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (739, N'Hiring of Refuse Trucks', N'400070041112014', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (740, N'Portable Water', N'400070041112015', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (741, N'Waste to Wealth Venture', N'400070041112016', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (742, N'Car Park Tolls', N'400070041114005', N'400070041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (743, N'Homeowners` Charter Registration Form', N'400210001110001', N'400210001110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (744, N'HOC Deposit on Assessment', N'400210001110002', N'400210001110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (745, N'HOC Assessment', N'400210001110003', N'400210001110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (746, N'Nominal Grant Rent', N'400110041110019', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (747, N'Grant from State Government', N'400110041110020', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (748, N'Consent Fees, Stamping and Registration', N'400110041112001', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (749, N'Legal Counsel and Stamping Fees', N'400110041112002', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (750, N'Sport Club', N'400110041112003', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (751, N'Public Savings', N'400110041112004', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (752, N'Nominal Ground Rents', N'400110041112006', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (753, N'Survey Fees', N'400110041112010', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (754, N'Maintenance Levy', N'400110041112015', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (755, N'Building Plan Approval', N'400110041112016', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (756, N'Block Making', N'400110041112017', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (757, N'Charting Fees', N'400110041112023', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (758, N'Regularization Fees', N'400110041112024', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (759, N'Capital Contribution - Electricity', N'400110041112025', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (760, N'Capital Contribution - Water', N'400110041112026', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (761, N'Sale of Forms', N'400110041112028', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (762, N'Sale of Houses', N'400110041112030', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (763, N'Administration/transfer Charges', N'400110041113021', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (764, N'Temporary Occupation License', N'400110041113022', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (765, N'Penalty/Permission Fee', N'400110041113027', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (766, N'Sales of Cement', N'400110041114007', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (767, N'Sales of Forms', N'400110041114008', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (768, N'Plot Allocations', N'400110041114009', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (769, N'Sales of Houses', N'400110041114014', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (770, N'Industrial Plot Allocation', N'400110041114029', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (771, N'Sale of Blocks', N'400110041114031', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (772, N'Residential Plot Allocation', N'400110041114032', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (773, N'Sales - Lines of OGSHC Housing Project', N'400110041114033', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (774, N'Sales Of Farms', N'400110041114034', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (775, N'Accommodation of existing Land Owners', N'400110041115012', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (776, N'Accommodation (Rental)', N'400110041115013', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (777, N'Transport and Plant Hire', N'400110041115018', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (778, N'Industrial Grand Rent', N'400110041115035', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (779, N'Rent of plants and Equipment', N'400110041115036', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (780, N'Interest of Fixed Deposits', N'400110041116037', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (781, N'Mortgage Repayment', N'400110041118005', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (782, N'Mortgage Loan Inspection', N'400110041118011', N'400110041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (783, N'Application Form', N'200050091110001', N'200050091110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (784, N'Bond Waiver Fee', N'200050091110002', N'200050091110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (785, N'Workshop', N'200050091110003', N'200050091110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (786, N'Payment of Participation in Seminar/Workshop by Local Govt. and Political Parties', N'300090031114001', N'300090031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (787, N'Membership Registration', N'200050021112001', N'200050020110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (788, N'Hire of Library Halls', N'200050021115002', N'200050020110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (789, N'Commercialization of the Cyber caf?', N'200050021115003', N'200050020110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (790, N'Tender fee', N'200050081110002', N'200050081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (791, N'Sale of Forms', N'200050081114001', N'200050081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (792, N'Traditional Birth Attendants (TBA)', N'200100051110001', N'200100051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (793, N'Mission Birth Attendants (MBA)', N'200100051110002', N'200100051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (794, N'Community Birth Attendants (CBA)', N'200100051110003', N'200100051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (795, N'Registration Fee', N'200100051110004', N'200100051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (796, N'Issuance and Renewal of Certificate', N'200100051110005', N'200100051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (797, N'General Printing', N'200120051114001', N'200120051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (798, N'Classified Printing', N'200120051114002', N'200120051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (799, N'Stationery Sales', N'200120051114003', N'200120051110000')
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (800, N'Sales of Publication', N'200120051114004', N'200120051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (801, N'Proceed from Office Equipment Hire', N'200120051115005', N'200120051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (802, N'Miscellaneous', N'200120051117006', N'200120051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (803, N'Application fee; Residential', N'100080131110001', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (804, N'Application fee; Industrial/Commercial', N'100080131110002', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (805, N'Application fee; Assignment/Ractification', N'100080131110003', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (806, N'Assignment/Ractification', N'100080131110004', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (807, N'Land Premium: Residential/Commercial', N'100080131110005', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (808, N'Land Premium: Ground Rent', N'100080131110006', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (809, N'Service Charge', N'100080131110007', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (810, N'Survey plan', N'100080131110008', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (811, N'Sales of 3 Bedroom Bungalows', N'100080131110009', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (812, N'Sales of Houses- Town Houses', N'100080131110010', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (813, N'Sales of Houses- Duplex (Abk)', N'100080131110011', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (814, N'Rent from opic properties', N'100080131110012', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (815, N'Plant Hire', N'100080131110013', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (816, N'Sales of Unserviceable motor vehicles', N'100080131110014', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (817, N'Mortgage Interest from loan', N'100080131110015', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (818, N'Investment Income', N'100080131110016', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (819, N'Sundry Income', N'100080131110017', N'100080131110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (820, N'Sponsorship', N'200160041112005', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (821, N'Hire of Council''s Sporting Facilities', N'200160041114002', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (822, N'Hiring of Stadia Facilities', N'200160041114008', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (823, N'Hiring of Mattresses', N'200160041114009', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (824, N'Hiring of Transport', N'200160041114010', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (825, N'Sale of Sporting Souvenirs', N'200160041114011', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (826, N'State Stadium Complex', N'200160041114012', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (827, N'Gate-Takings', N'200160041115001', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (828, N'Donations', N'200160041115006', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (829, N'Administrative Charges and other Revenue', N'200160041115007', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (830, N'Hire of Kiosk/Shop', N'200160041118003', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (831, N'Advertisements', N'200160041118004', N'200160041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (832, N'Sales of Forms - New Teachers', N'200050041112001', N'200050041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (833, N'Sales from TESCOM News magazine', N'200050041114002', N'200050041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (834, N'Sales from Statistical Publication', N'200050041114003', N'200050041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (835, N'Inter Cadre Transfer', N'200050041114004', N'200050041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (836, N'Promotion Adjustment', N'200050041114007', N'200050041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (837, N'Additional Qualification', N'200050041114008', N'200050041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (838, N'Refund of Salary', N'200050041114009', N'200050041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (839, N'Sales of Forms', N'200050031110002', N'200050030110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (840, N'Tender Fees', N'200050031112001', N'200050030110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (841, N'Inter Cadre Transfer', N'200050031112003', N'200050030110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (842, N'Permission to undergo Study Leave', N'200050031112004', N'200050030110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (843, N'Re-issuance of lost letters Appointment/Promotion etc.', N'200050031112005', N'200050030110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (844, N'Petition/Appeal, Request for Career Progression, error in Promotion etc', N'200050031112006', N'200050030110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (845, N'Inter-Zonal/Inter Departmental Transfer', N'200050031112007', N'200050030110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (846, N'Inter-State Transfer (Incoming and Outgoing)', N'200050031112008', N'200050030110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (847, N'Four (4) Progress Evaluation Reports for Confirmation of Appointment', N'200050031112009', N'200050030110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (848, N'Confirmation of Teaching Appointment / Confirmation of Teaching Service', N'200050031112010', N'200050030110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (849, N'Fencing Permit', N'400070051110004', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (850, N'Petition', N'400070051110006', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (851, N'Spatial Enlargement levy', N'400070051110007', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (852, N'Change of Use', N'400070051110008', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (853, N'10 Town Planning Administrative Charge', N'400070051110010', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (854, N'Building Plan Assessment', N'400070051112001', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (855, N'Registration', N'400070051112002', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (856, N'Penal Fees', N'400070051112003', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (857, N'Approval in Principle', N'400070051112005', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (858, N'10% Town Planning Administrative Charge', N'400070051112006', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (859, N'Building Plan Application Form Fee', N'400070051112007', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (860, N'Fastracking Fee', N'400070051112008', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (861, N'Petrol Filling Station Assessment', N'400070051112009', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (862, N'Fencing Permit Repair', N'400070051112011', N'400070051110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (863, N'Domestic Consumers', N'200200011112001', N'200200011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (864, N'Public Stand Pipe', N'200200011112003', N'200200011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (865, N'Tanker Service', N'200200011112004', N'200200011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (866, N'Institutional Consumer', N'200200011112005', N'200200011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (867, N'Industrial Consumer', N'200200011112006', N'200200011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (868, N'Private Boreholes', N'200200011112007', N'200200011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (869, N'Reconnection Fees', N'200200011112008', N'200200011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (870, N'Sales of Forms and Application Fees', N'200200011112009', N'200200011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (871, N'Registration of Plumbers and Tankers', N'200200011112010', N'200200011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (872, N'Commercial Consumer', N'200200011115002', N'200200011112000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (873, N'Grants and Subventions from The Education Tax Fund (ETF)', N'200050061110022', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (874, N'Contractors'' Registration Fees', N'200050061112001', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (875, N'Tender Fees', N'200050061112002', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (876, N'School Fees (Undergraduates)', N'200050061112004', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (877, N'Sale of Forms', N'200050061112005', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (878, N'Acceptance Fees', N'200050061112006', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (879, N'Medical Fees', N'200050061112007', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (880, N'Laboratory fees', N'200050061112008', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (881, N'Proceeds from Computer Centre', N'200050061112009', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (882, N'Examination Fees', N'200050061112010', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (883, N'Post Graduate School Fees', N'200050061112011', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (884, N'P.D.S. School Fees', N'200050061112012', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (885, N'CESAP', N'200050061112013', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (886, N'OSU Ventures', N'200050061112025', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (887, N'OSU Consult', N'200050061112026', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (888, N'Proceed from Agriculture', N'200050061112027', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (889, N'I. D Card', N'200050061112028', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (890, N'Transcript and Certificate', N'200050061112029', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (891, N'Students Handbook', N'200050061112030', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (892, N'Sales of Unserviceable Store', N'200050061112031', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (893, N'Interest on Bank Deposits', N'200050061112032', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (894, N'Interest on Investment', N'200050061112033', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (895, N'Interest on Loans', N'200050061112034', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (896, N'Salary Refund in lieu of Notice', N'200050061112035', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (897, N'Miscelleneous(Prog & Other Funds)', N'200050061112036', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (898, N'Other Sources', N'200050061112037', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (899, N'Subversions from State Govt.', N'200050061112038', N'200050061110000')
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (900, N'Subversions from Fed Govt.', N'200050061112039', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (901, N'Subversions from Local Govt.', N'200050061112040', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (902, N'Others (Price Award and scholarship)', N'200050061112041', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (903, N'Transport Service', N'200050061114017', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (904, N'Hire of Gowns', N'200050061115003', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (905, N'Hire of Hall', N'200050061115016', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (906, N'University Guest House', N'200050061115018', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (907, N'Rent from University property', N'200050061115019', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (908, N'Income from Salary Refunds In Lieu of Notices', N'200050061117020', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (909, N'Bulk Releases', N'200050061117021', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (910, N'Degree Foundation', N'200050061118014', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (911, N'Dedicated Account Income', N'200050061118015', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (912, N'Income from Donations, Loans and Affiliations', N'200050061118023', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (913, N'Miscellaneous: Programme & Other Funds', N'200050061118024', N'200050061110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (914, N'STD Clinic', N'200100031112001', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (915, N'Laboratory', N'200100031112002', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (916, N'Drugs & Dressing', N'200100031112003', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (917, N'Theatre', N'200100031112004', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (918, N'Embalmment', N'200100031112005', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (919, N'Mortuary', N'200100031112006', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (920, N'Physiotherapy', N'200100031112007', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (921, N'Accident & Emergency', N'200100031112008', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (922, N'X-Ray (Radiology)', N'200100031112009', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (923, N'Ultra Sound', N'200100031112010', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (924, N'Electrocardiogram Services', N'200100031112011', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (925, N'Renal Dialysis', N'200100031112012', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (926, N'Family Planning', N'200100031112013', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (927, N'Obst. & Gynecology Consumables', N'200100031112014', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (928, N'Cheche', N'200100031112015', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (929, N'Eye, Ear, Nose & Throat', N'200100031112016', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (930, N'Neonatal', N'200100031112017', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (931, N'Telephone', N'200100031112018', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (932, N'Medical Records', N'200100031112019', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (933, N'Medical Gas', N'200100031112021', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (934, N'HIV/AIDS Services', N'200100031112022', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (935, N'Medical Social Services', N'200100031112023', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (936, N'Consultant Out-patient Dept''l Services', N'200100031112024', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (937, N'Administrative', N'200100031112025', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (938, N'Consult Ward', N'200100031112026', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (939, N'Diesel', N'200100031112027', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (940, N'Laundry', N'200100031112028', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (941, N'Intensive Care Unit', N'200100031112029', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (942, N'General Medical Practice Services', N'200100031112030', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (943, N'Surgical Operation', N'200100031112031', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (944, N'Counseling', N'200100031112032', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (945, N'Monitor', N'200100031112033', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (946, N'Surgical Consult', N'200100031112034', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (947, N'Pediatrics', N'200100031112035', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (948, N'Medical Consult', N'200100031112036', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (949, N'Dermatology', N'200100031112037', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (950, N'Audiology', N'200100031112038', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (951, N'Registration of Contractors and Tender Fees', N'200100031112039', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (952, N'Bed Fees', N'200100031112040', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (953, N'Consultation Fees', N'200100031112041', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (954, N'Delivery', N'200100031112042', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (955, N'Identity cards', N'200100031112043', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (956, N'ANC Booking', N'200100031112044', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (957, N'Death Certificate', N'200100031112045', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (958, N'Medical tests and Reports', N'200100031112046', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (959, N'Nursing Services', N'200100031112047', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (960, N'Catering', N'200100031112049', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (961, N'STC', N'200100031112050', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (962, N'RTD', N'200100031112051', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (963, N'Radiology', N'200100031112052', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (964, N'Application Forms', N'200100031114053', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (965, N'Residency Training Programme Fund', N'200100031118020', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (966, N'Miscellaneous: Board of Survey', N'200100031118048', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (967, N'Miscellaneous( Board of Survey)', N'200100031118054', N'200100031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (968, N'Sales of Loan Application forms', N'100010081114002', N'100010081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (969, N'Interest on Loans', N'100010081116001', N'100010081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (970, N'Convenience Rate', N'100190021112001', N'100190021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (971, N'Parks Development Levy', N'100190021112002', N'100190021110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (972, N'Premium', N'400070071112001', N'400070071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (973, N'Annual Ground Rent', N'400070071112002', N'400070071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (974, N'Preparation of C of O', N'400070071112003', N'400070071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (975, N'Execution fee for C of O', N'400070071112004', N'400070071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (976, N'Registration Fee for C of O', N'400070071112005', N'400070071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (977, N'Government Survey', N'400070071112006', N'400070071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (978, N'Capital Contribution', N'400070071112007', N'400070071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (979, N'Form', N'400070071112008', N'400070071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (980, N'Admin Charge', N'400070071112009', N'400070071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (981, N'Premium', N'400070081115001', N'400070081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (982, N'Annual Ground Rent', N'400070081115002', N'400070081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (983, N'Preparation of C of O', N'400070081115003', N'400070081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (984, N'Execution Fee for C of O', N'400070081115004', N'400070081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (985, N'Registration Fee for C of O', N'400070081115005', N'400070081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (986, N'Government Survey', N'400070081115006', N'400070081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (987, N'Capital Contribution', N'400070081115007', N'400070081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (988, N'Form', N'400070081115008', N'400070081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (989, N'Admin Charge', N'400070081115009', N'400070081110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (990, N'Tuition Fees', N'200050071112001', N'200050071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (991, N'Acceptance Fees', N'200050071112002', N'200050071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (992, N'Registration Fees', N'200050071112003', N'200050071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (993, N'Registration of Contractors', N'200050071112004', N'200050071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (994, N'College examination Fees', N'200050071112005', N'200050071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (995, N'Change of Course/Institution', N'200050071112006', N'200050071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (996, N'Transcripts', N'200050071112007', N'200050071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (997, N'Sales of Forms', N'200050071114009', N'200050071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (998, N'Hiring of Academic gowns', N'200050071115008', N'200050071110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (999, N'Fines', N'100190031112001', N'100190031110000')
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1000, N'Tow fees', N'100190031112002', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1001, N'Custody''s Fees', N'100190031112003', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1002, N'Abuse of Lay-by use', N'100190031112004', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1003, N'Assault of TRACE Officer', N'100190031112005', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1004, N'Causing obstruction on a public road (articulated Vehicle/ tipper/ luxury bus)', N'100190031112006', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1005, N'Causing obstruction on a public road (car/ mini bus)', N'100190031112007', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1006, N'Custody charges for impounded cars, Jeeps and mini bus per day', N'100190031112008', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1007, N'Custody charges for impounded motor cycles/ 3-wheelers per day', N'100190031112009', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1008, N'Custody charges for impounded tippers/trailers/lorries/luxury bus per day', N'100190031112010', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1009, N'Disobeying traffic control personnel, traffic light/signs', N'100190031112011', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1010, N'Driving unlicensed vehicle', N'100190031112012', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1011, N'Driving a commercial vehicle without a Road-worthiness certificate', N'100190031112013', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1012, N'Driving a commercial vehicle without Hackney Stage carriage permit', N'100190031112014', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1013, N'Driving a commercial vehicle without passenger and goods manifest', N'100190031112015', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1014, N'Driving a vehicle with fake number plates', N'100190031112016', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1015, N'Driving a vehicle with unauthorised or reflective number plates', N'100190031112017', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1016, N'Driving a vehicle without valid motor test certificate', N'100190031112018', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1017, N'Driving an unregistered vehicle', N'100190031112019', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1018, N'Driving a commercial vehicle with any defective road-worthiness component', N'100190031112020', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1019, N'Driving a commercial vehicle with any defective road-worthiness or BOT-TEST component', N'100190031112021', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1020, N'Driving in a direction prohibited by the Road Traffic Law', N'100190031112022', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1021, N'Driving Motorcycles, 3-wheeler with defective BOT-TEST Component', N'100190031112023', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1022, N'Driving of any vehicle by a person under 18 years', N'100190031112024', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1023, N'Driving on the road with a right-hand drive vehicle', N'100190031112025', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1024, N'Driving or parking on walkways/kerbs', N'100190031112026', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1025, N'Driving Private Vehicle with Defective BOT-TEST Component', N'100190031112027', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1026, N'Driving Private Vehicle without BOT-TEST Certificate', N'100190031112028', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1027, N'Driving Tractors,Tankers and Tippers wth any Defective Road Worthiness Component', N'100190031112029', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1028, N'Driving Under the Influence of Alcohol or Drugs', N'100190031112030', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1029, N'Driving with Forged Vehicle Particulars', N'100190031112031', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1030, N'Driving with Forged Driver''s Licence', N'100190031112032', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1031, N'Driving without Driver''s Licence on demand', N'100190031112033', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1032, N'Driving without using seat belts', N'100190031112034', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1033, N'Driving withouth valid vehicle particulars', N'100190031112035', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1034, N'Failure to pay penalty/reprobate offender', N'100190031112036', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1035, N'Flying Particles - Failure to cover', N'100190031112037', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1036, N'Illegal U-turn', N'100190031112038', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1037, N'Learner driving on major highway unacompanied by Licenced Driver', N'100190031112039', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1038, N'Learner driving without learner''s permit', N'100190031112040', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1039, N'No Car Hire Service Permit', N'100190031112041', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1040, N'Non Painting of Commercial Vehicle with approved colours', N'100190031112042', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1041, N'Non-display of Hackney Permit', N'100190031112043', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1042, N'Non-display of route and number on commercial vehicle', N'100190031112044', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1043, N'Operating a Kabu Kabu without permit', N'100190031112045', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1044, N'Overloading of Commercial goods vehicle/Trailer', N'100190031112046', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1045, N'Overloading of motor cycle', N'100190031112047', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1046, N'Recovery services', N'100190031112048', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1047, N'Riding a motor cycle without a crash helmet', N'100190031112049', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1048, N'Riding a motor cycle without a rider''s licence/permit', N'100190031112050', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1049, N'Riding Motor Cycle Without BOT-TEST or road-worthiness', N'100190031112051', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1050, N'Smoking while driving', N'100190031112052', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1051, N'Stopping on junction, yellow box/yellow line', N'100190031112053', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1052, N'Using mobile phones while driving', N'100190031112054', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1053, N'Wrong overtaking/Dangerous driving', N'100190031112055', N'100190031110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1054, N'Revenue from mini power plant', N'200200041110001', N'200200041110000')
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1055, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1056, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1057, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1058, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1059, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1060, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1061, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1062, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1063, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1064, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1065, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1066, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1067, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1068, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1069, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1070, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1071, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1072, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1073, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1074, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1075, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1076, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1077, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1078, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1079, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1080, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1081, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1082, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1083, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1084, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1085, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1086, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1087, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1088, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1089, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1090, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1091, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1092, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1093, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1094, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1095, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1096, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1097, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1098, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1099, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1100, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1101, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1102, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1103, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1104, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1105, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1106, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1107, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1108, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1109, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1110, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1111, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1112, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1113, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1114, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1115, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1116, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1117, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1118, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1119, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1120, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1121, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1122, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1123, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1124, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1125, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1126, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1127, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1128, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1129, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1130, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1131, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1132, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1133, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1134, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1135, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1136, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1137, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1138, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1139, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1140, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1141, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1142, NULL, NULL, NULL)
INSERT [dbo].[tblRevenueList] ([SN], [RevenueName], [RevenueCode], [AgencyCode]) VALUES (1143, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblRevenueList] OFF
SET IDENTITY_INSERT [dbo].[UsersInformation] ON 

INSERT [dbo].[UsersInformation] ([UserID], [FirstName], [LastName], [OtherNames], [UserName], [Password], [VCode], [WrongLoginAttempt], [IsEnabled], [EnabledDate], [PwdExpired], [ActivationCode], [IsLocked], [StateName], [InstitutionCode], [CreatedDate], [CreatedBy], [CreatedByID], [IsDeleted], [LastModifiedBy], [DateLastmodified], [MaxApprovedCount], [ApprovalCount], [MaxAppConstant], [UserLevelID]) VALUES (5, N'engr', N'engr.isholabarshef@gmail.com', N'ishola', N'engr.isholabarshef@gmail.com', N'AD-78-F0-FF-F6-FB-90-EA-A5-30-EE-84-19-55-F8-77', N'1c3qAVFJoC', 0, 1, CAST(N'2018-02-20T10:30:48.423' AS DateTime), 0, N'18bcdfcb-9832-4870-9d91-9aff75b6283f', N'0', N'DELTA STATE ', 10, CAST(N'2017-04-12T14:40:40.140' AS DateTime), N'penus1960@gustr.com', 17, 0, N'penus1960@gustr.com', CAST(N'2017-04-12T14:40:40.143' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[UsersInformation] ([UserID], [FirstName], [LastName], [OtherNames], [UserName], [Password], [VCode], [WrongLoginAttempt], [IsEnabled], [EnabledDate], [PwdExpired], [ActivationCode], [IsLocked], [StateName], [InstitutionCode], [CreatedDate], [CreatedBy], [CreatedByID], [IsDeleted], [LastModifiedBy], [DateLastmodified], [MaxApprovedCount], [ApprovalCount], [MaxAppConstant], [UserLevelID]) VALUES (7, N'Lukman', N'lukmanbuari@gmail.com', N'Buari', N'lukmanbuari@gmail.com', N'AD-78-F0-FF-F6-FB-90-EA-A5-30-EE-84-19-55-F8-77', N'1c3qAVFJoC', 0, 1, CAST(N'2018-02-20T10:30:48.423' AS DateTime), 0, N'd2deb5a9-14d0-4f0a-94f9-5275cbc62b58', N'0', N'OGUN STATE', 28, CAST(N'2017-04-11T13:54:10.960' AS DateTime), N'Admin', 2, 0, N'Admin', CAST(N'2017-04-11T13:54:10.927' AS DateTime), 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[UsersInformation] OFF
SET IDENTITY_INSERT [dbo].[UsersLevel] ON 

INSERT [dbo].[UsersLevel] ([UserLevelID], [UserLevel]) VALUES (1, N'1')
INSERT [dbo].[UsersLevel] ([UserLevelID], [UserLevel]) VALUES (2, N'2')
SET IDENTITY_INSERT [dbo].[UsersLevel] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UsersInformation]    Script Date: 8/2/2018 11:30:37 PM ******/
ALTER TABLE [dbo].[UsersInformation] ADD  CONSTRAINT [IX_UsersInformation] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StateUrl] ADD  CONSTRAINT [DF_Institution_DateEntered]  DEFAULT (getdate()) FOR [DateEntered]
GO
ALTER TABLE [dbo].[StateUrl] ADD  CONSTRAINT [DF_Institution_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TransactionLog] ADD  CONSTRAINT [DF_TransactionLog_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[UsersInformation] ADD  CONSTRAINT [DF_tblLoginAcess_WrongLoginAttempt]  DEFAULT ((0)) FOR [WrongLoginAttempt]
GO
ALTER TABLE [dbo].[UsersInformation] ADD  CONSTRAINT [DF_tblLoginAcess_Enabled]  DEFAULT ((0)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[UsersInformation] ADD  CONSTRAINT [DF_UsersInformation_IsEnabled1]  DEFAULT ((0)) FOR [PwdExpired]
GO
ALTER TABLE [dbo].[UsersInformation] ADD  CONSTRAINT [DF_tblLoginAcess_IsLocked]  DEFAULT ('0') FOR [IsLocked]
GO
ALTER TABLE [dbo].[UsersInformation] ADD  CONSTRAINT [DF_UsersInformation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UsersInformation] ADD  CONSTRAINT [DF_tblLoginAcess_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UsersInformation] ADD  CONSTRAINT [DF_UsersInformation_MaxApprovedCount]  DEFAULT ((0)) FOR [MaxApprovedCount]
GO
ALTER TABLE [dbo].[UsersInformation] ADD  CONSTRAINT [DF_UsersInformation_ApprovalCount]  DEFAULT ((0)) FOR [ApprovalCount]
GO
ALTER TABLE [dbo].[UsersInformation] ADD  CONSTRAINT [DF_UsersInformation_MaxAppConstant]  DEFAULT ((2)) FOR [MaxAppConstant]
GO
ALTER TABLE [dbo].[LGA]  WITH CHECK ADD  CONSTRAINT [State_LGA] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[LGA] CHECK CONSTRAINT [State_LGA]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [Country_State] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [Country_State]
GO
ALTER TABLE [dbo].[UsersInformation]  WITH CHECK ADD  CONSTRAINT [UsersLevel_UsersInformation] FOREIGN KEY([UserLevelID])
REFERENCES [dbo].[UsersLevel] ([UserLevelID])
GO
ALTER TABLE [dbo].[UsersInformation] CHECK CONSTRAINT [UsersLevel_UsersInformation]
GO
/****** Object:  StoredProcedure [Barsh].[LogTransaction_InsertOrUpdate]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Barsh].[LogTransaction_InsertOrUpdate]
    (
      @TransRefNo VARCHAR(200) ,
      @Surname VARCHAR(200) = NULL ,
	  @OtherNames VARCHAR(200) = NULL ,
      @Address VARCHAR(200) = NULL ,
      @Email VARCHAR(200) = NULL ,
      @PhoneNo VARCHAR(20) = NULL ,
      @RevenueName VARCHAR(200) = NULL ,
      @RevenueCode VARCHAR(200) = NULL ,
	  @AgencyName VARCHAR(200) = NULL ,
      @AgencyCode VARCHAR(200) = NULL ,
      @AmountPaid MONEY = NULL ,
      @PayGateWay VARCHAR(200) = NULL ,
	  @institutionCode BIGINT,
	  @CountryName VARCHAR(200) = NULL ,
      @StateName VARCHAR(200) = NULL,
	  @City VARCHAR(200) = NULL,
	  @Area VARCHAR(200) = NULL,
	  @LGA VARCHAR(200) = NULL ,
	  @payerpayperiod VARCHAR(200) = NULL
	  --@DateCreated DATETIME = NULL 

    )
AS
    BEGIN
        IF EXISTS ( SELECT  TransRefNo
                    FROM    TransactionLog
                    WHERE   TransRefNo = @TransRefNo )
            BEGIN
                UPDATE  TransactionLog
                SET     TransactionLog.TransRefNo = @TransRefNo ,
                        TransactionLog.Surname = @Surname ,
						TransactionLog.OtherNames = @OtherNames ,
                        TransactionLog.Address = @Address ,
                        TransactionLog.Email = @Email ,
                        TransactionLog.PhoneNo = @PhoneNo ,
                        TransactionLog.RevenueName = @RevenueName ,
                        TransactionLog.RevenueCode = @RevenueCode ,
						TransactionLog.AgencyName = @AgencyName ,
                        TransactionLog.AgencyCode = @AgencyCode ,
                        TransactionLog.AmountPaid = @AmountPaid ,
                        TransactionLog.PayGateWay = @PayGateWay ,
						TransactionLog.InstitutionCode = @institutionCode,
						TransactionLog.CountryName = @CountryName,
                        TransactionLog.StateName = @StateName,
                        TransactionLog.City = @City,
						TransactionLog.Area = @Area,
						TransactionLog.LGA = @LGA,
						TransactionLog.PaymentPeriod = @payerpayperiod
                WHERE   TransRefNo = @TransRefNo;
            END;
        ELSE
            BEGIN
                INSERT  INTO TransactionLog
                        ( TransRefNo ,
                          Surname ,
						  OtherNames,
                          Address ,
                          Email ,
                          PhoneNo ,
                          RevenueName ,
                          RevenueCode ,
						  AgencyName ,
                          AgencyCode ,
                          AmountPaid ,
                          PayGateWay ,
						  InstitutionCode,
						  CountryName,
						  StateName,
						  City,
						  Area,
						  LGA,
						  PaymentPeriod
			            )
                VALUES  ( @TransRefNo ,
                          @Surname ,
						  @OtherNames,
                          @Address ,
                          @Email ,
                          @PhoneNo ,
                          @RevenueName ,
                          @RevenueCode ,
						  @AgencyName,
						  @AgencyCode,
                          @AmountPaid ,
                          @PayGateWay ,
						  @institutionCode,
						  @CountryName,
						  @StateName,
						  @City,
						  @Area,
						  @LGA,
						  @payerpayperiod
			            );
            END;
    END;




GO
/****** Object:  StoredProcedure [Barsh].[Querr_AgencyList]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Barsh].[Querr_AgencyList]
--(
--  @TransRefNo VARCHAR(200)
--)
AS
    BEGIN

        BEGIN
            SELECT
                AgencyName AS Name,
                AgencyCode AS Value
            FROM
                dbo.tblAgencyList
            ORDER BY
                SN;
        END;

    END;

GO
/****** Object:  StoredProcedure [Barsh].[Querr_CheckAgencyException]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Barsh].[Querr_CheckAgencyException]
    (
        @AgencyCode VARCHAR(250),
        @StateCode  VARCHAR(250)
    )
AS
    BEGIN
        BEGIN
            SELECT
                CompulsoryAgency.AgencyCode,
                CompulsoryAgency.AgencyName
            FROM
                dbo.CompulsoryAgency
            WHERE
                CompulsoryAgency.AgencyCode = @AgencyCode
                AND CompulsoryAgency.StateCode = @StateCode;
        END;

    END;

GO
/****** Object:  StoredProcedure [Barsh].[Querr_CheckRevenueException]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Barsh].[Querr_CheckRevenueException]
    (
        @RevenueCode VARCHAR(250),
        @StateCode   VARCHAR(250)
    )
AS
    BEGIN
        --IF EXISTS
        --    (
        --        SELECT
        --            RevenueCode
        --        FROM
        --            dbo.RevenueException
        --        WHERE
        --            RevenueCode = @RevenueCode
        --    )
        BEGIN
            SELECT
                RevenueCode,
                RevenueName
            FROM
                dbo.RevenueException
            WHERE
                RevenueCode = @RevenueCode
                AND StateCode = @StateCode;
        END;


    END;


GO
/****** Object:  StoredProcedure [Barsh].[Querr_Country]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Barsh].[Querr_Country]
--(
--  @TransRefNo VARCHAR(200)
--)
AS
    BEGIN

        BEGIN
            SELECT
                CountryId, CountryName
            FROM
                dbo.Country
            ORDER BY
                CountryId;
        END;

    END;

GO
/****** Object:  StoredProcedure [Barsh].[Querr_LgaBasedOnState]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Barsh].[Querr_LgaBasedOnState]
    --(
    --  @TransRefNo VARCHAR(200)
    --)
    @StateId BIGINT
AS
    BEGIN

        BEGIN
            SELECT
                LgaId,
                LgaName
            FROM
			[dbo].[LGA]
            WHERE
                StateId = @StateId
            ORDER BY
                StateId;
        END;

    END;

GO
/****** Object:  StoredProcedure [Barsh].[Querr_LoadAgencyPerRevenue]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Barsh].[Querr_LoadAgencyPerRevenue] (@AgencyCode VARCHAR(250))
AS
    BEGIN
        IF EXISTS
            (
                SELECT
                    AgencyCode
                FROM
                    dbo.tblRevenueList
                WHERE
                    AgencyCode = @AgencyCode
            )
            BEGIN
                SELECT
                    RevenueName AS Name,
                    RevenueCode AS Value
                FROM
                    dbo.tblRevenueList
                WHERE
                    AgencyCode = @AgencyCode
                ORDER BY
                    SN;
            END;

    END;

GO
/****** Object:  StoredProcedure [Barsh].[Querr_LogTransaction]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Barsh].[Querr_LogTransaction] (@TransRefNo VARCHAR(200))
AS
    BEGIN
        IF EXISTS
            (
                SELECT
                    TransRefNo
                FROM
                    TransactionLog
                WHERE
                    TransRefNo = @TransRefNo
            )
            BEGIN
                SELECT
                    TransactionLog.AmountPaid,
                    TransactionLog.TransRefNo,
                    TransactionLog.PaymentReference,
                    TransactionLog.ReceiptNo,
                    TransactionLog.RevenueName,
                    TransactionLog.Surname,
                    TransactionLog.OtherNames,
                    TransactionLog.DateCreated,
					TransactionLog.TransactionStatus,
					TransactionLog.TransStatusMsg,
					TransactionLog.AgencyName,
					TransactionLog.PayGateWay,

					TransactionLog.RevenueName,
					TransactionLog.RevenueCode,
					TransactionLog.Email
                FROM
                    dbo.TransactionLog
                WHERE
                    TransactionLog.TransRefNo = @TransRefNo;
            END;

    END;

GO
/****** Object:  StoredProcedure [Barsh].[Querr_StateBasedOnCountry]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Barsh].[Querr_StateBasedOnCountry]
    --(
    --  @TransRefNo VARCHAR(200)
    --)
    @CountryId BIGINT
AS
    BEGIN

        BEGIN
            SELECT
                StateId,
                StateName
            FROM
			[dbo].[State]
            WHERE
                CountryId = @CountryId
            ORDER BY
                CountryId;
        END;

    END;

GO
/****** Object:  StoredProcedure [Barsh].[QuerryAIlnstiBased_LogTransaction]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Barsh].[QuerryAIlnstiBased_LogTransaction] (@institutionCode BIGINT)
AS
BEGIN

    BEGIN
        SELECT *
        FROM dbo.TransactionLog
        WHERE TransactionLog.InstitutionCode = @institutionCode;
    END;

END;




GO
/****** Object:  StoredProcedure [Barsh].[QuerryAll_LogTransaction]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Barsh].[QuerryAll_LogTransaction]
    (
      @TransRefNo VARCHAR(200)
    )
AS
    BEGIN
        IF EXISTS ( SELECT  TransRefNo
                    FROM    TransactionLog
                    WHERE   TransRefNo = @TransRefNo )
            BEGIN
                SELECT  *
                FROM    dbo.TransactionLog
                WHERE   TransactionLog.TransRefNo = @TransRefNo;
            END;
           
    END;




GO
/****** Object:  StoredProcedure [Barsh].[QuerryInstiBased_LogTransaction]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Barsh].[QuerryInstiBased_LogTransaction]
    (
      @TransRefNo VARCHAR(200) ,
      @institutionCode BIGINT
    )
AS
    BEGIN
        IF EXISTS ( SELECT  TransRefNo
                    FROM    TransactionLog
                    WHERE   TransRefNo = @TransRefNo
                            AND TransactionLog.InstitutionCode = @institutionCode )
            BEGIN
                SELECT  *
                FROM    dbo.TransactionLog
                WHERE   TransactionLog.TransRefNo = @TransRefNo
                        AND TransactionLog.InstitutionCode = @institutionCode;
            END;
           
    END;




GO
/****** Object:  StoredProcedure [Barsh].[Stp_LoginAcessVerification]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Barsh].[Stp_LoginAcessVerification]
    @UserName NVARCHAR(500) ,
    @Password NVARCHAR(500) ,
    @InstitutionCode NVARCHAR(500) 

	--@MinName VARCHAR(500)
AS
    BEGIN  
	
        DECLARE  @ERROR VARCHAR(100)
        IF EXISTS ( SELECT  1
                    FROM    [dbo].[UsersInformation]
                    WHERE   UserName = @UserName
                            AND Password = @Password
                            AND IsLocked = '0'
                            AND IsEnabled = 'True'
                            AND IsApproved = 'True'
                            AND IsDeleted = 0
                            AND InstitutionCode = @InstitutionCode )
            BEGIN  
--declare  
                UPDATE  [dbo].[UsersInformation]
                SET     WrongLoginAttempt = 0 ,
                        IsLocked = '0'
                WHERE   UserName = @UserName  
                SET @ERROR = 1  
                
                SELECT  '0' AS ResponseCode ,
                        'Successful' AS ResponseMsg

				SELECT  UsersInformation.FirstName ,
                        UsersInformation.UserName ,
                        UsersInformation.InstitutionCode,
						UsersInformation.EnabledDate
                FROM    [dbo].[UsersInformation]
                WHERE   UserName = @userName
                        AND UsersInformation.InstitutionCode = @InstitutionCode;  
                
            END 
        ELSE
            BEGIN  
                DECLARE @LoginAttempt INT;  
                SET @LoginAttempt = ( SELECT    WrongLoginAttempt
                                      FROM      [dbo].[UsersInformation]
                                      WHERE     UserName = @UserName
                                    )  
                UPDATE  [dbo].[UsersInformation]
                SET     WrongLoginAttempt = @LoginAttempt + 1
                WHERE   UserName = @UserName  
                SET @ERROR = 'Wrong Login Details, If otherwise; Cross check with your Administrator to enable your login details'  
                IF @LoginAttempt >= 4
                    BEGIN  
                        UPDATE  [dbo].[UsersInformation]
                        SET     IsLocked = '1'
                        WHERE   UserName = @UserName  
                        UPDATE  [dbo].[UsersInformation]
                        SET     IsEnabled = '0'
                        WHERE   UserName = @UserName  
                        SET @ERROR = 'Your Password is locked & Disabled Due to 4 Failed Login Attempts'  
                    END  
                SELECT  '-1' AS ResponseCode ,
                        @ERROR AS ResponseMsg
            END  
        --SELECT  @ERROR  
		
    END  




GO
/****** Object:  StoredProcedure [Barsh].[Stp_LoginUsersInforHarsh]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [Barsh].[Stp_LoginUsersInforHarsh]
    @userName NVARCHAR(500) ,
    @institutionCode NVARCHAR(500)
AS
    BEGIN  
	
        DECLARE @ERROR VARCHAR(100);
        IF EXISTS ( SELECT  1
                    FROM    [dbo].[UsersInformation]
                    WHERE   UserName = @userName
                            AND IsLocked = '0'
                            AND IsEnabled = 'True'
                            AND IsApproved = 'True'
                            AND IsDeleted = 0
                            AND InstitutionCode = @institutionCode )
            BEGIN  
                SELECT  '0' AS ResponseCode ,
                        'Successful' AS ResponseMsg;
                SELECT  UsersInformation.VCode ,
                        UsersInformation.InstitutionCode ,
                        UsersInformation.UserName
                FROM    [dbo].[UsersInformation]
                WHERE   UserName = @userName
                        AND UsersInformation.InstitutionCode = @InstitutionCode;  
            END; 
        ELSE
            BEGIN  
			SET @ERROR = 'Wrong Username, Please cross check your username'  
                SELECT  '-1' AS ResponseCode ,
						'Unauthorized User, please contact the administrator.' AS ResponseMsg;
                        --@ERROR AS ResponseMsg;
            END;  
		
    END;  




GO
/****** Object:  StoredProcedure [Barsh].[UpdateFalse_LogTransaction]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Barsh].[UpdateFalse_LogTransaction]
    (
      @TransRefNo VARCHAR(200) ,
      @TransStatusMsg VARCHAR(200) = NULL,
	  @TransStatusCode VARCHAR(200) = NULL 
	  --@XpressJson TEXT = NULL
      

    )
AS
    BEGIN
        IF EXISTS ( SELECT  TransRefNo
                    FROM    TransactionLog
                    WHERE   TransRefNo = @TransRefNo )
            BEGIN
                UPDATE  TransactionLog
                SET     TransactionLog.TransactionStatus = 0 ,
                        TransactionLog.TransStatusMsg = @TransStatusMsg,
						TransactionLog.TransStatusCode = @TransStatusCode
						--TransactionLog.JsonResponse = @XpressJson
                WHERE   TransRefNo = @TransRefNo;
            END;
        
    END;




GO
/****** Object:  StoredProcedure [Barsh].[UpdateTrue_LogTransaction]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Barsh].[UpdateTrue_LogTransaction]
    (
      @TransRefNo VARCHAR(200) ,
      @TransStatusMsg VARCHAR(200) = NULL ,
	  @TransStatusCode VARCHAR(200) = NULL ,
	  @PaymentReference VARCHAR(200) = NULL ,
	  @ReceiptNo VARCHAR(200) = NULL 
	 -- @XpressJson TEXT = NULL
      

    )
AS
    BEGIN
        IF EXISTS ( SELECT  TransRefNo
                    FROM    TransactionLog
                    WHERE   TransRefNo = @TransRefNo )
            BEGIN
                UPDATE  TransactionLog
                SET     TransactionLog.TransactionStatus = 1 ,
                        TransactionLog.TransStatusMsg = @TransStatusMsg,
						TransactionLog.TransStatusCode = @TransStatusCode,
						--TransactionLog.JsonResponse = @XpressJson,
						TransactionLog.PaymentReference = @PaymentReference,
						TransactionLog.ReceiptNo = @ReceiptNo
                WHERE   TransRefNo = @TransRefNo;
            END;
        
    END;




GO
/****** Object:  StoredProcedure [dbo].[Stp_FetchStatesInfo]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Stp_FetchStatesInfo]
        
AS

BEGIN TRANSACTION
			
				SELECT * FROM State_Information Order By StateId DESC
IF @@ERROR <> 0
BEGIN      
    ROLLBACK     
    RETURN 
END

COMMIT


GO
/****** Object:  StoredProcedure [dbo].[StpFetchCountryInfo]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StpFetchCountryInfo]
        
AS

BEGIN TRANSACTION
			
				SELECT CountryId, CountryName FROM Country
IF @@ERROR <> 0
BEGIN      
    ROLLBACK     
    RETURN 
END

COMMIT


GO
/****** Object:  StoredProcedure [dbo].[StpFetchNationalityInfo]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StpFetchNationalityInfo]
        
AS

BEGIN TRANSACTION
			
				SELECT * FROM Nationality_Information 
IF @@ERROR <> 0
BEGIN      
    ROLLBACK     
    RETURN 
END

COMMIT


GO
/****** Object:  StoredProcedure [dbo].[usp_StateRegUrl_Select]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Exec [usp_Frequency_InsertOrUpdate] 1
CREATE PROC [dbo].[usp_StateRegUrl_Select] (@StateUrlName VARCHAR(500))
AS
    BEGIN
        SELECT
            *
        FROM
            dbo.StateUrl
        WHERE
            StateUrlName = @StateUrlName;
    END;

--	ALTER PROC [dbo].[usp_StateRegUrl_Select]
--    (
--      @StateCode VARCHAR(500) 
--    )
--AS
--    BEGIN
--        SELECT  *
--        FROM    dbo.StateRegNavigation
--        WHERE   StateRegNavigation.StateCode = @StateCode

--    END





GO
/****** Object:  StoredProcedure [dbo].[usp_StateUrl_Compare]    Script Date: 8/2/2018 11:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Exec [usp_Frequency_InsertOrUpdate] 1
CREATE PROC [dbo].[usp_StateUrl_Compare]
    (
      @StateUrlName VARCHAR(500) 
    )
AS
    BEGIN
        SELECT  *
        FROM    [dbo].[StateUrl]
        WHERE   StateUrlName = @StateUrlName
		
    END





GO
USE [master]
GO
ALTER DATABASE [FlutterWaveDb] SET  READ_WRITE 
GO
