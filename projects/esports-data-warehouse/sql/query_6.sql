-- Refund Analysis by Refund Type with Ranking and Percentage

WITH RefundSummary AS (
  SELECT 
    rd.RefundType,
    SUM(rf.TicketsRefundedPND) AS TotalTicketRefundPND
  FROM RefundFact rf
  JOIN RefundDim rd ON rf.RefundID = rd.RefundID
  GROUP BY rd.RefundType
),
OverallTotal AS (
  SELECT SUM(TotalTicketRefundPND) AS GrandTotal
  FROM RefundSummary
)
SELECT 
  rs.RefundType,
  rs.TotalTicketRefundPND,
  RANK() OVER (ORDER BY rs.TotalTicketRefundPND DESC) AS RefundRank,
  CAST(rs.TotalTicketRefundPND * 100.0 / ot.GrandTotal AS DECIMAL(5,2)) AS PercentageOfTotal
FROM RefundSummary rs, OverallTotal ot
ORDER BY RefundRank;
