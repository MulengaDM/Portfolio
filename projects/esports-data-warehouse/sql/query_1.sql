-- Top Champions by Average KDA Ratio in World Championships

WITH ChampionKDA AS (
    SELECT 
        c.ChampionName,
        AVG(
            CASE 
              WHEN pr.PRDeaths = 0 THEN (pr.PRKills + pr.PRAssists)
              ELSE (pr.PRKills + pr.PRAssists) * 1.0 / pr.PRDeaths 
            END
        ) AS AvgKDA
    FROM PersonalRecordDim pr
    JOIN PlayerInGameDim pig ON pr.PRID = pig.PRID
    JOIN ChampionDim c ON pig.ChampionID = c.ChampionID
    JOIN GameFact gf ON pig.GameID = gf.GameID
    JOIN EventDim ed ON gf.EventID = ed.EventID
    GROUP BY c.ChampionName
)
SELECT 
    ChampionName,
    AvgKDA,
    RANK() OVER (ORDER BY AvgKDA DESC) AS KDA_Rank
FROM ChampionKDA
ORDER BY KDA_Rank;
