CREATE DATABASE ShopDB; 
USE ShopDB; 

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache (
    ID INT AUTO_INCREMENT,
    IPRange VARCHAR(100),
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries (ID) ON DELETE CASCADE
) ENGINE=Memory;

CREATE TABLE ProductDescription (
    ID INT AUTO_INCREMENT,
    CountryID INT,
    ProductID INT,
    Description TEXT,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

CREATE TABLE Logs (
    ID INT AUTO_INCREMENT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Message TEXT,
    PRIMARY KEY (ID)
) ENGINE=Blackhole;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
