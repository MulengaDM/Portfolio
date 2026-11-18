-- Online Sales Aggregation by Event Period

WITH EventPeriod AS (
    SELECT
        ed.EventID,
        ed.EventName,
        ds_start.DateValue AS StartDate,
        ds_end.DateValue AS EndDate
    FROM EventDim ed
    JOIN DateDim ds_start ON ed.EventStartDateID = ds_start.DateID
    JOIN DateDim ds_end ON ed.EventEndDateID = ds_end.DateID
)
SELECT
    ep.EventID,
    ep.EventName,
    ep.StartDate,
    ep.EndDate,
    SUM(osf.MerchandiseSold) AS TotalUnitsSold,
    SUM(osf.MerchandiseSoldPND) AS TotalRevenue
FROM OnlineSalesFact osf
JOIN DateDim ds ON osf.DateID = ds.DateID
JOIN EventPeriod ep ON ds.DateValue BETWEEN ep.StartDate AND ep.EndDate
GROUP BY ep.EventID, ep.EventName, ep.StartDate, ep.EndDate
ORDER BY ep.EventID;
