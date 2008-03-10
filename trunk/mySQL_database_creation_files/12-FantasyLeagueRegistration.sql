USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `FantasyLeagueRegistration`;
CREATE TABLE  `FantasyLeagueRegistration` (
  `fantasyTeamID`   	int(15) NOT NULL,
  `fantasyLeagueID`	int(15) NOT NULL,

  KEY `registrationToTeam` (`fantasyTeamID`),
  CONSTRAINT `registrationToTeam` FOREIGN KEY (`fantasyTeamID`) REFERENCES `FantasyTeam`(`fantasyTeamID`) 
  ON DELETE CASCADE ON UPDATE CASCADE,

  KEY `registrationToLeague` (`fantasyLeagueID`),
  CONSTRAINT `registrationToLeague` FOREIGN KEY (`fantasyLeagueID`) REFERENCES `FantasyLeague`(`fantasyLeagueID`) 
  ON DELETE CASCADE ON UPDATE CASCADE,

PRIMARY KEY (`fantasyTeamID`, `fantasyLeagueID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;