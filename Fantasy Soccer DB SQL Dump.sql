/*
SQLyog Community Edition- MySQL GUI v6.16
MySQL - 5.0.45-community : Database - ecsmyth
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `ecsmyth`;

USE `ecsmyth`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `FantasyLeague` */

DROP TABLE IF EXISTS `FantasyLeague`;

CREATE TABLE `FantasyLeague` (
  `fantasyLeagueID` int(15) NOT NULL,
  `name` varchar(40) default NULL,
  `dateCreated` date default NULL,
  `commissionerID` int(15) NOT NULL,
  PRIMARY KEY  (`fantasyLeagueID`),
  KEY `leagueToCommissioner` (`commissionerID`),
  CONSTRAINT `leagueToCommissioner` FOREIGN KEY (`commissionerID`) REFERENCES `LeagueCommissioner` (`commissionerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `FantasyLeague` */

insert  into `FantasyLeague`(`fantasyLeagueID`,`name`,`dateCreated`,`commissionerID`) values (1,'Washington Premiership','2007-08-08',4),(2,'LA Liga','2007-08-09',5),(3,'UW:T','2007-08-10',6),(4,'Seattle Division One','2007-08-11',7);

/*Table structure for table `FantasyLeagueRegistration` */

DROP TABLE IF EXISTS `FantasyLeagueRegistration`;

CREATE TABLE `FantasyLeagueRegistration` (
  `fantasyTeamID` int(15) NOT NULL,
  `fantasyLeagueID` int(15) NOT NULL,
  PRIMARY KEY  (`fantasyTeamID`,`fantasyLeagueID`),
  KEY `registrationToTeam` (`fantasyTeamID`),
  KEY `registrationToLeague` (`fantasyLeagueID`),
  CONSTRAINT `registrationToTeam` FOREIGN KEY (`fantasyTeamID`) REFERENCES `FantasyTeam` (`fantasyTeamID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `registrationToLeague` FOREIGN KEY (`fantasyLeagueID`) REFERENCES `FantasyLeague` (`fantasyLeagueID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `FantasyLeagueRegistration` */

insert  into `FantasyLeagueRegistration`(`fantasyTeamID`,`fantasyLeagueID`) values (1,1),(2,3),(3,4),(4,1),(5,3),(6,3),(7,2),(8,2),(9,4),(10,1),(11,1),(12,3),(13,2),(14,1);

/*Table structure for table `FantasyPlayerRegistration` */

DROP TABLE IF EXISTS `FantasyPlayerRegistration`;

CREATE TABLE `FantasyPlayerRegistration` (
  `playerID` int(15) NOT NULL,
  `fantasyTeamID` int(15) NOT NULL,
  `dateJoined` date default NULL,
  `dateLeft` date default NULL,
  PRIMARY KEY  (`fantasyTeamID`,`playerID`),
  KEY `registrationToPlayer` (`playerID`),
  KEY `playerRegistrationToTeam` (`fantasyTeamID`),
  CONSTRAINT `registrationToPlayer` FOREIGN KEY (`playerID`) REFERENCES `Player` (`playerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `playerRegistrationToTeam` FOREIGN KEY (`fantasyTeamID`) REFERENCES `FantasyTeam` (`fantasyTeamID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `FantasyPlayerRegistration` */

insert  into `FantasyPlayerRegistration`(`playerID`,`fantasyTeamID`,`dateJoined`,`dateLeft`) values (2,1,'2007-08-23','0000-00-00'),(4,1,'2007-08-22','0000-00-00'),(67,1,'2007-08-18','2007-12-01'),(68,1,'2007-08-19','0000-00-00'),(69,1,'2007-08-20','0000-00-00'),(71,1,'2007-08-21','0000-00-00'),(349,1,'2007-08-15','0000-00-00'),(350,1,'2007-08-12','0000-00-00'),(351,1,'2007-08-11','0000-00-00'),(352,1,'2007-08-17','0000-00-00'),(353,1,'2007-08-16','0000-00-00'),(538,1,'2007-08-14','0000-00-00'),(539,1,'2007-08-13','2008-03-03'),(540,1,'2007-08-10','0000-00-00');

/*Table structure for table `FantasyTeam` */

DROP TABLE IF EXISTS `FantasyTeam`;

CREATE TABLE `FantasyTeam` (
  `fantasyTeamID` int(15) NOT NULL,
  `name` varchar(40) default NULL,
  `captain` varchar(15) default NULL,
  `value` int(15) default NULL,
  `managerID` int(15) NOT NULL,
  PRIMARY KEY  (`fantasyTeamID`),
  KEY `teamToManager` (`managerID`),
  CONSTRAINT `teamToManager` FOREIGN KEY (`managerID`) REFERENCES `TeamManager` (`managerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `FantasyTeam` */

insert  into `FantasyTeam`(`fantasyTeamID`,`name`,`captain`,`value`,`managerID`) values (1,'Chicago FC\r\n','Drogba\r\n',1000,15),(2,'South Sound Rangers\r\n','van Persie\r\n',1012,16),(3,'Eastern United\r\n','Ronaldo\r\n',998,17),(4,'Tacoma Titans\r\n','Lampard\r\n',1032,4),(5,'Bellevue FC\r\n','Eboue\r\n',999,5),(6,'Bellingham FC\r\n','Lampard\r\n',1032,6),(7,'FC Super Eashhh\r\n','Ronaldo\r\n',987,7),(8,'MAD MAN UTD\r\n','Terry',1029,8),(9,'BERBATOV UTD\r\n','Terry\r\n',1011,9),(10,'Curry Hill United\r\n','Cech\r\n',1017,10),(11,'Dan\'s Destroyers\r\n','Terry\r\n',1018,11),(12,'Shadwell Army\r\n','Gerrard\r\n',1004,12),(13,'Kings of Murphy\r\n','Tevez\r\n',998,13),(14,'Liverpublicans\r\n','Adebayor\r\n',1020,14);

/*Table structure for table `Game` */

DROP TABLE IF EXISTS `Game`;

CREATE TABLE `Game` (
  `gameID` int(15) NOT NULL,
  `date` date default NULL,
  `venue` varchar(60) default NULL,
  `teamOneScore` int(2) default NULL,
  `teamTwoScore` int(2) default NULL,
  `teamOneID` int(15) default NULL,
  `teamTwoID` int(15) default NULL,
  PRIMARY KEY  (`gameID`),
  KEY `gameToTeamOne` (`teamOneID`),
  KEY `gameToTeamTwo` (`teamTwoID`),
  CONSTRAINT `gameToTeamOne` FOREIGN KEY (`teamOneID`) REFERENCES `Team` (`teamID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `gameToTeamTwo` FOREIGN KEY (`teamTwoID`) REFERENCES `Team` (`teamID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `Game` */

insert  into `Game`(`gameID`,`date`,`venue`,`teamOneScore`,`teamTwoScore`,`teamOneID`,`teamTwoID`) values (1,'2008-03-01','City of Manchester Stadium\r\n',0,0,11,20),(2,'2008-03-02','Reebok Stadium\r\n',1,2,5,10),(3,'2008-03-02','Goodison Park\r\n',3,1,8,15),(4,'2008-03-05','Anfield\r\n',4,0,10,19),(5,'2008-03-08','Anfield\r\n',3,0,10,14),(6,'2008-03-08','Ewood Park\r\n',1,1,4,9),(7,'2008-03-08','Madejski Stadium\r\n',2,0,16,11),(8,'2008-03-09','Stadium of Light\r\n',0,1,17,8),(9,'2008-03-09','White Hart Lane\r\n',4,0,18,19),(10,'2008-03-09','JJB Stadium\r\n',0,0,20,1);

/*Table structure for table `League` */

DROP TABLE IF EXISTS `League`;

CREATE TABLE `League` (
  `leagueID` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY  (`leagueID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `League` */

insert  into `League`(`leagueID`,`name`) values (1,'English Premier League'),(2,'Spanish La Liga'),(3,'Spanish Segunda'),(4,'Italian Serie A'),(5,'Italian Serie B'),(6,'German Bundesliga 1'),(7,'German Bundesliga 2'),(8,'French Ligue 1'),(9,'French Ligue 2'),(10,'Scottish Premier League'),(11,'Dutch Eredivisie'),(12,'Dutch Eerste Divisie'),(13,'Portuguese Liga'),(14,'Major League Soccer');

/*Table structure for table `LeagueCommissioner` */

DROP TABLE IF EXISTS `LeagueCommissioner`;

CREATE TABLE `LeagueCommissioner` (
  `commissionerID` int(15) NOT NULL,
  PRIMARY KEY  (`commissionerID`),
  KEY `commissionerToUser` (`commissionerID`),
  CONSTRAINT `commissionerToUser` FOREIGN KEY (`commissionerID`) REFERENCES `User` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `LeagueCommissioner` */

insert  into `LeagueCommissioner`(`commissionerID`) values (4),(5),(6),(7);

/*Table structure for table `Player` */

DROP TABLE IF EXISTS `Player`;

CREATE TABLE `Player` (
  `playerID` int(15) NOT NULL,
  `salary` int(10) NOT NULL,
  `fName` varchar(20) default NULL,
  `lName` varchar(30) default NULL,
  `position` varchar(2) default NULL,
  `dob` date default NULL,
  `country` varchar(2) default NULL,
  `cost` int(10) default NULL,
  `teamID` int(15) default NULL,
  PRIMARY KEY  (`playerID`),
  KEY `playerToTeam` (`teamID`),
  CONSTRAINT `playerToTeam` FOREIGN KEY (`teamID`) REFERENCES `Team` (`teamID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `Player` */

insert  into `Player`(`playerID`,`salary`,`fName`,`lName`,`position`,`dob`,`country`,`cost`,`teamID`) values (0,0,'','Christanval','De','0000-00-00','',4,9),(1,0,'','Reina','Go','0000-00-00','',7,10),(2,0,'','Cech','Go','0000-00-00','',6,6),(3,0,'','Van der Sar','Go','0000-00-00','',6,12),(4,0,'','Carson','Go','0000-00-00','',6,2),(5,0,'Manuel','Almunia','Go','0000-00-00','Sp',5,1),(6,0,'','Friedel','Go','0000-00-00','',5,4),(7,0,'','Itandje','Go','0000-00-00','',5,10),(8,0,'','James','Go','0000-00-00','',5,15),(9,0,'','Green','Go','0000-00-00','',5,19),(10,0,'','Cudicini','Go','0000-00-00','',5,6),(11,0,'Jens','Lehmann','Go','0000-00-00','Ge',5,1),(12,0,'','Howard','Go','0000-00-00','',5,8),(13,0,'','Martin','Go','0000-00-00','',5,10),(14,0,'','Given','Go','0000-00-00','',5,14),(15,0,'','Foster','Go','0000-00-00','',5,12),(16,0,'','Hilario','Go','0000-00-00','',5,6),(17,0,'Lukasz','Fabianski','Go','0000-00-00','Po',5,1),(18,0,'','Jaaskelainen','Go','0000-00-00','',5,5),(19,0,'','Robinson','Go','0000-00-00','',5,18),(20,0,'','Taylor','Go','0000-00-00','',5,6),(21,0,'','Alnwick','Go','0000-00-00','',5,18),(22,0,'','Isaksson','Go','0000-00-00','',4,11),(23,0,'','Walker','Go','0000-00-00','',4,5),(24,0,'','Kuszczak','Go','0000-00-00','',4,12),(25,0,'','Schwarzer','Go','0000-00-00','',4,13),(26,0,'','Hahnemann','Go','0000-00-00','',4,16),(27,0,'','Sorensen','Go','0000-00-00','',4,2),(28,0,'','Brown','Go','0000-00-00','',4,4),(29,0,'','Harper','Go','0000-00-00','',4,14),(30,0,'','Hart','Go','0000-00-00','',4,11),(31,0,'','Schmeichel','Go','0000-00-00','',4,11),(32,0,'','Kirkland','Go','0000-00-00','',4,20),(33,0,'','Taylor','Go','0000-00-00','',4,3),(34,0,'','Bywater','Go','0000-00-00','',4,7),(35,0,'','Ruddy','Go','0000-00-00','',4,8),(36,0,'','Wessels','Go','0000-00-00','',4,8),(37,0,'','Keller','Go','0000-00-00','',4,9),(38,0,'','Niemi','Go','0000-00-00','',4,9),(39,0,'','Heaton','Go','0000-00-00','',4,12),(40,0,'','Turnbull','Go','0000-00-00','',4,13),(41,0,'','Steele','Go','0000-00-00','',4,13),(42,0,'','Gordon','Go','0000-00-00','',4,17),(43,0,'','Walker','Go','0000-00-00','',4,19),(44,0,'','Taylor','Go','0000-00-00','',4,2),(45,0,'','Kingson','Go','0000-00-00','',4,3),(46,0,'','Enckelman','Go','0000-00-00','',4,4),(47,0,'','Al-Habsi','Go','0000-00-00','',4,5),(48,0,'','Hinchliffe','Go','0000-00-00','',4,7),(49,0,'','Price','Go','0000-00-00','',4,7),(50,0,'','Turner','Go','0000-00-00','',4,8),(51,0,'','Batista','Go','0000-00-00','',4,9),(52,0,'','Warner','Go','0000-00-00','',4,9),(53,0,'','Jones','Go','0000-00-00','',4,13),(54,0,'','Forster','Go','0000-00-00','',4,14),(55,0,'','Begovic','Go','0000-00-00','',4,15),(56,0,'','Ashdown','Go','0000-00-00','',4,15),(57,0,'','Jordan','Go','0000-00-00','',4,15),(58,0,'','Federici','Go','0000-00-00','',4,16),(59,0,'','Ward','Go','0000-00-00','',4,17),(60,0,'','Forecast','Go','0000-00-00','',4,18),(61,0,'','Cerny','Go','0000-00-00','',4,18),(62,0,'','Wright','Go','0000-00-00','',4,19),(63,0,'','Nash','Go','0000-00-00','',4,20),(64,0,'','Pollitt','Go','0000-00-00','',4,20),(65,0,'','Doyle','Go','0000-00-00','',4,3),(66,0,'','Fulop','Go','0000-00-00','',4,17),(67,0,'','Terry','De','0000-00-00','',7,6),(68,0,'','Ferdinand','De','0000-00-00','',7,12),(69,0,'','Vidic','De','0000-00-00','',7,12),(70,0,'','Carragher','De','0000-00-00','',7,10),(71,0,'','Agger','De','0000-00-00','',7,10),(72,0,'','Alex','De','0000-00-00','',7,6),(73,0,'','Carvalho','De','0000-00-00','',7,6),(74,0,'','Lescott','De','0000-00-00','',7,8),(75,0,'','Riise','De','0000-00-00','',7,10),(76,0,'','Evra','De','0000-00-00','',7,12),(77,0,'Toure','Toure','De','0000-00-00','Iv',7,1),(78,0,'William','Gallas','De','0000-00-00','Sp',7,1),(79,0,'','Aurelio','De','0000-00-00','',7,10),(80,0,'','Belletti','De','0000-00-00','',6,6),(81,0,'','Laursen','De','0000-00-00','',6,2),(82,0,'','Cole A','De','0000-00-00','',6,6),(83,0,'Emmanuel','Eboue','De','0000-00-00','Iv',6,1),(84,0,'Gael','Clichy','De','0000-00-00','Fr',6,1),(85,0,'Bacary','Sagna','De','0000-00-00','Fr',6,1),(86,0,'','Arbeloa','De','0000-00-00','',6,10),(87,0,'','Ivanovic','De','0000-00-00','',6,6),(88,0,'','Skrtel','De','0000-00-00','',6,10),(89,0,'','Finnan','De','0000-00-00','',6,10),(90,0,'','Johnson','De','0000-00-00','',6,15),(91,0,'','Hyypia','De','0000-00-00','',6,10),(92,0,'','Distin','De','0000-00-00','',6,15),(93,0,'','Bale','De','0000-00-00','',6,18),(94,0,'','Ferreira','De','0000-00-00','',6,6),(95,0,'','Bridge','De','0000-00-00','',6,6),(96,0,'','Neville','De','0000-00-00','',6,12),(97,0,'','Brown','De','0000-00-00','',6,12),(98,0,'','Chimbonda','De','0000-00-00','',6,18),(99,0,'','Dunne','De','0000-00-00','',6,11),(100,0,'','Campbell','De','0000-00-00','',6,15),(101,0,'','Samba','De','0000-00-00','',5,4),(102,0,'','Warnock','De','0000-00-00','',5,4),(103,0,'','Corluka','De','0000-00-00','',5,11),(104,0,'Philippe','Senderos','De','0000-00-00','Sw',5,1),(105,0,'','Emerton','De','0000-00-00','',5,4),(106,0,'','Ben Haim','De','0000-00-00','',5,6),(107,0,'','Neville','De','0000-00-00','',5,8),(108,0,'','Richards','De','0000-00-00','',5,11),(109,0,'','Woodgate','De','0000-00-00','',5,13),(110,0,'','Pogatetz','De','0000-00-00','',5,13),(111,0,'','King','De','0000-00-00','',5,18),(112,0,'','Yobo','De','0000-00-00','',5,8),(113,0,'','Silvestre','De','0000-00-00','',5,12),(114,0,'','Dawson','De','0000-00-00','',5,18),(115,0,'','Mellberg','De','0000-00-00','',5,2),(116,0,'','Davies','De','0000-00-00','',5,2),(117,0,'','Steinsson','De','0000-00-00','',5,5),(118,0,'','Gardner','De','0000-00-00','',5,5),(119,0,'','Beye','De','0000-00-00','',5,14),(120,0,'','Geremi','De','0000-00-00','',5,14),(121,0,'Johan','Djourou','De','0000-00-00','Iv',5,1),(122,0,'','Nelsen','De','0000-00-00','',5,4),(123,0,'','Jagielka','De','0000-00-00','',5,8),(124,0,'','Pique','De','0000-00-00','',5,12),(125,0,'','Neill','De','0000-00-00','',5,19),(126,0,'','Upson','De','0000-00-00','',5,19),(127,0,'','Hobbs','De','0000-00-00','',5,10),(128,0,'','Huth','De','0000-00-00','',5,13),(129,0,'','Carr','De','0000-00-00','',5,14),(130,0,'','Hreidarsson','De','0000-00-00','',5,15),(131,0,'','Shorey','De','0000-00-00','',5,16),(132,0,'','Lee','De','0000-00-00','',5,18),(133,0,'','McCartney','De','0000-00-00','',5,19),(134,0,'','Queudrue','De','0000-00-00','',5,3),(135,0,'','Ooijer','De','0000-00-00','',5,4),(136,0,'','Insua','De','0000-00-00','',5,10),(137,0,'','Young','De','0000-00-00','',5,13),(138,0,'','Cacapa','De','0000-00-00','',5,14),(139,0,'','Kaboul','De','0000-00-00','',5,18),(140,0,'','Knight','De','0000-00-00','',5,2),(141,0,'','Khizanishvili','De','0000-00-00','',5,4),(142,0,'','Hunt','De','0000-00-00','',5,5),(143,0,'','Meite','De','0000-00-00','',5,5),(144,0,'','Stubbs','De','0000-00-00','',5,8),(145,0,'','Bocanegra','De','0000-00-00','',5,9),(146,0,'','Rozehnal','De','0000-00-00','',5,14),(147,0,'','Faye','De','0000-00-00','',5,14),(148,0,'','Primus','De','0000-00-00','',5,15),(149,0,'','Rocha','De','0000-00-00','',5,18),(150,0,'','Bouma','De','0000-00-00','',5,2),(151,0,'','Berner','De','0000-00-00','',5,4),(152,0,'','Cathcart','De','0000-00-00','',5,12),(153,0,'','Taylor','De','0000-00-00','',5,14),(154,0,'','Cranie','De','0000-00-00','',5,15),(155,0,'','Lauren','De','0000-00-00','',5,15),(156,0,'','Aubey','De','0000-00-00','',5,15),(157,0,'','Higginbotham','De','0000-00-00','',5,17),(158,0,'','Harte','De','0000-00-00','',5,17),(159,0,'','Gunter','De','0000-00-00','',5,18),(160,0,'','Assou-Ekotto','De','0000-00-00','',5,18),(161,0,'','Melchiot','De','0000-00-00','',5,20),(162,0,'Justin','Hoyte','De','0000-00-00','En',4,1),(163,0,'','Ridgewell','De','0000-00-00','',4,3),(164,0,'','Baines','De','0000-00-00','',4,8),(165,0,'','Ball','De','0000-00-00','',4,11),(166,0,'','Simpson','De','0000-00-00','',4,12),(167,0,'','Jose Enrique','De','0000-00-00','',4,14),(168,0,'','Evans','De','0000-00-00','',4,17),(169,0,'','Gardner','De','0000-00-00','',4,18),(170,0,'','Ferdinand','De','0000-00-00','',4,19),(171,0,'','Scharner','De','0000-00-00','',4,20),(172,0,'','Michalik','De','0000-00-00','',4,5),(173,0,'','Hibbert','De','0000-00-00','',4,8),(174,0,'','Valente','De','0000-00-00','',4,8),(175,0,'','Konchesky','De','0000-00-00','',4,9),(176,0,'','Gibson','De','0000-00-00','',4,12),(177,0,'','Pamarot','De','0000-00-00','',4,15),(178,0,'','Murty','De','0000-00-00','',4,16),(179,0,'','Sonko','De','0000-00-00','',4,16),(180,0,'','Davenport','De','0000-00-00','',4,19),(181,0,'','Collins','De','0000-00-00','',4,19),(182,0,'','Samuel','De','0000-00-00','',4,5),(183,0,'','Stefanovic','De','0000-00-00','',4,9),(184,0,'','Baird','De','0000-00-00','',4,9),(185,0,'','Onuoha','De','0000-00-00','',4,11),(186,0,'','Garrido','De','0000-00-00','',4,11),(187,0,'','Davies','De','0000-00-00','',4,13),(188,0,'','Riggott','De','0000-00-00','',4,13),(189,0,'','Wheater','De','0000-00-00','',4,13),(190,0,'','Ingimarsson','De','0000-00-00','',4,16),(191,0,'','Gabbidon','De','0000-00-00','',4,19),(192,0,'','Spector','De','0000-00-00','',4,19),(193,0,'','Cahill','De','0000-00-00','',4,2),(194,0,'','Kelly','De','0000-00-00','',4,3),(195,0,'','Todd','De','0000-00-00','',4,7),(196,0,'','Volz','De','0000-00-00','',4,9),(197,0,'','Bardsley','De','0000-00-00','',4,12),(198,0,'','Taylor','De','0000-00-00','',4,13),(199,0,'','Ramage','De','0000-00-00','',4,14),(200,0,'','Traore','De','0000-00-00','',4,15),(201,0,'','De La Cruz','De','0000-00-00','',4,16),(202,0,'','Bramble','De','0000-00-00','',4,20),(203,0,'','Schmitz','De','0000-00-00','',4,3),(204,0,'','Olsson','De','0000-00-00','',4,4),(205,0,'','O\'Brien A','De','0000-00-00','',4,5),(206,0,'','Fojut','De','0000-00-00','',4,5),(207,0,'','Omozusi','De','0000-00-00','',4,9),(208,0,'','Ashton','De','0000-00-00','',4,9),(209,0,'','Hines','De','0000-00-00','',4,13),(210,0,'','Grounds','De','0000-00-00','',4,13),(211,0,'','Duffy','De','0000-00-00','',4,15),(212,0,'','Golbourne','De','0000-00-00','',4,16),(213,0,'','Halls','De','0000-00-00','',4,16),(214,0,'','Halford','De','0000-00-00','',4,17),(215,0,'','Archibald-Henville','De','0000-00-00','',4,18),(216,0,'','Stalteri','De','0000-00-00','',4,18),(217,0,'','Tomkins','De','0000-00-00','',4,19),(218,0,'','Olembe','De','0000-00-00','',4,20),(219,0,'','Sadler','De','0000-00-00','',4,3),(220,0,'','Leacock','De','0000-00-00','',4,7),(221,0,'','Moore','De','0000-00-00','',4,7),(222,0,'','McEveley','De','0000-00-00','',4,7),(223,0,'','Mears','De','0000-00-00','',4,7),(224,0,'','Davis','De','0000-00-00','',4,7),(225,0,'','Hughes','De','0000-00-00','',4,9),(226,0,'','Leijer','De','0000-00-00','',4,9),(227,0,'','Bates','De','0000-00-00','',4,13),(228,0,'','Duberry','De','0000-00-00','',4,16),(229,0,'','Rosenior','De','0000-00-00','',4,16),(230,0,'','Collins','De','0000-00-00','',4,17),(231,0,'','McShane','De','0000-00-00','',4,17),(232,0,'','Paintsil','De','0000-00-00','',4,19),(233,0,'','Taylor','De','0000-00-00','',4,20),(234,0,'','Taylor','De','0000-00-00','',4,3),(235,0,'','Jaidi','De','0000-00-00','',4,3),(236,0,'','Parnaby','De','0000-00-00','',4,3),(237,0,'','Henchoz','De','0000-00-00','',4,4),(238,0,'','Johnson M','De','0000-00-00','',4,7),(239,0,'','Camara','De','0000-00-00','',4,7),(240,0,'','Edworthy','De','0000-00-00','',4,7),(241,0,'','Nyatanga','De','0000-00-00','',4,7),(242,0,'','Mills D','De','0000-00-00','',4,7),(243,0,'','Sun','De','0000-00-00','',4,11),(244,0,'','Edgar','De','0000-00-00','',4,14),(245,0,'','Carroll','De','0000-00-00','',4,14),(246,0,'','Pearce','De','0000-00-00','',4,16),(247,0,'','Bikey','De','0000-00-00','',4,16),(248,0,'','Kay','De','0000-00-00','',4,17),(249,0,'','Nosworthy','De','0000-00-00','',4,17),(250,0,'','Wright','De','0000-00-00','',4,17),(251,0,'','Dailly','De','0000-00-00','',4,19),(252,0,'','Granqvist','De','0000-00-00','',4,20),(253,0,'','Boyce','De','0000-00-00','',4,20),(255,0,'','Pearce','De','0000-00-00','',4,9),(256,0,'','Varga','De','0000-00-00','',4,17),(257,0,'','Anderson','De','0000-00-00','',4,17),(258,0,'','Hoyte','Mi','0000-00-00','',4,12),(259,0,'','Ridgewell','Mi','0000-00-00','',4,6),(260,0,'','Baines','Mi','0000-00-00','',4,10),(261,0,'','Ball','Mi','0000-00-00','Sp',4,1),(262,0,'','Simpson','Mi','0000-00-00','',4,6),(263,0,'','Jose Enrique','Mi','0000-00-00','',4,11),(264,0,'','Evans','Mi','0000-00-00','',4,6),(265,0,'','Gardner','Mi','0000-00-00','',4,8),(266,0,'','Ferdinand','Mi','0000-00-00','',4,6),(267,0,'','Scharner','Mi','0000-00-00','',4,12),(268,0,'','Hibbert','Mi','0000-00-00','',4,6),(269,0,'','Valente','Mi','0000-00-00','',4,8),(270,0,'','Konchesky','Mi','0000-00-00','',4,11),(271,0,'','Gibson','Mi','0000-00-00','',4,12),(272,0,'','Pamarot','Mi','0000-00-00','',4,2),(273,0,'','Murty','Mi','0000-00-00','',4,4),(274,0,'','Sonko','Mi','0000-00-00','',4,12),(275,0,'','Davenport','Mi','0000-00-00','',4,12),(276,0,'','Collins','Mi','0000-00-00','',4,12),(277,0,'','Samuel','Mi','0000-00-00','',4,6),(278,0,'','Stefanovic','Mi','0000-00-00','',4,10),(279,0,'','Baird','Mi','0000-00-00','',4,18),(280,0,'','Onuoha','Mi','0000-00-00','',4,14),(281,0,'','Garrido','Mi','0000-00-00','',4,6),(282,0,'','Riggott','Mi','0000-00-00','',4,4),(283,0,'','Wheater','Mi','0000-00-00','',4,12),(284,0,'','Ingimarsson','Mi','0000-00-00','',4,10),(285,0,'','Gabbidon','Mi','0000-00-00','',4,18),(286,0,'','Spector','Mi','0000-00-00','',4,19),(287,0,'','Cahill','Mi','0000-00-00','',4,6),(288,0,'','Kelly','Mi','0000-00-00','',4,10),(289,0,'','Todd','Mi','0000-00-00','',4,14),(290,0,'','Volz','Mi','0000-00-00','',4,13),(291,0,'','Bardsley','Mi','0000-00-00','',4,19),(292,0,'','Taylor','Mi','0000-00-00','',4,19),(293,0,'','Ramage','Mi','0000-00-00','',4,19),(294,0,'Armand','Traore','Mi','0000-00-00','Fr',4,1),(295,0,'','De La Cruz','Mi','0000-00-00','',4,2),(296,0,'','Bramble','Mi','0000-00-00','',4,5),(297,0,'','Schmitz','Mi','0000-00-00','',4,10),(298,0,'','Olsson','Mi','0000-00-00','',4,11),(299,0,'','O\'Brien A','Mi','0000-00-00','',4,10),(300,0,'','Fojut','Mi','0000-00-00','',4,9),(301,0,'','Omozusi','Mi','0000-00-00','',4,16),(302,0,'','Ashton','Mi','0000-00-00','',4,18),(303,0,'','Hines','Mi','0000-00-00','',4,5),(304,0,'','Grounds','Mi','0000-00-00','',4,6),(305,0,'','Duffy','Mi','0000-00-00','',4,12),(306,0,'','Halls','Mi','0000-00-00','',4,4),(307,0,'','Halford','Mi','0000-00-00','',4,5),(308,0,'','Archibald-Henville','Mi','0000-00-00','',4,8),(309,0,'','Stalteri','Mi','0000-00-00','',4,8),(310,0,'','Tomkins','Mi','0000-00-00','',4,10),(311,0,'','Olembe','Mi','0000-00-00','',4,14),(312,0,'','Sadler','Mi','0000-00-00','',4,15),(313,0,'','Leacock','Mi','0000-00-00','',4,12),(314,0,'','McEveley','Mi','0000-00-00','',4,4),(315,0,'','Mears','Mi','0000-00-00','',4,10),(316,0,'','Davis','Mi','0000-00-00','',4,13),(317,0,'','Hughes','Mi','0000-00-00','',4,15),(318,0,'','Leijer','Mi','0000-00-00','',4,20),(319,0,'','Bates','Mi','0000-00-00','',4,2),(320,0,'','Duberry','Mi','0000-00-00','',4,5),(321,0,'','Rosenior','Mi','0000-00-00','',4,14),(322,0,'','Collins','Mi','0000-00-00','',4,19),(323,0,'','McShane','Mi','0000-00-00','',4,19),(324,0,'','Paintsil','Mi','0000-00-00','',4,2),(325,0,'','Taylor','Mi','0000-00-00','',4,3),(326,0,'','Taylor','Mi','0000-00-00','',4,8),(327,0,'','Jaidi','Mi','0000-00-00','',4,9),(328,0,'','Parnaby','Mi','0000-00-00','',4,12),(329,0,'','Henchoz','Mi','0000-00-00','',4,13),(330,0,'','Johnson M','Mi','0000-00-00','',4,15),(331,0,'','Camara','Mi','0000-00-00','',4,16),(332,0,'','Edworthy','Mi','0000-00-00','',4,18),(333,0,'','Nyatanga','Mi','0000-00-00','',4,10),(334,0,'','Mills D','Mi','0000-00-00','',4,13),(335,0,'','Sun','Mi','0000-00-00','',4,19),(336,0,'','Carroll','Mi','0000-00-00','',4,5),(337,0,'','Pearce','Mi','0000-00-00','',4,18),(338,0,'','Bikey','Mi','0000-00-00','',4,19),(339,0,'','Kay','Mi','0000-00-00','',4,20),(340,0,'','Nosworthy','Mi','0000-00-00','',4,4),(341,0,'','Wright','Mi','0000-00-00','',4,5),(342,0,'','Dailly','Mi','0000-00-00','',4,5),(343,0,'','Granqvist','Mi','0000-00-00','',4,7),(344,0,'','Boyce','Mi','0000-00-00','',4,7),(345,0,'','Christanval','Mi','0000-00-00','',4,9),(346,0,'','Pearce','Mi','0000-00-00','',4,9),(347,0,'','Varga','Mi','0000-00-00','',4,17),(348,0,'','Anderson','Mi','0000-00-00','',4,17),(349,0,'','Ronaldo','Mi','0000-00-00','',13,12),(350,0,'','Lampard','Mi','0000-00-00','',11,6),(351,0,'','Gerrard','Mi','0000-00-00','',11,10),(352,0,'','Cole J','Mi','0000-00-00','',9,6),(353,0,'','Elano','Mi','0000-00-00','',9,11),(354,0,'','Ballack','Mi','0000-00-00','',8,6),(355,0,'','Arteta','Mi','0000-00-00','',8,8),(356,0,'','Malouda','Mi','0000-00-00','',8,6),(357,0,'','Giggs','Mi','0000-00-00','',8,12),(358,0,'Tomas','Rosicky','Mi','0000-00-00','Cz',8,1),(359,0,'','Essien','Mi','0000-00-00','',8,6),(360,0,'','Cahill','Mi','0000-00-00','',8,8),(361,0,'','Petrov','Mi','0000-00-00','',8,11),(362,0,'','Scholes','Mi','0000-00-00','',8,12),(363,0,'','Barry','Mi','0000-00-00','',8,2),(364,0,'','Bentley','Mi','0000-00-00','',8,4),(365,0,'','Anderson','Mi','0000-00-00','',8,12),(366,0,'','Park','Mi','0000-00-00','',8,12),(367,0,'','Nani','Mi','0000-00-00','',8,12),(368,0,'','Sidwell','Mi','0000-00-00','',7,6),(369,0,'','Babel','Mi','0000-00-00','',7,10),(370,0,'','Lennon','Mi','0000-00-00','',7,18),(371,0,'','Barton','Mi','0000-00-00','',7,14),(372,0,'','Wright-Phillips','Mi','0000-00-00','',7,6),(373,0,'Alex','Hleb','Mi','0000-00-00','Be',7,1),(374,0,'','Gamst Pedersen','Mi','0000-00-00','',7,4),(375,0,'','Carrick','Mi','0000-00-00','',7,12),(376,0,'','Alonso','Mi','0000-00-00','',7,10),(377,0,'','Jenas','Mi','0000-00-00','',7,18),(378,0,'','Faubert','Mi','0000-00-00','',7,19),(379,0,'','Mikel','Mi','0000-00-00','',7,6),(380,0,'','Pennant','Mi','0000-00-00','',7,10),(381,0,'','Duff','Mi','0000-00-00','',7,14),(382,0,'','Downing','Mi','0000-00-00','',7,13),(383,0,'','Ljungberg','Mi','0000-00-00','',7,19),(384,0,'','Dyer','Mi','0000-00-00','',7,19),(385,0,'','Boa Morte','Mi','0000-00-00','',7,19),(386,0,'','Petrov','Mi','0000-00-00','',7,2),(387,0,'','Nolan','Mi','0000-00-00','',7,5),(388,0,'','Benayoun','Mi','0000-00-00','',7,10),(389,0,'','Geovanni','Mi','0000-00-00','',7,11),(390,0,'','Lucas','Mi','0000-00-00','',7,10),(391,0,'','Bullard','Mi','0000-00-00','',6,9),(392,0,'','Hunt','Mi','0000-00-00','',6,16),(393,0,'','Malbranque','Mi','0000-00-00','',6,18),(394,0,'','Taylor','Mi','0000-00-00','',6,5),(395,0,'','Makelele','Mi','0000-00-00','',6,6),(396,0,'','Fletcher','Mi','0000-00-00','',6,12),(397,0,'Pereira','Denilson','Mi','0000-00-00','Br',6,1),(398,0,'','Reid','Mi','0000-00-00','',6,4),(399,0,'','Braaten','Mi','0000-00-00','',6,5),(400,0,'','Gravesen','Mi','0000-00-00','',6,8),(401,0,'','Fernandes','Mi','0000-00-00','',6,8),(402,0,'','Leto','Mi','0000-00-00','',6,10),(403,0,'','Milner','Mi','0000-00-00','',6,14),(404,0,'','Muntari','Mi','0000-00-00','',6,15),(405,0,'','Hargreaves','Mi','0000-00-00','',6,12),(406,0,'Mathieu','Flamini','Mi','0000-00-00','Fr',6,1),(407,0,'','Dunn','Mi','0000-00-00','',6,4),(408,0,'','Kewell','Mi','0000-00-00','',6,10),(409,0,'','Arca','Mi','0000-00-00','',6,13),(410,0,'','Kranjcar','Mi','0000-00-00','',6,15),(411,0,'','Koumas','Mi','0000-00-00','',6,20),(412,0,'','Maloney','Mi','0000-00-00','',6,2),(413,0,'','Speed','Mi','0000-00-00','',6,5),(414,0,'','Emre','Mi','0000-00-00','',6,14),(415,0,'','Etherington','Mi','0000-00-00','',6,19),(416,0,'','Parker','Mi','0000-00-00','',6,19),(417,0,'','Berger','Mi','0000-00-00','',6,2),(418,0,'','McSheffrey','Mi','0000-00-00','',6,3),(419,0,'','Osman','Mi','0000-00-00','',6,8),(420,0,'','Davies','Mi','0000-00-00','',6,9),(421,0,'','O\'Shea','Mi','0000-00-00','',6,12),(422,0,'','O\'Neil','Mi','0000-00-00','',6,13),(423,0,'','Diarra','Mi','0000-00-00','',6,15),(424,0,'','Matejovsky','Mi','0000-00-00','',6,16),(425,0,'','Zokora','Mi','0000-00-00','',6,18),(426,0,'','Mascherano','Mi','0000-00-00','',5,10),(427,0,'','Rochemback','Mi','0000-00-00','',5,13),(428,0,'','Solano','Mi','0000-00-00','',5,19),(429,0,'Vassiriki','Diaby','Mi','0000-00-00','Fr',5,1),(430,0,'','Wilhelmsson','Mi','0000-00-00','',5,5),(431,0,'','Boateng','Mi','0000-00-00','',5,18),(432,0,'','Bowyer','Mi','0000-00-00','',5,19),(433,0,'','Sibierski','Mi','0000-00-00','',5,20),(434,0,'','Tugay','Mi','0000-00-00','',5,4),(435,0,'','Campo','Mi','0000-00-00','',5,5),(436,0,'','Stelios','Mi','0000-00-00','',5,5),(437,0,'','Savage','Mi','0000-00-00','',5,7),(438,0,'','Barnes','Mi','0000-00-00','',5,7),(439,0,'','Murphy','Mi','0000-00-00','',5,9),(440,0,'','Dempsey','Mi','0000-00-00','',5,9),(441,0,'','Davis','Mi','0000-00-00','',5,15),(442,0,'','Harper','Mi','0000-00-00','',5,16),(443,0,'','Kapo','Mi','0000-00-00','',5,3),(444,0,'','Carsley','Mi','0000-00-00','',5,8),(445,0,'','Boateng','Mi','0000-00-00','',5,13),(446,0,'Alexandre ','Song','Mi','0000-00-00','Ca',5,1),(447,0,'','Reo-Coker','Mi','0000-00-00','',5,2),(448,0,'','Dzemaili','Mi','0000-00-00','',5,5),(449,0,'','Seol','Mi','0000-00-00','',5,9),(450,0,'','Davis','Mi','0000-00-00','',5,9),(451,0,'','Gelson','Mi','0000-00-00','',5,11),(452,0,'','Cattermole','Mi','0000-00-00','',5,13),(453,0,'','Mendes','Mi','0000-00-00','',5,15),(454,0,'','Mvuemba','Mi','0000-00-00','',5,15),(455,0,'','Fae','Mi','0000-00-00','',5,16),(456,0,'','Richardson','Mi','0000-00-00','',5,17),(457,0,'','Sissoko','Mi','0000-00-00','',5,10),(458,0,'','Dabo','Mi','0000-00-00','',5,11),(459,0,'','N\'Zogbia','Mi','0000-00-00','',5,14),(460,0,'','Butt','Mi','0000-00-00','',5,14),(461,0,'','Tainio','Mi','0000-00-00','',5,18),(462,0,'','Routledge','Mi','0000-00-00','',5,18),(463,0,'','Gardner','Mi','0000-00-00','',5,2),(464,0,'','Ghaly','Mi','0000-00-00','',5,7),(465,0,'','Ireland','Mi','0000-00-00','',5,11),(466,0,'','Landzaat','Mi','0000-00-00','',5,20),(467,0,'','Valencia','Mi','0000-00-00','',5,20),(468,0,'','Gunnarsson','Mi','0000-00-00','',5,16),(469,0,'','Little','Mi','0000-00-00','',5,16),(470,0,'','Convey','Mi','0000-00-00','',5,16),(471,0,'','Pienaar','Mi','0000-00-00','',5,8),(472,0,'','Hamann','Mi','0000-00-00','',5,11),(473,0,'','Diop','Mi','0000-00-00','',5,15),(474,0,'','Kilbane','Mi','0000-00-00','',5,20),(475,0,'','OubiÃ±a','Mi','0000-00-00','',5,3),(476,0,'','Larsson','Mi','0000-00-00','',5,3),(477,0,'','Peter','Mi','0000-00-00','',5,4),(478,0,'','Cohen','Mi','0000-00-00','',5,5),(479,0,'','McCann','Mi','0000-00-00','',5,5),(480,0,'','Lewis','Mi','0000-00-00','',5,7),(481,0,'','Robert','Mi','0000-00-00','',5,7),(482,0,'','Jones','Mi','0000-00-00','',5,7),(483,0,'','Whitehead','Mi','0000-00-00','',5,17),(484,0,'','Edwards','Mi','0000-00-00','',5,17),(485,0,'','Huddlestone','Mi','0000-00-00','',5,18),(486,0,'','Palacios','Mi','0000-00-00','',5,20),(487,0,'','Bouaouzan','Mi','0000-00-00','',5,20),(488,0,'','Andranik','Mi','0000-00-00','',4,5),(489,0,'','Van Der Meyde','Mi','0000-00-00','',4,8),(490,0,'','Cook','Mi','0000-00-00','',4,9),(491,0,'','Johnson','Mi','0000-00-00','',4,11),(492,0,'','Eagles','Mi','0000-00-00','',4,12),(493,0,'','Leadbitter','Mi','0000-00-00','',4,17),(494,0,'','Oster','Mi','0000-00-00','',4,16),(495,0,'','Etuhu','Mi','0000-00-00','',4,17),(496,0,'','Noble','Mi','0000-00-00','',4,19),(497,0,'','Brown','Mi','0000-00-00','',4,20),(498,0,'','De Silva','Mi','0000-00-00','',4,8),(499,0,'','Wilson','Mi','0000-00-00','',4,15),(500,0,'','Songo\'o','Mi','0000-00-00','',4,15),(501,0,'','Hughes','Mi','0000-00-00','',4,15),(502,0,'','Mullins','Mi','0000-00-00','',4,19),(503,0,'','Osbourne','Mi','0000-00-00','',4,2),(504,0,'','Mokoena','Mi','0000-00-00','',4,4),(505,0,'','Guthrie','Mi','0000-00-00','',4,5),(506,0,'','Alonso','Mi','0000-00-00','',4,5),(507,0,'','Wallace','Mi','0000-00-00','',4,17),(508,0,'','Yorke','Mi','0000-00-00','',4,17),(509,0,'','Salifou','Mi','0000-00-00','',4,2),(510,0,'','Muamba','Mi','0000-00-00','',4,3),(511,0,'','Treacy','Mi','0000-00-00','',4,4),(512,0,'','Feilhaber','Mi','0000-00-00','',4,7),(513,0,'','Holmes','Mi','0000-00-00','',4,7),(514,0,'','Pearson','Mi','0000-00-00','',4,7),(515,0,'','Shawky','Mi','0000-00-00','',4,13),(516,0,'','Reid','Mi','0000-00-00','',4,19),(517,0,'','Collison','Mi','0000-00-00','',4,19),(518,0,'','Skoko','Mi','0000-00-00','',4,20),(519,0,'','Johnson','Mi','0000-00-00','',4,3),(520,0,'','De Ridder','Mi','0000-00-00','',4,3),(521,0,'','Smertin','Mi','0000-00-00','',4,9),(522,0,'','Mendieta','Mi','0000-00-00','',4,13),(523,0,'','LuaLua','Mi','0000-00-00','',4,14),(524,0,'','Cisse','Mi','0000-00-00','',4,16),(525,0,'','Miller','Mi','0000-00-00','',4,17),(526,0,'','Taarabt','Mi','0000-00-00','',4,18),(527,0,'','Nafti','Mi','0000-00-00','',4,3),(528,0,'','O\'Brien J','Mi','0000-00-00','',4,5),(529,0,'','Malcolm','Mi','0000-00-00','',4,7),(530,0,'','Teale','Mi','0000-00-00','',4,7),(531,0,'','Elliott','Mi','0000-00-00','',4,9),(532,0,'','Johnson','Mi','0000-00-00','',4,13),(533,0,'','Pattison','Mi','0000-00-00','',4,14),(534,0,'','Troisi','Mi','0000-00-00','',4,14),(535,0,'','Quashie','Mi','0000-00-00','',4,19),(536,0,'','Waghorn','Mi','0000-00-00','',4,17),(537,0,'','Kavanagh','Mi','0000-00-00','',4,17),(538,0,'','Drogba','Fo','0000-00-00','',12,6),(539,0,'','Rooney','Fo','0000-00-00','',12,12),(540,0,'','Torres','Fo','0000-00-00','',11,10),(541,0,'','Berbatov','Fo','0000-00-00','',9,18),(542,0,'','Anelka','Fo','0000-00-00','',9,6),(543,0,'','Tevez','Fo','0000-00-00','',9,12),(544,0,'','Owen','Fo','0000-00-00','',9,14),(545,0,'','Keane','Fo','0000-00-00','',9,18),(546,0,'Emmanuel','Adebayor','Fo','0000-00-00','To',9,1),(547,0,'','Shevchenko','Fo','0000-00-00','',9,6),(548,0,'','Bent','Fo','0000-00-00','',9,18),(549,0,'','Kuyt','Fo','0000-00-00','',9,10),(550,0,'Robin','Van Persie','Fo','0000-00-00','Ne',9,1),(551,0,'','Saha','Fo','0000-00-00','',9,12),(552,0,'','Martins','Fo','0000-00-00','',8,14),(553,0,'Da Silva','Eduardo','Fo','0000-00-00','Br',8,1),(554,0,'','McCarthy','Fo','0000-00-00','',8,4),(555,0,'','Johnson','Fo','0000-00-00','',8,8),(556,0,'','Crouch','Fo','0000-00-00','',8,10),(557,0,'','Carew','Fo','0000-00-00','',8,2),(558,0,'','Santa Cruz','Fo','0000-00-00','',8,4),(559,0,'','Kalou','Fo','0000-00-00','',8,6),(560,0,'','Bellamy','Fo','0000-00-00','',8,19),(561,0,'','Agbonlahor','Fo','0000-00-00','',8,2),(562,0,'','Yakubu','Fo','0000-00-00','',8,8),(563,0,'','Defoe','Fo','0000-00-00','',8,18),(564,0,'','Castillo','Fo','0000-00-00','',8,11),(565,0,'','Viduka','Fo','0000-00-00','',8,14),(566,0,'','O\'Hara','Fo','0000-00-00','',8,18),(567,0,'','Rose','Fo','0000-00-00','',8,18),(568,0,'','Pizarro','Fo','0000-00-00','',7,6),(569,0,'','Voronin','Fo','0000-00-00','',7,10),(570,0,'Theo','Walcott','Fo','0000-00-00','En',7,1),(571,0,'','Young','Fo','0000-00-00','',7,2),(572,0,'','Roberts','Fo','0000-00-00','',7,4),(573,0,'','Doyle','Fo','0000-00-00','',7,16),(574,0,'','Bianchi','Fo','0000-00-00','',7,11),(575,0,'','Tuncay','Fo','0000-00-00','',7,13),(576,0,'','Diouf','Fo','0000-00-00','',7,5),(577,0,'','McBride','Fo','0000-00-00','',7,9),(578,0,'','Ameobi','Fo','0000-00-00','',7,14),(579,0,'','Sinclair','Fo','0000-00-00','',7,6),(580,0,'','Sahar','Fo','0000-00-00','',7,6),(581,0,'','Vaughan','Fo','0000-00-00','',7,8),(582,0,'','Vassell','Fo','0000-00-00','',7,11),(583,0,'','Bojinov','Fo','0000-00-00','',7,11),(584,0,'','Mido','Fo','0000-00-00','',7,13),(585,0,'','Ashton','Fo','0000-00-00','',6,19),(586,0,'','Mpenza','Fo','0000-00-00','',6,11),(587,0,'','Smith','Fo','0000-00-00','',6,14),(588,0,'','Benjani','Fo','0000-00-00','',6,15),(589,0,'','Davies','Fo','0000-00-00','',6,5),(590,0,'','Kanu','Fo','0000-00-00','',6,15),(591,0,'','Heskey','Fo','0000-00-00','',6,20),(592,0,'','Aliadiere','Fo','0000-00-00','',6,13),(593,0,'','Nugent','Fo','0000-00-00','',6,15),(594,0,'','Kamara','Fo','0000-00-00','',6,9),(595,0,'','Utaka','Fo','0000-00-00','',6,15),(596,0,'','Lita','Fo','0000-00-00','',6,16),(597,0,'','Rigters','Fo','0000-00-00','',6,4),(598,0,'','Helguson','Fo','0000-00-00','',6,5),(599,0,'','Bouazza','Fo','0000-00-00','',6,9),(600,0,'','Samaras','Fo','0000-00-00','',6,11),(601,0,'','McFadden','Fo','0000-00-00','',6,3),(602,0,'','Kitson','Fo','0000-00-00','',6,16),(603,0,'','Derbyshire','Fo','0000-00-00','',6,4),(604,0,'','Anichebe','Fo','0000-00-00','',6,8),(605,0,'','Campbell','Fo','0000-00-00','',6,12),(606,0,'','Jones','Fo','0000-00-00','',6,17),(607,0,'Nicklas','Bendtner','Fo','0000-00-00','De',5,1),(608,0,'','Jerome','Fo','0000-00-00','',5,3),(609,0,'','Dong','Fo','0000-00-00','',5,12),(610,0,'','Cole','Fo','0000-00-00','',5,17),(611,0,'','Healy','Fo','0000-00-00','',5,9),(612,0,'','Long','Fo','0000-00-00','',5,16),(613,0,'','Zamora','Fo','0000-00-00','',5,19),(614,0,'','Camara','Fo','0000-00-00','',5,19),(615,0,'','Miller','Fo','0000-00-00','',5,7),(616,0,'','Bent','Fo','0000-00-00','',5,20),(617,0,'','Vaz Te','Fo','0000-00-00','',5,5),(618,0,'','Dickov','Fo','0000-00-00','',5,11),(619,0,'','Lee Dong-Gook','Fo','0000-00-00','',5,13),(620,0,'','Cole','Fo','0000-00-00','',5,19),(621,0,'','O\'Connor','Fo','0000-00-00','',5,3),(622,0,'','Villa','Fo','0000-00-00','',5,7),(623,0,'','Kuqi','Fo','0000-00-00','',5,9),(624,0,'','John','Fo','0000-00-00','',5,9),(625,0,'','Hutchinson','Fo','0000-00-00','',5,13),(626,0,'','Craddock','Fo','0000-00-00','',5,13),(627,0,'','O\'Donovan','Fo','0000-00-00','',5,17),(628,0,'','Aghahowa','Fo','0000-00-00','',5,20),(629,0,'','Moore','Fo','0000-00-00','',5,2),(630,0,'','Harewood','Fo','0000-00-00','',5,2),(631,0,'','Forssell','Fo','0000-00-00','',5,3),(632,0,'','Sinclair','Fo','0000-00-00','',5,5),(633,0,'','Murphy','Fo','0000-00-00','',5,17),(634,0,'','Chopra','Fo','0000-00-00','',5,17),(635,0,'','Fagan','Fo','0000-00-00','',5,7),(636,0,'','Runstrom','Fo','0000-00-00','',5,9),(637,0,'','Gallagher','Fo','0000-00-00','',5,4),(638,0,'','Harsanyi','Fo','0000-00-00','',5,5),(639,0,'','Macken','Fo','0000-00-00','',5,7),(640,0,'','Earnshaw','Fo','0000-00-00','',5,7),(641,0,'','Etuhu','Fo','0000-00-00','',5,11),(642,0,'','Sturridge','Fo','0000-00-00','',5,11),(643,0,'','Connolly','Fo','0000-00-00','',5,17),(644,0,'','Stokes','Fo','0000-00-00','',5,17),(645,0,'','Cotterill','Fo','0000-00-00','',5,20);

/*Table structure for table `PlayerStatistics` */

DROP TABLE IF EXISTS `PlayerStatistics`;

CREATE TABLE `PlayerStatistics` (
  `playerID` int(15) NOT NULL,
  `gameID` int(15) NOT NULL,
  `goalsScored` int(2) default NULL,
  `assists` int(2) default NULL,
  `goalsConceeded` int(2) default NULL,
  `shotsSaved` int(2) default NULL,
  `penaltySaved` int(2) default NULL,
  `penaltyMissed` int(2) default NULL,
  `yellowCards` int(1) default NULL,
  `redCards` int(1) default NULL,
  `started` tinyint(1) default NULL,
  `played` tinyint(1) default NULL,
  PRIMARY KEY  (`gameID`,`playerID`),
  KEY `statsToGame` (`gameID`),
  KEY `statsToPlayer` (`playerID`),
  CONSTRAINT `statsToGame` FOREIGN KEY (`gameID`) REFERENCES `Game` (`gameID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `statsToPlayer` FOREIGN KEY (`playerID`) REFERENCES `Player` (`playerID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `PlayerStatistics` */

insert  into `PlayerStatistics`(`playerID`,`gameID`,`goalsScored`,`assists`,`goalsConceeded`,`shotsSaved`,`penaltySaved`,`penaltyMissed`,`yellowCards`,`redCards`,`started`,`played`) values (253,1,0,0,0,0,0,0,0,0,1,90),(588,1,0,0,0,0,0,0,0,0,1,90),(351,2,1,1,1,0,0,0,0,0,1,127),(123,3,0,0,0,0,0,0,0,0,1,90),(351,5,1,1,0,0,0,0,0,0,1,65),(364,6,0,0,0,0,0,0,0,0,1,90),(588,7,0,0,0,0,0,0,0,0,1,90),(123,8,0,0,0,0,0,0,0,0,1,90),(9,9,0,0,4,3,0,0,0,0,1,90),(249,9,0,0,0,0,0,0,0,0,1,90),(253,10,0,0,0,0,0,0,0,0,1,90),(546,10,0,0,0,0,0,0,0,0,1,90);

/*Table structure for table `SystemAdministrator` */

DROP TABLE IF EXISTS `SystemAdministrator`;

CREATE TABLE `SystemAdministrator` (
  `adminID` int(15) NOT NULL,
  PRIMARY KEY  (`adminID`),
  KEY `adminToUser` (`adminID`),
  CONSTRAINT `adminToUser` FOREIGN KEY (`adminID`) REFERENCES `User` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `SystemAdministrator` */

insert  into `SystemAdministrator`(`adminID`) values (1),(2),(3);

/*Table structure for table `Team` */

DROP TABLE IF EXISTS `Team`;

CREATE TABLE `Team` (
  `teamID` int(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `leagueID` int(10) default NULL,
  PRIMARY KEY  (`teamID`),
  KEY `teamToLeague` (`leagueID`),
  CONSTRAINT `teamToLeague` FOREIGN KEY (`leagueID`) REFERENCES `League` (`leagueID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `Team` */

insert  into `Team`(`teamID`,`name`,`leagueID`) values (1,'Arsenal',1),(2,'Aston Villa',1),(3,'Birmingham',1),(4,'Blackburn',1),(5,'Bolton',1),(6,'Chelsea',1),(7,'Derby County',1),(8,'Everton',1),(9,'Fulham',1),(10,'Liverpool',1),(11,'Manchester City',1),(12,'Manchester United',1),(13,'Middlesbrough',1),(14,'Newcastle',1),(15,'Portsmouth',1),(16,'Reading',1),(17,'Sunderland',1),(18,'Tottenham',1),(19,'West Ham United',1),(20,'Wigan Athletic',1);

/*Table structure for table `TeamManager` */

DROP TABLE IF EXISTS `TeamManager`;

CREATE TABLE `TeamManager` (
  `managerID` int(15) NOT NULL,
  PRIMARY KEY  (`managerID`),
  KEY `tmToUser` (`managerID`),
  CONSTRAINT `tmToUser` FOREIGN KEY (`managerID`) REFERENCES `User` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `TeamManager` */

insert  into `TeamManager`(`managerID`) values (4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17);

/*Table structure for table `User` */

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `userID` int(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(60) default NULL,
  `fName` varchar(20) default NULL,
  `lName` varchar(30) default NULL,
  `regDate` date default NULL,
  `zipCode` int(9) default NULL,
  `country` varchar(2) default NULL,
  `gender` varchar(1) default NULL,
  `dob` date default NULL,
  PRIMARY KEY  (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `User` */

insert  into `User`(`userID`,`password`,`email`,`fName`,`lName`,`regDate`,`zipCode`,`country`,`gender`,`dob`) values (1,'qwe456','eSmyth@mlsnet.com','Eric','Smyth','2007-08-08',12345,'US','M','1980-01-01'),(2,'wer567','yShin@mlsnet.com','Yong','Shin','2007-08-09',23456,'US','M','1980-01-02'),(3,'ert678','bFish@mlsnet.com','Brian','Fish','2007-08-10',34567,'US','M','1980-01-03'),(4,'rty789','mEdmiston@mlsnet.com','Mathew','Edmiston','2007-08-11',45678,'US','M','1980-01-04'),(5,'tyu890','bEducalane@mlsnet.com','Brittany','Educalane','2007-08-12',56789,'US','F','1980-01-05'),(6,'asd123','eEide@mlsnet.com','Eleanor','Eide','2007-08-13',67890,'US','F','1980-01-06'),(7,'sdf234','sFinch@mlsnet.com','Spencer','Finch','2007-08-14',54321,'US','M','1980-01-07'),(8,'fgh456','tFlaherty@mlsnet.com','Tara','Flaherty','2007-08-15',65432,'US','F','1980-01-08'),(9,'ghj567','rFoster@mlsnet.com','Rachel','Foster','2007-08-16',76543,'US','F','1980-01-09'),(10,'hjk678','sHansen@mlsnet.com','Shelby','Hansen','2007-08-17',87654,'US','M','1980-01-10'),(11,'jkl789','bHinton@mlsnet.com','Brandy','Hinton','2007-08-18',98765,'US','F','1980-01-11'),(12,'zxc098','mJohnson@mlsnet.com','Marcus','Johnson','2007-08-19',9876,'US','M','1980-01-12'),(13,'xcv987','jLawrence@mlsnet.com','Joshua','Lawrence','2007-08-20',10293,'US','M','1980-01-13'),(14,'vbn876','dMaki@mlsnet.com','Dewey','Maki','2007-08-21',1928,'US','M','1980-01-14'),(15,'cvb765','jMarshall@mlsnet.com','Joshua','Marshall','2007-08-22',12009,'US','M','1980-01-15'),(16,'fhs456','sMattson@mlsnet.com','Shaun','Mattson','2007-08-23',67584,'US','M','1980-01-16'),(17,'sdflkj9497','bMiller@mlsnet.com','Brandon','Miller','2007-08-24',89706,'US','M','1980-01-17');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
