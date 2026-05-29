-- Total churn rate
select 
	count(*) as total_accounts,
    sum(churn_flag) as churned_accounts,
    concat(round(sum(churn_flag) * 100 / count(*) , 2), '%') as churn_rate_percent 
from accounts;

-- total accounts: 500, churned: 110, Percentage: 22%

-- CHurn rate by plan tier

select
	plan_tier,
    count(*) as total_Acc,
    sum(churn_flag) as churned_accounts,
    concat(round(sum(churn_flag) * 100 / count(*) , 2), '%') as churn_rate_percent
from accounts
group by plan_tier
order by churn_rate_percent desc;

-- enterprise: 154 accounts, 34 churned, 22.08%
-- basic: 188 accounts, 37 churned, 22.02%
-- pro 178 accounts, 39 churned, 21.9 %


-- churn rate by industry

select 
	industry,
     count(*) as total_Acc,
    sum(churn_flag) as churned_accounts,
    concat(round(sum(churn_flag) * 100 / count(*) , 2), '%') as churn_rate_percent
from accounts
group by industry
order by churn_rate_percent desc;

-- devtools: 113 accounts, 35 churned, 31%
-- fintech: 112 accounts, 25 churned, 22.32%
-- healthtech: 96 accounts, 21 churned, 21.8 %
-- edtech: 79 accounts, 13 churned, 16.4%
-- cybersec: 100 accounts, 16 churned, 16%



-- churn rate by country

select
	country,
    count(*) as total_Acc,
    sum(churn_flag) as churned_accounts,
    concat(round(sum(churn_flag) * 100 / count(*) , 2), '%') as churn_rate_percent
from accounts
group by country
order by churn_rate_percent desc;

-- findings:
-- DE: 25 acc, 8 churn, 32%
-- US: 291 acc, 8 churn, 23.27%
-- FR: 22 acc, 5 churn, 22.73%
-- IN: 49, 10 churn, 20.41%
-- UK: 58, 11 churn, 18.97%
-- CA: 23, 4, 17.39%
-- AU: 32, 4, 12.50%

-- Trial vs paid churn rate
SELECT
    is_trial,
    COUNT(*) as total_subscriptions,
    SUM(churn_flag) as churned,
    ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) as churn_rate_percent
FROM subscriptions
GROUP BY is_trial;

-- Average subscription duration for churned vs active
SELECT
    churn_flag,
    ROUND(AVG(subscription_duration_days), 0) as avg_duration_days,
    MIN(subscription_duration_days) as min_days,
    MAX(subscription_duration_days) as max_days
FROM subscriptions
WHERE subscription_duration_days != -1
-- excluding active subscriptions (no end date)
GROUP BY churn_flag;