CREATE VIEW vw_Dim_Salesman AS
SELECT
    s.FirstName,
    s.LastName,
	s.Email,
    s.PhoneNumber,
    sa.StreetAddress,
	sa.City,
	sa.State,
	sa.ZipCode,
	s.LastModifiedDate,
	CONCAT('9999-01-01', '') AS end_date,
	s.is_current,
	s.SalesmanID
	
FROM
    Salesman s
JOIN
    Address sa ON sa.AddressID = s.AddressID;


CREATE VIEW vw_Dim_Product AS
SELECT
    p.ProductName,
	p.Price,
    s.SubCategoryName,
    sc.CategoryName,
	p.LastModifiedDate,
	CONCAT('9999-01-01', '') AS end_date,
	p.is_current,
	p.ProductID
FROM
    product p
JOIN
    SubCategory s ON p.SubCategoryID = s.SubCategoryID
JOIN
    Category sc ON s.CategoryID = sc.CategoryID;

CREATE VIEW vw_Dim_Customer 
AS
SELECT
    c.FirstName,
    c.LastName,
    c.Email,
    c.PhoneNumber,
    g.GenderName,
	c.LastModifiedDate,
	CONCAT('9999-01-01', '') AS end_date,
	c.is_current,
	c.CustomerID 
FROM
    Customer c
JOIN
    Gender g ON c.GenderID = g.GenderID;



CREATE VIEW vw_Dim_Time AS
SELECT
    o.OrderDate AS date,
    o.LastModifiedDate,
	CONCAT('9999-01-01', '') AS end_date,
	o.is_current
FROM
    [Order] o;


CREATE VIEW vw_Fact_Sales AS
SELECT
    od.Quantity,
    od.TotalPrice,
    o.LastModifiedDate AS start_date,
	CONCAT('9999-01-01', '') AS end_date,
	CONCAT('', '') AS end_date
	o.is_current
    -- Add other necessary columns from related tables
FROM
    OrderDetails od
JOIN
    [order] o ON od.OrderID = o.OrderID
JOIN
    customer c ON o.CustomerID = c.CustomerID;



CREATE VIEW vw_Fact_Sales AS
SELECT
    c.CustomerID,
    od.ProductID,
    s.SalesmanID,
    od.Quantity,
    od.TotalPrice,
    o.LastModifiedDate AS start_date,
    CONCAT('9999-01-01', '') AS end_date,
    o.is_current
    -- Add other necessary columns from related tables
FROM
    OrderDetails od
JOIN
    [order] o ON od.OrderID = o.OrderID
JOIN
    customer c ON o.CustomerID = c.CustomerID
JOIN
    salesman s ON o.SalesmanID = s.SalesmanID;


