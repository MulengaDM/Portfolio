-- Financial Performance per Event 

SELECT 
  ed.EventYear,
  ed.EventName,
  SUM(ef.MerchandiseSoldPND) AS TotalMerchandiseRevenue,
  SUM(ef.TicketsSoldPND) AS TotalTicketRevenue,
  SUM(ef.PromotionRevenue) AS TotalPromotionRevenue,
  SUM(ef.MerchandiseSoldPND + ef.TicketsSoldPND + ef.PromotionRevenue) AS TotalEventRevenue,
  CAST(
    SUM(ef.MerchandiseSoldPND + ef.TicketsSoldPND + ef.PromotionRevenue) * 100.0 / 
    SUM(SUM(ef.MerchandiseSoldPND + ef.TicketsSoldPND + ef.PromotionRevenue)) OVER ()
    AS DECIMAL(5,2)
  ) AS RevenuePercentage
FROM EventFact ef
JOIN EventDim ed ON ef.EventID = ed.EventID
GROUP BY ROLLUP(ed.EventYear, ed.EventName)
HAVING ed.EventYear IS NOT NULL AND ed.EventName IS NOT NULL
ORDER BY ed.EventYear, ed.EventName;
