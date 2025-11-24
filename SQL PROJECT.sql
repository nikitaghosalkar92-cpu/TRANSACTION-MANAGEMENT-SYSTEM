-- ============================================
-- TRANSACTION MANAGEMENT SYSTEM - MySQL Project
-- ============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS TransactionManagementSystem;
USE TransactionManagementSystem;

-- ============================================
-- TABLE 1: Customers
-- ============================================
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    registration_date DATE
);

INSERT INTO Customers VALUES
(1, 'John Smith', 'john.smith@email.com', '9876543210', 'Mumbai', '2024-01-15'),
(2, 'Sarah Johnson', 'sarah.j@email.com', '9876543211', 'Delhi', '2024-02-20'),
(3, 'Mike Brown', NULL, '9876543212', 'Bangalore', '2024-01-10'),
(4, 'Emily Davis', 'emily.d@email.com', '9876543213', 'Chennai', NULL),
(5, 'Robert Wilson', 'robert.w@email.com', NULL, 'Pune', '2024-03-05'),
(6, 'John Smith', 'john.duplicate@email.com', '9876543210', 'Mumbai', '2024-01-15'),
(7, 'Lisa Anderson', 'lisa.a@email.com', '9876543215', 'Hyderabad', '2024-02-28'),
(8, 'David Martinez', 'david.m@email.com', '9876543216', 'Kolkata', '2024-01-20'),
(9, 'Jennifer Taylor', NULL, '9876543217', 'Ahmedabad', '2024-03-10'),
(10, 'Michael Lee', 'michael.l@email.com', '9876543218', 'Jaipur', NULL),
(11, 'Sarah Johnson', 'sarah.duplicate@email.com', '9876543211', 'Delhi', '2024-02-20'),
(12, 'Christopher White', 'chris.w@email.com', '9876543220', 'Surat', '2024-04-01'),
(13, 'Amanda Harris', 'amanda.h@email.com', NULL, 'Lucknow', '2024-03-15'),
(14, 'James Clark', 'james.c@email.com', '9876543222', 'Kanpur', '2024-02-05'),
(15, 'Patricia Lewis', NULL, '9876543223', 'Nagpur', NULL);


-- ============================================
-- TABLE 2: Accounts
-- ============================================
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    opening_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Accounts VALUES
(101, 1, 'Savings', 50000.00, '2024-01-15', 'Active'),
(102, 2, 'Current', 125000.50, '2024-02-20', 'Active'),
(103, 3, 'Savings', 75000.00, NULL, 'Active'),
(104, 4, 'Current', 200000.00, '2024-02-15', 'Active'),
(105, 5, 'Savings', 30000.00, '2024-03-05', 'Inactive'),
(106, 1, 'Current', 150000.00, '2024-03-01', 'Active'),
(107, 6, 'Savings', 50000.00, '2024-01-15', 'Active'),
(108, 7, 'Savings', 90000.00, '2024-02-28', 'Active'),
(109, 8, 'Current', 180000.00, NULL, 'Active'),
(110, 9, 'Savings', 45000.00, '2024-03-10', 'Active'),
(111, 10, 'Current', 220000.00, '2024-03-20', 'Active'),
(112, 2, 'Savings', 125000.50, '2024-02-25', 'Active'),
(113, 12, 'Current', 95000.00, '2024-04-01', 'Inactive'),
(114, 13, 'Savings', 60000.00, NULL, 'Active'),
(115, 14, 'Savings', 85000.00, '2024-02-05', 'Active');

-- ============================================
-- TABLE 3: Transactions
-- ============================================
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE,
    description VARCHAR(100),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

