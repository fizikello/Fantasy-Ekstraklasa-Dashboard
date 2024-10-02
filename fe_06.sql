
-- clean details
DELETE FROM "details_t01"
WHERE ("PLAYER_INDEX", "DATE") NOT IN
(SELECT "PLAYER_INDEX", MAX("DATE") 
 FROM "popularity" 
 GROUP BY "PLAYER_INDEX");

--check details_t01
--select count(*) from "details_t01"