-- ==========================================================
-- DATABASE: alx_book_store
-- SCRIPT: task_2.sql
-- DESCRIPTION: Create all tables for the online bookstore
-- ==========================================================

-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- ==========================================================
-- 2. AUTHORS TABLE
-- ==========================================================
CREATE TABLE IF NOT EXISTS AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- ==========================================================
-- 3. BOOKS TABLE
-- ==========================================================
CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    CONSTRAINT FK_BOOKS_AUTHOR
        FOREIGN KEY (author_id)
        REFERENCES AUTHORS(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ==========================================================
-- 4. CUSTOMERS TABLE
-- ==========================================================
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- ==========================================================
-- 5. ORDERS TABLE
-- ==========================================================
CREATE TABLE IF NOT EXISTS ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT FK_ORDERS_CUSTOMER
        FOREIGN KEY (customer_id)
        REFERENCES CUSTOMERS(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ==========================================================
-- 6. ORDER_DETAILS TABLE
-- ==========================================================
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    CONSTRAINT FK_ORDERDETAILS_ORDER
        FOREIGN KEY (order_id)
        REFERENCES ORDERS(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_ORDERDETAILS_BOOK
        FOREIGN KEY (book_id)
        REFERENCES BOOKS(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ==========================================================
-- END OF task_2.sql
-- ==========================================================
