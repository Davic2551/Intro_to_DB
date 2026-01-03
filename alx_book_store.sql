-- ==========================================================
-- DATABASE: alx_book_store
-- DESCRIPTION: Online bookstore database
-- ==========================================================

-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- ==========================================================
-- 2. AUTHORS TABLE
-- ==========================================================
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- ==========================================================
-- 3. BOOKS TABLE
-- ==========================================================
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    CONSTRAINT fk_books_author
        FOREIGN KEY (author_id)
        REFERENCES Authors(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ==========================================================
-- 4. CUSTOMERS TABLE
-- ==========================================================
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- ==========================================================
-- 5. ORDERS TABLE
-- ==========================================================
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ==========================================================
-- 6. ORDER_DETAILS TABLE
-- ==========================================================
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    CONSTRAINT fk_orderdetails_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_orderdetails_book
        FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ==========================================================
-- END OF alx_book_store.sql
-- ==========================================================
