-- Fact Table

-- Fact_Sales
CREATE TABLE Fact_Sales (
    Sales_ID_SK INT PRIMARY KEY,
    SalesmanID_SK INT FOREIGN KEY REFERENCES Dim_Salesman(SalesmanID_SK),
    CustomerID_SK INT FOREIGN KEY REFERENCES Dim_Customer(CustomerID_SK),
    Product_ID_SK INT FOREIGN KEY REFERENCES Dim_Product(ProductID_SK),
    Time_ID INT FOREIGN KEY REFERENCES Dim_Time(Time_ID),
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    start_date DATETIME,
    end_date DATETIME,
    is_current Tinyint,
    OrderID INT  -- Assuming OrderID is the business key
);

-- Dimension Tables

-- Dim_Customer
CREATE TABLE Dim_Customer (
    CustomerID_SK INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    GenderName VARCHAR(20),
    start_date DATETIME,
    end_date DATETIME,
    is_current tinyint,
    CustomerID INT  -- Assuming CustomerID is the business key
);

-- Dim_Product
CREATE TABLE Dim_Product (
    ProductID_SK INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Price DECIMAL(10, 2),
    SubCategoryName VARCHAR(50),
    CategoryName VARCHAR(50),
    start_date DATETIME,
    end_date DATETIME,
    is_current tinyint,
    ProductID INT  -- Assuming ProductID is the business key
);

-- Dim_Salesman
CREATE TABLE Dim_Salesman (
    SalesmanID_SK INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    StreetAddress VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    start_date DATETIME,
    end_date DATETIME,
    is_current tinyint,
    SalesmanID INT  -- Assuming SalesmanID is the business key
);

-- Dim_Time
CREATE TABLE Dim_Time (
    Time_ID INT PRIMARY KEY,
    Year INT,
    Month INT,
    Day INT,
    start_date DATETIME,
    end_date DATETIME,
    is_current tinyint
);
