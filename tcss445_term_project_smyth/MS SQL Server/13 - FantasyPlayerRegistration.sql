USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[FantasyPlayerRegistration]    Script Date: 03/10/2008 17:09:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FantasyPlayerRegistration](
	[fantasyTeamID] [int] NOT NULL,
	[playerID] [int] NOT NULL,
	[dateJoined] [datetime] NULL,
	[dateLeft] [datetime] NULL,
 CONSTRAINT [PK_FantasyPlayerRegistration] PRIMARY KEY CLUSTERED 
(
	[fantasyTeamID] ASC,
	[playerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FantasyPlayerRegistration]  WITH CHECK ADD  CONSTRAINT [FK_FantasyPlayerRegistration_FantasyTeam] FOREIGN KEY([fantasyTeamID])
REFERENCES [dbo].[FantasyTeam] ([fantasyTeamID]) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FantasyPlayerRegistration] CHECK CONSTRAINT [FK_FantasyPlayerRegistration_FantasyTeam]
GO
ALTER TABLE [dbo].[FantasyPlayerRegistration]  WITH CHECK ADD  CONSTRAINT [FK_FantasyPlayerRegistration_Player] FOREIGN KEY([playerID])
REFERENCES [dbo].[Player] ([playerID]) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FantasyPlayerRegistration] CHECK CONSTRAINT [FK_FantasyPlayerRegistration_Player]