DROP VIEW IF EXISTS `ecsmyth`.`TeamPlayerPosition`;

create view TeamPlayerPosition (leagueName, teamName, playerLName, pos)
as select l.name, t.name, p.lName, p.position
	from Team t, Player p, League l
	where p.teamID = t.teamID && t.leagueID = l.leagueID;

select * from TeamPlayerPosition where teamName='Arsenal';