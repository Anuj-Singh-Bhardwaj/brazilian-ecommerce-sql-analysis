# Brazilian E‑Commerce SQL Analysis 🇧🇷

**Dataset**: [Olist Brazilian E‑Commerce](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (95K+ orders, 8 tables)  
**Tools**: SQLite / MySQL / PostgreSQL, Python, Power BI

## 📊 Business KPIs Analyzed (SQL)

| # | KPI | Purpose |
|---|-----|---------|
| 1 | Average review score by product category | Identify top‑rated categories |
| 2 | On‑time vs delayed delivery rate | Measure logistics performance |
| 3 | Monthly order & revenue trend | Track business growth |
| 4 | Top 5 best‑selling categories | Find popular products |
| 5 | Customer repeat purchase rate | Measure loyalty |
| 6 | Average delivery time by state | Find regional delays |
| 7 | Payment type preference | Understand payment habits |
| 8 | Highest‑rated sellers (min 20 reviews) | Recognise top sellers |
| 9 | Freight % by price tier | Analyse shipping cost burden |

## 🚀 How to Run the SQL Queries

1. **Upload the Olist CSV files** to an online SQL tool (e.g. [SQLiteOnline](https://sqliteonline.com), [CSVFiddle](https://csvfiddle.io), or [DB Fiddle](https://www.db-fiddle.com)).
2. **Rename tables** to match the queries:
   - `olist_orders`
   - `olist_order_items`
   - `olist_products`
   - `product_category_name_translation`
   - `olist_order_reviews`
   - `olist_customers`
   - `olist_sellers`
   - `olist_order_payments`
3. **Copy & paste** each query from `brazilian_ecommerce_analysis.sql`.
4. **Export results** as CSV and upload to this repo (optional).

## 🐍 Python Customer Cohort Analysis

Run `cohort_analysis.py` to compute **cohort retention rates**:

```bash
pip install -r requirements.txt
python cohort_analysis.py
