USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[PlayerStatistics]    Script Date: 03/10/2008 17:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerStatistics](
	[playerID] [int] NOT NULL,
	[gameID] [int] NOT NULL,
	[goalsScored] [int] NULL,
	[assists] [int] NULL,
	[goalsConceeded] [int] NULL,
	[shotsSaved] [int] NULL,
	[penaltySaved] [int] NULL,
	[penaltyMissed] [int] NULL,
	[yellowCards] [int] NULL,
	[redCards] [int] NULL,
	[started] [bit] NULL,
	[played] [bit] NULL,
 CONSTRAINT [PK_PlayerStatistics] PRIMARY KEY CLUSTERED 
(
	[playerID] ASC,
	[gameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[PlayerStatistics]  WITH CHECK ADD  CONSTRAINT [FK_PlayerStatistics_Game] FOREIGN KEY([gameID])
REFERENCES [dbo].[Game] ([gameID]) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerStatistics] CHECK CONSTRAINT [FK_PlayerStatistics_Game]
GO
ALTER TABLE [dbo].[PlayerStatistics]  WITH CHECK ADD  CONSTRAINT [FK_PlayerStatistics_Player] FOREIGN KEY([playerID])
REFERENCES [dbo].[Player] ([playerID]) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerStatistics] CHECK CONSTRAINT [FK_PlayerStatistics_Player]