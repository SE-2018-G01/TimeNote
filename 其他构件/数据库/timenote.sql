USE [master]
GO
/****** Object:  Database [timenote]    Script Date: 12/11/2018 11:02:52 ******/
CREATE DATABASE [timenote] ON  PRIMARY 
( NAME = N'timenote', FILENAME = N'C:\Program Files\Microsoft SQL Server ex\MSSQL10_50.SE2018G01\MSSQL\DATA\timenote.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'timenote_log', FILENAME = N'C:\Program Files\Microsoft SQL Server ex\MSSQL10_50.SE2018G01\MSSQL\DATA\timenote_log.ldf' , SIZE = 5696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [timenote] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [timenote].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [timenote] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [timenote] SET ANSI_NULLS OFF
GO
ALTER DATABASE [timenote] SET ANSI_PADDING OFF
GO
ALTER DATABASE [timenote] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [timenote] SET ARITHABORT OFF
GO
ALTER DATABASE [timenote] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [timenote] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [timenote] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [timenote] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [timenote] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [timenote] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [timenote] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [timenote] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [timenote] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [timenote] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [timenote] SET  DISABLE_BROKER
GO
ALTER DATABASE [timenote] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [timenote] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [timenote] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [timenote] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [timenote] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [timenote] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [timenote] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [timenote] SET  READ_WRITE
GO
ALTER DATABASE [timenote] SET RECOVERY SIMPLE
GO
ALTER DATABASE [timenote] SET  MULTI_USER
GO
ALTER DATABASE [timenote] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [timenote] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'timenote', N'ON'
GO
USE [timenote]
GO
/****** Object:  Table [dbo].[ListInformation]    Script Date: 12/11/2018 11:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListInformation](
	[ListId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ListName] [varchar](50) NOT NULL,
	[CreatDate] [datetime] NOT NULL,
	[BackgroundColor] [varchar](10) NULL,
	[ListPriority] [int] NULL,
 CONSTRAINT [PK_ListIformation_1] PRIMARY KEY CLUSTERED 
(
	[ListId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'清单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListInformation', @level2type=N'COLUMN',@level2name=N'ListId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListInformation', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'清单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListInformation', @level2type=N'COLUMN',@level2name=N'ListName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListInformation', @level2type=N'COLUMN',@level2name=N'CreatDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背景颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListInformation', @level2type=N'COLUMN',@level2name=N'BackgroundColor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'清单优先级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListInformation', @level2type=N'COLUMN',@level2name=N'ListPriority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'清单信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListInformation'
GO
/****** Object:  Table [dbo].[LeavesStatistics]    Script Date: 12/11/2018 11:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeavesStatistics](
	[LeavesDate] [date] NOT NULL,
	[LeavesAmount] [int] NULL,
	[FocusTime] [int] NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_LEAVESSTATISTICS] PRIMARY KEY NONCLUSTERED 
(
	[LeavesDate] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'叶子日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LeavesStatistics', @level2type=N'COLUMN',@level2name=N'LeavesDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'获得的叶子数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LeavesStatistics', @level2type=N'COLUMN',@level2name=N'LeavesAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专注时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LeavesStatistics', @level2type=N'COLUMN',@level2name=N'FocusTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LeavesStatistics', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'叶子收获统计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LeavesStatistics'
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 12/11/2018 11:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInformation](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [varchar](50) NOT NULL,
	[UserPassword] [varchar](20) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[CreatDate] [datetime] NOT NULL,
	[LeavesId] [int] NOT NULL,
	[StopDate] [datetime] NULL,
	[UserCalendar] [bit] NOT NULL,
	[UserTypeface] [varchar](10) NOT NULL,
	[Achievement] [int] NOT NULL,
	[AuthCode] [varchar](20) NULL,
	[StopUserId] [int] NULL,
	[UserHead] [image] NULL,
 CONSTRAINT [PK_USERINFORMATION] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__UserInfo__08638DF833F4B129] UNIQUE NONCLUSTERED 
(
	[UserEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'UserEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'UserPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'CreatDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'叶子钟设置编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'LeavesId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'停用日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'StopDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日历模式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'UserCalendar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字体大小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'UserTypeface'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成就值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'Achievement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'AuthCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'停用人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation', @level2type=N'COLUMN',@level2name=N'StopUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInformation'
GO
/****** Object:  Table [dbo].[LeaveSet]    Script Date: 12/11/2018 11:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveSet](
	[LeavesId] [int] IDENTITY(1,1) NOT NULL,
	[Userid] [int] NULL,
	[LeavesDuration] [int] NOT NULL,
	[BreakDuration] [int] NOT NULL,
 CONSTRAINT [PK_LEAVESET] PRIMARY KEY NONCLUSTERED 
(
	[LeavesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Set_FK] ON [dbo].[LeaveSet] 
(
	[Userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'叶子钟设置编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LeaveSet', @level2type=N'COLUMN',@level2name=N'LeavesId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户信_用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LeaveSet', @level2type=N'COLUMN',@level2name=N'Userid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'叶子钟时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LeaveSet', @level2type=N'COLUMN',@level2name=N'LeavesDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短休息时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LeaveSet', @level2type=N'COLUMN',@level2name=N'BreakDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'叶子钟设置信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LeaveSet'
GO
/****** Object:  Table [dbo].[EventInformation]    Script Date: 12/11/2018 11:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventInformation](
	[UserId] [int] NOT NULL,
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[DRemindId] [int] NULL,
	[ListId] [int] NULL,
	[EventName] [varchar](50) NOT NULL,
	[EventDate] [datetime] NULL,
	[EventPriority] [int] NULL,
	[DRemindDate] [datetime] NULL,
	[Complete] [int] NULL,
	[LeavesEventSign] [bit] NOT NULL,
	[EventNote] [varchar](200) NULL,
	[Pid] [int] NULL,
 CONSTRAINT [PK_EventInformation] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事务编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation', @level2type=N'COLUMN',@level2name=N'EventId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提醒编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation', @level2type=N'COLUMN',@level2name=N'DRemindId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'清单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation', @level2type=N'COLUMN',@level2name=N'ListId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事物名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation', @level2type=N'COLUMN',@level2name=N'EventName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事务时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation', @level2type=N'COLUMN',@level2name=N'EventDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事务优先级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation', @level2type=N'COLUMN',@level2name=N'EventPriority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation', @level2type=N'COLUMN',@level2name=N'DRemindDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'叶子事务标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation', @level2type=N'COLUMN',@level2name=N'LeavesEventSign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事务备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation', @level2type=N'COLUMN',@level2name=N'EventNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事件信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventInformation'
GO
/****** Object:  Table [dbo].[DRemindInformation]    Script Date: 12/11/2018 11:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DRemindInformation](
	[DRemindId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[DRemindRing] [int] NULL,
	[DRemindRepeat] [int] NULL,
	[AheadTime] [int] NULL,
	[PId] [int] NULL,
	[DRemindVib] [bit] NULL,
	[DefaultTime] [varchar](20) NULL,
	[LeavesTime] [int] NULL,
	[EventId] [int] NULL,
 CONSTRAINT [PK_DRemindInformation_1] PRIMARY KEY CLUSTERED 
(
	[DRemindId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Define_FK] ON [dbo].[DRemindInformation] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提醒编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRemindInformation', @level2type=N'COLUMN',@level2name=N'DRemindId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户信_用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRemindInformation', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提醒方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRemindInformation', @level2type=N'COLUMN',@level2name=N'DRemindRing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提醒频率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRemindInformation', @level2type=N'COLUMN',@level2name=N'DRemindRepeat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提醒时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRemindInformation', @level2type=N'COLUMN',@level2name=N'AheadTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提醒设置信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DRemindInformation'
GO
/****** Object:  Table [dbo].[AppealInformation]    Script Date: 12/11/2018 11:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppealInformation](
	[UserId] [int] NOT NULL,
	[AppealId] [int] IDENTITY(1,1) NOT NULL,
	[AppealDeclare] [varchar](200) NULL,
	[UserName] [varchar](20) NOT NULL,
	[AppealEmail] [varchar](50) NOT NULL,
	[AppealPhone] [varchar](20) NULL,
	[AppealStatus] [varchar](200) NOT NULL,
	[DealTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AppealInformation_1] PRIMARY KEY CLUSTERED 
(
	[AppealId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Appeal_FK] ON [dbo].[AppealInformation] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户信_用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppealInformation', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申诉id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppealInformation', @level2type=N'COLUMN',@level2name=N'AppealId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申诉说明信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppealInformation', @level2type=N'COLUMN',@level2name=N'AppealDeclare'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppealInformation', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppealInformation', @level2type=N'COLUMN',@level2name=N'AppealEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppealInformation', @level2type=N'COLUMN',@level2name=N'AppealPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申诉状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppealInformation', @level2type=N'COLUMN',@level2name=N'AppealStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppealInformation', @level2type=N'COLUMN',@level2name=N'DealTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申述信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppealInformation'
GO
/****** Object:  Table [dbo].[UserManagerInformation]    Script Date: 12/11/2018 11:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserManagerInformation](
	[UserManagerId] [int] NOT NULL,
	[UserManagerName] [varchar](50) NOT NULL,
	[UserManagerPassword] [varchar](20) NOT NULL,
	[CreatDate] [datetime] NOT NULL,
 CONSTRAINT [PK_USERMANAGERINFORMATION] PRIMARY KEY NONCLUSTERED 
(
	[UserManagerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserManagerInformation', @level2type=N'COLUMN',@level2name=N'UserManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserManagerInformation', @level2type=N'COLUMN',@level2name=N'UserManagerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserManagerInformation', @level2type=N'COLUMN',@level2name=N'UserManagerPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserManagerInformation', @level2type=N'COLUMN',@level2name=N'CreatDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserManagerInformation'
GO
/****** Object:  Table [dbo].[DealWith]    Script Date: 12/11/2018 11:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealWith](
	[UserManagerId] [int] NOT NULL,
	[Use_UserId] [int] NOT NULL,
	[AppealId] [int] NOT NULL,
 CONSTRAINT [PK_DEALWITH] PRIMARY KEY CLUSTERED 
(
	[Use_UserId] ASC,
	[UserManagerId] ASC,
	[AppealId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [被提交_FK] ON [dbo].[DealWith] 
(
	[UserManagerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [审核_FK] ON [dbo].[DealWith] 
(
	[Use_UserId] ASC,
	[AppealId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DealWith', @level2type=N'COLUMN',@level2name=N'UserManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户信_用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DealWith', @level2type=N'COLUMN',@level2name=N'Use_UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申诉id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DealWith', @level2type=N'COLUMN',@level2name=N'AppealId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DealWith'
GO
/****** Object:  Default [DF_ListIformation_CreatDate]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[ListInformation] ADD  CONSTRAINT [DF_ListIformation_CreatDate]  DEFAULT (getdate()) FOR [CreatDate]
GO
/****** Object:  Default [DF_LeavesStatistics_LeavesDate]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[LeavesStatistics] ADD  CONSTRAINT [DF_LeavesStatistics_LeavesDate]  DEFAULT (dateadd(day,(1),getdate())) FOR [LeavesDate]
GO
/****** Object:  Default [DF_LeavesStatistics_LeavesAmount]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[LeavesStatistics] ADD  CONSTRAINT [DF_LeavesStatistics_LeavesAmount]  DEFAULT ((0)) FOR [LeavesAmount]
GO
/****** Object:  Default [DF_LeavesStatistics_FocusTime]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[LeavesStatistics] ADD  CONSTRAINT [DF_LeavesStatistics_FocusTime]  DEFAULT ((0)) FOR [FocusTime]
GO
/****** Object:  Default [DF_UserInformation_CreatDate]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[UserInformation] ADD  CONSTRAINT [DF_UserInformation_CreatDate]  DEFAULT (getdate()) FOR [CreatDate]
GO
/****** Object:  Default [DF_UserInformation_LeavesId]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[UserInformation] ADD  CONSTRAINT [DF_UserInformation_LeavesId]  DEFAULT ((1)) FOR [LeavesId]
GO
/****** Object:  Default [DF_UserInformation_StopDate]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[UserInformation] ADD  CONSTRAINT [DF_UserInformation_StopDate]  DEFAULT (dateadd(hour,(2),getdate())) FOR [StopDate]
GO
/****** Object:  Default [DF_UserInformation_UserCalendar]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[UserInformation] ADD  CONSTRAINT [DF_UserInformation_UserCalendar]  DEFAULT ((1)) FOR [UserCalendar]
GO
/****** Object:  Default [DF_UserInformation_UserTypeface]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[UserInformation] ADD  CONSTRAINT [DF_UserInformation_UserTypeface]  DEFAULT ('中') FOR [UserTypeface]
GO
/****** Object:  Default [DF_UserInformation_Achievement]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[UserInformation] ADD  CONSTRAINT [DF_UserInformation_Achievement]  DEFAULT ((0)) FOR [Achievement]
GO
/****** Object:  Default [DF_EventInformation_EventPriority]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[EventInformation] ADD  CONSTRAINT [DF_EventInformation_EventPriority]  DEFAULT ((0)) FOR [EventPriority]
GO
/****** Object:  Default [DF_EventInformation_Complete]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[EventInformation] ADD  CONSTRAINT [DF_EventInformation_Complete]  DEFAULT ((0)) FOR [Complete]
GO
/****** Object:  Default [DF_EventInformation_LeavesEventSign]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[EventInformation] ADD  CONSTRAINT [DF_EventInformation_LeavesEventSign]  DEFAULT ((0)) FOR [LeavesEventSign]
GO
/****** Object:  Default [DF_EventInformation_EventNote]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[EventInformation] ADD  CONSTRAINT [DF_EventInformation_EventNote]  DEFAULT ('') FOR [EventNote]
GO
/****** Object:  Default [DF_EventInformation_Pid]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[EventInformation] ADD  CONSTRAINT [DF_EventInformation_Pid]  DEFAULT ((-99)) FOR [Pid]
GO
/****** Object:  Default [DF_DRemindInformation_DRemindRing]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[DRemindInformation] ADD  CONSTRAINT [DF_DRemindInformation_DRemindRing]  DEFAULT ((1)) FOR [DRemindRing]
GO
/****** Object:  Default [DF_DRemindInformation_DRemindRepeat]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[DRemindInformation] ADD  CONSTRAINT [DF_DRemindInformation_DRemindRepeat]  DEFAULT ((0)) FOR [DRemindRepeat]
GO
/****** Object:  Default [DF_DRemindInformation_AheadTime]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[DRemindInformation] ADD  CONSTRAINT [DF_DRemindInformation_AheadTime]  DEFAULT ((0)) FOR [AheadTime]
GO
/****** Object:  Default [DF_DRemindInformation_DRemindVib]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[DRemindInformation] ADD  CONSTRAINT [DF_DRemindInformation_DRemindVib]  DEFAULT ((0)) FOR [DRemindVib]
GO
/****** Object:  Default [DF_DRemindInformation_DefaultTime]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[DRemindInformation] ADD  CONSTRAINT [DF_DRemindInformation_DefaultTime]  DEFAULT ('4') FOR [DefaultTime]
GO
/****** Object:  Default [DF_DRemindInformation_DefaultLeavesTime]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[DRemindInformation] ADD  CONSTRAINT [DF_DRemindInformation_DefaultLeavesTime]  DEFAULT ((25)) FOR [LeavesTime]
GO
/****** Object:  Default [DF_DRemindInformation_EventId]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[DRemindInformation] ADD  CONSTRAINT [DF_DRemindInformation_EventId]  DEFAULT ((-99)) FOR [EventId]
GO
/****** Object:  Check [CKC_USERTYPEFACE_USERINFO]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [CKC_USERTYPEFACE_USERINFO] CHECK  (([UserTypeface]='小' OR [UserTypeface]='中' OR [UserTypeface]='大'))
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [CKC_USERTYPEFACE_USERINFO]
GO
/****** Object:  Check [CKC_EVENTPRIORITY_EVENTINF]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[EventInformation]  WITH CHECK ADD  CONSTRAINT [CKC_EVENTPRIORITY_EVENTINF] CHECK  (([EventPriority] IS NULL OR [EventPriority]>=(0) AND [EventPriority]<=(3)))
GO
ALTER TABLE [dbo].[EventInformation] CHECK CONSTRAINT [CKC_EVENTPRIORITY_EVENTINF]
GO
/****** Object:  ForeignKey [FK_LISTIFOR_NEW_USERINFO]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[ListInformation]  WITH CHECK ADD  CONSTRAINT [FK_LISTIFOR_NEW_USERINFO] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInformation] ([UserId])
GO
ALTER TABLE [dbo].[ListInformation] CHECK CONSTRAINT [FK_LISTIFOR_NEW_USERINFO]
GO
/****** Object:  ForeignKey [FK_LEAVESST_INCLUDE_USERINFO]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[LeavesStatistics]  WITH CHECK ADD  CONSTRAINT [FK_LEAVESST_INCLUDE_USERINFO] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInformation] ([UserId])
GO
ALTER TABLE [dbo].[LeavesStatistics] CHECK CONSTRAINT [FK_LEAVESST_INCLUDE_USERINFO]
GO
/****** Object:  ForeignKey [FK_UserInformation_LeaveSet]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_LeaveSet] FOREIGN KEY([LeavesId])
REFERENCES [dbo].[LeaveSet] ([LeavesId])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_LeaveSet]
GO
/****** Object:  ForeignKey [FK_UserInformation_UserInformation]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_UserInformation] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInformation] ([UserId])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_UserInformation]
GO
/****** Object:  ForeignKey [FK_UserInformation_UserInformation1]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_UserInformation1] FOREIGN KEY([StopUserId])
REFERENCES [dbo].[UserInformation] ([UserId])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_UserInformation1]
GO
/****** Object:  ForeignKey [FK_LEAVESET_SET_USERINFO]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[LeaveSet]  WITH CHECK ADD  CONSTRAINT [FK_LEAVESET_SET_USERINFO] FOREIGN KEY([Userid])
REFERENCES [dbo].[UserInformation] ([UserId])
GO
ALTER TABLE [dbo].[LeaveSet] CHECK CONSTRAINT [FK_LEAVESET_SET_USERINFO]
GO
/****** Object:  ForeignKey [FK_EventInformation_EventInformation]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[EventInformation]  WITH CHECK ADD  CONSTRAINT [FK_EventInformation_EventInformation] FOREIGN KEY([DRemindId])
REFERENCES [dbo].[DRemindInformation] ([DRemindId])
GO
ALTER TABLE [dbo].[EventInformation] CHECK CONSTRAINT [FK_EventInformation_EventInformation]
GO
/****** Object:  ForeignKey [FK_EventInformation_ListIformation]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[EventInformation]  WITH CHECK ADD  CONSTRAINT [FK_EventInformation_ListIformation] FOREIGN KEY([ListId])
REFERENCES [dbo].[ListInformation] ([ListId])
GO
ALTER TABLE [dbo].[EventInformation] CHECK CONSTRAINT [FK_EventInformation_ListIformation]
GO
/****** Object:  ForeignKey [FK_EventInformation_UserInformation]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[EventInformation]  WITH CHECK ADD  CONSTRAINT [FK_EventInformation_UserInformation] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInformation] ([UserId])
GO
ALTER TABLE [dbo].[EventInformation] CHECK CONSTRAINT [FK_EventInformation_UserInformation]
GO
/****** Object:  ForeignKey [FK_DREMINDI_DEFINE_USERINFO]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[DRemindInformation]  WITH CHECK ADD  CONSTRAINT [FK_DREMINDI_DEFINE_USERINFO] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInformation] ([UserId])
GO
ALTER TABLE [dbo].[DRemindInformation] CHECK CONSTRAINT [FK_DREMINDI_DEFINE_USERINFO]
GO
/****** Object:  ForeignKey [FK_APPEALIN_APPEAL_USERINFO]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[AppealInformation]  WITH CHECK ADD  CONSTRAINT [FK_APPEALIN_APPEAL_USERINFO] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInformation] ([UserId])
GO
ALTER TABLE [dbo].[AppealInformation] CHECK CONSTRAINT [FK_APPEALIN_APPEAL_USERINFO]
GO
/****** Object:  ForeignKey [FK_DEALWITH_被提交_USERMANA]    Script Date: 12/11/2018 11:02:53 ******/
ALTER TABLE [dbo].[DealWith]  WITH CHECK ADD  CONSTRAINT [FK_DEALWITH_被提交_USERMANA] FOREIGN KEY([UserManagerId])
REFERENCES [dbo].[UserManagerInformation] ([UserManagerId])
GO
ALTER TABLE [dbo].[DealWith] CHECK CONSTRAINT [FK_DEALWITH_被提交_USERMANA]
GO
