-- Видалити базу, якщо існує
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- Таблиця країн
CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

-- Таблиця складів
CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(50) NOT NULL,
    WarehouseAddress VARCHAR(100),
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

-- Таблиця товарів
CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL
);

-- Таблиця запасів товарів на складах (зв'язує Products і Warehouses)
CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- =======================================
-- Вставлення тестових даних
-- =======================================

-- Країни
INSERT INTO Countries (Name)
VALUES ('Country1'), ('Country2');

-- Склади
INSERT INTO Warehouses (WarehouseName, WarehouseAddress, CountryID)
VALUES 
('Warehouse-1', 'City-1, Street-1', 1),
('Warehouse-2', 'City-2, Street-2', 2);

-- Товари
INSERT INTO Products (ProductName)
VALUES ('AwersomeProduct');

-- Залишки товарів на складах
INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
VALUES
(1, 1, 2),
(1, 2, 5);
