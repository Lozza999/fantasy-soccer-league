USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[User]    Script Date: 03/10/2008 17:02:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] NOT NULL,
	[password] [int] NOT NULL,
	[email] [varchar](60) NOT NULL,
	[fName] [varchar](20) NULL,
	[lName] [varchar](30) NOT NULL,
	[regDate] [datetime] NOT NULL,
	[zipcode] [int] NULL,
	[country] [varchar](30) NULL,
	[gender] [varchar](1) NULL,
	[dob] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF