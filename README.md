# Ravenstack Churn Analysis

A complete end-to-end data analytics project analyzing customer churn 
for Ravenstack, a fictional SaaS company with 500 accounts across 7 countries.

## Project Overview

This project covers the full analytics pipeline — from raw data cleaning 
to an interactive Power BI dashboard — identifying why customers churn, 
how much revenue is lost, and what actions the business should take.

## Tech Stack

| Tool | Purpose |
|---|---|
| Python (Pandas) | Data cleaning and preprocessing |
| MySQL | Database schema design and SQL analysis |
| Power BI | Interactive dashboard and DAX measures |

## Dataset

5 tables, 500 accounts, 5000+ subscription records

| Table | Description |
|---|---|
| accounts | Company info, industry, country, churn flag |
| subscriptions | MRR, ARR, plan tier, upgrade/downgrade flags |
| churn_events | Reason codes, refunds, reactivation flags |
| feature_usage | Product feature adoption per account |
| support_tickets | Ticket volume, resolution time, sentiment |

## What Was Done

### 1. Data Cleaning (Python)
- Removed duplicates and null values across all 5 CSVs
- Standardized date formats and column naming conventions
- Validated churn flags and financial figures for consistency

### 2. Database Design (MySQL)
- Designed normalized schema with primary and foreign keys
- Imported all 5 cleaned CSVs into ravenanalytics database
- Wrote SQL queries across 5 analysis sections covering churn rate, 
  revenue impact, feature adoption, support correlation, and cohort behavior

### 3. Power BI Dashboard (3 Pages)
- Connected Power BI directly to MySQL database
- Built 15+ DAX measures including MRR Lost, ARR Lost, 
  Churn Rate, Reactivation Rate, Net MRR Change
- Created calculated columns using SWITCH, FORMAT, IF, MONTH functions

## Dashboard Pages

### Page 1 — Overview
KPIs: Total Accounts, Churned Accounts, Churn Rate, Active Accounts
Charts: Churn by Country, Churn by Industry, Churn by Plan Tier, 
Active vs Inactive accounts
Slicers: Industry, Plan Tier, Country

### Page 2 — Revenue Impact
KPIs: MRR Lost, ARR Lost, Avg Subscription Duration, Downgrade Rate, 
Total Revenue at Risk, Upgrades, Net MRR Change, Avg MRR per Churned Account
Charts: MRR Lost by Plan Tier, Upgrades vs Downgrades, 
Subscription Duration Distribution, Monthly MRR Lost Trend
Slicers: Plan Tier, Billing Frequency, Date Range

### Page 3 — Churn Reasons
KPIs: Total Churn Events, Reactivation Rate, Total Refunds Issued, 
Top Churn Reason
Charts: Churn by Reason Code, Reactivated vs Not, 
Refund Amount by Reason, Churn Events Over Time
Slicers: Reason Code, Year

## Key Findings

- 22% overall churn rate — high for a SaaS business
- 68% of churned accounts left within the first 90 days
- Enterprise accounts account for $926K of $1.18M total MRR lost
- Churn was stable through 2023 but spiked sharply from August 2024
- Top churn reason is missing features (114 of 600 events)
- Only 10.17% of churned customers ever reactivated
- Net MRR is positive at $83K — upgrades slightly offset churn losses
- Germany has the highest churn rate at 32%

## DAX Measures Used

- MRR Lost, ARR Lost, Net MRR Change
- Avg Subscription Duration (Churned)
- Downgrade Rate %, Reactivation Rate %
- Total Revenue at Risk
- Avg MRR per Churned Account
- Top Churn Reason (TOPN + FIRSTNONBLANK pattern)
- Duration Bucket (SWITCH bucketing pattern)

## Project Structure

ravenstack-churn-analysis/
│
├── data/
│   ├── raw/                         # Original CSV files
│   └── cleaned/                     # Python cleaned CSVs
│
├── python/
│   └── data_cleaning.py             # Cleaning script
│
├── sql/
│   └── churn_analysis.sql           # All SQL queries
│
├── powerbi/
│   └── churn_analytics_dashboard.pbix
│
└── README.md

## How to Run

1. Clone the repo
2. Run data_cleaning.py on the raw CSVs
3. Import cleaned CSVs into MySQL using the schema in churn_analysis.sql
4. Open churn_analytics_dashboard.pbix in Power BI Desktop
5. Update the MySQL connection string to your local credentials

## Author

Built as a portfolio project demonstrating end-to-end data analytics 
skills across Python, SQL, and Power BI.
