USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[LeagueCommissioner]    Script Date: 03/10/2008 17:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeagueCommissioner](
	[commissionerID] [int] NOT NULL,
 CONSTRAINT [PK_LeagueCommissioner] PRIMARY KEY CLUSTERED 
(
	[commissionerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[LeagueCommissioner]  WITH CHECK ADD  CONSTRAINT [FK_LeagueCommissioner_User] FOREIGN KEY([commissionerID])
REFERENCES [dbo].[User] ([userID]) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LeagueCommissioner] CHECK CONSTRAINT [FK_LeagueCommissioner_User]