create database CAPSTONE_PROJECT_CUSTOMER_DATA

-----Total sales for each product category------
SELECT Product,
SUM (quantity * unitprice) AS Total_sales
FROM [dbo].[Sales Data]
GROUP  BY Product;

------Number of sales transaction in each region---
SELECT region,
COUNT (*) AS transaction_count
FROM [dbo].[Sales Data]
GROUP BY region;

------Highest selling product by total sales values-----
SELECT product,
SUM (quantity * unitprice) AS Total_sales
FROM [dbo].[Sales Data]
GROUP  BY Product
ORDER BY Total_sales DESC

------Total revenue per product---
SELECT product,
SUM (quantity * unitprice) AS Total_sales
FROM [dbo].[Sales Data]
GROUP BY Product

-------Monthly sales total for the current year-------
SELECT
      MONTH(orderdate) AS month,
	  SUM(quantity * unitprice) AS MonthlyTotalsales
FROM [dbo].[Sales Data]
WHERE YEAR (orderdate) = '2024'
GROUP BY MONTH (orderdate)
ORDER BY Month

---Find the top 5 customers by total purchase amount-----
SELECT TOP 5 Customer_id,
    SUM(quantity * unitprice) as TotalPurchaseAmount
FROM [dbo].[Customer Data]
GROUP BY Customer_id
ORDER BY TotalPurchaseAmount DESC


SELECT TOP 5 Customerid,













