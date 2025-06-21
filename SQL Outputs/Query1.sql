-- ALTER TABLE book1
-- ADD Stage_ProductInterest BOOLEAN,
-- ADD Stage_Intent BOOLEAN,
-- ADD Stage_Purchase BOOLEAN,
-- ADD Stage_Return BOOLEAN,
-- ADD Stage_Churn BOOLEAN;

--  describe book1; 
 -- select * from book1 ;
-- UPDATE book1
-- SET Stage_ProductInterest = 1,
--     Stage_Intent = CASE WHEN Quantity > 0 THEN 1 ELSE 0 END,
--     Stage_Purchase = CASE WHEN `Total Purchase Amount` > 0 THEN 1 ELSE 0 END,
--     Stage_Return = CASE WHEN `Returns` = 1 THEN 1 ELSE 0 END,
--     Stage_Churn = CASE WHEN LOWER(`Churn`) = 'Yes' THEN 1 ELSE 0 END;
--     
-- Calculating Funnel Metrics   
 
-- Conversion Rate Between Stages:

-- WITH funnel AS (
--   SELECT
--     COUNT(DISTINCT `Customer ID`) AS total_customers,
--     SUM(Stage_ProductInterest) AS product_interest,
--     SUM(Stage_Intent) AS intent,
--     SUM(Stage_Purchase) AS purchase,
--     SUM(Stage_Return) AS returns,
--     SUM(Stage_Churn) AS churn
--   FROM book1
-- )
-- SELECT
--   product_interest,
--   intent,
--   purchase,
--   returns,
--   churn,
--   ROUND(intent * 100.0 / product_interest, 2) AS intent_conversion_rate,
--   ROUND(purchase * 100.0 / intent, 2) AS purchase_conversion_rate,
--   ROUND(returns * 100.0 / purchase, 2) AS return_rate,
--   ROUND(churn * 100.0 / product_interest, 2) AS churn_rate
-- FROM funnel;

--  Segmenting the Funnel

-- SELECT
--   Gender,
--   COUNT(DISTINCT `Customer ID`) AS total_customers,
--   COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END) AS converted_customers,
--   SUM(`Total Purchase Amount`) AS total_revenue,
--   ROUND(SUM(`Total Purchase Amount`) / NULLIF(COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END), 0), 2) AS avg_order_value,
--   ROUND(100.0 * COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END) / COUNT(DISTINCT `Customer ID`), 2) AS conversion_rate_percent
-- FROM book1
-- GROUP BY Gender
-- ORDER BY conversion_rate_percent DESC;

-- SELECT
--   Gender,
--   CASE
--     WHEN `Customer Age` < 25 THEN 'Under 25'
--     WHEN `Customer Age`  BETWEEN 25 AND 34 THEN '25-34'
--     WHEN `Customer Age`  BETWEEN 35 AND 44 THEN '35-44'
--     WHEN `Customer Age`  BETWEEN 45 AND 54 THEN '45-54'
--     ELSE '55+'
--   END AS age_group,

--   COUNT(DISTINCT `Customer ID`) AS total_customers,
--   COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID`END) AS converted_customers,
--   SUM(`Total Purchase Amount`) AS total_revenue,
--   ROUND(SUM(`Total Purchase Amount`) / NULLIF(COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END), 0), 2) AS avg_order_value,
--   ROUND(100.0 * COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END) / COUNT(DISTINCT `Customer ID`), 2) AS conversion_rate_percent

-- FROM book1
-- GROUP BY Gender, age_group
-- ORDER BY conversion_rate_percent DESC;

-- SELECT
--   CASE
--     WHEN Age BETWEEN 18 AND 25 THEN '18-25'
--     WHEN Age BETWEEN 26 AND 35 THEN '26-35'
--     WHEN Age BETWEEN 36 AND 50 THEN '36-50'
--     ELSE '51+'
--   END AS Age_Group,

--   COUNT(DISTINCT `Customer ID`) AS total_customers,
--   COUNT(DISTINCT CASE WHEN Quantity > 0 THEN`Customer ID` END) AS converted_customers,
--   SUM(`Total Purchase Amount`) AS total_revenue,
--   ROUND(SUM(`Total Purchase Amount`) / NULLIF(COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END), 0), 2) AS avg_order_value,
--   ROUND(100.0 * COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END) / COUNT(DISTINCT `Customer ID`), 2) AS conversion_rate_percent

-- FROM book1
-- GROUP BY age_group
-- ORDER BY conversion_rate_percent DESC;

-- SELECT
--   `Product Category`,
--   COUNT(DISTINCT `Customer ID`) AS total_customers,
--   COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID`END) AS converted_customers,
--   SUM(`Total Purchase Amount`) AS total_revenue,
--   ROUND(SUM(`Total Purchase Amount`) / NULLIF(COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END), 0), 2) AS avg_order_value,
--   ROUND(100.0 * COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END) / COUNT(DISTINCT `Customer ID`), 2) AS conversion_rate_percent
-- FROM book1
-- GROUP BY `Product Category`
-- ORDER BY conversion_rate_percent DESC;


-- SELECT
--   Gender,
--   
--   -- Create Age Group
--   CASE
--     WHEN `Customer Age` < 25 THEN 'Under 25'
--     WHEN `Customer Age`BETWEEN 25 AND 34 THEN '25–34'
--     WHEN `Customer Age`BETWEEN 35 AND 44 THEN '35–44'
--     WHEN `Customer Age`BETWEEN 45 AND 54 THEN '45–54'
--     ELSE '55+'
--   END AS age_group,

--   `Product Category`,

--   -- Combine into a single customer segment label
--   CONCAT(Gender, ', ', 
--          CASE
--            WHEN `Customer Age` < 25 THEN 'Under 25'
--            WHEN `Customer Age` BETWEEN 25 AND 34 THEN '25–34'
--            WHEN `Customer Age` BETWEEN 35 AND 44 THEN '35–44'
--            WHEN `Customer Age` BETWEEN 45 AND 54 THEN '45–54'
--            ELSE '55+'
--          END, ', ',
--          `Product Category`
--   ) AS customer_segment,

--   COUNT(DISTINCT `Customer ID`) AS total_customers,
--   COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END) AS converted_customers,
--   SUM(`Total Purchase Amount`) AS total_revenue,
--   ROUND(SUM(`Total Purchase Amount`) / NULLIF(COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END), 0), 2) AS avg_order_value,
--   ROUND(100.0 * COUNT(DISTINCT CASE WHEN Quantity > 0 THEN `Customer ID` END) / COUNT(DISTINCT `Customer ID`), 2) AS conversion_rate_percent

-- FROM book1
-- GROUP BY Gender, age_group, `Product Category`, customer_segment
-- ORDER BY conversion_rate_percent DESC;