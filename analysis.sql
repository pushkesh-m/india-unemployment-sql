USE unemployment_india;

SELECT * FROM unemployment
LIMIT 10 ;

-- SECTION 1: DATA EXPLORATION
-- How many rows do we have?
SELECT COUNT(*) AS total_rows FROM unemployment;
 
-- What does the data look like?
SELECT * FROM unemployment LIMIT 10;
 
-- What states are in the dataset?
SELECT DISTINCT Region FROM unemployment ORDER BY Region;
 
-- How many unique states?
SELECT COUNT(DISTINCT Region) AS total_states FROM unemployment;
 
-- What areas are covered?
SELECT DISTINCT Area FROM unemployment;
 
-- What is the date range of the data?
SELECT
MIN(SUBSTRING(Date, 8, 4)) AS start_year,
MAX(SUBSTRING(Date, 8, 4)) AS end_year
FROM unemployment;
 
-- Check for nulls in key columns
SELECT
COUNT(*) AS total_rows,
COUNT(Region) AS region_filled,
COUNT(Date) AS date_filled,
COUNT(Unemployment_Rate) AS rate_filled,
COUNT(Area) AS area_filled
FROM unemployment;

-- SECTION 2: DATA CLEANING
-- Check for duplicate rows
SELECT Region, Date, Area, COUNT(*) AS count
FROM unemployment
GROUP BY Region, Date, Area
HAVING count > 1;
 
-- Verify date format looks correct
SELECT Date, 
SUBSTRING(Date, 5, 2) AS month,
SUBSTRING(Date, 8, 4) AS year
FROM unemployment
LIMIT 10;
 
-- Check unemployment rate range (spot any outliers)
SELECT 
MIN(Unemployment_Rate) AS min_rate,
MAX(Unemployment_Rate) AS max_rate,
ROUND(AVG(Unemployment_Rate), 2) AS avg_rate
FROM unemployment;

-- SECTION 3: ANALYSIS
-- QUERY 1: Top 10 States by Average Unemployment Rate
SELECT Region, ROUND(AVG(Unemployment_Rate)) AS AVGRAGE_UNEMPLOYMENT_RATE
FROM unemployment
GROUP BY REGION 
ORDER BY AVGRAGE_UNEMPLOYMENT_RATE DESC
LIMIT 10;

-- QUERY 2: National Monthly Trend (Spot the COVID spike)
SELECT SUBSTRING(Date,5,2) AS month_no, ROUND(AVG(Unemployment_Rate)) AS AVGRAGE_UNEMPLOYMENT_RATE
FROM unemployment
GROUP BY SUBSTRING(Date,5,2) 
ORDER BY month_no ASC
LIMIT 12;

-- QUERY 3: Rural vs Urban Comparison
SELECT Area , ROUND(AVG(labour_participation_rate)) as LABOUR_PARTICIPATION , ROUND(AVG(Unemployment_Rate)) AS AVGRAGE_UNEMPLOYMENT_RATE FROM unemployment
GROUP BY area;

-- QUERY 4: Pre-COVID Unemployment by State (before March 2020)
SELECT Region , ROUND(AVG(Unemployment_Rate)) AS AVGRAGE_UNEMPLOYMENT_RATE FROM unemployment
WHERE Date < '01-03-2020'
GROUP BY REGION 
ORDER BY AVGRAGE_UNEMPLOYMENT_RATE DESC;

-- QUERY 5: Hardest Hit States (April - May 2020 peak lockdown)
SELECT Region , ROUND(AVG(Unemployment_Rate)) AS AVGRAGE_UNEMPLOYMENT_RATE FROM unemployment
WHERE SUBSTRING(Date, 8, 4) = '2020' AND SUBSTRING(Date, 5, 2) IN ('04', '05')
GROUP BY REGION 
ORDER BY AVGRAGE_UNEMPLOYMENT_RATE DESC;

-- QUERY 6: Most Resilient States (lowest rate during COVID)
SELECT Region , ROUND(AVG(Unemployment_Rate)) AS AVGRAGE_UNEMPLOYMENT_RATE FROM unemployment
WHERE SUBSTRING(Date, 8, 4) = '2020' 
GROUP BY REGION 
ORDER BY AVGRAGE_UNEMPLOYMENT_RATE ASC
LIMIT 10;

-- QUERY 7: States Above the National Average
SELECT
Region,
ROUND(AVG(Unemployment_Rate), 2) AS avg_rate
FROM unemployment
GROUP BY Region
HAVING avg_rate > (SELECT AVG(Unemployment_Rate) FROM unemployment)
ORDER BY avg_rate DESC;

