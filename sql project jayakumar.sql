Create database Inventory_Management
Use Inventory_Management
Create table Product (
Productid int primary key, 
ProductName varchar(30) not null,
UnitPrice Decimal(10,2) not null,
ReorderLevel int not null,
Categoryid int,
Supplierid int,
Foreign Key (Supplierid) references Suppliers (Supplierid),
Foreign Key (Categoryid) references Categories (Categoryid)
)

Create table Suppliers (
Supplierid int Primary key,
SupplierName varchar(30) not null,
ContactName varchar(30),
Phonenumber varchar(30),
Email varchar(30),
City varchar(20),
Country Varchar(20)
)

Create Table Categories (
Categoryid INT PRIMARY KEY,
CategoryName VARCHAR(30) NOT NULL,
Description VARCHAR(255)
)

Create Table Warehouses (
Warehouseid INT PRIMARY KEY,
WarehouseName VARCHAR(50) NOT NULL,
Location VARCHAR(100) NOT NULL
)

Create Table Stock (
Stockid INT PRIMARY KEY,
Productid INT NOT NULL,
Warehouseid INT NOT NULL,
Quantity INT NOT NULL,
FOREIGN KEY (Productid) REFERENCES Product (Productid),
FOREIGN KEY (Warehouseid) REFERENCES Warehouses (Warehouseid)
)

CREATE TABLE StockMovements (
    Movementid INT PRIMARY KEY,
    Productid INT NOT NULL,
    Warehouseid INT NOT NULL,
    MovementType VARCHAR(10) CHECK (MovementType IN ('IN', 'OUT', 'TRANSFER')),
    Quantity INT NOT NULL,
    MovementDate DATE NOT NULL,
    FOREIGN KEY (Productid) REFERENCES Product (Productid),
    FOREIGN KEY (Warehouseid) REFERENCES Warehouses (Warehouseid)
)

CREATE TABLE Employees (
    Employeeid INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    Position VARCHAR(30),
    Email VARCHAR(50),
    PhoneNumber VARCHAR(15)
)

CREATE TABLE Orders (
    Orderid INT PRIMARY KEY,
    OrderType VARCHAR(10) CHECK (OrderType IN ('PURCHASE', 'SALES')),
    OrderDate DATE NOT NULL,
    Supplierid INT,
    Employeeid INT,
    TotalAmount DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (Supplierid) REFERENCES Suppliers (Supplierid),
    FOREIGN KEY (Employeeid) REFERENCES Employees (Employeeid)
)

CREATE TABLE OrderDetails (
    OrderDetailid INT PRIMARY KEY,
    Orderid INT NOT NULL,
    Productid INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Orderid) REFERENCES Orders (Orderid),
    FOREIGN KEY (Productid) REFERENCES Product (Productid)
)

alter table Product drop ReorderLevel

INSERT INTO Product (Productid, ProductName, UnitPrice) VALUES
(1, 'Laptop', 1200.00),
(2, 'Office Chair', 150.00),
(3, 'Smartphone', 800.00),
(4, 'Desk', 200.00),
(5, 'T-shirt', 25.00),
(6, 'Notebook', 5.00),
(7, 'Apple', 2.00),
(8, 'Teddy Bear', 20.00),
(9, 'Soccer Ball', 30.00),
(10, 'Car Battery', 150.00),
(11, 'Novel', 15.00),
(12, 'Band-Aids', 5.00),
(13, 'Lipstick', 20.00),
(14, 'Frying Pan', 30.00),
(15, 'Drill Machine', 100.00),
(16, 'Flower Pot', 10.00),
(17, 'Dog Food', 50.00),
(18, 'Running Shoes', 75.00),
(19, 'Gold Necklace', 500.00),
(20, 'Guitar', 300.00)

