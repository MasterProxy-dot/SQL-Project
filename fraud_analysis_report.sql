-- =========================================================
-- FINTECH RISK ANALYTICS REPORT: CREDIT CARD FRAUD PATTERNS
-- =========================================================

-- QUERY 1: Macro Financial Exposure Metrics
SELECT 
    class AS is_fraudulent,
    COUNT(class) AS transaction_count,
    ROUND((COUNT(class) * 100.0 / 284807), 4) AS percentage_fraud,
    ROUND(SUM(amount), 2) AS total_dollar_volume,
    ROUND(AVG(amount), 2) AS avg_transaction_value,
    ROUND(MAX(amount), 2) AS max_transaction_value
FROM credit_card_transactions
GROUP BY class;


-- QUERY 2: Time-Series Velocity Attack Analysis
SELECT 
    FLOOR((transaction_time % 86400) / 3600) AS hour_of_day,
    COUNT(*) AS total_transactions,
    SUM(class) AS fraud_cases,
    ROUND((SUM(class)::NUMERIC * 100.0 / COUNT(*)), 4) AS fraud_rate_percentage
FROM credit_card_transactions
GROUP BY hour_of_day
ORDER BY fraud_rate_percentage DESC;


-- QUERY 3: Statistical Profiling and Anomaly Signal Detection
SELECT 
    class AS is_fraudulent,
    ROUND(AVG(V1), 4) AS avg_v1,
    ROUND(AVG(V2), 4) AS avg_v2,
    ROUND(AVG(V3), 4) AS avg_v3,
    ROUND(AVG(V4), 4) AS avg_v4,
    ROUND(AVG(V14), 4) AS avg_v14,
    ROUND(AVG(V17), 4) AS avg_v17
FROM credit_card_transactions
GROUP BY class;