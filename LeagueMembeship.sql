DROP VIEW IF EXISTS `ecsmyth`.`FantasyLeagueMembership`;

create view FantasyLeagueMembership (fLeagueName, commissionerName, fTeamName, managerName)
as select fl.name, u.lName, ft.name, su.lName
	from FantasyTeam ft, FantasyLeague fl, FantasyLeagueRegistration flr, LeagueCommissioner lc, User u, User su, TeamManager tm
	where ft.fantasyTeamID = flr.fantasyTeamID && fl.fantasyLeagueID = flr.fantasyLeagueID && fl.commissionerID = lc.commissionerID && lc.commissionerID = u.userID && tm.managerID = su.userID && ft.managerID = tm.managerID;

select * from FantasyLeagueMembership where fLeagueName='UW:T';