INSERT INTO Suppliers (Supplierid, SupplierName, ContactName, Phonenumber, Email, City, Country) VALUES
(1, 'ABC Supplies', 'John Doe', '1234567890', 'contact@abcsupplies.com', 'New York', 'USA'),
(2, 'Global Distributors', 'Jane Smith', '9876543210', 'jane@globaldist.com', 'London', 'UK'),
(3, 'Tech World', 'Alice Brown', '4567891234', 'alice@techworld.com', 'San Francisco', 'USA'),
(4, 'MegaMart', 'Robert Johnson', '7891234567', 'robert@megamart.com', 'Sydney', 'Australia'),
(5, 'Quick Supplies', 'Emily Davis', '3216549870', 'emily@quicksupplies.com', 'Toronto', 'Canada'),
(6, 'Prime Distributors', 'Daniel Wilson', '6549873210', 'daniel@primedistributors.com', 'Berlin', 'Germany'),
(7, 'Elite Vendors', 'Sophia Moore', '2135468790', 'sophia@elitevendors.com', 'Dubai', 'UAE'),
(8, 'Supply Chain Co.', 'Liam Martinez', '4561237890', 'liam@supplychainco.com', 'Singapore', 'Singapore'),
(9, 'Goods Galore', 'Olivia Taylor', '7894561230', 'olivia@goodsgalore.com', 'Mumbai', 'India'),
(10, 'Universal Supplies', 'Noah Anderson', '6543217890', 'noah@universalsupplies.com', 'Shanghai', 'China'),
(11, 'BrightMart', 'Emma Thomas', '9874563210', 'emma@brightmart.com', 'Paris', 'France'),
(12, 'Trusted Supplies', 'Lucas Walker', '3219876540', 'lucas@trustedsupplies.com', 'Rome', 'Italy'),
(13, 'Efficient Suppliers', 'Charlotte White', '2138794560', 'charlotte@efficient.com', 'Seoul', 'South Korea'),
(14, 'Reliable Supplies', 'James Harris', '8792135460', 'james@reliablesupplies.com', 'Tokyo', 'Japan'),
(15, 'Quality Partners', 'Amelia Lewis', '5468792130', 'amelia@qualitypartners.com', 'Bangkok', 'Thailand'),
(16, 'Speedy Supplies', 'Benjamin Lee', '8795462130', 'benjamin@speedy.com', 'Jakarta', 'Indonesia'),
(17, 'Smart Distributors', 'Isabella Clark', '5463218790', 'isabella@smart.com', 'Lagos', 'Nigeria'),
(18, 'Dynamic Supplies', 'William Hall', '2136548790', 'william@dynamic.com', 'Nairobi', 'Kenya'),
(19, 'Global Goods', 'Mia Scott', '8795463210', 'mia@globalgoods.com', 'Buenos Aires', 'Argentina'),
(20, 'Pro Distributors', 'Elijah Allen', '6542138790', 'elijah@prodist.com', 'Mexico City', 'Mexico')

INSERT INTO Categories (Categoryid, CategoryName, Description) VALUES
(1, 'Electronics', 'Devices and gadgets'),
(2, 'Furniture', 'Office and home furniture'),
(3, 'Apparel', 'Clothing and accessories'),
(4, 'Stationery', 'Office and school supplies'),
(5, 'Groceries', 'Food and beverages'),
(6, 'Toys', 'Kids and baby products'),
(7, 'Sports', 'Sports and outdoor equipment'),
(8, 'Automotive', 'Car parts and accessories'),
(9, 'Books', 'Books and publications'),
(10, 'Healthcare', 'Medical supplies and equipment'),
(11, 'Beauty', 'Cosmetics and skincare'),
(12, 'Kitchen', 'Kitchenware and appliances'),
(13, 'Tools', 'Hand and power tools'),
(14, 'Garden', 'Gardening supplies and plants'),
(15, 'Pet Supplies', 'Products for pets'),
(16, 'Footwear', 'Shoes and sandals'),
(17, 'Accessories', 'Jewelry and other accessories'),
(18, 'Music', 'Instruments and music supplies'),
(19, 'Games', 'Video games and consoles'),
(20, 'Home Decor', 'Decorative items and furnishings')

