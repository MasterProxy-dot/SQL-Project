-- Step 1: Initialize Table Structure
DROP TABLE IF EXISTS credit_card_transactions;

CREATE TABLE credit_card_transactions (
    id SERIAL PRIMARY KEY,
    transaction_time NUMERIC, -- Kept numeric to support scientific notation mapping
    V1 NUMERIC, V2 NUMERIC, V3 NUMERIC, V4 NUMERIC, V5 NUMERIC,
    V6 NUMERIC, V7 NUMERIC, V8 NUMERIC, V9 NUMERIC, V10 NUMERIC,
    V11 NUMERIC, V12 NUMERIC, V13 NUMERIC, V14 NUMERIC, V15 NUMERIC,
    V16 NUMERIC, V17 NUMERIC, V18 NUMERIC, V19 NUMERIC, V20 NUMERIC,
    V21 NUMERIC, V22 NUMERIC, V23 NUMERIC, V24 NUMERIC, V25 NUMERIC,
    V26 NUMERIC, V27 NUMERIC, V28 NUMERIC,
    amount NUMERIC(10, 2),
    class INT
);

-- Step 2: Local Staging Import (Modify path for local execution)
-- COPY credit_card_transactions FROM 'C:\Users\Public\creditcard.csv' DELIMITER ',' CSV HEADER;