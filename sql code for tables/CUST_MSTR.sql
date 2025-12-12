USE customer_data_db;

CREATE TABLE CUST_MSTR (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT, -- Added AUTO_INCREMENT
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(20),
    AddressLine1 VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    LoadDate DATE NOT NULL
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    Description TEXT,
    LastUpdated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
USE customer_data_db; -- Make sure you're in the correct database

INSERT INTO Products (ProductName, Category, Price, StockQuantity, Description) VALUES
('Laptop Pro', 'Electronics', 1200.00, 50, 'High performance laptop'),
('Wireless Mouse', 'Accessories', 25.50, 200, 'Ergonomic wireless mouse'),
('Mechanical Keyboard', 'Accessories', 80.00, 100, 'RGB mechanical keyboard with clicky switches'),
('Gaming Headset', 'Accessories', 50.00, 150, 'Immersive sound for gaming'),
('Webcam HD', 'Electronics', 75.00, 80, 'Full HD video calls');

SELECT * FROM Products; -- Verify the data

SET @i = 0;
DELIMITER //

CREATE PROCEDURE InsertManyCustomers()
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < 700 DO
        INSERT INTO CUST_MSTR (
            FirstName,
            LastName,
            Email,
            PhoneNumber,
            AddressLine1,
            City,
            State,
            PostalCode,
            LoadDate
        )
        VALUES
        (
            CONCAT('TestFirstName_', i),
            CONCAT('TestLastName_', i),
            CONCAT('test.email_', i, '@example.com'),
            CONCAT('555-123-', LPAD(i, 4, '0')),
            CONCAT(i, ' Test Address'),
            CASE FLOOR(RAND() * 5)
                WHEN 0 THEN 'Mumbai'
                WHEN 1 THEN 'Delhi'
                WHEN 2 THEN 'Bangalore'
                WHEN 3 THEN 'Chennai'
                WHEN 4 THEN 'Hyderabad'
            END,
            'MH',
            '12345',
            CURDATE()
        );
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ; -- Revert the delimiter back to semicolon

-- Step 7: Call the Stored Procedure to insert the data
CALL InsertManyCustomers();

-- Step 8: Verify the count of records after insertion
SELECT COUNT(*) AS TotalCustomers FROM CUST_MSTR;

-- 