INSERT INTO Transactions VALUES
(1001, 101, 'Credit', 10000.00, '2024-03-01', 'Salary Credit'),
(1002, 102, 'Debit', 5000.00, '2024-03-02', 'Bill Payment'),
(1003, 103, 'Credit', 15000.00, NULL, 'Fund Transfer'),
(1004, 104, 'Debit', 25000.00, '2024-03-05', 'Withdrawal'),
(1005, 105, 'Credit', 5000.00, '2024-03-06', 'Deposit'),
(1006, 101, 'Debit', 3000.00, '2024-03-07', 'ATM Withdrawal'),
(1007, 102, 'Credit', 50000.00, NULL, 'Business Income'),
(1008, 106, 'Credit', 75000.00, '2024-03-08', 'Investment Return'),
(1009, 107, 'Debit', 2000.00, '2024-03-09', 'Online Shopping'),
(1010, 108, 'Credit', 20000.00, '2024-03-10', 'Salary Credit'),
(1011, 102, 'Debit', 5000.00, '2024-03-11', 'Bill Payment'),
(1012, 109, 'Credit', 35000.00, NULL, 'Freelance Income'),
(1013, 110, 'Debit', 8000.00, '2024-03-12', 'Shopping'),
(1014, 111, 'Credit', 100000.00, '2024-03-13', 'Business Revenue'),
(1015, 112, 'Debit', 12000.00, '2024-03-14', 'Rent Payment');

-- ============================================
-- TABLE 4: Branches
-- ============================================
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    branch_location VARCHAR(100),
    manager_name VARCHAR(100),
    contact_number VARCHAR(15),
    opening_date DATE
);

INSERT INTO Branches VALUES
(201, 'Main Branch', 'Mumbai Central', 'Rajesh Kumar', '9123456789', '2020-01-01'),
(202, 'South Branch', 'Delhi South', 'Priya Sharma', '9123456790', '2020-06-15'),
(203, 'Tech Park Branch', 'Bangalore Tech Park', NULL, '9123456791', '2021-03-20'),
(204, 'Marina Branch', 'Chennai Marina', 'Suresh Reddy', '9123456792', NULL),
(205, 'Kothrud Branch', 'Pune Kothrud', 'Anjali Desai', '9123456793', '2021-08-10'),
(206, 'Main Branch', 'Mumbai Central', 'Duplicate Manager', '9123456789', '2020-01-01'),
(207, 'Hitech City Branch', 'Hyderabad Hitech City', 'Venkat Rao', '9123456795', '2022-01-05'),
(208, 'Park Street Branch', 'Kolkata Park Street', 'Amit Banerjee', NULL, '2022-03-15'),
(209, 'CG Road Branch', 'Ahmedabad CG Road', 'Neha Patel', '9123456797', NULL),
(210, 'MI Road Branch', 'Jaipur MI Road', 'Vikram Singh', '9123456798', '2022-05-20'),
(211, 'South Branch', 'Delhi South', 'Duplicate Priya', '9123456790', '2020-06-15'),
(212, 'Ring Road Branch', 'Surat Ring Road', 'Kiran Shah', '9123456800', '2022-07-10'),
(213, 'Gomti Nagar Branch', 'Lucknow Gomti Nagar', NULL, '9123456801', '2022-08-25'),
(214, 'Civil Lines Branch', 'Kanpur Civil Lines', 'Rahul Gupta', '9123456802', NULL),
(215, 'Sitabuldi Branch', 'Nagpur Sitabuldi', 'Pooja Joshi', '9123456803', '2022-10-15');

