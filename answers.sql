--Database Design and Normalization
-- Question 1: Create 1NF table structure and insert normalized data
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);
-- Inserting normalized data by manually splitting the products
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');
-- Verifying the 1NF table
SELECT * FROM ProductDetail_1NF ORDER BY OrderID, Product;

-- Question 2: Transform OrderDetails table to 2NF
-- Removing partial dependencies by creating separate tables
-- Step 1: Create Orders table (removes CustomerName dependency on OrderID)
CREATE TABLE Orders_2NF AS
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;
-- Step 2: Creating OrderItems table (maintains product details with full dependency on composite key)
CREATE TABLE OrderItems_2NF AS
SELECT OrderID, Product, Quantity
FROM OrderDetails;












