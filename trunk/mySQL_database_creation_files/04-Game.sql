USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `Game`;
CREATE TABLE  `Game` (
  `gameID` 	int(15) NOT NULL,
  `date` 	date,
  `venue`    	varchar(40),
  `teamOneScore`	int(2),
  `teamTwoScore`	int(2),
  `teamOneID`	int(15),
  `teamTwoID`	int(15),

  KEY `gameToTeamOne` (`teamOneID`),
  CONSTRAINT `gameToTeamOne` FOREIGN KEY (`teamOneID`) REFERENCES `Team`(`teamID`) 
  ON DELETE NO ACTION ON UPDATE CASCADE,

  KEY `gameToTeamTwo` (`teamTwoID`),
  CONSTRAINT `gameToTeamTwo` FOREIGN KEY (`teamTwoID`) REFERENCES `Team`(`teamID`) 
  ON DELETE NO ACTION ON UPDATE CASCADE,

PRIMARY KEY (`gameID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
