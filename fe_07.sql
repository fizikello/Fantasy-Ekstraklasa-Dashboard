-- check diff popularity
with popularity_with_diff as (
select 
"PLAYER_INDEX" 
,"NAME" 
,"DATE"
,"POPULARITY"
,"POPULARITY" - LAG("POPULARITY") OVER(PARTITION BY "PLAYER_INDEX" ORDER BY "DATE") as diff
from
"popularity"
WHERE "DATE" IN ('202409301121','202410011509')
ORDER BY diff desc
)
SELECT *
FROM popularity_with_diff
WHERE diff IS NOT NULL
AND ABS(diff) > 5
ORDER BY diff DESC;