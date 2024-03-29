USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[FantasyLeagueRegistration]    Script Date: 03/10/2008 17:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FantasyLeagueRegistration](
	[fantasyTeamID] [int] NOT NULL,
	[fantasyLeagueID] [int] NOT NULL,
 CONSTRAINT [PK_FantasyLeagueRegistration] PRIMARY KEY CLUSTERED 
(
	[fantasyTeamID] ASC,
	[fantasyLeagueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FantasyLeagueRegistration]  WITH CHECK ADD  CONSTRAINT [FK_FantasyLeagueRegistration_FantasyLeague] FOREIGN KEY([fantasyLeagueID])
REFERENCES [dbo].[FantasyLeague] ([fantasyLeagueID]) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FantasyLeagueRegistration] CHECK CONSTRAINT [FK_FantasyLeagueRegistration_FantasyLeague]
GO
ALTER TABLE [dbo].[FantasyLeagueRegistration]  WITH CHECK ADD  CONSTRAINT [FK_FantasyLeagueRegistration_FantasyTeam] FOREIGN KEY([fantasyTeamID])
REFERENCES [dbo].[FantasyTeam] ([fantasyTeamID]) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FantasyLeagueRegistration] CHECK CONSTRAINT [FK_FantasyLeagueRegistration_FantasyTeam]