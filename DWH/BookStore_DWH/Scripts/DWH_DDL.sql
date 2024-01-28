--Dim_Book

CREATE TABLE dim_book
  (
     book_sk            INT NOT NULL IDENTITY(1, 1),          
     book_id            INT not NULL,                         
     title              VARCHAR(400),
     isBn13             VARCHAR(50),
	 language_id_bk     int  null,		
     language_code      VARCHAR(8),
     language_name      VARCHAR(50),
     num_pages          INT,
	 publisher_id_bk    int  null,  
	 publication_date	date,
	 publisher_name	    VARCHAR(400),
	 author_id_bk       int null,
	 author_name		VARCHAR(400),
	 start_date         DATETIME NOT NULL DEFAULT (Getdate()), 
     end_date           DATETIME NULL,							 
     is_current         TINYINT NOT NULL DEFAULT (1),             
     CONSTRAINT pk_dim_book PRIMARY KEY CLUSTERED (book_sk)
  );





--Dim-Customer :

CREATE TABLE dim_customer
  (
     customer_sk        INT NOT NULL IDENTITY(1, 1),             
     customer_id        INT NOT NULL,                           
     first_name         VARCHAR(200),
	 last_name          VARCHAR(200),
	 email			    VARCHAR(350),
	 address_id_bk      int null,
	 address_status_id_bk int null,
     address_status     VARCHAR(30),
	 street_number      VARCHAR(10),
     street_name        VARCHAR(200),
     city               VARCHAR(100),
	 country_id_bk      int null, 
	 country			VARCHAR(200),
	 is_current         TINYINT NOT NULL DEFAULT (1),            
	 start_date         DATETIME NOT NULL DEFAULT (Getdate()),  
     end_date           DATETIME NULL,							
     CONSTRAINT pk_dim_customer PRIMARY KEY CLUSTERED (customer_sk)
  );



--Dim_Shipping

CREATE TABLE dim_shipping
  (
     shipping_sk            INT NOT NULL IDENTITY(1, 1),           
     shipping_id            INT NOT NULL,                       
     shipping_method		NVARCHAR(100) NULL,
	 start_date             DATETIME NOT NULL DEFAULT (Getdate()), 
     end_date               DATETIME NULL,						
     is_current             TINYINT NOT NULL DEFAULT (1),  
     CONSTRAINT pk_dim_shipping PRIMARY KEY CLUSTERED (shipping_sk)
  );



Drop Table fact_book_sales;

--Fact_Table 

CREATE TABLE fact_book_sales
(
    Sales_SK INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    Customer_FK INT NOT NULL,
    Shipping_FK INT NOT NULL,
	Book_FK INT NOT NULL,
    Date_FK INT NOT NULL,
    Time_FK INT NOT NULL,
	order_id_BK INT NOT NULL,
	order_line_BK int not null,
	order_date  Datetime NULL,
    Order_Received_Date DATETIME,
    Order_Received_Status CHAR(30),
    Pending_Delivery_Date DATETIME,
    Pending_Delivery_Status CHAR(30),
    Delivery_In_Progress_Date DATETIME,
    Delivery_In_Progress_Status CHAR(30),
    Delivered_Date DATETIME,
    Delivered_Status CHAR(30),
    Cancelled_Date DATETIME,
    Cancelled_Status CHAR(30),
    Returned_Date DATETIME,
    Returned_Status CHAR(30),
    Price INT,
    Shipping_Cost INT,
    Total INT,
	source_system_code TINYINT,
	created_at DATETIME DEFAULT GETDATE()
    
    CONSTRAINT fk_fact_sales_dim_customer FOREIGN KEY (Customer_FK) REFERENCES dim_customer(customer_sk),
    CONSTRAINT fk_fact_sales_dim_shipping FOREIGN KEY (Shipping_FK) REFERENCES dim_shipping(shipping_sk),
	CONSTRAINT fk_fact_sales_dim_book FOREIGN KEY (Book_FK) REFERENCES dim_book(book_sk),
    CONSTRAINT fk_fact_sales_dim_date FOREIGN KEY (Date_FK) REFERENCES DimDate(DateSK),
    CONSTRAINT fk_fact_sales_dim_time FOREIGN KEY (Time_FK) REFERENCES DimTime(TimeSK)
);





--MetaData_Control_Load :
CREATE TABLE Meta_Control_Fact_Sales_Load(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderDetails] [nvarchar](100) NULL,
	[Last_load_date] [datetime] NULL,
	[Last_Load_OrderDetailsID_BK] [int] NULL

	CONSTRAINT PK_Meta_Control_Fact_Sales PRIMARY KEY CLUSTERED (id)
	);



