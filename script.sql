USE [master]
GO
/****** Object:  Database [ERPFIS]    Script Date: 6/9/2020 11:09:10 PM ******/
CREATE DATABASE [ERPFIS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ERPFIS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ERPFIS.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ERPFIS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ERPFIS_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ERPFIS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ERPFIS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ERPFIS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ERPFIS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ERPFIS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ERPFIS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ERPFIS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ERPFIS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ERPFIS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ERPFIS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ERPFIS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ERPFIS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ERPFIS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ERPFIS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ERPFIS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ERPFIS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ERPFIS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ERPFIS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ERPFIS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ERPFIS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ERPFIS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ERPFIS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ERPFIS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ERPFIS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ERPFIS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ERPFIS] SET  MULTI_USER 
GO
ALTER DATABASE [ERPFIS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ERPFIS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ERPFIS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ERPFIS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ERPFIS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ERPFIS] SET QUERY_STORE = OFF
GO
USE [ERPFIS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ERPFIS]
GO
/****** Object:  Table [dbo].[AssignedRoles]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedRoles](
	[AssignedRolesID] [int] IDENTITY(1,1) NOT NULL,
	[AssignToAdmin] [int] NULL,
	[Status] [varchar](1) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[RegistrationID] [int] NULL,
 CONSTRAINT [PK_AssignedRoles] PRIMARY KEY CLUSTERED 
(
	[AssignedRolesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditTB]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditTB](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](50) NULL,
	[SessionID] [varchar](50) NULL,
	[IPAddress] [varchar](50) NULL,
	[PageAccessed] [varchar](200) NULL,
	[LoggedInAt] [datetime] NULL,
	[LoggedOutAt] [datetime] NULL,
	[LoginStatus] [varchar](200) NULL,
	[ControllerName] [varchar](200) NULL,
	[ActionName] [varchar](200) NULL,
	[UrlReferrer] [varchar](200) NULL,
 CONSTRAINT [PK_AuditTB] PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DescriptionTB]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DescriptionTB](
	[DescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NULL,
	[ProjectID] [int] NULL,
	[TimeSheetMasterID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_DescriptionTB] PRIMARY KEY CLUSTERED 
(
	[DescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [varchar](50) NULL,
	[DocumentBytes] [varbinary](max) NULL,
	[UserID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ExpenseID] [int] NULL,
	[DocumentType] [varchar](10) NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [ntext] NOT NULL,
 CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expense]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense](
	[ExpenseID] [int] IDENTITY(1,1) NOT NULL,
	[PurposeorReason] [varchar](50) NULL,
	[ExpenseStatus] [int] NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[VoucherID] [varchar](50) NULL,
	[HotelBills] [int] NULL,
	[TravelBills] [int] NULL,
	[MealsBills] [int] NULL,
	[LandLineBills] [int] NULL,
	[TransportBills] [int] NULL,
	[MobileBills] [int] NULL,
	[Miscellaneous] [int] NULL,
	[TotalAmount] [int] NULL,
	[UserID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[Comment] [varchar](100) NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK_Expense] PRIMARY KEY CLUSTERED 
(
	[ExpenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseAuditTB]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseAuditTB](
	[ApprovaExpenselLogID] [int] IDENTITY(1,1) NOT NULL,
	[ApprovalUser] [int] NULL,
	[ProcessedDate] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[Comment] [varchar](100) NULL,
	[Status] [int] NULL,
	[ExpenseID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_ExpenseAuditTB] PRIMARY KEY CLUSTERED 
(
	[ApprovaExpenselLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [varchar](30) NOT NULL,
	[Name] [varchar](50) NULL,
	[ParentId] [varchar](30) NULL,
	[SortOrder_] [int] NULL,
	[UrlLink] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[Icon] [varchar](100) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationsTB]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationsTB](
	[NotificationsID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
 CONSTRAINT [PK_NotificationsTB] PRIMARY KEY CLUSTERED 
(
	[NotificationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationName] [varchar](50) NOT NULL,
	[OrganizationParent] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectMaster]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectMaster](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](100) NULL,
	[NatureofIndustry] [varchar](100) NULL,
	[ProjectCode] [varchar](10) NULL,
 CONSTRAINT [PK_ProjectMaster] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Mobileno] [varchar](20) NULL,
	[EmailID] [varchar](100) NULL,
	[Username] [varchar](20) NULL,
	[Password] [varchar](100) NULL,
	[ConfirmPassword] [varchar](100) NULL,
	[Gender] [varchar](10) NULL,
	[Birthdate] [datetime] NULL,
	[RoleID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[EmployeeID] [varchar](10) NULL,
	[DateofJoining] [date] NULL,
	[ForceChangePassword] [int] NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[RegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Rolename] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheetAuditTB]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetAuditTB](
	[ApprovalTimeSheetLogID] [int] IDENTITY(1,1) NOT NULL,
	[ApprovalUser] [int] NULL,
	[ProcessedDate] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[Comment] [varchar](100) NULL,
	[Status] [int] NULL,
	[TimeSheetID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_TimeSheetAuditTB] PRIMARY KEY CLUSTERED 
(
	[ApprovalTimeSheetLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheetDetails]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetDetails](
	[TimeSheetID] [int] IDENTITY(1,1) NOT NULL,
	[DaysofWeek] [varchar](50) NULL,
	[Hours] [int] NULL,
	[Period] [date] NULL,
	[ProjectID] [int] NULL,
	[UserID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[TimeSheetMasterID] [int] NULL,
	[TotalHours] [int] NULL,
 CONSTRAINT [PK_TimeSheetDetails] PRIMARY KEY CLUSTERED 
(
	[TimeSheetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheetMaster]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetMaster](
	[TimeSheetMasterID] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[TotalHours] [int] NULL,
	[UserID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[Comment] [varchar](100) NULL,
	[TimeSheetStatus] [int] NULL,
 CONSTRAINT [PK_TimeSheetMaster] PRIMARY KEY CLUSTERED 
(
	[TimeSheetMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkPlace]    Script Date: 6/9/2020 11:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkPlace](
	[WorkPlaceID] [int] IDENTITY(1,1) NOT NULL,
	[WorkPlaceName] [varchar](50) NOT NULL,
	[WorkPlaceParent] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ELMAH_Error_App_Time_Seq]    Script Date: 6/9/2020 11:09:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_ELMAH_Error_App_Time_Seq] ON [dbo].[ELMAH_Error]
(
	[Application] ASC,
	[TimeUtc] DESC,
	[Sequence] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml]
(
    @Application NVARCHAR(60),
    @PageIndex INT = 0,
    @PageSize INT = 15,
    @TotalCount INT OUTPUT
)
AS 

    SET NOCOUNT ON

    DECLARE @FirstTimeUTC DATETIME
    DECLARE @FirstSequence INT
    DECLARE @StartRow INT
    DECLARE @StartRowIndex INT

    SELECT 
        @TotalCount = COUNT(1) 
    FROM 
        [ELMAH_Error]
    WHERE 
        [Application] = @Application

    -- Get the ID of the first error for the requested page

    SET @StartRowIndex = @PageIndex * @PageSize + 1

    IF @StartRowIndex <= @TotalCount
    BEGIN

        SET ROWCOUNT @StartRowIndex

        SELECT  
            @FirstTimeUTC = [TimeUtc],
            @FirstSequence = [Sequence]
        FROM 
            [ELMAH_Error]
        WHERE   
            [Application] = @Application
        ORDER BY 
            [TimeUtc] DESC, 
            [Sequence] DESC

    END
    ELSE
    BEGIN

        SET @PageSize = 0

    END

    -- Now set the row count to the requested page size and get
    -- all records below it for the pertaining application.

    SET ROWCOUNT @PageSize

    SELECT 
        errorId     = [ErrorId], 
        application = [Application],
        host        = [Host], 
        type        = [Type],
        source      = [Source],
        message     = [Message],
        [user]      = [User],
        statusCode  = [StatusCode], 
        time        = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'
    FROM 
        [ELMAH_Error] error
    WHERE
        [Application] = @Application
    AND
        [TimeUtc] <= @FirstTimeUTC
    AND 
        [Sequence] <= @FirstSequence
    ORDER BY
        [TimeUtc] DESC, 
        [Sequence] DESC
    FOR
        XML AUTO
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml]
(
    @Application NVARCHAR(60),
    @ErrorId UNIQUEIDENTIFIER
)
AS

    SET NOCOUNT ON

    SELECT 
        [AllXml]
    FROM 
        [ELMAH_Error]
    WHERE
        [ErrorId] = @ErrorId
    AND
        [Application] = @Application
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELMAH_LogError]
(
    @ErrorId UNIQUEIDENTIFIER,
    @Application NVARCHAR(60),
    @Host NVARCHAR(30),
    @Type NVARCHAR(100),
    @Source NVARCHAR(60),
    @Message NVARCHAR(500),
    @User NVARCHAR(50),
    @AllXml NTEXT,
    @StatusCode INT,
    @TimeUtc DATETIME
)
AS

    SET NOCOUNT ON

    INSERT
    INTO
        [ELMAH_Error]
        (
            [ErrorId],
            [Application],
            [Host],
            [Type],
            [Source],
            [Message],
            [User],
            [AllXml],
            [StatusCode],
            [TimeUtc]
        )
    VALUES
        (
            @ErrorId,
            @Application,
            @Host,
            @Type,
            @Source,
            @Message,
            @User,
            @AllXml,
            @StatusCode,
            @TimeUtc
        )
GO
/****** Object:  StoredProcedure [dbo].[GetDescriptionbyTimeSheetMasterID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetDescriptionbyTimeSheetMasterID]      
@TimeSheetMasterID int   ,  
@ProjectID int   
as      
begin      

select Description from DescriptionTB where TimeSheetMasterID =@TimeSheetMasterID and ProjectID =@ProjectID  
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserIDbyExpenseID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[GetUserIDbyExpenseID]
@ExpenseID int
as
begin
select top 1 UserID from Expense where ExpenseID =@ExpenseID
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserIDbyTimeSheetID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetUserIDbyTimeSheetID]
@TimeSheetMasterID int
as
begin
select top 1 UserID from TimeSheetMaster where TimeSheetMasterID =@TimeSheetMasterID
end
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-6c69e1b9-15ed-43d1-9bf6-457d53154079]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-6c69e1b9-15ed-43d1-9bf6-457d53154079] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-6c69e1b9-15ed-43d1-9bf6-457d53154079]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-6c69e1b9-15ed-43d1-9bf6-457d53154079] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-6c69e1b9-15ed-43d1-9bf6-457d53154079') > 0)   DROP SERVICE [SqlQueryNotificationService-6c69e1b9-15ed-43d1-9bf6-457d53154079]; if (OBJECT_ID('SqlQueryNotificationService-6c69e1b9-15ed-43d1-9bf6-457d53154079', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-6c69e1b9-15ed-43d1-9bf6-457d53154079]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-6c69e1b9-15ed-43d1-9bf6-457d53154079]; END COMMIT TRANSACTION; END
GO
/****** Object:  StoredProcedure [dbo].[Usp_ChangeExpenseStatus]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_ChangeExpenseStatus]
@Status int,
@ExpenseID int,
@Comment varchar(100)
as
begin
Update dbo.ExpenseAuditTB
set 
Status = @Status,
Comment = @Comment,
ProcessedDate =getdate()
where ExpenseID = @ExpenseID and Status <> 1
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_ChangeTimesheetStatus]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ChangeTimesheetStatus]
@Status int,
@TimeSheetID int,
@Comment varchar(100)
as
begin
Update dbo.TimeSheetAuditTB
set 
Status = @Status,
Comment = @Comment,
ProcessedDate =getdate()
where TimeSheetID = @TimeSheetID and Status <> 1
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_CheckIsDateAlreadyUsed]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_CheckIsDateAlreadyUsed]
@FromDate date,
@ToDate date,
@UserID int
as
begin

SELECT COUNT(1)
  FROM [ERPFIS].[dbo].[Expense]
  where ToDate between @FromDate and @ToDate and UserID =@UserID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_CheckIsDateAlreadyUsed_New]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_CheckIsDateAlreadyUsed_New]
@FromDate datetime,
@ToDate datetime,
@UserID int
as
begin

SELECT COUNT(1)
  FROM [ERPFIS].[dbo].[TimeSheet_New]
  where ToDateTime between @FromDate and @ToDate and UserID =@UserID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteExpenseandDocuments]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeleteExpenseandDocuments]  
@ExpenseID int ,
@UserID int 
as  
begin  
Delete from Expense where ExpenseID =@ExpenseID and UserID =@UserID  
  
if exists (select DocumentID from dbo.Documents where ExpenseID =@ExpenseID and UserID =@UserID )  
begin  
Delete from Documents where ExpenseID =@ExpenseID and UserID =@UserID  
end  
  
if exists (select ApprovaExpenselLogID from dbo.ExpenseAuditTB where ExpenseID =@ExpenseID and UserID =@UserID)  
begin  
Delete from ExpenseAuditTB where ExpenseID =@ExpenseID and UserID =@UserID  
end  
  
  
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteTimeSheet]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeleteTimeSheet]
@TimeSheetID int,
@UserID int
as
begin

Delete from TimeSheetMaster where TimeSheetMasterID =@TimeSheetID and UserID =@UserID

if exists (select TimeSheetID from dbo.TimeSheetDetails where TimeSheetID =@TimeSheetID and UserID =@UserID)
begin
Delete from TimeSheetDetails where TimeSheetID =@TimeSheetID and UserID =@UserID
end

if exists (select TimeSheetID from dbo.TimeSheetAuditTB where TimeSheetID =@TimeSheetID and UserID =@UserID)
begin
Delete from TimeSheetAuditTB where TimeSheetID =@TimeSheetID and UserID =@UserID
end

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DisableExistingNotifications]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Usp_DisableExistingNotifications]
as
begin

update NotificationsTB
set NotificationsTB.Status ='D'

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAdminCount]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_GetAdminCount]
as
begin
Select Count (1) as AdminCount FROM [ERPFIS].[dbo].[Registration] where RoleID =1
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAdminDetailsByRegistrationID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_GetAdminDetailsByRegistrationID]  
@RegistrationID int  
as  
begin  
select  
EmployeeID,    
Name,  
Mobileno,  
EmailID,  
Username,  
Case when Gender ='M' then 'Male'  when Gender ='F' then 'Female' End Gender,  
CONVERT(VARCHAR(10), Birthdate, 101) as Birthdate,  
CONVERT(VARCHAR(10), DateofJoining, 101) as DateofJoining  
from Registration where RoleID =1 and RegistrationID =@RegistrationID  
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAdminIDbyUserID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Usp_GetAdminIDbyUserID]
@UserID int
as
begin
SELECT 
      [AssignToAdmin]
  FROM [ERPFIS].[dbo].[AssignedRoles] where RegistrationID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllReportofExpense]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetAllReportofExpense]    
@FromDate date = null,      
@ToDate date  = null
  
as    
begin    
    
SELECT     
       PM.ProjectName           
      ,[PurposeorReason]    
      ,Reg.Name    
      ,case when ExpenseStatus =1 then 'Submitted' when ExpenseStatus =2 then 'Approved' when ExpenseStatus =3 then 'Rejected' end as Status    
      ,[Comment]    
      ,[FromDate]    
      ,[ToDate]    
      ,[VoucherID]    
      ,[HotelBills]    
      ,[TravelBills]    
      ,[MealsBills]    
      ,[LandLineBills]    
      ,[TransportBills]    
      ,[MobileBills]    
      ,[Miscellaneous]    
      ,[TotalAmount]    
      ,ex.CreatedOn        
  FROM [ERPFIS].[dbo].[Expense] ex    
  inner join Registration Reg on reg.RegistrationID = ex.UserID    
  inner join ProjectMaster PM on ex.ProjectID =PM.ProjectID    
  where FromDate  between @FromDate and @ToDate  
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetExpenseAuditCountByAdminID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_GetExpenseAuditCountByAdminID] 
@AdminID int 
as
begin
 select ApprovalUser,
    count(case when Status = 1 then 1 else NULL end) SubmittedCount,
    count(case when Status = 2 then 1 else NULL end) ApprovedCount,
    count(case when Status = 3 then 1 else NULL end) RejectedCount
from ExpenseAuditTB
where ApprovalUser = @AdminID 
group by ApprovalUser
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetExpenseAuditCountByUserID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_GetExpenseAuditCountByUserID]
@UserID int   
as  
begin  
 select UserID,  
    count(case when Status = 1 then 1 else NULL end) SubmittedCount,  
    count(case when Status = 2 then 1 else NULL end) ApprovedCount,  
    count(case when Status = 3 then 1 else NULL end) RejectedCount  
from ExpenseAuditTB  
where UserID = @UserID   
group by UserID  
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetHoursbyTimeSheetMasterID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetHoursbyTimeSheetMasterID]    
@TimeSheetMasterID int   ,
@ProjectID int 
as    
begin    
    
SELECT     
      Hours 
  FROM [TimeSheetDetails]     
  where TimeSheetMasterID =@TimeSheetMasterID and ProjectID =@ProjectID
  
  union all
  
  SELECT     
      SUM(Hours) 
  FROM [TimeSheetDetails]     
  where TimeSheetMasterID =@TimeSheetMasterID and ProjectID =@ProjectID 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetListofAdmins]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetListofAdmins]  
  
as  
begin  
select RegistrationID, UPPER(Name) as Name from Registration where RoleID = 1  
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetListofMenus]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetListofMenus]  
  
as  
begin  
select Id
      ,Name
      ,ParentId
      ,SortOrder_
	  ,UrlLink
	  ,Icon
	  ,(select count(*)from menu m2 where m2.ParentId=m.Id)ChildCount
  FROM menu m where IsActive=1
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetListofRoles]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetListofRoles]  
  
as  
begin  
select RoleID, UPPER(Rolename) Rolename from Roles
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetListofUnAssignedUsers]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_GetListofUnAssignedUsers]      
      
as      
begin      
      
select * from dbo.Registration R       
where R.RoleID =2 and r.RegistrationID not in (
Select RegistrationID from dbo.AssignedRoles
)    
      
      
--RoleID Rolename      
--1 Admin      
--2 Users      
--3 SuperAdmin      
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetPeriodsbyTimeSheetMasterID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetPeriodsbyTimeSheetMasterID]      
@TimeSheetMasterID int      
as      
begin      
      
SELECT       
      CONVERT(varchar(10),T.Period) as Period    
  FROM [ERPFIS].[dbo].[TimeSheetDetails] T       
  inner join TimeSheetAuditTB TA on T.TimeSheetMasterID = TA.TimeSheetID  
  where TimeSheetMasterID =@TimeSheetMasterID       
  group by Period      
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetProjectCount]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_GetProjectCount]
as
begin
  Select Count (1) as ProjectCount FROM [ERPFIS].[dbo].[ProjectMaster]
  end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetProjectNamesbyTimeSheetMasterID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_GetProjectNamesbyTimeSheetMasterID]
@TimeSheetMasterID int
as
begin

  SELECT 
      TM.ProjectID,
      PM.ProjectName
  FROM [TimeSheetDetails] TM
  inner join ProjectMaster PM on TM.ProjectID =PM.ProjectID 
  where  TM.TimeSheetMasterID =@TimeSheetMasterID 
  group by TM.[ProjectID],PM.ProjectName
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetReportofExpense]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetReportofExpense]    
@FromDate date = null,      
@ToDate date  = null,  
@AssignTo int        
as    
begin    
    
SELECT     
       PM.ProjectName           
      ,[PurposeorReason]    
      ,Reg.Name    
      ,case when ExpenseStatus =1 then 'Submitted' when ExpenseStatus =2 then 'Approved' when ExpenseStatus =3 then 'Rejected' end as Status    
      ,EA.Comment as Comment   
      ,[FromDate]    
      ,[ToDate]    
      ,[VoucherID]    
      ,[HotelBills]    
      ,[TravelBills]    
      ,[MealsBills]    
      ,[LandLineBills]    
      ,[TransportBills]    
      ,[MobileBills]    
      ,[Miscellaneous]    
      ,[TotalAmount]    
      ,ex.CreatedOn        
  FROM [ERPFIS].[dbo].[Expense] ex    
  inner join Registration Reg on reg.RegistrationID = ex.UserID    
  inner join ProjectMaster PM on ex.ProjectID =PM.ProjectID 
  inner join AssignedRoles AR on reg.RegistrationID = AR.RegistrationID   
  inner join ExpenseAuditTB EA on ex.ExpenseID = EA.ExpenseID 
  where FromDate  between @FromDate and @ToDate and AR.AssignToAdmin =@AssignTo and EA.Status = 2      
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetTimeSheetbyFromDateandToDateTimeSheet]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetTimeSheetbyFromDateandToDateTimeSheet]  
@FromDate date = null,  
@ToDate date  = null
as  
begin  
  
SELECT [TimeSheetMasterID]  
FROM [ERPFIS].[dbo].[TimeSheetMaster]  
where FromDate  between @FromDate and @ToDate 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetTimeSheetMasterIDTimeSheet]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetTimeSheetMasterIDTimeSheet]  
@FromDate Date = null,  
@ToDate Date  = null,  
@UserID int  
as  
begin  
  

SELECT [TimeSheetMasterID]  
FROM [ERPFIS].[dbo].[TimeSheetMaster]  
where FromDate  between @FromDate and @ToDate and UserID = @UserID  
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetTimeSheetsCountByAdminID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetTimeSheetsCountByAdminID] 
@AdminID int 
as
begin
 select ApprovalUser,
    count(case when Status = 1 then 1 else NULL end) SubmittedCount,
    count(case when Status = 2 then 1 else NULL end) ApprovedCount,
    count(case when Status = 3 then 1 else NULL end) RejectedCount
from TimeSheetAuditTB
where ApprovalUser = @AdminID 
group by ApprovalUser
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetTimeSheetsCountByUserID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetTimeSheetsCountByUserID]   
@UserID int   
as  
begin  
 select UserID,  
    count(case when Status = 1 then 1 else NULL end) SubmittedCount,  
    count(case when Status = 2 then 1 else NULL end) ApprovedCount,  
    count(case when Status = 3 then 1 else NULL end) RejectedCount  
from TimeSheetAuditTB 
where UserID = @UserID   
group by UserID  
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetUserDetailsByRegistrationID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_GetUserDetailsByRegistrationID]
@RegistrationID int
as
begin
select
EmployeeID,  
Name,
Mobileno,
EmailID,
Username,
Case when Gender ='M' then 'Male'  when Gender ='F' then 'Female' End Gender,
CONVERT(VARCHAR(10), Birthdate, 101) as Birthdate,
CONVERT(VARCHAR(10), DateofJoining, 101) as DateofJoining
from Registration where 
--RoleID =2 and 
RegistrationID =@RegistrationID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetUsernamebyRegistrationID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetUsernamebyRegistrationID]  
@RegistrationID int  
as  
begin  
SELECT   replace(Name, ' ', '')
FROM Registration  
where RegistrationID =@RegistrationID 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetUsersCount]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_GetUsersCount]
as
begin
Select Count (1) as UsersCount FROM [ERPFIS].[dbo].[Registration]where RoleID =2
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetUsersCountbyAdmin]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_GetUsersCountbyAdmin]
@AdminID int 
as
begin
Select Count (1) as UsersCount FROM AssignedRoles where AssignToAdmin =@AdminID  
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetUsersCountbyAdminByAdminID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetUsersCountbyAdminByAdminID] 
@AdminID int 
as
begin
 select ApprovalUser,
    count(case when Status = 1 then 1 else NULL end) SubmittedCount,
    count(case when Status = 2 then 1 else NULL end) ApprovedCount,
    count(case when Status = 3 then 1 else NULL end) RejectedCount
from TimeSheetAuditTB
where ApprovalUser = @AdminID 
group by ApprovalUser
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetWeekTimeSheetDetails]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetWeekTimeSheetDetails]
@TimeSheetMasterID int
as
begin
select TM.DaysofWeek
      ,TM.Hours
      ,TM.Period
      ,PM.ProjectName
      ,TM.CreatedOn
      from TimeSheetDetails TM
Inner join ProjectMaster PM on TM.ProjectID = PM.ProjectID 
where TimeSheetMasterID = @TimeSheetMasterID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateExpenseStatus]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_UpdateExpenseStatus]
@ExpenseID int,
@Comment varchar(100),
@ExpenseStatus int
as
begin
update Expense
set Expense.ExpenseStatus =@ExpenseStatus,
Expense.Comment =@Comment
where Expense.ExpenseID =@ExpenseID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_Updatepassword]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_Updatepassword]
@NewPassword varchar(100),
@UserID int
as
begin

update Registration 
set Password = @NewPassword
where Registration.RegistrationID = @UserID  
  
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdatePasswordbyRegistrationID]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_UpdatePasswordbyRegistrationID]
@RegistrationID int,
@Password varchar(100)
as
begin
Update Registration
set Registration.Password = @Password
where Registration.RegistrationID =@RegistrationID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateTimeSheetStatus]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_UpdateTimeSheetStatus]  
@TimeSheetMasterID int,  
@Comment varchar(100),  
@TimeSheetStatus int  
as  
begin  
update TimeSheetMaster  
set TimeSheetMaster.TimeSheetStatus =@TimeSheetStatus,  
TimeSheetMaster.Comment =@Comment  
where TimeSheetMaster.TimeSheetMasterID =@TimeSheetMasterID  
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateUserRole]    Script Date: 6/9/2020 11:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_UpdateUserRole]  
@RegistrationID int  
as      
begin      
Delete from AssignedRoles where RegistrationID = @RegistrationID  
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'It is Registration Table  RegistrationID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignedRoles'
GO
USE [master]
GO
ALTER DATABASE [ERPFIS] SET  READ_WRITE 
GO