-- ============================================
-- TABLE 5: Account_Branch_Mapping
-- ============================================
CREATE TABLE Account_Branch_Mapping (
    mapping_id INT PRIMARY KEY,
    account_id INT,
    branch_id INT,
    assigned_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

INSERT INTO Account_Branch_Mapping VALUES
(301, 101, 201, '2024-01-15'),
(302, 102, 202, '2024-02-20'),
(303, 103, 203, NULL),
(304, 104, 204, '2024-02-15'),
(305, 105, 205, '2024-03-05'),
(306, 106, 201, '2024-03-01'),
(307, 107, 206, NULL),
(308, 108, 207, '2024-02-28'),
(309, 109, 208, '2024-01-20'),
(310, 110, 209, '2024-03-10'),
(311, 111, 210, NULL),
(312, 112, 202, '2024-02-25'),
(313, 113, 212, '2024-04-01'),
(314, 114, 213, '2024-03-15'),
(315, 115, 214, '2024-02-05');

-- ============================================
-- 15 BUSINESS QUESTIONS WITH SOLUTIONS
-- ============================================

-- Q1: Find all customers who have more than one account
SELECT c.customer_id, c.customer_name, COUNT(a.account_id) as account_count
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(a.account_id) > 1;

-- Q2: List all transactions with customer and account details
SELECT t.transaction_id, c.customer_name, a.account_type, t.transaction_type, 
       t.amount, t.transaction_date
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
ORDER BY t.transaction_date DESC;

-- Q3: Find customers with NULL email addresses
SELECT customer_id, customer_name, phone, city
FROM Customers
WHERE email IS NULL;

-- Q4: Calculate total transaction amount by account type
SELECT a.account_type, 
       SUM(CASE WHEN t.transaction_type = 'Credit' THEN t.amount ELSE 0 END) as total_credits,
       SUM(CASE WHEN t.transaction_type = 'Debit' THEN t.amount ELSE 0 END) as total_debits
FROM Accounts a
LEFT JOIN Transactions t ON a.account_id = t.account_id
GROUP BY a.account_type;

-- Q5: Find duplicate customer names
SELECT customer_name, COUNT(*) as count
FROM Customers
GROUP BY customer_name
HAVING COUNT(*) > 1;

-- Q6: List accounts with balance greater than average balance (SUBQUERY)
SELECT account_id, customer_id, account_type, balance
FROM Accounts
WHERE balance > (SELECT AVG(balance) FROM Accounts);

-- Q7: Find customers who have never made a transaction (SUBQUERY)
SELECT c.customer_id, c.customer_name, c.email
FROM Customers c
WHERE c.customer_id NOT IN (
    SELECT DISTINCT a.customer_id 
    FROM Accounts a 
    JOIN Transactions t ON a.account_id = t.account_id
);

-- Q8: Get branch details with total number of accounts
SELECT b.branch_id, b.branch_name, b.branch_location, COUNT(abm.account_id) as total_accounts
FROM Branches b
LEFT JOIN Account_Branch_Mapping abm ON b.branch_id = abm.branch_id
GROUP BY b.branch_id, b.branch_name, b.branch_location;

-- Q9: Find all transactions with NULL dates
SELECT t.transaction_id, a.account_id, c.customer_name, t.transaction_type, t.amount
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE t.transaction_date IS NULL;

-- Q10: Find customers whose total credit is more than total debit (SUBQUERY)
SELECT c.customer_id, c.customer_name,
       (SELECT SUM(t.amount) 
        FROM Transactions t 
        JOIN Accounts a ON t.account_id = a.account_id 
        WHERE a.customer_id = c.customer_id AND t.transaction_type = 'Credit') as total_credit,
       (SELECT SUM(t.amount) 
        FROM Transactions t 
        JOIN Accounts a ON t.account_id = a.account_id 
        WHERE a.customer_id = c.customer_id AND t.transaction_type = 'Debit') as total_debit
FROM Customers c
HAVING total_credit > COALESCE(total_debit, 0);

-- Q11: Find inactive accounts with their branch details
SELECT a.account_id, c.customer_name, a.balance, b.branch_name, b.branch_location
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id
JOIN Account_Branch_Mapping abm ON a.account_id = abm.account_id
JOIN Branches b ON abm.branch_id = b.branch_id
WHERE a.status = 'Inactive';

-- Q12: List customers from cities with more than 2 customers (SUBQUERY)
SELECT customer_id, customer_name, city, email
FROM Customers
WHERE city IN (
    SELECT city 
    FROM Customers 
    GROUP BY city 
    HAVING COUNT(*) >= 2
);

-- Q13: Find accounts with no transactions
SELECT a.account_id, c.customer_name, a.account_type, a.balance
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id
LEFT JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;

-- Q14: Get highest transaction amount for each account type (SUBQUERY)
SELECT a.account_type, t.transaction_id, t.amount, t.transaction_date
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
WHERE t.amount = (
    SELECT MAX(t2.amount)
    FROM Transactions t2
    JOIN Accounts a2 ON t2.account_id = a2.account_id
    WHERE a2.account_type = a.account_type
);

-- Q15: Complex query with multiple joins - Get complete transaction report
SELECT c.customer_name, c.city, a.account_type, a.balance, 
       b.branch_name, t.transaction_type, t.amount, t.transaction_date, t.description
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Account_Branch_Mapping abm ON a.account_id = abm.account_id
JOIN Branches b ON abm.branch_id = b.branch_id
LEFT JOIN Transactions t ON a.account_id = t.account_id
WHERE a.status = 'Active'
ORDER BY c.customer_name, t.transaction_date DESC;
