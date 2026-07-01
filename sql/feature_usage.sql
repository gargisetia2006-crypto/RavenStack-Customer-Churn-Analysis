describe feature_usage ;


-- 1. Total Feature Usage Records
SELECT COUNT(*) AS total_feature_usage
FROM feature_usage;

-- 2. Total Usage Count
SELECT SUM(usage_count) AS total_usage
FROM feature_usage;

-- 3. Total Usage Duration
SELECT SUM(usage_duration_secs) AS total_duration_seconds
FROM feature_usage;

-- 4. Average Usage Count
SELECT ROUND(AVG(usage_count),2) AS avg_usage_count
FROM feature_usage;

-- 5. Average Usage Duration
SELECT ROUND(AVG(usage_duration_secs),2) AS avg_duration_seconds
FROM feature_usage;

-- 6. Most Used Features
SELECT feature_name,
SUM(usage_count) AS total_usage
FROM feature_usage
GROUP BY feature_name
ORDER BY total_usage DESC;

-- 7. Average Usage Duration by Feature
SELECT feature_name,
ROUND(AVG(usage_duration_secs),2) AS avg_duration
FROM feature_usage
GROUP BY feature_name
ORDER BY avg_duration DESC;

-- 8. Error Count by Feature
SELECT feature_name,
SUM(error_count) AS total_errors
FROM feature_usage
GROUP BY feature_name
ORDER BY total_errors DESC;

-- 9. Average Errors per Feature
SELECT feature_name,
ROUND(AVG(error_count),2) AS avg_errors
FROM feature_usage
GROUP BY feature_name
ORDER BY avg_errors DESC;

-- 10. Beta vs Non-Beta Feature Usage
SELECT is_beta_feature,
COUNT(*) AS records
FROM feature_usage
GROUP BY is_beta_feature;

-- 11. Usage Count by Beta Status
SELECT is_beta_feature,
SUM(usage_count) AS total_usage
FROM feature_usage
GROUP BY is_beta_feature;

-- 12. Average Duration by Beta Status
SELECT is_beta_feature,
ROUND(AVG(usage_duration_secs),2) AS avg_duration
FROM feature_usage
GROUP BY is_beta_feature;

-- 13. Error Count by Beta Status
SELECT is_beta_feature,
SUM(error_count) AS total_errors
FROM feature_usage
GROUP BY is_beta_feature;

-- 14. Monthly Feature Usage Trend
SELECT
MONTH(STR_TO_DATE(usage_date,'%Y-%m-%d')) AS usage_month,
SUM(usage_count) AS total_usage
FROM feature_usage
GROUP BY usage_month
ORDER BY usage_month;

-- 15. Top 10 Most Active Usage Records
SELECT
usage_id,
subscription_id,
feature_name,
usage_count,
usage_duration_secs,
error_count
FROM feature_usage
ORDER BY usage_count DESC
LIMIT 10;