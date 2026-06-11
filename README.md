# Brazilian E-Commerce Analysis
**Tools:** Python | SQL (MySQL) | Power BI  
**Dataset:** Olist Brazilian E-Commerce | 95,000+ orders | 2016–2018

## Project Overview
End-to-end analysis of a Brazilian e-commerce marketplace covering 
product performance, customer geography, delivery efficiency, 
and customer retention behavior.

## Key Finding
Repeat purchase rate was only 3% — cohort retention analysis 
confirmed that 95%+ of customers never returned after their first 
purchase. Recommendation: prioritize new customer acquisition 
over retention investment.

## Why Cohort Analysis Instead of RFM
Initial plan was RFM segmentation. Abandoned after purchase 
frequency distribution showed ~75% one-time buyers — 
pd.qcut could not divide customers into meaningful segments. 
Pivoted to cohort retention analysis which better fit 
the single-purchase behavior of this dataset.

## Files
| File | Description |
|------|-------------|
| `analysis_queries.sql` | 9 KPI queries across 8 relational tables |
| `cohort_retention.ipynb` | Python cohort analysis + retention curve |
| `ecommerce_dashboard.pbix` | 4-page Power BI dashboard |

## Dashboard Pages
1. **Introduction** — Revenue, orders, AOV, repeat purchase rate
2. **Product Performance** — Revenue by category, AOV by product
3. **Customer Insights** — Geography, payment types, review scores
4. **Delivery Performance** — On-time rate, freight cost vs delivery time
