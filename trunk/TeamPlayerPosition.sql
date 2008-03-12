DROP VIEW IF EXISTS `ecsmyth`.`TeamPlayerPosition`;

create view TeamPlayerPosition (teamName, playerLName, pos)
as select t.name, p.lName, p.position
	from Team t, Player p
	where p.teamID = t.teamID;

select * from TeamPlayerPosition where teamName='Arsenal';