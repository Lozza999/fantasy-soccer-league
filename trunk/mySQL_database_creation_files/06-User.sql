USE fantasyfootball;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `User`;
CREATE TABLE  `User` (
  `userID`   	int(15) NOT NULL,
  `password` 	varchar(15) NOT NULL,
  `email`	varchar(60),
  `fName` 	varchar(20),
  `lName`    	varchar(30),
  `regDate`	date,
  `zipCode`	int(9),
  `country`	varchar(2),
  `gender`	varchar(1),
  `dob`		date,

PRIMARY KEY (`userID`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
