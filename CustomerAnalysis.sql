-- Create a new database called 'CustomerAnalysis'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'CustomerAnalysis'
)
CREATE DATABASE CustomerAnalysis
GO

--checking if table is imported correctly
SELECT*
FROM CustomerAnalysis..Customersales

--Total cost
SELECT SUM(Cost) AS 'Total Cost'
FROM CustomerAnalysis..Customersales

--Total Units Cost (COGS-Cost of Goods Sold)
SELECT SUM(Unit_Cost) AS 'Total COGS'
FROM CustomerAnalysis..Customersales

--Total Revenue
SELECT SUM(Revenue) AS 'Total Revenue'
FROM CustomerAnalysis..Customersales

--Net Profit
SELECT SUM(Revenue)-SUM(Cost) AS 'Net Profit'
FROM CustomerAnalysis..Customersales

--Gross Profit
SELECT SUM(Revenue)-SUM(Unit_Cost) AS 'Gross Profit'
FROM CustomerAnalysis..Customersales

--Monthly sales
--Jan 2015
SELECT SUM(Revenue) as "Jan 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'January' AND [Year] LIKE 2015 
--Feb 2015
SELECT SUM(Revenue) as "Feb 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'February' AND [Year] LIKE 2015 
--March 2015
SELECT SUM(Revenue) as "March 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'March' AND [Year] LIKE 2015 
--April 2015
SELECT SUM(Revenue) as "April 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'April' AND [Year] LIKE 2015 
--May 2015
SELECT SUM(Revenue) as "May 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'May' AND [Year] LIKE 2015 
--June 2015
SELECT SUM(Revenue) as "June 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'June' AND [Year] LIKE 2015 
--July 2015
SELECT SUM(Revenue) as "July 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'July' AND [Year] LIKE 2015 
--August 2015
SELECT SUM(Revenue) as "Aug 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'August' AND [Year] LIKE 2015 
--September 2015
SELECT SUM(Revenue) as "Sept 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'September' AND [Year] LIKE 2015 
--October 2015
SELECT SUM(Revenue) as "Oct 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'October' AND [Year] LIKE 2015 
--November 2015
SELECT SUM(Revenue) as "Nov 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'November' AND [Year] LIKE 2015 
--December 2015
SELECT SUM(Revenue) as "Dec 2015 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'December' AND [Year] LIKE 2015 
--January 2016
SELECT SUM(Revenue) as "Jan 2016 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'January' AND [Year] LIKE 2016
--February 2016 
SELECT SUM(Revenue) as "Feb 2016 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'February' AND [Year] LIKE 2016
--March 2016
SELECT SUM(Revenue) as "March 2016 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'March' AND [Year] LIKE 2016
--April 2016
SELECT SUM(Revenue) as "April 2016 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'April' AND [Year] LIKE 2016
--May 2016
SELECT SUM(Revenue) as "May 2016 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'May' AND [Year] LIKE 2016
--June 2016 
SELECT SUM(Revenue) as "June 2016 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'June' AND [Year] LIKE 2016
--July 2016 
SELECT SUM(Revenue) as "July 2016 revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] like 'July' AND [Year] LIKE 2016 

--Ranking of revenue by month (Highest to lowest)
SELECT [Month], Year, SUM(Revenue) AS "Total revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] IS NOT NULL
GROUP BY [Year],[Month]
ORDER BY [Total revenue] DESC

--Females vs Males shoppers?
SELECT Customer_Gender
FROM CustomerAnalysis..Customersales
--
SELECT Customer_Gender, COUNT(Customer_Gender) AS "Number of customers"
FROM CustomerAnalysis..Customersales
WHERE Customer_Gender IS NOT NULL
GROUP BY Customer_Gender
ORDER BY [Number of customers] DESC

--Sales graph
SELECT [Date],Revenue
FROM CustomerAnalysis..Customersales
WHERE [Date] IS NOT NULL
ORDER BY [Date] ASC

-- Revenue by country
SELECT Country,Revenue
FROM CustomerAnalysis..Customersales
--Ranking of revenue by country (highest to lowest)
SELECT Country, SUM(Revenue) AS "Total revenue"
FROM CustomerAnalysis..Customersales
WHERE Country IS NOT NULL
GROUP BY Country
ORDER BY [Total revenue] DESC

--Which product category had highest sales?
SELECT Product_Category, SUM(Revenue) AS "Total sales"
FROM CustomerAnalysis..Customersales
WHERE Product_Category IS NOT NULL
GROUP BY Product_Category
ORDER BY [Total revenue] DESC

