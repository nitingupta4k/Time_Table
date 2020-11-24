USE [master]
GO
/****** Object:  Database [time_Table]    Script Date: 12/13/2017 9:55:02 AM ******/
CREATE DATABASE [time_Table]
GO
ALTER DATABASE [time_Table] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [time_Table].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [time_Table] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [time_Table] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [time_Table] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [time_Table] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [time_Table] SET ARITHABORT OFF 
GO
ALTER DATABASE [time_Table] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [time_Table] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [time_Table] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [time_Table] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [time_Table] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [time_Table] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [time_Table] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [time_Table] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [time_Table] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [time_Table] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [time_Table] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [time_Table] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [time_Table] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [time_Table] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [time_Table] SET  MULTI_USER 
GO
ALTER DATABASE [time_Table] SET DB_CHAINING OFF 
GO
ALTER DATABASE [time_Table] SET ENCRYPTION ON
GO
ALTER DATABASE [time_Table] SET QUERY_STORE = ON
GO
ALTER DATABASE [time_Table] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [time_Table]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [time_Table]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/13/2017 9:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseCode] [varchar](50) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[types] [char](1) NULL,
	[ects] [float] NOT NULL,
	[department] [varchar](255) NULL,
	[labFlag] [char](1) NULL,
	[maximumHoursPerCycle] [float] NOT NULL,
	[maximumDaysPerCycle] [int] NULL,
	[maximumEnrollment] [int] NULL,
	[maximumHoursPerDay] [float] NULL,
	[description] [varchar](500) NULL,
	[status] [char](1) NULL,
	[createdBy] [int] NOT NULL,
	[createdDate] [date] NOT NULL,
	[modifiedBy] [int] NULL,
	[modifiedDate] [date] NULL,
	[startingDate] [date] NULL,
	[endingDate] [date] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 12/13/2017 9:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[universityID] [varchar](50) NOT NULL,
	[personalID] [varchar](50) NOT NULL,
	[position] [varchar](255) NOT NULL,
	[department] [int] NOT NULL,
	[description] [varchar](500) NULL,
	[maximumLecturePerDay] [int] NULL,
	[maxLectureHoursPerDay] [float] NULL,
	[maximumLecturePerCycle] [int] NULL,
	[status] [char](1) NULL,
	[createdBy] [int] NOT NULL,
	[createdDate] [date] NOT NULL,
	[modifiedBy] [int] NULL,
	[modifiedDate] [date] NULL,
	[qualification] [varchar](255) NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LecturertoCourses]    Script Date: 12/13/2017 9:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LecturertoCourses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[coursesID] [int] NOT NULL,
	[lectureID] [int] NOT NULL,
	[colorCode] [varchar](10) NOT NULL,
	[status] [char](1) NULL,
	[createdBy] [int] NOT NULL,
	[createdDate] [date] NOT NULL,
	[modifiedBy] [int] NULL,
	[modifiedDate] [date] NULL,
 CONSTRAINT [PK_LecturertoCourses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/13/2017 9:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[commonName] [varchar](100) NULL,
	[givenName] [varchar](100) NULL,
	[middleName] [varchar](100) NULL,
	[gender] [char](1) NULL,
	[address1] [varchar](255) NULL,
	[address2] [varchar](255) NULL,
	[city] [varchar](100) NULL,
	[country] [varchar](100) NULL,
	[zip] [varchar](20) NULL,
	[contactNumber] [int] NOT NULL,
	[email] [varchar](100) NULL,
	[userName] [varchar](50) NULL,
	[password] [varchar](20) NULL,
	[status] [char](1) NULL,
	[createdBy] [int] NULL,
	[createdDate] [date] NOT NULL,
	[modifiedBy] [int] NULL,
	[modifiedDate] [date] NULL,
	[dob] [date] NULL,
	[CountryCode] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 12/13/2017 9:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lecturerToCoursesdId] [int] NOT NULL,
	[day] [int] NOT NULL,
	[timeFrom] [varchar](8) NULL,
	[timeTo] [varchar](8) NULL,
	[room] [varchar](50) NOT NULL,
	[status] [char](1) NULL,
	[createdBy] [int] NOT NULL,
	[createdDate] [date] NOT NULL,
	[modifiedBy] [int] NULL,
	[modifiedDate] [date] NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([id], [courseCode], [name], [types], [ects], [department], [labFlag], [maximumHoursPerCycle], [maximumDaysPerCycle], [maximumEnrollment], [maximumHoursPerDay], [description], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [startingDate], [endingDate]) VALUES (1, N'IDU0455', N'Introduction to Development in Cloud', N'1', 6, N'4', N'1', 10, 16, 48, 4, N'', N'A', 1, CAST(N'2017-11-27' AS Date), 1, CAST(N'2017-12-04' AS Date), CAST(N'2017-09-01' AS Date), CAST(N'2017-12-22' AS Date))