INSERT INTO Warehouses (Warehouseid, WarehouseName, Location) VALUES
(1, 'Main Warehouse', '123 Warehouse Lane'),
(2, 'Secondary Warehouse', '456 Depot Road'),
(3, 'Central Storage', '789 Central Blvd'),
(4, 'North Depot', '111 North Street'),
(5, 'South Depot', '222 South Avenue'),
(6, 'East Storage', '333 East Road'),
(7, 'West Storage', '444 West Street'),
(8, 'City Center Warehouse', '555 City Plaza'),
(9, 'Airport Depot', '666 Airport Road'),
(10, 'Harbor Warehouse', '777 Harbor Lane'),
(11, 'Mountain Storage', '888 Mountain Drive'),
(12, 'Valley Depot', '999 Valley Lane'),
(13, 'Downtown Warehouse', '101 Downtown Blvd'),
(14, 'Suburban Storage', '202 Suburban Road'),
(15, 'Industrial Depot', '303 Industrial Avenue'),
(16, 'Tech Storage', '404 Tech Park'),
(17, 'Eco-Friendly Depot', '505 Green Lane'),
(18, 'Luxury Warehouse', '606 Elite Plaza'),
(19, 'High-Security Depot', '707 Secure Drive'),
(20, 'Global Distribution Center', '808 Global Blvd')

INSERT INTO Stock (Stockid, Productid, Warehouseid, Quantity) VALUES
(1, 1, 1, 500),
(2, 2, 2, 300),
(3, 3, 3, 100),
(4, 4, 4, 200),
(5, 5, 5, 150),
(6, 6, 6, 250),
(7, 7, 7, 400),
(8, 8, 8, 600),
(9, 9, 9, 350),
(10, 10, 10, 450),
(11, 11, 11, 220),
(12, 12, 12, 120),
(13, 13, 13, 320),
(14, 14, 14, 420),
(15, 15, 15, 520),
(16, 16, 16, 620),
(17, 17, 17, 370),
(18, 18, 18, 470),
(19, 19, 19, 270),
(20, 20, 20, 170)

INSERT INTO StockMovements VALUES
(1, 1, 1, 'IN', 100, '2024-01-01'),
(2, 2, 1, 'OUT', 50, '2024-01-02'),
(3, 3, 2, 'IN', 70, '2024-01-03'),
(4, 4, 2, 'TRANSFER', 30, '2024-01-04'),
(5, 5, 3, 'OUT', 40, '2024-01-05'),
(6, 6, 3, 'IN', 90, '2024-01-06'),
(7, 7, 4, 'TRANSFER', 20, '2024-01-07'),
(8, 8, 4, 'IN', 60, '2024-01-08'),
(9, 9, 5, 'OUT', 80, '2024-01-09'),
(10, 10, 5, 'IN', 100, '2024-01-10'),
(11, 11, 6, 'TRANSFER', 40, '2024-01-11'),
(12, 12, 6, 'IN', 50, '2024-01-12'),
(13, 13, 7, 'OUT', 30, '2024-01-13'),
(14, 14, 7, 'IN', 70, '2024-01-14'),
(15, 15, 8, 'TRANSFER', 90, '2024-01-15'),
(16, 16, 8, 'OUT', 60, '2024-01-16'),
(17, 17, 9, 'IN', 50, '2024-01-17'),
(18, 18, 9, 'TRANSFER', 30, '2024-01-18'),
(19, 19, 10, 'OUT', 20, '2024-01-19'),
(20, 20, 10, 'IN', 40, '2024-01-20')

INSERT INTO Employees VALUES
(1, 'Alice Johnson', 'Manager', 'alice.johnson@example.com', '1234567890'),
(2, 'Bob Smith', 'Supervisor', 'bob.smith@example.com', '1234567891'),
(3, 'Charlie Brown', 'Analyst', 'charlie.brown@example.com', '1234567892'),
(4, 'Diana Prince', 'Clerk', 'diana.prince@example.com', '1234567893'),
(5, 'Eve Adams', 'Technician', 'eve.adams@example.com', '1234567894'),
(6, 'Frank Martin', 'Operator', 'frank.martin@example.com', '1234567895'),
(7, 'Grace Hopper', 'Designer', 'grace.hopper@example.com', '1234567896'),
(8, 'Harry Kane', 'Developer', 'harry.kane@example.com', '1234567897'),
(9, 'Ivy Lee', 'Coordinator', 'ivy.lee@example.com', '1234567898'),
(10, 'Jack Sparrow', 'Manager', 'jack.sparrow@example.com', '1234567899'),
(11, 'Karen Gillan', 'Supervisor', 'karen.gillan@example.com', '2234567890'),
(12, 'Leonardo DiCaprio', 'Analyst', 'leonardo.dicaprio@example.com', '2234567891'),
(13, 'Maria Sharapova', 'Clerk', 'maria.sharapova@example.com', '2234567892'),
(14, 'Nina Dobrev', 'Technician', 'nina.dobrev@example.com', '2234567893'),
(15, 'Oscar Wilde', 'Operator', 'oscar.wilde@example.com', '2234567894'),
(16, 'Peter Parker', 'Designer', 'peter.parker@example.com', '2234567895'),
(17, 'Quincy Adams', 'Developer', 'quincy.adams@example.com', '2234567896'),
(18, 'Rachel Green', 'Coordinator', 'rachel.green@example.com', '2234567897'),
(19, 'Steve Rogers', 'Manager', 'steve.rogers@example.com', '2234567898'),
(20, 'Tony Stark', 'Supervisor', 'tony.stark@example.com', '2234567899')

