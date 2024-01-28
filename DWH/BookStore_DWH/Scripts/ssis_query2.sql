---- get cutomer dim from the oltp
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    ca.address_id AS address_id_bk,
    ca.status_id AS address_status_id_bk,
    ads.address_status,
    a.street_number,
    a.street_name,
    a.city,
    a.country_id AS country_id_bk,
    co.country_name

FROM
    dbo.customer c
INNER JOIN
    dbo.customer_address ca ON c.customer_id = ca.customer_id
INNER JOIN
    dbo.address a ON ca.address_id = a.address_id
INNER JOIN
    dbo.address_status ads ON ca.status_id = ads.status_id
INNER JOIN
    dbo.country co ON a.country_id = co.country_id;

---- get shipping dim from the oltp
SELECT
    method_id AS method_id_BK,
    method_name
FROM
    shipping_method;


	---- get book dim from the oltp

	SELECT
    b.book_id,
    b.title,
    b.isbn13,
    bl.language_id AS language_id_bk,
    bl.language_code,
    bl.language_name,
    b.num_pages,
    b.publisher_id AS publisher_id_bk,
    b.publication_date,
    p.publisher_name,
    ba.author_id AS author_id_bk,
    a.author_name
FROM
    dbo.book b
LEFT JOIN
    dbo.book_language bl ON b.language_id = bl.language_id
LEFT JOIN
    dbo.publisher p ON b.publisher_id = p.publisher_id
LEFT JOIN
    dbo.book_author ba ON b.book_id = ba.book_id
LEFT JOIN
    dbo.author a ON ba.author_id = a.author_id;

	---- get fact_table from the oltp

alter VIEW OrderStatusView AS
WITH StatusChanges AS (
    SELECT
        co.order_id,
        oh.status_date,
        os.status_value,
		co.LastModifiedDate,
        CONCAT('status_value_', ROW_NUMBER() OVER(PARTITION BY co.order_id ORDER BY oh.status_date)) AS status_column
    FROM cust_order co
    JOIN order_history oh ON co.order_id = oh.order_id
    JOIN order_status os ON oh.status_id = os.status_id
)

SELECT order_id, 
	LastModifiedDate,
    MAX(CASE WHEN status_column = 'status_value_1' THEN status_value END) AS Order_Received_Status,
    MAX(CASE WHEN status_column = 'status_value_1' THEN status_date END) AS Order_Received_Date,
    MAX(CASE WHEN status_column = 'status_value_2' THEN status_value END) AS Pending_Delivery_Status,
    MAX(CASE WHEN status_column = 'status_value_2' THEN status_date END) AS Pending_Delivery_Date,
    MAX(CASE WHEN status_column = 'status_value_3' THEN status_value END) AS Delivery_In_Progress_Status,
    MAX(CASE WHEN status_column = 'status_value_3' THEN status_date END) AS Delivery_In_Progress_Date,
    MAX(CASE WHEN status_column = 'status_value_4' THEN status_value END) AS Delivered_Status,
    MAX(CASE WHEN status_column = 'status_value_4' THEN status_date END) AS Delivered_Date,
    MAX(CASE WHEN status_column = 'status_value_5' THEN status_value END) AS Cancelled_Status,
    MAX(CASE WHEN status_column = 'status_value_5' THEN status_date END) AS Cancelled_Date,
    MAX(CASE WHEN status_column = 'status_value_6' THEN status_value END) AS Returned_Status,
    MAX(CASE WHEN status_column = 'status_value_6' THEN status_date END) AS Returned_Date
    -- Add more columns as needed for more status values and their dates
FROM StatusChanges
GROUP BY order_id,LastModifiedDate;
---------------------------------------
SELECT
 co.order_id AS order_id_BK,
 co.order_date,
 CAST(co.order_date AS DATE) AS orderdate_as_date,
 CAST(co.order_date AS time) AS orderdate_as_time,
  ol.line_id As line_id_BK,
  bo.book_id AS book_id_BK,
  co.customer_id AS Customer_id,
  co.shipping_method_id AS method_id,
  shi.cost,
  ol.Price,
  osv.*

FROM
    dbo.cust_order AS co

RIGHT JOIN   dbo.order_line AS ol 
ON  co.order_id = ol.order_id

JOIN
    OrderStatusView AS osv 
ON co.order_id = osv.order_id
Join
    book AS bo
ON bo.book_id = ol.book_id
Join
	shipping_method as shi
on  shi.method_id = co.shipping_method_id

where osv.order_id >?      
and osv.LastModifiedDate >=  ?  
and osv.LastModifiedDate <    ? 
ORDER BY ol.line_id, osv.LastModifiedDate;




	---lockup to date and time dim
 SELECT  DateSK, [Date]
FROM DimDate

SELECT [TimeSK],[Time]
FROM   DimTime

