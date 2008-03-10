USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `SystemAdministrator`;
CREATE TABLE  `SystemAdministrator` (
  `adminID`   	int(15) NOT NULL,

  KEY `adminToUser` (`adminID`),
  CONSTRAINT `adminToUser` FOREIGN KEY (`adminID`) REFERENCES `User`(`userID`) 
  ON DELETE CASCADE ON UPDATE CASCADE,

PRIMARY KEY (`adminID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
