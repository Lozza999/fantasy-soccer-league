USE [fantasyfootball]
GO
/****** Object:  Table [dbo].[SystemAdministrator]    Script Date: 03/10/2008 17:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemAdministrator](
	[adminID] [int] NOT NULL,
 CONSTRAINT [PK_SystemAdministrator] PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[SystemAdministrator]  WITH CHECK ADD  CONSTRAINT [FK_SystemAdministrator_User] FOREIGN KEY([adminID])
REFERENCES [dbo].[User] ([userID]) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SystemAdministrator] CHECK CONSTRAINT [FK_SystemAdministrator_User]