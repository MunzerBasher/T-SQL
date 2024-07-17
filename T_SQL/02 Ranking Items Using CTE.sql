WITH SalesTotals AS 
(
    SELECT 
        EmployeeID, 
        SUM(SaleAmount) AS TotalSales
    FROM SalesRecords 
    GROUP BY EmployeeID 
),

RankedSales AS (
    SELECT TOP 3 
        EmployeeID,
        TotalSales, 
        RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
    FROM SalesTotals
)
SELECT  EmployeeID, (TotalSales) ,SalesRank, (SELECT AVG(TotalSales) FROM RankedSales) AS AVR
FROM RankedSales s ;



