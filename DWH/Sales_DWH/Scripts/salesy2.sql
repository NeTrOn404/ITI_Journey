-- Fact_Sales
CREATE TABLE Fact_Sales (
    Sales_ID_SK INT IDENTITY(1,1) PRIMARY KEY,
    SalesmanID_SK INT,
    CustomerID_SK INT,
    Product_ID_SK INT,
    Time_ID DATETIME DEFAULT GETDATE(),
    Quantity INT,
    TotalPrice FLOAT,
    start_date DATETIME,
    end_date DATETIME,
    is_current TINYINT,
    OrderID INT
);




-- Dim_Customer
CREATE TABLE Dim_Customer (
    Customer_ID_SK INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    GenderName VARCHAR(50),
    start_date DATETIME,
    end_date DATETIME,
    is_current TINYINT,
    CustomerID INT
);

-- Dim_Product
CREATE TABLE Dim_Product (
    Product_ID_SK INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    Price FLOAT,
    SubCategoryName VARCHAR(50),
    CategoryName VARCHAR(50),
    start_date DATETIME,
    end_date DATETIME,
    is_current TINYINT,
    ProductID INT
);

-- Dim_Salesman
CREATE TABLE Dim_Salesman (
    Salesman_ID_SK INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    StreetAddress VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    start_date DATETIME,
    end_date DATETIME,
    is_current TINYINT,
    SalesmanID INT
);

-- Dim_Time
CREATE TABLE Dim_Time (
    Time_ID_SK INT IDENTITY(1,1) PRIMARY KEY,
    Year INT,
    Quarter INT,
    Month INT,
    Week INT,
    Day INT,
    start_date DATETIME,
    end_date DATETIME,
    is_current TINYINT,
    date DATETIME
);
