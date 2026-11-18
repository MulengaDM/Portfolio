-- Champion Purchase Analysis with Relative Contribution

WITH ChampionPurchase AS (
    SELECT 
        c.ChampionID,
        c.ChampionName,
        COUNT(cigs.ChampionInGameSpecID) AS TotalPurchaseCount
    FROM ChampionInGameSpecDim cigs
    JOIN PlayerInGameDim pig ON cigs.PlayerInGameID = pig.PlayerInGameID
    JOIN ChampionDim c ON pig.ChampionID = c.ChampionID
    GROUP BY c.ChampionID, c.ChampionName
),
ChampionRanked AS (
    SELECT 
        ChampionName,
        TotalPurchaseCount,
        RANK() OVER (ORDER BY TotalPurchaseCount DESC) AS PurchaseRank,
        SUM(TotalPurchaseCount) OVER () AS OverallTotalPurchases
    FROM ChampionPurchase
)
SELECT 
    ChampionName,
    TotalPurchaseCount,
    PurchaseRank,
    CAST(TotalPurchaseCount * 100.0 / OverallTotalPurchases AS DECIMAL(5,2)) AS PurchasePercentage
FROM ChampionRanked
ORDER BY PurchaseRank;
