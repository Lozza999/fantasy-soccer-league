USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `League`;
CREATE TABLE  `League` (
  `leagueID` 	int(10) NOT NULL,
  `name` 	varchar(30) NOT NULL,

PRIMARY KEY (`leagueID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
