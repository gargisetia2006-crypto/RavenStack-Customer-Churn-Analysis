DESCRIBE subscriptions;


-- ==========================================
-- SUBSCRIPTIONS MODULE ANALYSIS
-- ==========================================

-- 1. Total Subscriptions
SELECT COUNT(*) AS total_subscriptions
FROM subscriptions;

-- ==========================================

-- 2. Subscription Plans Distribution
SELECT
    plan_tier,
    COUNT(*) AS total_subscriptions
FROM subscriptions
GROUP BY plan_tier
ORDER BY total_subscriptions DESC;

-- ==========================================

-- 3. Trial vs Paid Customers
SELECT
    is_trial,
    COUNT(*) AS customers
FROM subscriptions
GROUP BY is_trial;

-- ==========================================

-- 4. Trial Conversion Rate
SELECT
    COUNT(*) AS total_subscriptions,
    SUM(CASE WHEN is_trial='True' THEN 1 ELSE 0 END) AS trial_users,
    SUM(CASE WHEN is_trial='False' THEN 1 ELSE 0 END) AS paid_users,
    ROUND(
        SUM(CASE WHEN is_trial='False' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),2
    ) AS paid_percentage
FROM subscriptions;

-- ==========================================

-- 5. Total Monthly Recurring Revenue (MRR)
SELECT
    SUM(mrr_amount) AS total_MRR
FROM subscriptions;

-- ==========================================

-- 6. Total Annual Recurring Revenue (ARR)
SELECT
    SUM(arr_amount) AS total_ARR
FROM subscriptions;

-- ==========================================

-- 7. Revenue by Plan
SELECT
    plan_tier,
    SUM(mrr_amount) AS total_MRR,
    SUM(arr_amount) AS total_ARR
FROM subscriptions
GROUP BY plan_tier
ORDER BY total_MRR DESC;

-- ==========================================

-- 8. Average Revenue Per Customer
SELECT
    ROUND(AVG(mrr_amount),2) AS avg_monthly_revenue,
    ROUND(AVG(arr_amount),2) AS avg_annual_revenue
FROM subscriptions;

-- ==========================================

-- 9. Average Seats Purchased
SELECT
    ROUND(AVG(seats),2) AS average_seats
FROM subscriptions;

-- ==========================================

-- 10. Average Seats by Plan
SELECT
    plan_tier,
    ROUND(AVG(seats),2) AS average_seats
FROM subscriptions
GROUP BY plan_tier
ORDER BY average_seats DESC;

-- ==========================================

-- 11. Upgrade Distribution
SELECT
    upgrade_flag,
    COUNT(*) AS customers
FROM subscriptions
GROUP BY upgrade_flag;

-- ==========================================

-- 12. Downgrade Distribution
SELECT
    downgrade_flag,
    COUNT(*) AS customers
FROM subscriptions
GROUP BY downgrade_flag;

-- ==========================================

-- 13. Auto Renewal Distribution
SELECT
    auto_renew_flag,
    COUNT(*) AS customers
FROM subscriptions
GROUP BY auto_renew_flag;

-- ==========================================

-- 14. Billing Frequency Distribution
SELECT
    billing_frequency,
    COUNT(*) AS customers
FROM subscriptions
GROUP BY billing_frequency
ORDER BY customers DESC;

-- ==========================================

-- 15. Churn Distribution
SELECT
    churn_flag,
    COUNT(*) AS customers
FROM subscriptions
GROUP BY churn_flag;

-- ==========================================

-- 16. Overall Churn Rate
SELECT
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN churn_flag='True' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        SUM(
            CASE
                WHEN churn_flag='True' THEN 1
                ELSE 0
            END
        )*100.0/COUNT(*),
        2
    ) AS churn_rate
FROM subscriptions;

-- ==========================================

-- 17. Churn Rate by Plan
SELECT
    plan_tier,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN churn_flag='True' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        SUM(
            CASE
                WHEN churn_flag='True' THEN 1
                ELSE 0
            END
        )*100.0/COUNT(*),
        2
    ) AS churn_rate
FROM subscriptions
GROUP BY plan_tier
ORDER BY churn_rate DESC;

-- ==========================================

-- 18. Average Revenue of Churned Customers
SELECT
    churn_flag,
    ROUND(AVG(mrr_amount),2) AS average_MRR
FROM subscriptions
GROUP BY churn_flag;

-- ==========================================

-- 19. Average Seats of Churned Customers
SELECT
    churn_flag,
    ROUND(AVG(seats),2) AS average_seats
FROM subscriptions
GROUP BY churn_flag;

-- ==========================================

-- 20. Upgrade vs Downgrade Matrix
SELECT
    upgrade_flag,
    downgrade_flag,
    COUNT(*) AS customers
FROM subscriptions
GROUP BY upgrade_flag, downgrade_flag
ORDER BY customers DESC;

-- ==========================================

-- 21. Subscription Start Year
SELECT
    YEAR(STR_TO_DATE(start_date,'%Y-%m-%d')) AS start_year,
    COUNT(*) AS subscriptions
FROM subscriptions
GROUP BY start_year
ORDER BY start_year;

-- ==========================================

-- 22. Subscription Start Month
SELECT
    MONTH(STR_TO_DATE(start_date,'%Y-%m-%d')) AS start_month,
    COUNT(*) AS subscriptions
FROM subscriptions
GROUP BY start_month
ORDER BY start_month;