INSERT [dbo].[Courses] ([id], [courseCode], [name], [types], [ects], [department], [labFlag], [maximumHoursPerCycle], [maximumDaysPerCycle], [maximumEnrollment], [maximumHoursPerDay], [description], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [startingDate], [endingDate]) VALUES (2, N'HHL1041', N'Public Management and Administration', N'2', 3, N'2', N'2', 15, 5, 50, 3, N'', N'A', 1, CAST(N'2017-12-04' AS Date), 1, CAST(N'2017-12-05' AS Date), CAST(N'2017-10-15' AS Date), CAST(N'2017-11-15' AS Date))
INSERT [dbo].[Courses] ([id], [courseCode], [name], [types], [ects], [department], [labFlag], [maximumHoursPerCycle], [maximumDaysPerCycle], [maximumEnrollment], [maximumHoursPerDay], [description], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [startingDate], [endingDate]) VALUES (3, N'IDU0404', N'Introduction to IT and eGov Technologies', N'2', 6, N'4', N'1', 192, 32, 30, 6, N'', N'A', 1, CAST(N'2017-12-04' AS Date), 1, CAST(N'2017-12-13' AS Date), CAST(N'2017-09-01' AS Date), CAST(N'2017-12-22' AS Date))
INSERT [dbo].[Courses] ([id], [courseCode], [name], [types], [ects], [department], [labFlag], [maximumHoursPerCycle], [maximumDaysPerCycle], [maximumEnrollment], [maximumHoursPerDay], [description], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [startingDate], [endingDate]) VALUES (4, N'HOE7210', N'Legal Framework of e-Governance', N'1', 6, N'2', N'2', 30, 10, 30, 3, N'', N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL, CAST(N'2017-09-01' AS Date), CAST(N'2017-12-22' AS Date))
INSERT [dbo].[Courses] ([id], [courseCode], [name], [types], [ects], [department], [labFlag], [maximumHoursPerCycle], [maximumDaysPerCycle], [maximumEnrollment], [maximumHoursPerDay], [description], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [startingDate], [endingDate]) VALUES (5, N'IDU0320', N'Business Information Systems', N'1', 6, N'4', N'1', 30, 16, 32, 2, N'', N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL, CAST(N'2017-09-01' AS Date), CAST(N'2017-12-22' AS Date))
INSERT [dbo].[Courses] ([id], [courseCode], [name], [types], [ects], [department], [labFlag], [maximumHoursPerCycle], [maximumDaysPerCycle], [maximumEnrollment], [maximumHoursPerDay], [description], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [startingDate], [endingDate]) VALUES (6, N'IDU0406', N'Information Society Concepts and Principles', N'2', 3, N'4', N'1', 30, 6, 12, 2, N'', N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL, CAST(N'2017-09-01' AS Date), CAST(N'2017-10-15' AS Date))
INSERT [dbo].[Courses] ([id], [courseCode], [name], [types], [ects], [department], [labFlag], [maximumHoursPerCycle], [maximumDaysPerCycle], [maximumEnrollment], [maximumHoursPerDay], [description], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [startingDate], [endingDate]) VALUES (8, N'IDU0815', N'Information Systems Programming', N'1', 6, N'4', N'1', 30, 16, 32, 2, N'', N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL, CAST(N'2017-09-01' AS Date), CAST(N'2017-12-22' AS Date))
INSERT [dbo].[Courses] ([id], [courseCode], [name], [types], [ects], [department], [labFlag], [maximumHoursPerCycle], [maximumDaysPerCycle], [maximumEnrollment], [maximumHoursPerDay], [description], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [startingDate], [endingDate]) VALUES (9, N'IDU0480', N'Foundations of Cyber Security', N'1', 6, N'4', N'1', 50, 12, 36, 3, N'', N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL, CAST(N'2017-09-01' AS Date), CAST(N'2017-12-22' AS Date))
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Lecturer] ON 

