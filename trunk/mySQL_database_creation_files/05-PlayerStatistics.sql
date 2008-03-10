USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `PlayerStatistics`;
CREATE TABLE  `PlayerStatistics` (
  `playerID`    int(15) NOT NULL,
  `gameID` 	int(15) NOT NULL,
  `goalsScored`	int(2),
  `assists` 	int(2),
  `goalsConceeded`    	int(2),
  `shotsSaved`	int(2),
  `penaltySaved`	int(2),
  `penaltyMissed`	int(2),
  `yellowCards`	int(1),
  `redCards`	int(1),
  `started`	boolean,
  `played`	boolean,

  KEY `statsToGame` (`gameID`),
  CONSTRAINT `statsToGame` FOREIGN KEY (`gameID`) REFERENCES `Game`(`gameID`) 
  ON DELETE CASCADE ON UPDATE CASCADE,

  KEY `statsToPlayer` (`playerID`),
  CONSTRAINT `statsToPlayer` FOREIGN KEY (`playerID`) REFERENCES `Player`(`playerID`) 
  ON DELETE NO ACTION ON UPDATE CASCADE,

PRIMARY KEY (`gameID`, `playerID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
