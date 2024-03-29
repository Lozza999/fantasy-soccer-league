USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[TeamManager]    Script Date: 03/10/2008 17:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamManager](
	[managerID] [int] NOT NULL,
 CONSTRAINT [PK_TeamManager] PRIMARY KEY CLUSTERED 
(
	[managerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TeamManager]  WITH CHECK ADD  CONSTRAINT [FK_TeamManager_User] FOREIGN KEY([managerID])
REFERENCES [dbo].[User] ([userID]) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamManager] CHECK CONSTRAINT [FK_TeamManager_User]