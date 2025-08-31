SELECT 
  `Product Category`,
  CASE 
    WHEN Age BETWEEN 13 AND 18 THEN 'Teenager'
    WHEN Age BETWEEN 19 AND 25 THEN 'Adult'
    ELSE '35+' 
  END AS age_group,
  CASE 
    WHEN `Total Amount` BETWEEN 0 AND 50 THEN 'Low Spending'
    WHEN `Total Amount` BETWEEN 51 AND 100 THEN 'Medium Spending'
    WHEN `Total Amount` BETWEEN 101 AND 200 THEN 'High Spending'
  END AS spend_bucket,
  COUNT(`Transaction ID`) AS total_transactions,
  SUM(`Total Amount`) AS total_revenue,
  COUNT(`Customer ID`) AS purchase_frequency,
  DATE_FORMAT(Date, 'yyyy-MM') AS month
FROM retail_sales_dataset_1
GROUP BY `Product Category`, age_group, spend_bucket, month
ORDER BY `Product Category`, age_group DESC