INSERT [dbo].[Lecturer] ([id], [universityID], [personalID], [position], [department], [description], [maximumLecturePerDay], [maxLectureHoursPerDay], [maximumLecturePerCycle], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [qualification]) VALUES (1, N'012456', N'1', N'Lecturer', 2, N'', 2, 2, 10, N'A', 1, CAST(N'2017-11-23' AS Date), 1, CAST(N'2017-12-04' AS Date), N'Ph.D')
INSERT [dbo].[Lecturer] ([id], [universityID], [personalID], [position], [department], [description], [maximumLecturePerDay], [maxLectureHoursPerDay], [maximumLecturePerCycle], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [qualification]) VALUES (4, N'124576', N'2', N'Professor', 4, N'', 1, 3, 20, N'A', 1, CAST(N'2017-12-04' AS Date), 1, CAST(N'2017-12-04' AS Date), N'Ph.D')
INSERT [dbo].[Lecturer] ([id], [universityID], [personalID], [position], [department], [description], [maximumLecturePerDay], [maxLectureHoursPerDay], [maximumLecturePerCycle], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [qualification]) VALUES (5, N'457689', N'5', N'Associate professor', 4, N'', 1, 3, 20, N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL, N'Ph.D')
INSERT [dbo].[Lecturer] ([id], [universityID], [personalID], [position], [department], [description], [maximumLecturePerDay], [maxLectureHoursPerDay], [maximumLecturePerCycle], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [qualification]) VALUES (6, N'345876', N'6', N'Lecturer', 4, N'', 1, 3, 20, N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL, N'Ph.D')
INSERT [dbo].[Lecturer] ([id], [universityID], [personalID], [position], [department], [description], [maximumLecturePerDay], [maxLectureHoursPerDay], [maximumLecturePerCycle], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [qualification]) VALUES (7, N'846943', N'7', N'Lecturer', 4, N'', 1, 3, 20, N'A', 1, CAST(N'2017-12-04' AS Date), 1, CAST(N'2017-12-04' AS Date), N'MA')
INSERT [dbo].[Lecturer] ([id], [universityID], [personalID], [position], [department], [description], [maximumLecturePerDay], [maxLectureHoursPerDay], [maximumLecturePerCycle], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [qualification]) VALUES (8, N'976456', N'8', N'Researcher', 2, N'', 1, 3, 20, N'A', 1, CAST(N'2017-12-04' AS Date), 1, CAST(N'2017-12-04' AS Date), N'Ph.D')
INSERT [dbo].[Lecturer] ([id], [universityID], [personalID], [position], [department], [description], [maximumLecturePerDay], [maxLectureHoursPerDay], [maximumLecturePerCycle], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [qualification]) VALUES (9, N'239543', N'9', N'Associate Professor', 4, N'', 1, 3, 20, N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL, N'Ph.D')
INSERT [dbo].[Lecturer] ([id], [universityID], [personalID], [position], [department], [description], [maximumLecturePerDay], [maxLectureHoursPerDay], [maximumLecturePerCycle], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [qualification]) VALUES (10, N'235754', N'10', N'Lecturer', 4, N'', 1, 4, 20, N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL, N'Ph.D student')
SET IDENTITY_INSERT [dbo].[Lecturer] OFF
SET IDENTITY_INSERT [dbo].[LecturertoCourses] ON 

