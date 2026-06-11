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
| `brazilian_ecommerce_analysis.sql` | 9 KPI queries across 8 relational tables |
| `customer_cohort.ipynb` | Python cohort analysis + retention curve |
| `ecommerce_dashboard.pdf` | 4-page Power BI dashboard |

## Dashboard Pages
1. **Introduction** — Revenue, orders, AOV, repeat purchase rate
   <img width="1342" height="752" alt="Screenshot 2026-06-11 114116" src="https://github.com/user-attachments/assets/f2d994f8-98d2-4ef9-bac8-0b818501cc84" />

2. **Product Performance** — Revenue by category, AOV by product
   <img width="1341" height="763" alt="Screenshot 2026-06-11 114125" src="https://github.com/user-attachments/assets/5509bd18-de27-4296-83d8-c078efd9f258" />

3. **Customer Insights** — Geography, payment types, review scores
   <img width="1341" height="763" alt="Screenshot 2026-06-11 114134" src="https://github.com/user-attachments/assets/6760cbb7-98fe-4e8b-9123-811bdab6da91" />

4. **Delivery Performance** — On-time rate, freight cost vs delivery time
    <img width="1334" height="754" alt="Screenshot 2026-06-11 114149" src="https://github.com/user-attachments/assets/47033411-58a2-4b71-bfa8-f8a92ebd96f8" />
