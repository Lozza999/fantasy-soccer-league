USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[FantasyLeague]    Script Date: 03/10/2008 17:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FantasyLeague](
	[fantasyLeagueID] [int] NOT NULL,
	[name] [varchar](40) NOT NULL,
	[dateCreated] [datetime] NOT NULL,
	[commissionerID] [int] NOT NULL,
 CONSTRAINT [PK_FantasyLeague] PRIMARY KEY CLUSTERED 
(
	[fantasyLeagueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FantasyLeague]  WITH CHECK ADD  CONSTRAINT [FK_FantasyLeague_LeagueCommissioner] FOREIGN KEY([commissionerID])
REFERENCES [dbo].[LeagueCommissioner] ([commissionerID]) ON UPDATE CASCADE ON DELETE CASCADE	
GO
ALTER TABLE [dbo].[FantasyLeague] CHECK CONSTRAINT [FK_FantasyLeague_LeagueCommissioner]