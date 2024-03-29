USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 03/10/2008 16:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Team](
	[teamID] [int] NOT NULL,
	[name] [varchar](30) NOT NULL,
	[leagueID] [int] NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[teamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [teamInLeague] FOREIGN KEY([leagueID])
REFERENCES [dbo].[League] ([leagueID]) ON UPDATE CASCADE ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [teamInLeague]