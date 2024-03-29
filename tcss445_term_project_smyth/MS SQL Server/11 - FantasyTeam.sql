USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[FantasyTeam]    Script Date: 03/10/2008 17:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FantasyTeam](
	[fantasyTeamID] [int] NOT NULL,
	[name] [varchar](40) NOT NULL,
	[captain] [varchar](30) NOT NULL,
	[value] [int] NOT NULL,
	[managerID] [int] NOT NULL,
 CONSTRAINT [PK_FantasyTeam] PRIMARY KEY CLUSTERED 
(
	[fantasyTeamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FantasyTeam]  WITH CHECK ADD  CONSTRAINT [FK_FantasyTeam_TeamManager] FOREIGN KEY([managerID])
REFERENCES [dbo].[TeamManager] ([managerID]) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FantasyTeam] CHECK CONSTRAINT [FK_FantasyTeam_TeamManager]