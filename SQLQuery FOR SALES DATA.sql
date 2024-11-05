create database CAPSTONE_PROJECT_CUSTOMER_DATA

CREATE TABLE Products (
    Products INT IDENTITY(1,1) primary key,
	ProductName nvarchar NOT NULL
)

ALTER TABLE Products
ALTER COLUMN ProductName NVARCHAR(255)

INSERT INTO [dbo].[Products] (ProductName)
VALUES
   ('Shirts'),
   ('Shoes'),
   ('Hat'),
   ('Socks'),
   ('Jackets'),
   ('Gloves')
  
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
      MONTH(orderdate) AS month ,
	 SUM(quantity * unitprice) AS MonthlyTotalsales
FROM [dbo].[Sales Data] 
WHERE YEAR (orderdate) = '2024'
GROUP BY MONTH (orderdate)
ORDER BY Month

---Find the top 5 customers by total purchase amount-----
SELECT TOP 5 Customer_id,
    SUM(quantity * unitprice) as TotalPurchaseAmount
FROM [dbo].[Sales Data]
GROUP BY Customer_id
ORDER BY TotalPurchaseAmount DESC

-----percentage of Totalsales contributed by each Region-------
WITH Total_Sales AS (
     SELECT
     SUM(quantity * unitPrice) AS Total_Sales
  FROM [dbo].[Sales Data]
)
SELECT 
     Region,
	 SUM(quantity * unitPrice) AS Region_Total,
	 (SUM(quantity * unitPrice) * 100.0) / Total_Sales AS Percentage_of_Total_Sales
FROM [dbo].[Sales Data] 
GROUP BY 
    Region, Total_Sales;

-----Check for product in the last quarter-------

SELECT DISTINCT Product
FROM [dbo].[Sales Data]
	 WHERE Orderdate >= DATEADD(QUARTER, -1, GETDATE())

-----Verify products lists in the products name--------
SELECT ProductName
FROM[dbo].[Products]

-----identify Products with No Sales In the Last Quarter------

SELECT ProductName
FROM [dbo].[Products]
LEFT JOIN
    (SELECT DISTINCT Product
	 FROM [dbo].[Sales Data] 
	 WHERE Orderdate >= DATEADD(QUARTER, -1, GETDATE()) 
) AS SalesData ON Products.ProductName = SalesData.Product  
WHERE SalesData.Product IS NULL







