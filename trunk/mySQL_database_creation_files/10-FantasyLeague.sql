USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `FantasyLeague`;
CREATE TABLE  `FantasyLeague` (
  `fantasyLeagueID`   	int(15) NOT NULL,
  `name`	varchar(40),
  `dateCreated`	date,
  `commissionerID`	int(15) NOT NULL,

  KEY `leagueToCommissioner` (`commissionerID`),
  CONSTRAINT `leagueToCommissioner` FOREIGN KEY (`commissionerID`) REFERENCES `LeagueCommissioner`(`commissionerID`) 
  ON DELETE CASCADE ON UPDATE CASCADE,

PRIMARY KEY (`fantasyLeagueID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;