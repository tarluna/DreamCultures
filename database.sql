USE [Dream]
GO
/****** Object:  User [DreamCultures]    Script Date: 2/27/2017 10:12:02 AM ******/
CREATE USER [DreamCultures] FOR LOGIN [DreamCultures] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DreamCultures]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/27/2017 10:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Name] [nvarchar](128) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dream]    Script Date: 2/27/2017 10:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dream](
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](128) NOT NULL,
	[Date] [date] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuarterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Dream] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dream_Pillar]    Script Date: 2/27/2017 10:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dream_Pillar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DreamID] [int] NOT NULL,
	[PillarID] [int] NOT NULL,
 CONSTRAINT [PK_Dream_Pillar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pillars]    Script Date: 2/27/2017 10:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pillars](
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](128) NOT NULL,
	[Active] [smallint] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Pillars] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Position]    Script Date: 2/27/2017 10:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Name] [nvarchar](128) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quarter]    Script Date: 2/27/2017 10:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quarter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](128) NULL,
	[Description] [nvarchar](128) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Active] [smallint] NULL,
 CONSTRAINT [PK_Quarter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2/27/2017 10:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[LastName] [nvarchar](128) NOT NULL,
	[NumberRegistration] [int] NULL,
	[BirthDate] [date] NOT NULL,
	[PositionID] [int] NULL,
	[DepartmentID] [int] NULL,
	[UserTypeID] [int] NOT NULL,
	[Gender] [smallint] NOT NULL,
	[Active] [smallint] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserType]    Script Date: 2/27/2017 10:12:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[Name] [nvarchar](128) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Dream]  WITH CHECK ADD  CONSTRAINT [FK_Dream_Quarter] FOREIGN KEY([QuarterID])
REFERENCES [dbo].[Quarter] ([ID])
GO
ALTER TABLE [dbo].[Dream] CHECK CONSTRAINT [FK_Dream_Quarter]
GO
ALTER TABLE [dbo].[Dream]  WITH CHECK ADD  CONSTRAINT [FK_Dream_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Dream] CHECK CONSTRAINT [FK_Dream_User]
GO
ALTER TABLE [dbo].[Dream_Pillar]  WITH CHECK ADD  CONSTRAINT [FK_Dream_Pillar_Dream_Pillar] FOREIGN KEY([DreamID])
REFERENCES [dbo].[Dream] ([ID])
GO
ALTER TABLE [dbo].[Dream_Pillar] CHECK CONSTRAINT [FK_Dream_Pillar_Dream_Pillar]
GO
ALTER TABLE [dbo].[Dream_Pillar]  WITH CHECK ADD  CONSTRAINT [FK_Dream_Pillar_Pillars] FOREIGN KEY([PillarID])
REFERENCES [dbo].[Pillars] ([ID])
GO
ALTER TABLE [dbo].[Dream_Pillar] CHECK CONSTRAINT [FK_Dream_Pillar_Pillars]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
