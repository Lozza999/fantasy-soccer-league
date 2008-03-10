USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `LeagueCommissioner`;
CREATE TABLE  `LeagueCommissioner` (
  `commissionerID`   	int(15) NOT NULL,

  KEY `commissionerToUser` (`commissionerID`),
  CONSTRAINT `commissionerToUser` FOREIGN KEY (`commissionerID`) REFERENCES `User`(`userID`) 
  ON DELETE CASCADE ON UPDATE CASCADE,

PRIMARY KEY (`commissionerID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
