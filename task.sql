CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(50) NOT NULL,
    WarehouseAddress VARCHAR(100),
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

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

INSERT INTO Countries (Name)
VALUES ('Country1'), ('Country2');

INSERT INTO Warehouses (WarehouseName, WarehouseAddress, CountryID)
VALUES 
('Warehouse-1', 'City-1, Street-1', 1),
('Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (ProductName)
VALUES ('AwesomeProduct');

INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
VALUES
(1, 1, 2),
(1, 2, 5);
