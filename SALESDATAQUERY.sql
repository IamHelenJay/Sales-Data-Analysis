SELECT * FROM SalesData;

--- 1. retrieve the total sales for each product category.---
SELECT Product, SUM(Sales) AS TotalSales
FROM SalesData
GROUP BY Product


--- 2. find the number of sales transactions in each region.
SELECT Region, COUNT(OrderID) AS NumOfTransactions
FROM SalesData
GROUP BY Region


-- 3. find the highest-selling product by total sales value.--
SELECT Top (1) Product, SUM(Sales) AS TotalSales
FROM SalesData
GROUP BY Product
ORDER BY TotalSales DESC


--- 4. calculate total revenue per product.---
SELECT Product, SUM(Sales) AS TotalRevenue
FROM SalesData
GROUP BY Product


-- 5. calculate monthly sales totals for the current year
SELECT Month(OrderDate) AS Month,
    SUM(Sales) AS MonthlySalesTotal
FROM SalesData WHERE YEAR(OrderDate) = 2024
GROUP BY Month(OrderDate)
ORDER BY Month


-- 6. find the top 5 customers by total purchase amount.---
SELECT Top (5) Customer_Id,
 SUM(Sales) AS TotalPurchaseAmount FROM SalesData
GROUP BY Customer_Id
ORDER BY TotalPurchaseAmount DESC


-- 7. calculate the percentage of total sales contributed by each region.---
SELECT Region, SUM(Sales) AS RegionTotalSales,
FORMAT(ROUND((SUM(Sales) / CAST((SELECT SUM(Sales) FROM salesdata) AS DECIMAL(10,2)) * 100), 1), '0.#') 
AS PercentageOfTotalSales
FROM salesdata
GROUP BY Region
ORDER BY PercentageOfTotalSales DESC

-- 8. identify products with no sales in the last quarter.---
SELECT Product FROM salesdata
GROUP BY Product
HAVING SUM(CASE 
WHEN OrderDate BETWEEN '2024-06-01' AND '2024-08-31' 
THEN 1 ELSE 0 END) = 0



 