INSERT [dbo].[LecturertoCourses] ([id], [coursesID], [lectureID], [colorCode], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (1, 1, 10, N'#0f6e6e', N'A', 1, CAST(N'2017-11-27' AS Date), 1, CAST(N'2017-12-04' AS Date))
INSERT [dbo].[LecturertoCourses] ([id], [coursesID], [lectureID], [colorCode], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (2, 2, 8, N'#104f13', N'A', 1, CAST(N'2017-12-04' AS Date), 1, CAST(N'2017-12-05' AS Date))
INSERT [dbo].[LecturertoCourses] ([id], [coursesID], [lectureID], [colorCode], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (3, 3, 4, N'#0f917f', N'A', 1, CAST(N'2017-12-04' AS Date), 1, CAST(N'2017-12-13' AS Date))
INSERT [dbo].[LecturertoCourses] ([id], [coursesID], [lectureID], [colorCode], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (4, 4, 1, N'#237485', N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL)
INSERT [dbo].[LecturertoCourses] ([id], [coursesID], [lectureID], [colorCode], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (5, 5, 9, N'#2919db', N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL)
INSERT [dbo].[LecturertoCourses] ([id], [coursesID], [lectureID], [colorCode], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (6, 6, 5, N'#fae413', N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL)
INSERT [dbo].[LecturertoCourses] ([id], [coursesID], [lectureID], [colorCode], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (7, 8, 6, N'#475e4d', N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL)
INSERT [dbo].[LecturertoCourses] ([id], [coursesID], [lectureID], [colorCode], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (8, 9, 7, N'#f51f38', N'A', 1, CAST(N'2017-12-04' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[LecturertoCourses] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([id], [code], [commonName], [givenName], [middleName], [gender], [address1], [address2], [city], [country], [zip], [contactNumber], [email], [userName], [password], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [dob], [CountryCode]) VALUES (1, N'001', N'Sandra', N'Särav', N'', N'F', N'Akadeemia tee 3	', N'', N'Tallinn', N'Estonia', N'12620', 6204109, N'sandra.sarav@ttu.ee', N'test', N'test123', N'A', 1, CAST(N'2017-11-21' AS Date), 1, CAST(N'2017-11-27' AS Date), CAST(N'1990-11-01' AS Date), 372)
INSERT [dbo].[Person] ([id], [code], [commonName], [givenName], [middleName], [gender], [address1], [address2], [city], [country], [zip], [contactNumber], [email], [userName], [password], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [dob], [CountryCode]) VALUES (2, N'002', N'Dirk	', N'Draheim	', N'', N'M', N'Akadeemia tee 15a', N'', N'Tallin', N'Estonia', N'12618', 58846997, N'dd@ttu.ee', N'test', N'test123', N'A', 1, CAST(N'2017-11-22' AS Date), 1, CAST(N'2017-11-27' AS Date), CAST(N'1987-04-01' AS Date), 372)
INSERT [dbo].[Person] ([id], [code], [commonName], [givenName], [middleName], [gender], [address1], [address2], [city], [country], [zip], [contactNumber], [email], [userName], [password], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [dob], [CountryCode]) VALUES (5, N'003', N'Ingrid ', N'Pappel', N'', N'F', N'Akadeemia tee 15a', N'', N'Tallinn', N'Estonia', N'12618', 2345678, N'ip@ttu.ee', N'test', N'test123', N'A', 1, CAST(N'2017-11-23' AS Date), NULL, NULL, CAST(N'1987-04-01' AS Date), 372)
INSERT [dbo].[Person] ([id], [code], [commonName], [givenName], [middleName], [gender], [address1], [address2], [city], [country], [zip], [contactNumber], [email], [userName], [password], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [dob], [CountryCode]) VALUES (6, N'004', N'Inna ', N'Švartsman', N'', N'F', N'Akadeemia tee 15A	', N'', N'Tallinn', N'Estonia', N'12620', 2345678, N'inna.svartsman@ttu.ee', N'test', N'test123', N'A', 1, CAST(N'2017-11-23' AS Date), 1, CAST(N'2017-11-23' AS Date), CAST(N'1987-04-01' AS Date), 372)
INSERT [dbo].[Person] ([id], [code], [commonName], [givenName], [middleName], [gender], [address1], [address2], [city], [country], [zip], [contactNumber], [email], [userName], [password], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [dob], [CountryCode]) VALUES (7, N'005', N'Sille', N'Laks', N'', N'F', N'Akadeemia tee 15a', N'', N'Tallinn', N'Estonia', N'12630', 1235678, N'sl@ttu.ee', N'test', N'test123', N'A', 1, CAST(N'2017-11-23' AS Date), NULL, NULL, CAST(N'1990-11-14' AS Date), 372)
INSERT [dbo].[Person] ([id], [code], [commonName], [givenName], [middleName], [gender], [address1], [address2], [city], [country], [zip], [contactNumber], [email], [userName], [password], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [dob], [CountryCode]) VALUES (8, N'006', N'Erkki', N'Karo	', N'', N'M', N'Akadeemia tee 15a', N'', N'Tallinn', N'Estonia', N'12620', 1246778, N'ek@ttu.ee', N'test', N'test123', N'A', 1, CAST(N'2017-11-23' AS Date), NULL, NULL, CAST(N'1990-11-28' AS Date), 372)
INSERT [dbo].[Person] ([id], [code], [commonName], [givenName], [middleName], [gender], [address1], [address2], [city], [country], [zip], [contactNumber], [email], [userName], [password], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [dob], [CountryCode]) VALUES (9, N'007', N'Enn', N'Õunapuu	', N'', N'M', N'Akadeemia tee 15a', N'', N'Tallinn', N'Estonia', N'12620', 1257880, N'eo@ttu.ee', N'test', N'test123', N'A', 1, CAST(N'2017-11-23' AS Date), 1, CAST(N'2017-12-04' AS Date), CAST(N'1970-07-29' AS Date), 372)
INSERT [dbo].[Person] ([id], [code], [commonName], [givenName], [middleName], [gender], [address1], [address2], [city], [country], [zip], [contactNumber], [email], [userName], [password], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate], [dob], [CountryCode]) VALUES (10, N'008', N'Anton', N'Vedešin', N'', N'M', N'Akadeemia tee 11', N'', N'Tallinn', N'Estonia', N'12632', 2345679, N'av@ttu.ee', N'test', N'test123', N'A', 1, CAST(N'2017-12-04' AS Date), 1, CAST(N'2017-12-04' AS Date), CAST(N'1980-04-29' AS Date), 372)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[TimeSlot] ON 

INSERT [dbo].[TimeSlot] ([id], [lecturerToCoursesdId], [day], [timeFrom], [timeTo], [room], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (1, 1, 2, N'8:00 AM', N'11:30 AM', N'ICT-402', N'A', 1, CAST(N'2017-12-13' AS Date), 1, CAST(N'2017-12-13' AS Date))
INSERT [dbo].[TimeSlot] ([id], [lecturerToCoursesdId], [day], [timeFrom], [timeTo], [room], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (2, 2, 2, N'5:54 PM', N'8:15 PM', N'SOC-414', N'A', 1, CAST(N'2017-12-13' AS Date), 1, CAST(N'2017-12-13' AS Date))
INSERT [dbo].[TimeSlot] ([id], [lecturerToCoursesdId], [day], [timeFrom], [timeTo], [room], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (5, 2, 4, N'5:45 PM', N'8:15 PM', N'SOC-414
', N'A', 1, CAST(N'2017-12-13' AS Date), NULL, NULL)
INSERT [dbo].[TimeSlot] ([id], [lecturerToCoursesdId], [day], [timeFrom], [timeTo], [room], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (7, 3, 1, N'8:00 AM', N'9:00 PM', N'ICT-637', N'A', 1, CAST(N'2017-12-13' AS Date), 1, CAST(N'2017-12-13' AS Date))
INSERT [dbo].[TimeSlot] ([id], [lecturerToCoursesdId], [day], [timeFrom], [timeTo], [room], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (8, 3, 4, N'9:00 AM', N'1:00 PM', N'ICT-402, ICT-637
', N'A', 1, CAST(N'2017-12-13' AS Date), NULL, NULL)
INSERT [dbo].[TimeSlot] ([id], [lecturerToCoursesdId], [day], [timeFrom], [timeTo], [room], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (9, 4, 5, N'4:00 PM', N'6:15 PM', N'U03-103
', N'A', 1, CAST(N'2017-12-13' AS Date), NULL, NULL)
INSERT [dbo].[TimeSlot] ([id], [lecturerToCoursesdId], [day], [timeFrom], [timeTo], [room], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (10, 5, 2, N'4:00 PM', N'5:30 PM', N'ICT-122
', N'A', 1, CAST(N'2017-12-13' AS Date), NULL, NULL)
INSERT [dbo].[TimeSlot] ([id], [lecturerToCoursesdId], [day], [timeFrom], [timeTo], [room], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (11, 6, 4, N'2:00 PM', N'4:00 PM', N'ICT-A1
', N'A', 1, CAST(N'2017-12-13' AS Date), NULL, NULL)
INSERT [dbo].[TimeSlot] ([id], [lecturerToCoursesdId], [day], [timeFrom], [timeTo], [room], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (12, 7, 3, N'4:00 PM', N'6:15 PM', N'ICT-402
', N'A', 1, CAST(N'2017-12-13' AS Date), NULL, NULL)
INSERT [dbo].[TimeSlot] ([id], [lecturerToCoursesdId], [day], [timeFrom], [timeTo], [room], [status], [createdBy], [createdDate], [modifiedBy], [modifiedDate]) VALUES (13, 8, 5, N'11:00 AM', N'1:00 PM', N'ICT-315, SCI-109, U03-103
', N'A', 1, CAST(N'2017-12-13' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TimeSlot] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [time_Table]    Script Date: 12/13/2017 9:55:04 AM ******/
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [time_Table] UNIQUE NONCLUSTERED 
(
	[courseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Uniq_Lecturer_personalId]    Script Date: 12/13/2017 9:55:04 AM ******/
ALTER TABLE [dbo].[Lecturer] ADD  CONSTRAINT [Uniq_Lecturer_personalId] UNIQUE NONCLUSTERED 
(
	[personalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Uniq_Lecturer_univversityId]    Script Date: 12/13/2017 9:55:04 AM ******/
ALTER TABLE [dbo].[Lecturer] ADD  CONSTRAINT [Uniq_Lecturer_univversityId] UNIQUE NONCLUSTERED 
(
	[universityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Uniq_Person_Code]    Script Date: 12/13/2017 9:55:04 AM ******/
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [Uniq_Person_Code] UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_createdBy] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_createdBy]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Modified] FOREIGN KEY([modifiedBy])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Modified]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_createdBy] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_createdBy]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_modifiedBy] FOREIGN KEY([modifiedBy])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_modifiedBy]
GO
ALTER TABLE [dbo].[LecturertoCourses]  WITH CHECK ADD  CONSTRAINT [FK_LecturertoCourses_Coursesid] FOREIGN KEY([coursesID])
REFERENCES [dbo].[Courses] ([id])
GO
ALTER TABLE [dbo].[LecturertoCourses] CHECK CONSTRAINT [FK_LecturertoCourses_Coursesid]
GO
ALTER TABLE [dbo].[LecturertoCourses]  WITH CHECK ADD  CONSTRAINT [FK_LecturertoCourses_createdBy] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[LecturertoCourses] CHECK CONSTRAINT [FK_LecturertoCourses_createdBy]
GO
ALTER TABLE [dbo].[LecturertoCourses]  WITH CHECK ADD  CONSTRAINT [FK_LecturertoCourses_Lecturerid] FOREIGN KEY([lectureID])
REFERENCES [dbo].[Lecturer] ([id])
GO
ALTER TABLE [dbo].[LecturertoCourses] CHECK CONSTRAINT [FK_LecturertoCourses_Lecturerid]
GO
ALTER TABLE [dbo].[LecturertoCourses]  WITH CHECK ADD  CONSTRAINT [FK_LecturertoCourses_modifiedBy] FOREIGN KEY([modifiedBy])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[LecturertoCourses] CHECK CONSTRAINT [FK_LecturertoCourses_modifiedBy]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Modified] FOREIGN KEY([modifiedBy])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Modified]
GO
ALTER TABLE [dbo].[TimeSlot]  WITH CHECK ADD  CONSTRAINT [FK_TimeSlot_createdBy] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[TimeSlot] CHECK CONSTRAINT [FK_TimeSlot_createdBy]
GO
ALTER TABLE [dbo].[TimeSlot]  WITH CHECK ADD  CONSTRAINT [FK_TimeSlot_lecturerToCoursesId] FOREIGN KEY([lecturerToCoursesdId])
REFERENCES [dbo].[LecturertoCourses] ([id])
GO
ALTER TABLE [dbo].[TimeSlot] CHECK CONSTRAINT [FK_TimeSlot_lecturerToCoursesId]
GO
ALTER TABLE [dbo].[TimeSlot]  WITH CHECK ADD  CONSTRAINT [FK_TimeSlot_modifiedBy] FOREIGN KEY([modifiedBy])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[TimeSlot] CHECK CONSTRAINT [FK_TimeSlot_modifiedBy]
GO
/****** Object:  StoredProcedure [dbo].[SP_checkTimeSlot]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE          procedure [dbo].[SP_checkTimeSlot]
@id int,
@timeFrom varchar(8), 
@timeTo varchar(8), 
@day int
AS
Begin
select  id from TimeSlot where 
--(CONVERT(time, timeFrom, 104) >= CONVERT(time, @timeFrom, 104) OR 
--CONVERT(time, timeTo, 104) <= CONVERT(time, @timeTo, 104)) AND 
(
  (
	CONVERT(time, timeFrom, 104) <= CONVERT(time, @timeFrom, 104) AND 
     CONVERT(time, timeTo, 104) >= CONVERT(time, @timeTo, 104)
  ) 
  OR 
  (
     CONVERT(time, timeFrom, 104) <= CONVERT(time, @timeFrom, 104) AND 
     CONVERT(time, timeTo, 104) >= CONVERT(time, @timeTo, 104)
  ) 
  OR 
  (
     CONVERT(time, timeFrom, 104) >= CONVERT(time, @timeFrom, 104) AND 
     CONVERT(time, timeTo, 104) <= CONVERT(time, @timeTo, 104)
  )
  
  )AND day=@day AND id!=@id
end
GO
/****** Object:  StoredProcedure [dbo].[SP_deleteCourses]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE      procedure [dbo].[SP_deleteCourses]
@id int 
AS
Begin try
BEGIN TRAN;
delete from Courses where id=@id;
delete from LecturertoCourses where coursesID=@id;
COMMIT TRAN;
END TRY
BEGIN CATCH
ROLLBACK TRAN;
SELECT 'Error' ActionType,'0' InsTitleID;
THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_deleteLecturer]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE      procedure [dbo].[SP_deleteLecturer]
@id int 
AS
Begin
delete from Lecturer where id=@id;
end
GO
/****** Object:  StoredProcedure [dbo].[SP_deletePerson]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE      procedure [dbo].[SP_deletePerson]
@id int 
AS
Begin
delete from Person where id=@id;
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getCourse]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     procedure [dbo].[SP_getCourse]
@id int,
@code varchar(50) 
AS
Begin
Select Courses.id ,Courses.courseCode,Courses.name,Courses.ects,Courses.department,Courses.types,Courses.labFlag,
Courses.maximumEnrollment,Courses.maximumDaysPerCycle,Courses.maximumHoursPerCycle,Courses.maximumHoursPerDay,
Courses.startingDate,Courses.endingDate,Courses.description,Courses.status,LecturertoCourses.id lcid,
LecturertoCourses.coursesID, LecturertoCourses.lectureID,LecturertoCourses.colorCode,LecturertoCourses.status lcstatus,
Person.code,Person.commonName
from Courses
join LecturertoCourses on LecturertoCourses.coursesID=Courses.id 
join Lecturer on Lecturer.id=LecturertoCourses.lectureID
join Person on Person.id=Lecturer.personalID
where Courses.id=COALESCE(NULLIF(@id, ''), Courses.id) and Courses.courseCode=COALESCE(NULLIF(@code, ''), Courses.courseCode);
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getCourseSelect]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    procedure [dbo].[SP_getCourseSelect]

AS
Begin
Select id, courseCode+' '+name courseCode from Courses
where status='A';
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getCourseSelectDetail]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE     procedure [dbo].[SP_getCourseSelectDetail]
@id int
AS
Begin
Select Courses.id,courseCode,maximumDaysPerCycle,maximumHoursPerCycle,maximumHoursPerDay,LecturertoCourses.id lcid,Person.commonName 
from Courses 
join LecturertoCourses on LecturertoCourses.coursesID =Courses.id
join Lecturer on Lecturer.id=LecturertoCourses.lectureID 
join Person on Person.id=Lecturer.personalID 
where Courses.id=COALESCE(NULLIF(@id, ''), Courses.id);
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getHour]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE       procedure [dbo].[SP_getHour]
@id int,
@day int 
AS
Begin
SELECT 
CONVERT(time, timeFrom, 104) timeFrom,
CONVERT(time, timeTo, 104) timeTo,
CONVERT(VARCHAR(5),(CONVERT(Datetime, timeTo, 104) -CONVERT(Datetime, timeFrom, 104) ),108) diffrent 
from TimeSlot  
where lecturerToCoursesdId=COALESCE(NULLIF(@id, ''), lecturerToCoursesdId) 
and day=COALESCE(NULLIF(@day, ''), day);
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getLecturer]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE    procedure [dbo].[SP_getLecturer]
@id int
AS
Begin
Select Lecturer.id, universityID, personalID, position, department, description, maximumLecturePerDay, CONVERT(DECIMAL(10,2),maxLectureHoursPerDay) maxLectureHoursPerDay, maximumLecturePerCycle, 
Lecturer.status, qualification,Person.code code  from Lecturer join Person on Person.id=Lecturer.personalID
where Lecturer.id=COALESCE(NULLIF(@id, ''), Lecturer.id);
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getLecturerSelect]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE    procedure [dbo].[SP_getLecturerSelect]

AS
Begin
Select Lecturer.id, universityID,Person.commonName commonName from Lecturer join Person on Person.id=Lecturer.personalID
where Lecturer.status='A';
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getPerson]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE    procedure [dbo].[SP_getPerson]
@id int,
@code varchar(50) 
AS
Begin
Select id, code, commonName, givenName, middleName, gender, address1, address2, city, country, zip, contactNumber, email, userName, password, status, createdBy, createdDate, modifiedBy, modifiedDate, dob, CountryCode from Person where id=COALESCE(NULLIF(@id, ''), id) and code=COALESCE(NULLIF(@code, ''), code);
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getPersonSearch]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    procedure [dbo].[SP_getPersonSearch]
@code varchar(50)
AS
Begin
Select * from Person where 
   code  like @code+'%'
OR commonName like '%'+@code+'%'
OR givenName like '%'+@code+'%'
OR middleName like '%'+@code+'%';
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getTimeSlot]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE      procedure [dbo].[SP_getTimeSlot]
@id int 
AS
Begin
select Timeslot.*, coursesID,Person.commonName,Courses.name from Timeslot
join LecturertoCourses on LecturertoCourses.id=lecturerToCoursesdId
join Courses on Courses.id=coursesID
join Lecturer on Lecturer.id=lectureID
join Person on Person.id=personalID
where Timeslot.id=COALESCE(NULLIF(@id, ''), Timeslot.id) ORDER By DAY,timeFrom  
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getTimeTable]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE    procedure [dbo].[SP_getTimeTable]
--@id int 
AS
Begin
select Day,CONVERT(time, timeFrom, 104) timeFrom, CONVERT(time, timeTo, 104) timeTo,room,
courseCode,Name,ects,types,colorCode,
commonName,givenName,middleName,contactNumber,email  
from TimeSlot
Join LecturertoCourses on LecturertoCourses.id=lecturerToCoursesdId
Join Courses on Courses.id=coursesID
Join Lecturer on Lecturer.id=lectureID
Join Person on Person.id=personalID 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertorUpdateCourses]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   Procedure [dbo].[SP_InsertorUpdateCourses]
@id int , 
@courseCode varchar(50), 
@name varchar(255), 
@types char(1),
@ects float, 
@department int, 
@labFlag char(1),
@maximumHoursPerCycle float, 
@maximumDaysPerCycle int, 
@maximumEnrollment int, 
@maximumHoursPerDay float, 
@description varchar(500), 
@startingDate date, 
@endingDate date,
@status char(1), 
@By int,

@lcid int ,
@coursesID int ,
@lectureID int ,
@colorCode varchar(10), 
@lcstatus char(1)

AS
DECLARE @MergeOutput TABLE
(
  ActionType NVARCHAR(10),
  InsTitleID INT  
);
BEGIN TRY
BEGIN TRAN;
MERGE Courses AS T
USING (select @id id ) AS S ON T.id =s.id

WHEN NOT MATCHED THEN 
INSERT (courseCode, name, types, ects, department, labFlag, maximumHoursPerCycle, maximumDaysPerCycle, maximumEnrollment, maximumHoursPerDay, description, status, createdBy, createdDate, startingDate, endingDate)
VALUES(@courseCode, @name, @types, @ects, @department, @labFlag, @maximumHoursPerCycle, @maximumDaysPerCycle, @maximumEnrollment, @maximumHoursPerDay, @description, @status, @By, GETDATE(), @startingDate,@endingDate)

WHEN MATCHED THEN
UPDATE SET
 T.courseCode=@courseCode			
,T.name=@name
,T.types=@types
,T.ects=@ects
,T.department=@department
,T.labFlag=@labFlag
,T.maximumHoursPerCycle=@maximumHoursPerCycle
,T.maximumDaysPerCycle=@maximumDaysPerCycle
,T.maximumEnrollment=@maximumEnrollment
,T.maximumHoursPerDay=@maximumHoursPerDay
,T.description=@description
,T.startingDate=@startingDate
,T.endingDate=@endingDate
,T.status=@status
,T.modifiedBy=@By
,T.modifiedDate=GETDATE()
OUTPUT
    $action,
    INSERTED.id   
  INTO @MergeOutput;
  SELECT * FROM @MergeOutput;
  SET @coursesID=(SELECT InsTitleID FROM @MergeOutput);  
  MERGE LecturertoCourses AS T2
USING (select @lcid lcid ) AS S ON T2.id =s.lcid

WHEN NOT MATCHED THEN 
INSERT (coursesID, lectureID, colorCode, status, createdBy, createdDate)
VALUES(@coursesID, @lectureID, @colorCode, @lcstatus, @By, GETDATE())

WHEN MATCHED THEN
UPDATE SET
 T2.coursesID=@coursesID		
,T2.lectureID=@lectureID
,T2.colorCode=@colorCode
,T2.status=@lcstatus
,T2.modifiedBy=@By
,T2.modifiedDate=GETDATE();

COMMIT TRAN;
END TRY
BEGIN CATCH
ROLLBACK TRAN;
SELECT 'Error' ActionType,'0' InsTitleID;
THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertorUpdateLecturer]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    Procedure [dbo].[SP_InsertorUpdateLecturer]
@id int , 
@universityID varchar(50), 
@personalID varchar(50),
@position varchar(255), 
@department int, 
@description varchar(500),
@maximumLecturePerDay int, 
@maxLectureHoursPerDay float, 
@maximumLecturePerCycle int, 
@qualification varchar(255), 
@status char(1), 
@By int


AS
DECLARE @MergeOutput TABLE
(
  ActionType NVARCHAR(10),
  InsTitleID INT  
);
BEGIN TRY
BEGIN TRAN;
MERGE Lecturer AS T
USING (select @id id ) AS S ON T.id =s.id

WHEN NOT MATCHED THEN 
INSERT (universityID, personalID, position, department, description, maximumLecturePerDay, maxLectureHoursPerDay, maximumLecturePerCycle, status, createdBy, createdDate, qualification)
VALUES(@universityID, @personalID, @position, @department, @description, @maximumLecturePerDay, @maxLectureHoursPerDay, @maximumLecturePerCycle, @status, @By, GETDATE(),@qualification)

WHEN MATCHED THEN
UPDATE SET
 T.universityID=@universityID			
,T.personalID=@personalID
,T.position=@position
,T.department=@department
,T.description=@description
,T.maximumLecturePerDay=@maximumLecturePerDay
,T.maxLectureHoursPerDay=@maxLectureHoursPerDay
,T.maximumLecturePerCycle=@maximumLecturePerCycle
,T.qualification=@qualification
,T.status=@status
,T.modifiedBy=@By
,T.modifiedDate=GETDATE()
OUTPUT
    $action,
    INSERTED.id   
  INTO @MergeOutput;
  SELECT * FROM @MergeOutput;
COMMIT TRAN;
END TRY
BEGIN CATCH
ROLLBACK TRAN;
SELECT 'Error' ActionType,'0' InsTitleID;
THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertorUpdatePerson]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   Procedure [dbo].[SP_InsertorUpdatePerson]
@id int , 
@code varchar(50), 
@commonName varchar(100),
@givenName varchar(100), 
@middleName varchar(100), 
@gender char(1),
@dob date, 
@address1 varchar(255), 
@address2 varchar(255), 
@city varchar(100), 
@country varchar(100), 
@zip varchar(20), 
@contactNumber int, 
@email varchar(100), 
@userName varchar(50), 
@password varchar(20), 
@status char(1), 
@By int,
@CountryCode int

AS
DECLARE @MergeOutput TABLE
(
  ActionType NVARCHAR(10),
  InsTitleID INT  
);
BEGIN TRY
BEGIN TRAN;
MERGE person AS T
USING (select @id id ) AS S ON T.id =s.id

WHEN NOT MATCHED THEN 
INSERT (code, commonName, givenName, middleName, gender,address1, address2, city, country, zip, contactNumber, email, userName, password, status, createdBy, createdDate,dob,CountryCode)
VALUES(@code, @commonName, @givenName, @middleName, @gender, @address1, @address2, @city, @country, @zip, @contactNumber, @email, @userName, @password, @status, @By, GETDATE(), @dob,@CountryCode)

WHEN MATCHED THEN
UPDATE SET
 T.code=@code 			
,T.commonName=@commonName
,T.givenName=@givenName
,T.middleName=@middleName
,T.gender=@gender
,T.dob=@dob
,T.address1=@address1
,T.address2=@address2
,T.city=@city
,T.country=@country
,T.zip=@zip
,T.CountryCode=@CountryCode
,T.contactNumber=@contactNumber
,T.email=@email
,T.userName=@userName
,T.password=@password
,T.status=@status
,T.modifiedBy=@By
,T.modifiedDate=GETDATE()
OUTPUT
    $action,
    INSERTED.id   
  INTO @MergeOutput;
  SELECT * FROM @MergeOutput;
COMMIT TRAN;
END TRY
BEGIN CATCH
ROLLBACK TRAN;
SELECT 'Error' ActionType,'0' InsTitleID;
THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertorUpdateTimeSlot]    Script Date: 12/13/2017 9:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     Procedure [dbo].[SP_InsertorUpdateTimeSlot]
@id int , 
@lecturerToCoursesdId int, 
@day int,
@timeFrom varchar(8), 
@timeTo varchar(8), 
@room varchar(50), 
@status char(1), 
@By int

AS
DECLARE @MergeOutput TABLE
(
  ActionType NVARCHAR(10),
  InsTitleID INT  
);
BEGIN TRY
BEGIN TRAN;
MERGE Timeslot AS T
USING (select @id id ) AS S ON T.id =s.id

WHEN NOT MATCHED THEN 
INSERT (lecturerToCoursesdId, day, timeFrom, timeTo, room, status, createdBy, createdDate)
VALUES(@lecturerToCoursesdId, @day, @timeFrom, @timeTo, @room, @status, @By, GETDATE())

WHEN MATCHED THEN
UPDATE SET
 T.lecturerToCoursesdId=@lecturerToCoursesdId			
,T.day=@day
,T.timeFrom=@timeFrom
,T.timeTo=@timeTo
,T.room=@room
,T.status=@status
,T.modifiedBy=@By
,T.modifiedDate=GETDATE()
OUTPUT
    $action,
    INSERTED.id   
  INTO @MergeOutput;
  SELECT * FROM @MergeOutput;
COMMIT TRAN;
END TRY
BEGIN CATCH
ROLLBACK TRAN;
SELECT 'Error' ActionType,'0' InsTitleID;
THROW;
END CATCH
GO
USE [master]
GO
ALTER DATABASE [time_Table] SET  READ_WRITE 
GO
