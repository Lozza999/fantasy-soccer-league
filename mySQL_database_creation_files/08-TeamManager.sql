USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `TeamManager`;
CREATE TABLE  `TeamManager` (
  `managerID`  	int(15) NOT NULL,

  KEY `managerToUser` (`managerID`),
  CONSTRAINT `managerToUser` FOREIGN KEY (`managerID`) REFERENCES `User`(`userID`) 
  ON DELETE CASCADE ON UPDATE CASCADE,

PRIMARY KEY (`managerID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
