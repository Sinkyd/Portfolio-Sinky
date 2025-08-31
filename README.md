SELECT DATE_FORMAT(Date, 'yyyyMM') AS month_id,
       COUNT(DISTINCT `Transaction ID`) AS transaction_count,
       SUM(`Total Amount`) AS total_sales,
       AVG(`Total Amount`) AS avg_sales,
       `Product Category`,
       CASE 
           WHEN Age >= 1 AND Age < 13 THEN 'child'
           WHEN Age >= 13 AND Age < 19 THEN 'teen'
           WHEN Age >= 19 AND Age < 35 THEN 'adult'
           ELSE 'senior'
       END AS age_group,
       CASE
           WHEN `Total Amount` >= 10 AND `Total Amount` < 50 THEN 'low spend'
           WHEN `Total Amount` >= 50 AND `Total Amount` < 100 THEN 'medium spend'
           WHEN `Total Amount` >= 100 AND `Total Amount` < 200 THEN 'big spend'
           WHEN `Total Amount` >= 200 THEN 'over spend'
           ELSE 'spend_bucket'
       END AS spend_bucket
FROM workspace.default.retail_sales_dataset_1
GROUP BY DATE_FORMAT(Date, 'yyyyMM'), `Product Category`, 
         CASE 
             WHEN Age >= 1 AND Age < 13 THEN 'child'
             WHEN Age >= 13 AND Age < 19 THEN 'teen'
             WHEN Age >= 19 AND Age < 35 THEN 'adult'
             ELSE 'senior'
         END,
         CASE
             WHEN `Total Amount` >= 10 AND `Total Amount` < 50 THEN 'low spend'
             WHEN `Total Amount` >= 50 AND `Total Amount` < 100 THEN 'medium spend'
             WHEN `Total Amount` >= 100 AND `Total Amount` < 200 THEN 'big spend'
             WHEN `Total Amount` >= 200 THEN 'over spend'
             ELSE 'spend_bucket'
         END
LIMIT 1000;


# Portfolio-Sinky
Sales dashboard 
## Sales Analysis Report
### Case Study: Retail Sales Analysis by Product Category, Customer Age Group, and Spending Level
## Data Assumptions for Analysis
- We have retail sales data including transaction details, product categories, customer IDs, age groups, and transaction amounts.
- Spending levels are defined as:
- Low: $10-$50
- Medium: $50-$100
- High: $100-$200

## Sales Analysis by Product Category
- Calculate the number of transactions and revenue by product category for each month.
- Example output:
| Product Category | Jan Transactions | Jan Revenue | Feb Transactions | Feb Revenue |
Electronics                100                              $10 000        120                     $12 000
Clothing                    150                               $7 500          130                     $6500

customer spending ($10-$200 range) by age group:
- Low ($10-$50)
- Medium ($50-$100)
- High ($100-$200)
- Example output:
| Age Group | Low Spend Count | Medium Spend Count | High Spend Count |
| 18-25           $ 50                                   $100                                 $ 200
  26-35            $40                                    $150                                 $250
  35-50

          ## Month-to-Month Revenue by Product Category
- Compare revenue trends month over month for each product category to identify growth or decline.

## Creating the Report
- Use tools like Excel pivot tables, SQL queries, or Python (pandas) for data analysis.
- Visualize trends with bar charts (transactions/revenue by category) or pie charts (spending levels by age group).
