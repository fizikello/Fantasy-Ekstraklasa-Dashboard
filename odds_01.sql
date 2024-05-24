WITH
	o AS
	(
		SELECT "1", "X", "2", "ID_team_home", "ID_team_away", "ID_date", "update-date" FROM odds t1
		WHERE "update-date" = (SELECT MAX("update-date" ) FROM odds t2 WHERE t1."event-id"=t2."event-id")
	),
	a AS
	(	
		SELECT "ID", "NAME_FORTUNA" AS HOME FROM teams
	),
	b AS
	(	
		SELECT "ID", "NAME_FORTUNA" AS AWAY FROM teams
	),
	c AS
	(
		SELECT "ID", "DATE" FROM calendar
	),
	d AS
	(
		SELECT "ID", "NAME_FANTASY" AS HOME_F, "SHORT_NAME_FANTASY" AS HOME_S FROM public."teams-linked"
	),
	e AS
	(
		SELECT "ID", "NAME_FANTASY" AS AWAY_F, "SHORT_NAME_FANTASY" AS AWAY_S FROM public."teams-linked"
	)
SELECT 
	o."1"
	, o."X", o."2", 
	--a.HOME, b.AWAY, 
	c."DATE", d.HOME_F, d.HOME_S, e.AWAY_F, e.AWAY_S
	, o."update-date"
FROM o
--INNER JOIN a
--ON o."ID_team_home" = a."ID"
--INNER JOIN b
--ON o."ID_team_away" = b."ID"
INNER JOIN c
ON o."ID_date" = c."ID"
INNER JOIN d
ON o."ID_team_home" = d."ID" 
INNER JOIN e
ON o."ID_team_away" = e."ID" 