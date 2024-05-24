--select distinct "DATE"
--from "popularity"
--ORDER BY "DATE" DESC

-- players
--select * from "players"
--where "UPDATE_DATE" = '202405220839'

-- details
--select * from "details_t01"
--where "DATE" = '202405220839'
--and
--"PLAYER_INDEX" = '2214'

-- popularity
--select * from "popularity"
--where "DATE" in (
--	'202405220839','202405172126','202405102205', '202405042305','202404261848', '202404192343','202404121931','202404051816','20240402', '20240316', '20240308', '20240304', '20240223', '20240216', '20240209')

--select * from "scrap_performance"
--WHERE "TECHNOLOGY" != 'test'
--where "DATE" = '202405220839'

-- clean details
--DELETE FROM "details_t01"
--WHERE ("PLAYER_INDEX", "DATE") NOT IN
--(SELECT "PLAYER_INDEX", MAX("DATE") 
-- FROM "popularity" 
--     GROUP BY "PLAYER_INDEX");

--check details_t01
--select count(*) from "details_t01"

-- check diff popularity
--with popularity_with_diff as (
--select 
--"PLAYER_INDEX", 
--"NAME", 
--"DATE",
--"POPULARITY"
--,"POPULARITY" - LAG("POPULARITY") OVER(PARTITION BY "PLAYER_INDEX" ORDER BY "DATE") as diff
--from
--"popularity"
--WHERE "DATE" IN ('202404111439', '202404121019')
--ORDER BY diff desc
--)
--SELECT *
--FROM popularity_with_diff
--WHERE diff IS NOT NULL
--AND ABS(diff) > 50
--ORDER BY diff DESC;
