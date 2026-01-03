-- ==========================================================
-- SCRIPT: task_3.sql
-- DESCRIPTION: List all tables in a MySQL database
-- ==========================================================

-- This query lists all tables in the current database
SHOW TABLES;

-- Optional: Check if specific tables exist (like AUTHORS, BOOKS, CUSTOMERS, ORDERS, ORDER_DETAILS)
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME IN ('AUTHORS', 'BOOKS', 'CUSTOMERS', 'ORDERS', 'ORDER_DETAILS');
