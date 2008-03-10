USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `team`;
CREATE TABLE  `team` (
  `teamID` 	int(15) NOT NULL,
  `name` 	varchar(30) NOT NULL,
  `leagueID`    int(10),

  KEY `teamToLeague` (`leagueID`),
  CONSTRAINT `teamToLeague` FOREIGN KEY (`leagueID`) REFERENCES `League`(`leagueID`) 
  ON DELETE SET NULL ON UPDATE CASCADE,

PRIMARY KEY (`teamID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
