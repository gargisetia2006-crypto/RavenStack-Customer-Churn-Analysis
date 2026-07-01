DESCRIBE churn_events ;


-- 1. Total Churn Events

SELECT COUNT(*) AS total_churn_events
FROM churn_events;


-- 2. Churn by Reason

SELECT
reason_code,
COUNT(*) AS customers
FROM churn_events
GROUP BY reason_code
ORDER BY customers DESC;


-- 3. Total Refund Amount

SELECT
ROUND(SUM(refund_amount_usd),2) AS total_refund
FROM churn_events;


-- 4. Average Refund Amount

SELECT
ROUND(AVG(refund_amount_usd),2) AS average_refund
FROM churn_events;





SELECT
reason_code,
ROUND(SUM(refund_amount_usd),2) AS total_refund
FROM churn_events
GROUP BY reason_code
ORDER BY total_refund DESC;


-- 6. Customers Upgraded Before Churning

SELECT
preceding_upgrade_flag,
COUNT(*) AS customers
FROM churn_events
GROUP BY preceding_upgrade_flag;



-- 7. Customers Downgraded Before Churning

SELECT
preceding_downgrade_flag,
COUNT(*) AS customers
FROM churn_events
GROUP BY preceding_downgrade_flag;



-- 8. Upgrade + Downgrade Combination

SELECT
preceding_upgrade_flag,
preceding_downgrade_flag,
COUNT(*) AS customers
FROM churn_events
GROUP BY
preceding_upgrade_flag,
preceding_downgrade_flag
ORDER BY customers DESC;



-- 9. Reactivated Customers

SELECT
is_reactivation,
COUNT(*) AS customers
FROM churn_events
GROUP BY is_reactivation;



-- 10. Reactivation Percentage

SELECT

COUNT(*) AS total_churned,

SUM(
CASE
WHEN is_reactivation='TRUE'
THEN 1
ELSE 0
END
) AS reactivated_customers,

ROUND(
SUM(
CASE
WHEN is_reactivation='TRUE'
THEN 1
ELSE 0
END
)*100.0/COUNT(*),2
) AS reactivation_rate

FROM churn_events;



-- 11. Monthly Churn Trend

SELECT

MONTH(
STR_TO_DATE(churn_date,'%Y-%m-%d')
) AS churn_month,

COUNT(*) AS customers

FROM churn_events

GROUP BY churn_month

ORDER BY churn_month;



-- 12. Year-wise Churn

SELECT

YEAR(
STR_TO_DATE(churn_date,'%Y-%m-%d')
) AS churn_year,

COUNT(*) AS customers

FROM churn_events

GROUP BY churn_year

ORDER BY churn_year;



-- 13. Top 10 Highest Refund Customers

SELECT
account_id,
refund_amount_usd,
reason_code
FROM churn_events
ORDER BY refund_amount_usd DESC
LIMIT 10;



-- 14. Average Refund by Reason

SELECT
reason_code,
ROUND(AVG(refund_amount_usd),2) AS avg_refund
FROM churn_events
GROUP BY reason_code
ORDER BY avg_refund DESC;


-- 15. Churn Reasons with Refund Percentage

SELECT

reason_code,

COUNT(*) AS churned_customers,

ROUND(
SUM(refund_amount_usd),2
) AS total_refund

FROM churn_events

GROUP BY reason_code

ORDER BY churned_customers DESC;