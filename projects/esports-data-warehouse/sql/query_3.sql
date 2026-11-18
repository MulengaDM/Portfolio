-- Promotion Effectiveness Analysis with Average Promotion Revenue

SELECT
  m.MarketeerName,
  ed.EventName,
  AVG(p.PromotionDuration) AS AvgPromotionDuration,
  AVG(ef.PromotionRevenue) AS AvgPromotionRevenue
FROM PromotionDim p
LEFT JOIN EventFact ef ON p.PromotionID = ef.PromotionID
JOIN MarketeerDim m ON p.MarketeerID = m.MarketeerID
JOIN EventDim ed ON p.PromotionEventID = ed.EventID
GROUP BY GROUPING SETS (
  (m.MarketeerName, ed.EventName),
  (m.MarketeerName),
  (ed.EventName)
)
HAVING m.MarketeerName IS NOT NULL AND ed.EventName IS NOT NULL
ORDER BY AvgPromotionRevenue, m.MarketeerName, ed.EventName;
