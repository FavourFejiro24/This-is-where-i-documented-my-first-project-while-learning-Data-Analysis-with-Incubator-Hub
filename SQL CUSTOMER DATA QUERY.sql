create table Customer_Data (
Customer_ID int primary key,
Customer_Name nvarchar,
Region nvarchar,
Subscription_Type nvarchar,
Subscription_Start int,
Subscription_End int,
Cancelled nvarchar,
Revenue int,
)

-----Total number of customers from each region ------
SELECT Region,
COUNT (*) AS TotalCustomers
FROM [dbo].[Customer Data]
GROUP BY Region

------most popular subscription type by the number of customers------
SELECT SubscriptionType,
COUNT (*) AS CustomerCount
FROM [dbo].[Customer Data]
GROUP BY SubscriptionType 
ORDER BY CustomerCount DESC 

-----customers who cancelled their subscription within six months------
SELECT CustomerID
FROM [dbo].[Customer Data]
WHERE DATEDIFF(MONTH, SubcriptionStart, SubscriptionEnd)  <= 6

-----Calculate the average subscription duration for all customers--------
SELECT AVG (DATEDIFF(MONTH, 
SubcriptionStart, SubscriptionEnd)) AS
AVERAGESubscriptionDuration
FROM [dbo].[Customer Data]

------Customers with subscription longer than 12 months----
SELECT CustomerID
FROM [dbo].[Customer Data]
WHERE DATEDIFF(MONTH, SubcriptionStart, SubscriptionEnd) > 12

-----Total revenue by subscriptiontype-------
SELECT SubscriptionType, 
SUM (Revenue) AS TotalRevenue
FROM [dbo].[Customer Data]
GROUP BY SubscriptionType

----Top 3 region by subscription cancellation-----
SELECT Region,
SubscriptionType,
COUNT (*) AS CancellationCount
FROM [dbo].[Customer Data]
WHERE SubscriptionEnd IS NOT NULL ---- Assuming a null SubscriptionEnd indicates an activesubscription
GROUP BY Region,
SubscriptionType
ORDER BY Region,
CancellationCount DESC; 

-----Total number of active and cancelled subscription------
SELECT
  SUM(CASE WHEN SubscriptionEnd IS NOT NULL
  THEN 1 ELSE 0 END ) AS ActiveSubscriptions,
  SUM(CASE WHEN SubscriptionEnd  IS NOT NULL   THEN 1 ELSE 0 END ) 
AS CancelledSubscriptions 
FROM [dbo].[Customer Data]

