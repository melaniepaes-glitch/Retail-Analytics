-- IMPORTANT:
-- Run the CSV import only once for initial database setup.
-- The analysis SELECT queries can be executed repeatedly.
-- CREATE TABLE IF NOT EXISTS does not reset existing data.

CREATE SCHEMA IF NOT EXISTS retail_data;
USE retail_data;

CREATE TABLE IF NOT EXISTS marketing_campaign (
    ID INT PRIMARY KEY,
    Year_Birth INT,
    Education VARCHAR(50),
    Marital_Status VARCHAR(50),
    Income DECIMAL(12 , 2 ),
    Kidhome INT,
    Teenhome INT,
    Dt_Customer DATE,
    Recency INT,
    MntWines INT,
    MntFruits INT,
    MntMeatProducts INT,
    MntFishProducts INT,
    MntSweetProducts INT,
    MntGoldProds INT,
    NumDealsPurchases INT,
    NumWebPurchases INT,
    NumCatalogPurchases INT,
    NumStorePurchases INT,
    NumWebVisitsMonth INT,
    AcceptedCmp3 INT,
    AcceptedCmp4 INT,
    AcceptedCmp5 INT,
    AcceptedCmp1 INT,
    AcceptedCmp2 INT,
    Complain INT,
    Z_CostContact INT,
    Z_Revenue INT,
    Response INT,
    Age INT,
    Age_group VARCHAR(10)
);

-- DATA IMPORT INSTRUCTIONS
-- 1. Download marketing_campaign.csv from the project's GitHub repository.
-- 2. Place the CSV in your MySQL server's permitted import directory.
-- 3. Check the permitted directory using:
--       SHOW VARIABLES LIKE 'secure_file_priv';
-- 4. Update the file path below to match your MySQL configuration.
-- 5. Run this import once when setting up the database.

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/marketing_campaign.csv'
IGNORE INTO TABLE marketing_campaign
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(ID,	Year_Birth,	Education, 
Marital_Status,	Income,	Kidhome,	Teenhome,	@Dt_Customer,	Recency,	MntWines,	MntFruits,
MntMeatProducts,	MntFishProducts,	MntSweetProducts,	MntGoldProds,	NumDealsPurchases,	NumWebPurchases,
NumCatalogPurchases,	NumStorePurchases,	NumWebVisitsMonth,	AcceptedCmp3,	AcceptedCmp4,	AcceptedCmp5,	
AcceptedCmp1,	AcceptedCmp2,	Complain,	Z_CostContact,	Z_Revenue,	Response) 
SET Dt_Customer = STR_TO_DATE(
    REPLACE(TRIM(@Dt_Customer), '-', '/'),
    '%d/%m/%Y'
);

-- Verify the imported dataset
SELECT
    COUNT(*) AS total_customers,
    SUM(Income IS NULL) AS missing_income,
    SUM(Dt_Customer IS NULL) AS missing_dates
FROM marketing_campaign;

SELECT 
    *
FROM
    retail_data.marketing_campaign;

SELECT 
    COUNT(*) AS total_encounters
FROM
    marketing_campaign;

SELECT 
    CASE
        WHEN product_name = 'MntWines' THEN 'Wines'
        WHEN product_name = 'MntFruits' THEN 'Fruits'
        WHEN product_name = 'MntMeatProducts' THEN 'Meat Products'
        WHEN product_name = 'MntFishProducts' THEN 'Fish Products'
        WHEN product_name = 'MntSweetProducts' THEN 'Sweet Products'
        WHEN product_name = 'MntGoldProds' THEN 'Gold Products'
    END AS product_category,
    SUM(product_amount) AS total_purchases
FROM
    (SELECT 
        'MntWines' AS product_name, MntWines AS product_amount
    FROM
        marketing_campaign UNION ALL SELECT 
        'MntFruits' AS product_name, MntFruits AS product_amount
    FROM
        marketing_campaign UNION ALL SELECT 
        'MntMeatProducts' AS product_name,
            MntMeatProducts AS product_amount
    FROM
        marketing_campaign UNION ALL SELECT 
        'MntFishProducts' AS product_name,
            MntFishProducts AS product_amount
    FROM
        marketing_campaign UNION ALL SELECT 
        'MntSweetProducts' AS product_name,
            MntSweetProducts AS product_amount
    FROM
        marketing_campaign UNION ALL SELECT 
        'MntGoldProds' AS product_name,
            MntGoldProds AS product_amount
    FROM
        marketing_campaign) AS subquery
GROUP BY product_category
ORDER BY total_purchases DESC
LIMIT 10;

SELECT 
    response, COUNT(*)
FROM
    marketing_campaign
GROUP BY response;

SELECT 
    Education, Marital_Status, COUNT(*) AS customer_count
FROM
    marketing_campaign
GROUP BY Education , Marital_Status;

SELECT 
    ROUND(AVG(Income), 2) AS avg_income
FROM
    marketing_campaign;

SELECT 
    SUM(accepted_cmp1) AS campaign_1_total,
    SUM(accepted_cmp2) AS campaign_2_total,
    SUM(accepted_cmp3) AS campaign_3_total,
    SUM(accepted_cmp4) AS campaign_4_total,
    SUM(accepted_cmp5) AS campaign_5_total
FROM marketing_campaign;


SELECT 
    Response, COUNT(*) AS response_count
FROM
    marketing_campaign
GROUP BY Response;

SELECT 
    AVG(Kidhome) AS avg_children, AVG(Teenhome) AS avg_teenagers
FROM
    marketing_campaign; 


set sql_safe_updates=0;
UPDATE marketing_campaign 
SET 
    Age = year(now()) - year_birth; 
set sql_safe_updates=1; 


set sql_safe_updates=0;
UPDATE marketing_campaign 
SET 
    Age_group = CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END; 
set sql_safe_updates=1;

SELECT 
    Age_Group, AVG(NumWebVisitsMonth) AS AvgVisitsPerMonth
FROM
    marketing_campaign
GROUP BY Age_Group;
