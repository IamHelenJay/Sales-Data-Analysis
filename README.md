# Project Title: - SALES DATA ANALYSIS
---

## Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools Used](#tools-used)
- [Data Cleaning and Preparation](#data-cleaning-and-preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results and Findings](#results-and-findings)
- [Recommendations](#recommendations)
---

## Project Overview
---
This Project is designed to analysze and derive valuable insights from a sales dataset for the year 2023 to 2024. The goal is to understand sales trends, identify top performing products, analyze regional contributions, and gain deeper knowledge about customer purchases.

## Data Sources 
---
The primary source of data used in this analysis is the CustomerData set.

## Tools Used
---
1. Microsoft Excel [Download here](https://www.microsoft.com)
- For data cleaning and analysis, creating pivot tables, and calculating metrics such as average sales per product and total revenue by region.
Enabled detailed inspection and summary of sales data to find trends and patterns.

2. SQL (Structure Query Language)
- For extracting key insights from the dataset.

3. Power BI
- Used to create interactive dashboards and visualizations.

## Data Cleaning and Preparation
---
In the initial stage of data cleaning and preparation, we performed the following steps to clean the data;
 - Data Loading and Inspection
- Handling Missing Data
- Data Cleaning and Formatting

## Exploratory Data Analysis 
---
The EDA involves the following key questions;
retrieve the total sales for each product category.
- find the number of sales transactions in each region.
- find the highest-selling product by total sales value.
- calculate total revenue per product.
- calculate monthly sales totals for the current year.
- find the top 5 customers by total purchase amount.
- calculate the percentage of total sales contributed by each region.
- identify products with no sales in the last quarter.

## Data Analysis
---
Below are examples of some SQL queries and DAX expressions used during the analysis to extract and analyze key insights from the Sales dataset:

SQL CODES
1. Retrieve All Data for Initial Inspection
```
SELECT * FROM SalesData;
```
---
2. find the number of sales transactions in each region.
```
SELECT Region, COUNT(OrderID) AS NumOfTransactions
FROM SalesData
GROUP BY Region;
```
![image](https://github.com/user-attachments/assets/008e4732-b255-4053-bb3d-ab4d5883071c)


---
3. find the highest-selling product by total sales value.
```
SELECT Top (1) Product, SUM(Sales) AS TotalSales
FROM SalesData
GROUP BY Product
ORDER BY TotalSales DESC;
```
Product | TotalSales
--------|------------
Shoes	  | 613380

![image](https://github.com/user-attachments/assets/04a83ace-ebae-48c5-939f-90d80b3586f7)



4. calculate monthly sales totals for the current year
```
SELECT Month(OrderDate) AS Month,
    SUM(Sales) AS MonthlySalesTotal
FROM SalesData WHERE YEAR(OrderDate) = 2024
GROUP BY Month(OrderDate)
ORDER BY Month;
```
![image](https://github.com/user-attachments/assets/c1e9c6c5-c951-47c2-a893-56f17e5e3e53)


---
5. identify products with no sales in the last quarter.
```
SELECT Product FROM salesdata
GROUP BY Product
HAVING SUM(CASE 
WHEN OrderDate BETWEEN '2024-06-01' AND '2024-08-31' 
THEN 1 ELSE 0 END) = 0
```

## Results and Findings
---
The analysis yielded the following quantitative insights;
- Shoes is the highest revenue-generating product, making them a top focus for marketing and stock optimization.
- The count of sales transactions varied slightly across regions:
North: 2,481 transactions
East: 2,483 transactions
South: 2,480 transactions
West: 2,477 transactions
Observation: The number of transactions was fairly balanced, with the East region having a marginally higher count. This indicates consistent customer engagement across all regions.
- February and August had the highest monthly sales totals, indicating potential seasonal factors or successful promotional campaigns during those months.
- The consistency in high purchase amounts among the top customers highlights an opportunity for loyalty programs or personalized marketing to retain and grow this customer segment.
- The South region contributed the most to total sales, making it a key market for targeted campaigns. East also showed significant potential.
![image](https://github.com/user-attachments/assets/a3e56915-133b-44dc-aa97-9e214c02994e)
- Products that had no recorded sales in the last quarter (October to December):
Jacket, Socks, Shirt.
The absence of sales for these products in the last quarter suggests a need for review—potential causes might include seasonal trends, stock shortages, or reduced customer interest.

## Recommendations
---
Based on the results and findings from the customer data analysis, the following recommendations are suggested to improve product performance, enhance regional strategies, and optimize customer engagement;

1. Focus on High-Performing Products: Increase marketing and maintain adequate stock levels for top-sellers like Shoes and Shirt to sustain high sales.

2. Revitalize Underperforming Products: Address low sales in Jacket, Socks, and Shirt with targeted promotions and product strategy reviews, especially in the last quarter.

3. Enhance Regional Marketing: Strengthen efforts in the South region with loyalty programs and targeted campaigns, while boosting visibility and sales in the West.

4. Engage High-Value Customers: Implement loyalty programs and personalized marketing for top customers to encourage repeat purchases and maximize customer lifetime value.





