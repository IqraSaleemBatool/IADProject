CREATE DATABASE IvoryHaya;
USE IvoryHaya;


CREATE TABLE Roles_t
(
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName VARCHAR(50) NOT NULL
)
CREATE TABLE Users_t
(
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(255),
    RoleID INT,
    
    FOREIGN KEY (RoleID) REFERENCES Roles_t(RoleID)
)

CREATE TABLE Categories_t
(
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(100) NOT NULL
)
CREATE TABLE Products_t
(
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    CategoryID INT,
    ProductName VARCHAR(150) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2),
    StockQuantity INT,
    Properties VARCHAR(255),
    ImageURL VARCHAR(255),

    FOREIGN KEY (CategoryID) REFERENCES Categories_t(CategoryID)
)
CREATE TABLE Orders_t
(
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(50),
    PaymentMethod VARCHAR(50),

    FOREIGN KEY (UserID) REFERENCES Users_t(UserID)
)
CREATE TABLE OrderItems_t
(
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),

    FOREIGN KEY (OrderID) REFERENCES Orders_t(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products_t(ProductID)
)

CREATE TABLE Cart_t
(
    CartID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    ProductID INT,
    Quantity INT,

    FOREIGN KEY (UserID) REFERENCES Users_t(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products_t(ProductID)
)

INSERT INTO Roles_t (RoleName)
VALUES
('Admin'),
('SalesPerson'),
('Customer')

INSERT INTO Users_t
(FullName, Email, Password, Phone, Address, RoleID)
VALUES
('Admin User','admin@gmail.com','admin123','03001234567','Islamabad',1),
('Sales User','sales@gmail.com','sales123','03111234567','Lahore',2),
('Ayesha Khan','ayesha@gmail.com','123','03211234567','Rawalpindi',3),
('Fatima Noor','fatima@gmail.com','123','03331234567','Karachi',3),
('Sara Ali','sara@gmail.com','123','03451234567','Faisalabad',3),
('Hina Malik','hina@gmail.com','123','03010000001','Lahore',3),
('Zara Ahmed','zara@gmail.com','123','03010000002','Karachi',3),
('Noor Fatima','noor@gmail.com','123','03010000003','Islamabad',3),
('Maham Ali','maham@gmail.com','123','03010000004','Rawalpindi',3),
('Areeba Khan','areeba@gmail.com','123','03010000005','Faisalabad',3),
('Iqra Noor','iqra@gmail.com','123','03010000006','Multan',3),
('Sana Sheikh','sana@gmail.com','123','03010000007','Peshawar',3),
('Eman Tariq','eman@gmail.com','123','03010000008','Sialkot',3),
('Rabia Aslam','rabia@gmail.com','123','03010000009','Hyderabad',3),
('Komal Shah','komal@gmail.com','123','03010000010','Quetta',3);

INSERT INTO Categories_t (CategoryName)
VALUES
('Casual'),
('Formal'),
('Luxury'),
('Wedding');

INSERT INTO Products_t
(CategoryID, ProductName, Description,Price, StockQuantity, Properties, ImageURL)
VALUES
(1,'Black Casual Abaya','Simple everyday abaya',4500,20,'Black | Medium | Nidha Fabric','images/abaya1.jpg'),
(1,'Grey Front Open Abaya','Stylish front open abaya',5500,15,'Grey | Large | Korean Nidha','images/abaya2.jpg'),
(2,'Formal Pearl Abaya','Elegant formal wear',7000,10,'Black | Medium | Pearl Work','images/abaya3.jpg'),
(3,'Luxury Gold Abaya','Premium luxury abaya',12000,5,'Black-Gold | Large | Luxury Fabric','images/abaya4.jpg'),
(4,'White Wedding Abaya','Beautiful bridal abaya',18000,3,'White | Medium | Bridal Collection','images/abaya5.jpg'),
(1,'Blue Casual Abaya','Daily wear abaya',5000,12,'Blue | Medium | Nidha','images/abaya6.jpg'),
(2,'Stone Formal Abaya','Formal stylish abaya',8500,8,'Stone | Large | Pearl Work','images/abaya7.jpg'),
(3,'Royal Black Luxury Abaya','Luxury premium abaya',15000,5,'Black | XL | Luxury Fabric','images/abaya8.jpg'),
(4,'Golden Wedding Abaya','Wedding special abaya',22000,4,'Golden | Medium | Bridal','images/abaya9.jpg');

INSERT INTO Orders_t
(UserID, TotalAmount, Status, PaymentMethod)
VALUES

(3,11500,'Completed','Card'),
(3,18000,'Completed','JazzCash'),
(3,4500,'Completed','Cash On Delivery'),

(4,19000,'Completed','Card'),
(4,12000,'Completed','JazzCash'),

(5,30000,'Completed','Card'),
(5,18000,'Completed','Cash On Delivery'),
(5,22000,'Completed','Card'),

(6,10000,'Completed','Card'),

(7,12500,'Completed','JazzCash'),
(7,25000,'Completed','Card'),
(7,7000,'Completed','Cash On Delivery'),

(8,18000,'Completed','Card'),
(8,4500,'Completed','JazzCash'),

(9,22000,'Completed','Card'),
(9,15000,'Completed','Card'),

(10,30500,'Completed','JazzCash'),
(10,7000,'Completed','Cash On Delivery'),

(11,12000,'Completed','Card'),
(11,18000,'Completed','JazzCash'),

(12,5000,'Completed','Card'),
(12,15500,'Completed','Card'),

(13,22000,'Completed','JazzCash'),
(13,4500,'Completed','Cash On Delivery'),

(14,8500,'Completed','Card'),
(14,12000,'Completed','Card'),

(15,18000,'Completed','JazzCash'),
(15,30000,'Completed','Card');

INSERT INTO OrderItems_t
(OrderID, ProductID, Quantity, Price)
VALUES

-- Order 1
(1,1,1,4500),
(1,3,1,7000),

-- Order 2
(2,5,1,18000),

-- Order 3
(3,1,1,4500),

-- Order 4
(4,4,1,12000),
(4,3,1,7000),

-- Order 5
(5,4,1,12000),

-- Order 6
(6,5,1,18000),
(6,4,1,12000),

-- Order 7
(7,5,1,18000),

-- Order 8
(8,9,1,22000),

-- Order 9
(9,2,1,5500),
(9,1,1,4500),

-- Order 10
(10,2,1,5500),
(10,3,1,7000),

-- Order 11
(11,5,1,18000),
(11,4,1,12000),

-- Order 12
(12,3,1,7000),

-- Order 13
(13,5,1,18000),

-- Order 14
(14,1,1,4500),

-- Order 15
(15,9,1,22000),

-- Order 16
(16,8,1,15000),

-- Order 17
(17,9,1,22000),
(17,2,1,5500),

-- Order 18
(18,3,1,7000),

-- Order 19
(19,4,1,12000),

-- Order 20
(20,5,1,18000),

-- Order 21
(21,6,1,5000),

-- Order 22
(22,7,1,8500),
(22,6,1,5000),

-- Order 23
(23,9,1,22000),

-- Order 24
(24,1,1,4500),

-- Order 25
(25,7,1,8500),

-- Order 26
(26,4,1,12000),

-- Order 27
(27,5,1,18000),

-- Order 28
(28,5,1,18000),
(28,4,1,12000);
INSERT INTO Cart_t
(UserID, ProductID, Quantity)
VALUES

(3,1,1),
(3,3,1),

(4,4,1),

(5,5,1),

(7,2,1);

ALTER TABLE Users_t
ADD IsActive BIT DEFAULT 1;

ALTER TABLE Products_t 
ADD IsActive BIT DEFAULT 1;



select * from Users_t
select * from Roles_t
select * from Categories_t
select * from Cart_t
select * from OrderItems_t
select * from Orders_t
select * from Products_t