INSERT INTO Orders VALUES
(1, 'PURCHASE', '2024-01-01', 1, 1, 1500.00),
(2, 'SALES', '2024-01-02', 2, 2, 2000.00),
(3, 'PURCHASE', '2024-01-03', 3, 3, 1200.00),
(4, 'SALES', '2024-01-04', 4, 4, 2500.00),
(5, 'PURCHASE', '2024-01-05', 5, 5, 1800.00),
(6, 'SALES', '2024-01-06', 6, 6, 2200.00),
(7, 'PURCHASE', '2024-01-07', 7, 7, 1600.00),
(8, 'SALES', '2024-01-08', 8, 8, 2400.00),
(9, 'PURCHASE', '2024-01-09', 9, 9, 1400.00),
(10, 'SALES', '2024-01-10', 10, 10, 2100.00),
(11, 'PURCHASE', '2024-01-11', 11, 11, 1700.00),
(12, 'SALES', '2024-01-12', 12, 12, 2300.00),
(13, 'PURCHASE', '2024-01-13', 13, 13, 1900.00),
(14, 'SALES', '2024-01-14', 14, 14, 2600.00),
(15, 'PURCHASE', '2024-01-15', 15, 15, 1500.00),
(16, 'SALES', '2024-01-16', 16, 16, 2700.00),
(17, 'PURCHASE', '2024-01-17', 17, 17, 1300.00),
(18, 'SALES', '2024-01-18', 18, 18, 2800.00),
(19, 'PURCHASE', '2024-01-19', 19, 19, 1600.00),
(20, 'SALES', '2024-01-20', 20, 20, 3000.00)

INSERT INTO OrderDetails VALUES
(1, 1, 1, 5, 300.00),
(2, 2, 2, 10, 200.00),
(3, 3, 3, 15, 80.00),
(4, 4, 4, 20, 125.00),
(5, 5, 5, 8, 225.00),
(6, 6, 6, 12, 180.00),
(7, 7, 7, 10, 160.00),
(8, 8, 8, 20, 120.00),
(9, 9, 9, 14, 100.00),
(10, 10, 10, 18, 130.00),
(11, 11, 11, 16, 110.00),
(12, 12, 12, 6, 140.00),
(13, 13, 13, 12, 85.00),
(14, 14, 14, 10, 95.00),
(15, 15, 15, 20, 145.00),
(16, 16, 16, 18, 100.00),
(17, 17, 17, 15, 75.00),
(18, 18, 18, 22, 160.00),
(19, 19, 19, 14, 135.00),
(20, 20, 20, 25, 180.00)

SELECT COUNT(*) AS TotalProducts FROM Product;
SELECT AVG(UnitPrice) AS AveragePrice FROM Product;
SELECT SUM(TotalAmount) AS TotalSalesAmount FROM Orders WHERE OrderType = 'SALES';
SELECT MAX(UnitPrice) AS HighestPrice, MIN(UnitPrice) AS LowestPrice FROM Product;
SELECT Stock.Stockid, Product.ProductName, Warehouses.WarehouseName, Stock.Quantity  FROM Stock
INNER JOIN Product ON Stock.Productid = Product.Productid
INNER JOIN Warehouses ON Stock.Warehouseid = Warehouses.Warehouseid;
SELECT O.Orderid, O.OrderType, O.OrderDate, O.TotalAmount, S.SupplierName, S.City FROM Orders O
LEFT JOIN Suppliers S ON O.Supplierid = S.Supplierid;