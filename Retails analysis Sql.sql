
SELECT * 
FROM us_retail.retails;

SELECT `Transaction ID`,`Date`,`Gender`,`Age`,`Age Group`, `Product Category`, `Quantity`, `Price per Unit`, `Total Amount`
from us_retail.retails;

SELECT `Transaction ID`,`Date`,`Gender`,`Age`,`Age Group`, `Product Category`, `Quantity`, `Price per Unit`, `Total Amount`
from us_retail.retails
LIMIT 10;

CREATE TABLE clean_retail_data AS
SELECT `Transaction ID`,`Date`,`Gender`,`Age`,`Age Group`, `Product Category`, `Quantity`, `Price per Unit`, `Total Amount`
FROM us_retail.retails
WHERE `Transaction ID` IS NOT NULL 
AND `Total Amount` IS NOT NULL;


 select `date`
 FROM clean_retail_data;
 
 update clean_retail_data
set `date` = str_to_date(`date`, '%m/%d/%Y');

ALTER TABLE clean_retail_data
MODIFY COLUMN `DATE` DATE;

SELECT * 
FROM clean_retail_data;

SELECT  
SUM(`Total Amount`) AS total_revenue
FROM clean_retail_data;

SELECT 
`Product Category`,  
SUM(`Total Amount`) AS revenue
FROM clean_retail_data
GROUP BY `Product Category`
ORDER BY revenue DESC;
  
SELECT  
`Age Group`,  
SUM(`Total Amount`) AS revenue
FROM clean_retail_data
GROUP BY `Age Group`
ORDER BY revenue DESC;

SELECT  
Gender,  
SUM(`Total Amount`) AS revenue
FROM clean_retail_data
GROUP BY Gender;

SELECT 
DATE_FORMAT(`Date`, '%Y-%m') AS month,
SUM(`Total Amount`) AS revenue
FROM clean_retail_data
GROUP BY month
ORDER BY month;

SELECT  
AVG(`Total Amount`) AS avg_transaction_value
FROM clean_retail_data;

SELECT 
`Transaction ID`, 
COUNT(*) AS total_transactions, 
SUM(`Total Amount`) AS total_spent
FROM clean_retail_data
GROUP BY `Transaction ID`
ORDER BY total_transactions DESC;

SELECT 
COUNT(DISTINCT `Transaction ID`) AS total_customers,
SUM(`Total Amount`) / COUNT(DISTINCT `Transaction ID`) AS avg_spend_per_customer
FROM clean_retail_data;


