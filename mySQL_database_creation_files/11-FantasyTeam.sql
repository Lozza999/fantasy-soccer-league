USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `FantasyTeam`;
CREATE TABLE  `FantasyTeam` (
  `fantasyTeamID`   	int(15) NOT NULL,
  `name`	varchar(40),
  `captain`	varchar(15),
  `value`	int(15),
  `managerID`	int(15) NOT NULL,

  KEY `teamToManager` (`managerID`),
  CONSTRAINT `teamToManager` FOREIGN KEY (`managerID`) REFERENCES `TeamManager`(`managerID`) 
  ON DELETE CASCADE ON UPDATE CASCADE,

PRIMARY KEY (`fantasyTeamID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;