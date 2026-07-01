describe support_tickets  ;

-- ==========================================================
-- SUPPORT TICKETS ANALYSIS
-- ==========================================================

-- 1. Total Support Tickets
SELECT COUNT(*) AS total_tickets
FROM support_tickets;

-- 2. Average Resolution Time
SELECT ROUND(AVG(resolution_time_hours),2) AS avg_resolution_time
FROM support_tickets;

-- 3. Average First Response Time
SELECT ROUND(AVG(first_response_time_minutes),2) AS avg_first_response_time
FROM support_tickets;

-- 4. Average Satisfaction Score
SELECT ROUND(AVG(satisfaction_score),2) AS avg_satisfaction_score
FROM support_tickets;

-- 5. Tickets by Priority
SELECT priority,
COUNT(*) AS tickets
FROM support_tickets
GROUP BY priority
ORDER BY tickets DESC;

-- 6. Escalated vs Non-Escalated Tickets
SELECT escalation_flag,
COUNT(*) AS tickets
FROM support_tickets
GROUP BY escalation_flag;

-- 7. Average Resolution Time by Priority
SELECT priority,
ROUND(AVG(resolution_time_hours),2) AS avg_resolution_time
FROM support_tickets
GROUP BY priority
ORDER BY avg_resolution_time DESC;

-- 8. Average First Response Time by Priority
SELECT priority,
ROUND(AVG(first_response_time_minutes),2) AS avg_first_response_time
FROM support_tickets
GROUP BY priority
ORDER BY avg_first_response_time DESC;

-- 9. Average Satisfaction by Priority
SELECT priority,
ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM support_tickets
GROUP BY priority
ORDER BY avg_satisfaction DESC;

-- 10. Satisfaction by Escalation Status
SELECT escalation_flag,
ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM support_tickets
GROUP BY escalation_flag;

-- 11. Resolution Time by Escalation Status
SELECT escalation_flag,
ROUND(AVG(resolution_time_hours),2) AS avg_resolution_time
FROM support_tickets
GROUP BY escalation_flag;

-- 12. First Response Time by Escalation Status
SELECT escalation_flag,
ROUND(AVG(first_response_time_minutes),2) AS avg_first_response_time
FROM support_tickets
GROUP BY escalation_flag;

-- 13. Monthly Ticket Volume
SELECT MONTH(STR_TO_DATE(submitted_at,'%Y-%m-%d')) AS submitted_month,
COUNT(*) AS tickets
FROM support_tickets
GROUP BY submitted_month
ORDER BY submitted_month;

-- 14. Yearly Ticket Volume
SELECT YEAR(STR_TO_DATE(submitted_at,'%Y-%m-%d')) AS submitted_year,
COUNT(*) AS tickets
FROM support_tickets
GROUP BY submitted_year
ORDER BY submitted_year;

-- 15. Monthly Average Satisfaction
SELECT MONTH(STR_TO_DATE(submitted_at,'%Y-%m-%d')) AS submitted_month,
ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM support_tickets
GROUP BY submitted_month
ORDER BY submitted_month;

-- 16. Monthly Average Resolution Time
SELECT MONTH(STR_TO_DATE(submitted_at,'%Y-%m-%d')) AS submitted_month,
ROUND(AVG(resolution_time_hours),2) AS avg_resolution_time
FROM support_tickets
GROUP BY submitted_month
ORDER BY submitted_month;

-- 17. Tickets Closed by Month
SELECT MONTH(STR_TO_DATE(closed_at,'%Y-%m-%d')) AS closed_month,
COUNT(*) AS closed_tickets
FROM support_tickets
GROUP BY closed_month
ORDER BY closed_month;

-- 18. Satisfaction by Satisfaction Score
SELECT satisfaction_score,
COUNT(*) AS customers
FROM support_tickets
GROUP BY satisfaction_score
ORDER BY satisfaction_score DESC;

-- 19. Average Resolution Time by Satisfaction Score
SELECT satisfaction_score,
ROUND(AVG(resolution_time_hours),2) AS avg_resolution_time
FROM support_tickets
GROUP BY satisfaction_score
ORDER BY satisfaction_score DESC;

-- 20. Average First Response Time by Satisfaction Score
SELECT satisfaction_score,
ROUND(AVG(first_response_time_minutes),2) AS avg_first_response_time
FROM support_tickets
GROUP BY satisfaction_score
ORDER BY satisfaction_score DESC;

-- 21. Escalation Rate by Priority
SELECT priority,
COUNT(*) AS total_tickets,
SUM(CASE WHEN escalation_flag='TRUE' THEN 1 ELSE 0 END) AS escalated_tickets,
ROUND(
SUM(CASE WHEN escalation_flag='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS escalation_rate
FROM support_tickets
GROUP BY priority
ORDER BY escalation_rate DESC;

-- 22. Overall Escalation Rate
SELECT
COUNT(*) AS total_tickets,
SUM(CASE WHEN escalation_flag='TRUE' THEN 1 ELSE 0 END) AS escalated_tickets,
ROUND(
SUM(CASE WHEN escalation_flag='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS escalation_rate
FROM support_tickets;

-- 23. Top 10 Longest Resolution Times
SELECT ticket_id,
account_id,
priority,
resolution_time_hours
FROM support_tickets
ORDER BY resolution_time_hours DESC
LIMIT 10;

-- 24. Top 10 Fastest Resolution Times
SELECT ticket_id,
account_id,
priority,
resolution_time_hours
FROM support_tickets
ORDER BY resolution_time_hours
LIMIT 10;

-- 25. Top 10 Slowest First Responses
SELECT ticket_id,
account_id,
priority,
first_response_time_minutes
FROM support_tickets
ORDER BY first_response_time_minutes DESC
LIMIT 10;

-- 26. Top 10 Highest Satisfaction Tickets
SELECT ticket_id,
account_id,
satisfaction_score
FROM support_tickets
ORDER BY satisfaction_score DESC
LIMIT 10;

-- 27. Top 10 Lowest Satisfaction Tickets
SELECT ticket_id,
account_id,
satisfaction_score
FROM support_tickets
ORDER BY satisfaction_score
LIMIT 10;

-- 28. Average Metrics by Priority
SELECT priority,
ROUND(AVG(resolution_time_hours),2) AS avg_resolution,
ROUND(AVG(first_response_time_minutes),2) AS avg_response,
ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM support_tickets
GROUP BY priority;

-- 29. Average Metrics by Escalation
SELECT escalation_flag,
ROUND(AVG(resolution_time_hours),2) AS avg_resolution,
ROUND(AVG(first_response_time_minutes),2) AS avg_response,
ROUND(AVG(satisfaction_score),2) AS avg_satisfaction
FROM support_tickets
GROUP BY escalation_flag;

-- 30. Overall Support Dashboard KPIs
SELECT
COUNT(*) AS total_tickets,
ROUND(AVG(resolution_time_hours),2) AS avg_resolution_time,
ROUND(AVG(first_response_time_minutes),2) AS avg_first_response_time,
ROUND(AVG(satisfaction_score),2) AS avg_satisfaction,
SUM(CASE WHEN escalation_flag='TRUE' THEN 1 ELSE 0 END) AS escalated_tickets,
ROUND(SUM(CASE WHEN escalation_flag='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS escalation_rate
FROM support_tickets;

