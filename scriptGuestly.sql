USE [GuestlyDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29-08-2023 16:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressInfos]    Script Date: 29-08-2023 16:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressInfos](
	[AddressInfoId] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](max) NULL,
	[Number] [nvarchar](max) NULL,
	[Box] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[GuestInfoID] [int] NOT NULL,
 CONSTRAINT [PK_AddressInfos] PRIMARY KEY CLUSTERED 
(
	[AddressInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuestInfos]    Script Date: 29-08-2023 16:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestInfos](
	[GuestId] [int] IDENTITY(1,1) NOT NULL,
	[GuestName] [nvarchar](max) NULL,
	[Telephone] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[WebSite] [nvarchar](max) NULL,
 CONSTRAINT [PK_GuestInfos] PRIMARY KEY CLUSTERED 
(
	[GuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AddressInfos]  WITH CHECK ADD  CONSTRAINT [FK_AddressInfos_GuestInfos_GuestInfoID] FOREIGN KEY([GuestInfoID])
REFERENCES [dbo].[GuestInfos] ([GuestId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AddressInfos] CHECK CONSTRAINT [FK_AddressInfos_GuestInfos_GuestInfoID]
GO
