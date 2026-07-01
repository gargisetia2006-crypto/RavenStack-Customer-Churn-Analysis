CREATE DATABASE ravenstack;
USE ravenstack;

SELECT COUNT(*) AS total_customers
FROM accounts;
# 500 


SELECT industry,
       COUNT(*) AS total_customers
FROM accounts
GROUP BY industry
ORDER BY total_customers DESC;



SELECT referral_source,
       COUNT(*) AS total_customers
FROM accounts
GROUP BY referral_source
ORDER BY total_customers DESC;


SELECT plan_tier,
       COUNT(*) AS total_customers
FROM accounts
GROUP BY plan_tier
ORDER BY total_customers DESC;


SELECT is_trial,
       COUNT(*) AS total_customers
FROM accounts
GROUP BY is_trial;


SELECT churn_flag,
       COUNT(*) AS total_customers
FROM accounts
GROUP BY churn_flag;



SELECT
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN churn_flag = 'TRUE' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        SUM(
            CASE
                WHEN churn_flag = 'TRUE' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM accounts;



SELECT
    industry,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN churn_flag = 'TRUE' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        SUM(
            CASE
                WHEN churn_flag = 'TRUE' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM accounts
GROUP BY industry
ORDER BY churn_rate DESC;



SELECT
    country,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN churn_flag = 'TRUE' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        SUM(
            CASE
                WHEN churn_flag = 'TRUE' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM accounts
GROUP BY country
ORDER BY churn_rate DESC;





SELECT
    referral_source,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN churn_flag = 'TRUE' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        SUM(
            CASE
                WHEN churn_flag = 'TRUE' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM accounts
GROUP BY referral_source
ORDER BY churn_rate DESC;



SELECT
    ROUND(AVG(seats),2) AS average_seats
FROM accounts;


SELECT
    industry,
    ROUND(AVG(seats),2) AS average_seats
FROM accounts
GROUP BY industry
ORDER BY average_seats DESC;



SELECT
    plan_tier,
    ROUND(AVG(seats),2) AS average_seats
FROM accounts
GROUP BY plan_tier
ORDER BY average_seats DESC;




SELECT
    YEAR(signup_date) AS signup_year,
    COUNT(*) AS customers
FROM accounts
GROUP BY signup_year
ORDER BY signup_year;



SELECT
    MONTH(signup_date) AS signup_month,
    COUNT(*) AS customers
FROM accounts
GROUP BY signup_month
ORDER BY signup_month;




