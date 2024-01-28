-- Dimension Tables

-- Date Dimension
CREATE TABLE Dim_Date (
    Date_ID_SK INT PRIMARY KEY,
    Year INT,
    Quarter INT,
    Month INT,
    Week INT,
    Day INT,
    Price DECIMAL(10, 2),
    Is_Weekend BIT,
    Date DATE,
    Date_ID_BK INT
);

-- Customer Dimension
CREATE TABLE Dim_Customer (
    Customer_ID_SK INT PRIMARY KEY,
    Cust_FName VARCHAR(255),
    Cust_LName VARCHAR(255),
    Email VARCHAR(255),
    Active BIT,
    Country VARCHAR(255),
    ZipCode VARCHAR(20),
    City VARCHAR(255),
    District VARCHAR(255),
    Address VARCHAR(255),
    Address2 VARCHAR(255),
    Create_Date DATETIME,
    Start_Date DATETIME,
    Cust_ID_BK INT
);

-- Film Dimension
CREATE TABLE Dim_Film (
    Film_ID_SK INT PRIMARY KEY,
    Title VARCHAR(255),
    Description VARCHAR(MAX),
    Release_Year INT,
    Language VARCHAR(255),
    Original_Language VARCHAR(255),
    Rental_Duration INT,
    Length INT,
    Rating VARCHAR(10),
    Special_Features VARCHAR(MAX),
    Film_ID_BK INT
);

-- Store Dimension
CREATE TABLE Dim_Store (
    Store_ID_SK INT PRIMARY KEY,
    Store_ID INT,
    Manager_First_Name VARCHAR(255),
    Manager_Last_Name VARCHAR(255),
    Start_Date DATETIME,
    End_Date DATETIME
);

-- Fact Table

-- Sales Fact
CREATE TABLE Fact_Sales (
    Sales_ID_SK INT PRIMARY KEY,
    Customer_ID_SK INT FOREIGN KEY REFERENCES Dim_Customer(Customer_ID_SK),
    Film_ID_SK INT FOREIGN KEY REFERENCES Dim_Film(Film_ID_SK),
    Store_ID_SK INT FOREIGN KEY REFERENCES Dim_Store(Store_ID_SK),
    Date_ID_SK INT FOREIGN KEY REFERENCES Dim_Date(Date_ID_SK),
    Sales_ID_BK INT,
    Qty INT
);