--Which sub category had highest sales?
SELECT Sub_Category, SUM(Revenue) AS "Total sales"
FROM CustomerAnalysis..Customersales
WHERE Sub_Category IS NOT NULL
GROUP BY Sub_Category
ORDER BY [Total sales] DESC

--Breaking down sales by age 
SELECT Customer_Age, COUNT(Customer_Age) AS "Age"
FROM CustomerAnalysis..Customersales
WHERE Customer_Age IS NOT NULL
GROUP BY Customer_Age
ORDER BY [Age] DESC

--Creating views for later visulaization
--Total revenue by month
CREATE VIEW TotalRevenuebymonth AS
SELECT [Month], Year, SUM(Revenue) AS "Total revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] IS NOT NULL
GROUP BY [Year],[Month]
--ORDER BY [Total revenue] DESC

--Total Revenue by Country
CREATE VIEW TotalRevenuebyCountry AS
SELECT Country, SUM(Revenue) AS "Total revenue"
FROM CustomerAnalysis..Customersales
WHERE Country IS NOT NULL
GROUP BY Country
--ORDER BY [Total revenue] DESC

--Product category ranking
CREATE VIEW Productcategoryranking AS
SELECT Product_Category, SUM(Revenue) AS "Total sales"
FROM CustomerAnalysis..Customersales
WHERE Product_Category IS NOT NULL
GROUP BY Product_Category
--ORDER BY [Total revenue] DESC

--Sub-category ranking
CREATE VIEW Subcategoryranking AS
SELECT Sub_Category, SUM(Revenue) AS "Total sales"
FROM CustomerAnalysis..Customersales
WHERE Sub_Category IS NOT NULL
GROUP BY Sub_Category
--ORDER BY [Total sales] DESC

--Customer ages
CREATE VIEW Customerage AS
SELECT Customer_Age, COUNT(Customer_Age) AS "Age"
FROM CustomerAnalysis..Customersales
WHERE Customer_Age IS NOT NULL
GROUP BY Customer_Age
--ORDER BY [Age] DESC

--Tables for Tableau
1--Total Revenue
SELECT SUM(Revenue) AS 'Total Revenue'
FROM CustomerAnalysis..Customersales

2--Net Profit
SELECT SUM(Revenue)-SUM(Cost) AS 'Net Profit'
FROM CustomerAnalysis..Customersales

3--Gross Profit
SELECT SUM(Revenue)-SUM(Unit_Cost) AS 'Gross Profit'
FROM CustomerAnalysis..Customersales

4--Ranking of revenue by month (Highest to lowest)
SELECT [Month], Year, SUM(Revenue) AS "Total revenue"
FROM CustomerAnalysis..Customersales
WHERE [Month] IS NOT NULL
GROUP BY [Year],[Month]
ORDER BY [Total revenue] DESC

5--Females vs Males shoppers?
SELECT Customer_Gender, COUNT(Customer_Gender) AS "Number of customers"
FROM CustomerAnalysis..Customersales
WHERE Customer_Gender IS NOT NULL
GROUP BY Customer_Gender
ORDER BY [Number of customers] DESC

6--Sales graph
SELECT [Date],Revenue
FROM CustomerAnalysis..Customersales
WHERE [Date] IS NOT NULL
ORDER BY [Date] ASC

7--Ranking of revenue by country (highest to lowest)
SELECT Country, SUM(Revenue) AS "Total revenue"
FROM CustomerAnalysis..Customersales
WHERE Country IS NOT NULL
GROUP BY Country
ORDER BY [Total revenue] DESC

8--Which product category had highest sales?
SELECT Product_Category, SUM(Revenue) AS "Total sales"
FROM CustomerAnalysis..Customersales
WHERE Product_Category IS NOT NULL
GROUP BY Product_Category
ORDER BY [Total sales] DESC

9--Which sub category had highest sales?
SELECT Sub_Category, SUM(Revenue) AS "Total sales"
FROM CustomerAnalysis..Customersales
WHERE Sub_Category IS NOT NULL
GROUP BY Sub_Category
ORDER BY [Total sales] DESC

10--Breaking down sales by age 
SELECT Customer_Age, COUNT(Customer_Age) AS "Age"
FROM CustomerAnalysis..Customersales
WHERE Customer_Age IS NOT NULL
GROUP BY Customer_Age
ORDER BY [Age] DESC