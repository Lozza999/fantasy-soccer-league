USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 03/10/2008 16:50:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Player](
	[playerID] [int] NOT NULL,
	[salary] [int] NULL,
	[fName] [varchar](20) NULL,
	[lName] [varchar](30) NOT NULL,
	[position] [varchar](50) NOT NULL,
	[dob] [datetime] NOT NULL,
	[country] [varchar](30) NOT NULL,
	[cost] [int] NOT NULL,
	[teamID] [int] NOT NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[playerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Team] FOREIGN KEY([teamID])
REFERENCES [dbo].[Team] ([teamID])ON UPDATE CASCADE ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_Team]