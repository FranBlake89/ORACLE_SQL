--EXTRA.	Display Warehouse Id, warehouse name, product category Id, product category name, and the lowest product standard cost for this combination.
--�	In your result, include the rows that the lowest standard cost is less then $200.
--�	Also, include the rows that the lowest cost is more than $500.
--�	Sort the output according to Warehouse Id, warehouse name and then product category Id, and product category name.



SELECT ware.WAREHOUSE_ID, ware.WAREHOUSE_NAME, pc.CATEGORY_ID, pc.CATEGORY_NAME, MIN(p.STANDARD_COST) AS MIN_STANDARD_COST
FROM WAREHOUSES ware
JOIN INVENTORIES inv ON ware.WAREHOUSE_ID = inv.WAREHOUSE_ID
JOIN PRODUCTS p ON inv.PRODUCT_ID = p.PRODUCT_ID
JOIN PRODUCT_CATEGORIES pc ON p.CATEGORY_ID = pc.CATEGORY_ID
GROUP BY ware.WAREHOUSE_ID, ware.WAREHOUSE_NAME, pc.CATEGORY_ID, pc.CATEGORY_NAME
HAVING MIN(p.STANDARD_COST) < 200 OR MIN(p.STANDARD_COST) > 500
ORDER BY ware.WAREHOUSE_ID, ware.WAREHOUSE_NAME, pc.CATEGORY_ID, pc.CATEGORY_NAME;


SELECT 'Number of customers with total purshase amount over average: ' ||COUNT(customer_id) 
FROM 
(SELECT customer_id, COUNT (customer_id) as num_cus, SUM(quantity * unit_price) AS total_order_amount
from orders o 
join order_items oi ON o.order_id = oi.order_id
group by customer_id
HAVING SUM(quantity * unit_price) > (SELECT AVG(quantity * unit_price) FROM order_items))

UNION

SELECT 'Number of customers with total purshase amount below average: ' ||COUNT(customer_id) 
FROM 
(SELECT customer_id, COUNT (customer_id) as num_cus, SUM(quantity * unit_price) AS total_order_amount
from orders o 
join order_items oi ON o.order_id = oi.order_id
group by customer_id
HAVING SUM(quantity * unit_price) < (SELECT AVG(quantity * unit_price) FROM order_items)) 

UNION

SELECT 'Number of customers with no orders: ' ||COUNT(c.customer_id)
FROM customers c
WHERE c.customer_id NOT IN (SELECT o.customer_id FROM orders o)

UNION

SELECT 'Total Number of customers: ' ||COUNT(c.customer_id)
FROM customers c;