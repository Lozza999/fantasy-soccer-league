USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `Player`;
CREATE TABLE  `Player` (
  `playerID` 	int(15) NOT NULL,
  `salary` 	int(10) NOT NULL,
  `fName`    	varchar(20),
  `lName`	varchar(30),
  `position`	varchar(2),
  `dob`		date,
  `country`	varchar(2),
  `cost`	int(10),
  `teamID`	int(15),

  KEY `playerToTeam` (`teamID`),
  CONSTRAINT `playerToTeam` FOREIGN KEY (`teamID`) REFERENCES `Team`(`teamID`) 
  ON DELETE SET NULL ON UPDATE CASCADE,

PRIMARY KEY (`playerID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
