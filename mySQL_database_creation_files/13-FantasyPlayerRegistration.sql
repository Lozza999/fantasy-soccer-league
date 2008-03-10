USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `FantasyPlayerRegistration`;
CREATE TABLE  `FantasyPlayerRegistration` (
  `playerID`	int(15) NOT NULL,
  `fantasyTeamID`   	int(15) NOT NULL,
  `dateJoined`	date,
  `dateLeft`	date,

  KEY `registrationToPlayer` (`playerID`),
  CONSTRAINT `registrationToPlayer` FOREIGN KEY (`playerID`) REFERENCES `Player`(`playerID`) 
  ON DELETE CASCADE ON UPDATE CASCADE,

  KEY `playerRegistrationToTeam` (`fantasyTeamID`),
  CONSTRAINT `playerRegistrationToTeam` FOREIGN KEY (`fantasyTeamID`) REFERENCES `FantasyTeam`(`fantasyTeamID`) 
  ON DELETE CASCADE ON UPDATE CASCADE,

PRIMARY KEY (`fantasyTeamID`, `playerID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;