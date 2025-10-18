-- Видалення старої бази (точно за завданням)
DROP DATABASE ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- =======================================
-- 1. Таблиця країн
-- =======================================
CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- =======================================
-- 2. Таблиця складів
-- =======================================
CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(50) NOT NULL,
    WarehouseAddress VARCHAR(100),
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =======================================
-- 3. Таблиця товарів
-- =======================================
CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- =======================================
-- 4. Таблиця запасів товарів на складах
-- =======================================
CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT UNSIGNED NOT NULL CHECK (WarehouseAmount >= 0),
    FOREIGN KEY (ProductID) REFERENCES Products(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (ProductID, WarehouseID)
) ENGINE=InnoDB;

-- =======================================
-- 5. Тестові дані
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
VALUES ('AwesomeProduct');

-- Запаси товарів на складах
INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
VALUES
(1, 1, 2),
(1, 2, 5);
