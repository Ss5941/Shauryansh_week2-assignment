DROP DATABASE superstore;
CREATE DATABASE superstore;
USE superstore;
SHOW TABLES;

-- SEC- 1: DATA EXPLORATION
-- Q1. View first 10 records
SELECT * FROM superstore LIMIT 10;

-- Q2. Count total number of rows
SELECT COUNT(*) AS Total_Rows
FROM superstore;

-- Q3. View table structure
DESC superstore;

-- Q4. View distinct product categories
SELECT DISTINCT Category
FROM superstore;


-- SEC- 2: FILTERING DATA

-- Q5. Orders from West Region
SELECT *
FROM superstore
WHERE Region = 'West';

-- Q6. Technology category products
SELECT *
FROM superstore
WHERE Category = 'Technology';

-- Q7. Orders with sales greater than 1000
SELECT *
FROM superstore
WHERE Sales > 1000;

-- Q8. Furniture orders from East region
SELECT *
FROM superstore
WHERE Category = 'Furniture'
AND Region = 'East';



-- SEC- 3: AGGREGATION ANALYSIS

-- Q10. Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM superstore;

-- Q11. Average Sales
SELECT AVG(Sales) AS Average_Sales
FROM superstore;

-- Q12. Total Quantity Sold
SELECT SUM(Quantity) AS Total_Quantity
FROM superstore;

-- Q13. Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM superstore;


-- SEC- 4: CATEGORY ANALYSIS


-- Q14. Total Sales by Category
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Q15. Total Profit by Category
SELECT Category,
       SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Q16. Top Categories by Sales
SELECT Category,
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC
LIMIT 5;


-- SEC - 5: TOP PRODUCTS


-- Q17. Top 10 Products by Sales
SELECT' Product Name',
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY 'Product Name'
ORDER BY Total_Sales DESC
LIMIT 10;




-- SECT- 6: TOP CUSTOMERS


-- Q18. Top 10 Customers by Sales
SELECT 'Customer Name',
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY 'Customer Name'
ORDER BY Total_Sales DESC
LIMIT 10;



-- SEC-7: REGION ANALYSIS


-- Q19. Sales by Region
SELECT Region,
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;



-- SEC- 8: BUSINESS USE CASES


-- Q20. Monthly Sales Trend
SELECT MONTH(STR_TO_DATE('Order_Date', '%m/%d/%Y')) AS Month_No,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Month_No
ORDER BY Month_No;

-- Q21. Monthly Profit Trend
SELECT MONTH(STR_TO_DATE('Order Date', '%m/%d/%Y')) AS Month_No,
SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Month_No
ORDER BY Month_No;

-- Q22. Top 5 Most Profitable Products
SELECT 'Product Name',
SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY 'Product Name'
ORDER BY Total_Profit DESC
LIMIT 5;



-- SEC-9: DATA VALIDATION


-- Q23. Find Duplicate Order IDs
SELECT 'Order ID',
COUNT(*) AS Duplicate_Count
FROM superstore
GROUP BY 'Order ID'
HAVING COUNT(*) > 1;

-- Q24. Check Missing Sales Values
SELECT *
FROM superstore
WHERE Sales IS NULL;

-- Q25. Verify Total Row Count
SELECT COUNT(*) AS Total_Rows
FROM superstore;


